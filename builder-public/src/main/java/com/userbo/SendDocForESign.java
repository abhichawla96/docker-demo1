package com.userbo;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.StringReader;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.transform.Result;
import javax.xml.transform.Source;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.sax.SAXResult;
import javax.xml.transform.stream.StreamSource;

import org.apache.commons.codec.binary.Base64;
import org.apache.fop.apps.FOUserAgent;
import org.apache.fop.apps.Fop;
import org.apache.fop.apps.FopFactory;
import org.apache.fop.apps.MimeConstants;
import org.apache.fop.servlet.ServletContextURIResolver;
import org.json.JSONArray;
import org.json.JSONObject;

import com.docusign.esign.model.EnvelopeSummary;
import com.esign.docusign.info.DocRequest;
import com.esign.docusign.info.DocResponse;
import com.esign.docusign.info.SignerInfoBean;
import com.esign.docusign.util.ESignatureUtil;
import com.esign.docusignrest.util.CustomTabUtil;
import com.esign.docusignrest.util.DocuSignUtil;
import com.esign.docusignrest.valueObjects.DocuSignRequest;
import com.esign.docusignrest.valueObjects.RecipientInfoBean;
import com.manage.managecomponent.components.Businessobject;
import com.manage.managecomponent.components.SetParametersForStoredProcedures;
import com.manage.managemetadata.functions.commonfunctions.DataUtils;
import com.manage.util.XML2PDF;
import com.manage.util.XMLUtils;
import com.ormapping.ibatis.SqlResources;
import com.osi.integration.platform.client.IntegrationPlatformClient;
import com.osi.integration.platform.client.model.IntegrationRequest;
import com.osi.integration.platform.client.model.IntegrationResponse;
import com.pone.esign.client.OlsEsignResponse;
import com.userbo.DocumentUploadBO;
import com.userbo.ESignConstants;
import com.userbo.OLSESignWS;
import com.util.Constants;
import com.util.Context;
import com.util.HtmlConstants;
import com.util.IContext;
import com.util.IOUtils;
import com.util.InetLogger;
import com.util.SystemProperties;

public class SendDocForESign extends Businessobject {
	private static InetLogger logger = InetLogger.getInetLogger(SendDocForESign.class);
	private final static String AGENT_SIGNER_IDENTIFIER = ESignConstants.AGENT_SIGNER_IDENTIFIER;
	private final static String DATE_IDENTIFIER = ESignConstants.DATE_SIGNER_IDENTFIER;
	
	private final static String ANCHOR_TAG_DOCUSIGN_SIGN_AGENCY_1 = ESignConstants.ANCHOR_TAG_DOCUSIGN_SIGN_AGENCY_1;
	private final static String DATE_ANCHOR_TAG_DOCUSIGN_DATE_AGENCY_1 = ESignConstants.DATE_ANCHOR_TAG_DOCUSIGN_DATE_AGENCY_1;
	private final static String CUSTOM_TAB_IDENTFIER = ESignConstants.CUSTOM_TAB_IDENTFIER;
	
	
	public boolean evaluate(IContext arg0) throws Exception {
		// TODO Auto-generated method stub
		return false;
	}

	public Object execute(IContext ctx) throws Exception {
		String isEsignEnabled = SystemProperties.getInstance().getString("esign.enabled");
		String isDMSIntegrationdone = SystemProperties.getInstance().getString("dms.integrationdone");
		
		/*if(isEsignEnabled == null || !isEsignEnabled.equals("Y")){
			logger.debug("Esign Integration is not enabled.");
			return null;
		}*/
		
        String isBankRecordWithPaymentTypeAgencySweepExists=(ctx.get("isBankRecordWithPaymentTypeAgencySweepExists") != null && !ctx.get("isBankRecordWithPaymentTypeAgencySweepExists").toString().equals(HtmlConstants.EMPTY)) ? ctx.get("isBankRecordWithPaymentTypeAgencySweepExists").toString() : null;
		
			
		String email_add = (ctx.get("validEmails") != null && !HtmlConstants.EMPTY.equals(ctx.get("validEmails"))) ? ctx.get("validEmails").toString() : null;
		if(email_add != null && email_add.endsWith(";"))
			email_add = email_add.substring(0, email_add.length()-1);
		
		
		if(email_add == null || !HtmlConstants.EMPTY.equals(email_add)){
			email_add = ctx.get("email")!=null && !HtmlConstants.EMPTY.equals(ctx.get("email"))? ctx.get("email").toString():null;
		}
			
		
		String agency_name = (ctx.get("aar_agencyname") != null && !HtmlConstants.EMPTY.equals(ctx.get("aar_agencyname"))) ? ctx.get("aar_agencyname").toString() : null;
		
		if(email_add == null){
			DataUtils.populateError((Context)ctx, "carrierError", DataUtils.getMessage((Context)ctx, "emailDocforESignErrorKey") + ctx.get("aar_requestid") + " and agency name - " + ctx.get("aar_agencyname"));
			logger.error(DataUtils.getMessage((Context)ctx, "emailDocforESignErrorKey") + ctx.get("aar_requestid") + " and agency name - " + ctx.get("aar_agencyname"));
			return null;
		}
		
		String htmlDir = SystemProperties.getInstance().getString("html.basedir");
		List principalList = new ArrayList();
		new SetParametersForStoredProcedures().setParametersInContext(ctx, "aar_requestid,AgentAddresType");
		principalList = SqlResources.getSqlMapProcessor(ctx).select("tbl_agencyprincipal.getPrincipalTypeAgentListByRequestId_p", ctx);
		String esignProvider = ctx.get("esign_provider") != null ? ctx.get("esign_provider").toString() : null;
		
		//CR55 Changes non-HRP
        Object objCType = SqlResources.getSqlMapProcessor(ctx).findByKey("SqlStmts.UserStatementviewgetContactTypeDataByAarRequestId", ctx);
        if(objCType!=null){
       	 ctx.put("getContactTypeLS", objCType);
        }
        else{
       	 ctx.put("getContactTypeLS", null);
        }
		
		Map princiapalMap = null;
		if(principalList!=null && principalList.size()>0){
			
			ByteArrayOutputStream[] boutArray =  new ByteArrayOutputStream[principalList.size()+1];
			//going to generate pdf content bytes
			if((isEsignEnabled != null && isEsignEnabled.equals("Y")) || 
					(isDMSIntegrationdone != null && isDMSIntegrationdone.equals("Y"))){
				princiapalMap = null;
				// 1 is added in list size to create 1 applicationForm PDF and backgroundCheckPDF equals to the no. of principal
				for(int i=0; i<principalList.size()+1; i++){
					if(i == 0){
						princiapalMap = (Map)principalList.get(i);
						if(princiapalMap.get("person_id") != null && !HtmlConstants.EMPTY.equals(princiapalMap.get("person_id").toString())) {
							ctx.put("person_id", princiapalMap.get("person_id").toString());
							ctx.put("personid", princiapalMap.get("person_id").toString());
						}

						if(princiapalMap != null){
							ctx.put("printname", princiapalMap.get("printName").toString());
							//CR55 - non-HRP & Licensed Producer (LS)
							String person_id_t =princiapalMap.get("person_id").toString();
							if(ctx.get("getContactTypeLS") != null)
							{
								if(ctx.get("getContactTypeLS").toString().contains(person_id_t))
								{
									if(esignProvider.equalsIgnoreCase("DocuEsignDirect")){
										ctx.put("AGENT_SIGNER_IDENTIFIER", AGENT_SIGNER_IDENTIFIER+"1");
										ctx.put("DATE_IDENTIFIER", DATE_IDENTIFIER+"_"+1);
									}
									if(esignProvider.equalsIgnoreCase("DocuEsign")){
										ctx.put("AGENT_SIGNER_IDENTIFIER", ANCHOR_TAG_DOCUSIGN_SIGN_AGENCY_1+".1");
										ctx.put("DATE_IDENTIFIER", DATE_ANCHOR_TAG_DOCUSIGN_DATE_AGENCY_1+".1");
									}
								}
								else if(princiapalMap.get("is_principal").toString().equalsIgnoreCase("Y"))
								{
									if(esignProvider.equalsIgnoreCase("DocuEsignDirect")){
										ctx.put("AGENT_SIGNER_IDENTIFIER", AGENT_SIGNER_IDENTIFIER+"1");
										ctx.put("DATE_IDENTIFIER", DATE_IDENTIFIER+"_"+1);
									}
									if(esignProvider.equalsIgnoreCase("DocuEsign")){
										ctx.put("AGENT_SIGNER_IDENTIFIER", ANCHOR_TAG_DOCUSIGN_SIGN_AGENCY_1+".1");
										ctx.put("DATE_IDENTIFIER", DATE_ANCHOR_TAG_DOCUSIGN_DATE_AGENCY_1+".1");
									}
								}
								else
								{
									if(esignProvider.equalsIgnoreCase("DocuEsignDirect")){
										ctx.put("AGENT_SIGNER_IDENTIFIER", AGENT_SIGNER_IDENTIFIER+"1");
										ctx.put("DATE_IDENTIFIER", DATE_IDENTIFIER+"_"+1);
									}
									if(esignProvider.equalsIgnoreCase("DocuEsign")){
										ctx.put("AGENT_SIGNER_IDENTIFIER", ANCHOR_TAG_DOCUSIGN_SIGN_AGENCY_1+".1");
										ctx.put("DATE_IDENTIFIER", DATE_ANCHOR_TAG_DOCUSIGN_DATE_AGENCY_1+".1");
									}
								}
							}
							else if(princiapalMap.get("is_principal").toString().equalsIgnoreCase("Y"))
							{
								if(esignProvider.equalsIgnoreCase("DocuEsignDirect")){
									ctx.put("AGENT_SIGNER_IDENTIFIER", AGENT_SIGNER_IDENTIFIER+"1");
									ctx.put("DATE_IDENTIFIER", DATE_IDENTIFIER+"_"+1);
								}
								if(esignProvider.equalsIgnoreCase("DocuEsign")){
									ctx.put("AGENT_SIGNER_IDENTIFIER", ANCHOR_TAG_DOCUSIGN_SIGN_AGENCY_1+".1");
									ctx.put("DATE_IDENTIFIER", DATE_ANCHOR_TAG_DOCUSIGN_DATE_AGENCY_1+".1");
								}
							}
							else
							{
								if(esignProvider.equalsIgnoreCase("DocuEsignDirect")){
									ctx.put("AGENT_SIGNER_IDENTIFIER", AGENT_SIGNER_IDENTIFIER+"1");
									ctx.put("DATE_IDENTIFIER", DATE_IDENTIFIER+"_"+1);
								}
								if(esignProvider.equalsIgnoreCase("DocuEsign")){
									ctx.put("AGENT_SIGNER_IDENTIFIER", ANCHOR_TAG_DOCUSIGN_SIGN_AGENCY_1+".1");
									ctx.put("DATE_IDENTIFIER", DATE_ANCHOR_TAG_DOCUSIGN_DATE_AGENCY_1+".1");
								}
							}
						}
					}
					else{
						princiapalMap = (Map)principalList.get(i-1);
						if(princiapalMap.get("person_id") != null && !HtmlConstants.EMPTY.equals(princiapalMap.get("person_id").toString())) {
							ctx.put("person_id", princiapalMap.get("person_id").toString());
							ctx.put("personid", princiapalMap.get("person_id").toString());
						}

						if(princiapalMap != null){
							ctx.put("printname", princiapalMap.get("printName").toString());
							//CR55 - non-HRP & Licensed Producer
							String person_id_t =princiapalMap.get("person_id").toString();
							if(ctx.get("getContactTypeLS") != null)
							{
								if(ctx.get("getContactTypeLS").toString().contains(person_id_t) )
								{
									if(esignProvider.equalsIgnoreCase("DocuEsignDirect")){
										ctx.put("AGENT_SIGNER_IDENTIFIER", AGENT_SIGNER_IDENTIFIER+""+(i+1));
										ctx.put("DATE_IDENTIFIER", DATE_IDENTIFIER+"_"+(i+1));
									}

									if(esignProvider.equalsIgnoreCase("DocuEsign")){
										ctx.put("AGENT_SIGNER_IDENTIFIER", ANCHOR_TAG_DOCUSIGN_SIGN_AGENCY_1+"."+i);
										ctx.put("DATE_IDENTIFIER", DATE_ANCHOR_TAG_DOCUSIGN_DATE_AGENCY_1+"."+i);
									}
								}
								else if(princiapalMap.get("is_principal").toString().equalsIgnoreCase("Y"))
								{
									if(esignProvider.equalsIgnoreCase("DocuEsignDirect")){
										ctx.put("AGENT_SIGNER_IDENTIFIER", AGENT_SIGNER_IDENTIFIER+""+(i+1));
										ctx.put("DATE_IDENTIFIER", DATE_IDENTIFIER+"_"+(i+1));
									}

									if(esignProvider.equalsIgnoreCase("DocuEsign")){
										ctx.put("AGENT_SIGNER_IDENTIFIER", ANCHOR_TAG_DOCUSIGN_SIGN_AGENCY_1+"."+i);
										ctx.put("DATE_IDENTIFIER", DATE_ANCHOR_TAG_DOCUSIGN_DATE_AGENCY_1+"."+i);
									}
								}
								else 
								{
									if(esignProvider.equalsIgnoreCase("DocuEsignDirect")){
										ctx.put("AGENT_SIGNER_IDENTIFIER", AGENT_SIGNER_IDENTIFIER+""+(i+1));
										ctx.put("DATE_IDENTIFIER", DATE_IDENTIFIER+"_"+(i+1));
									}

									if(esignProvider.equalsIgnoreCase("DocuEsign")){
										ctx.put("AGENT_SIGNER_IDENTIFIER", ANCHOR_TAG_DOCUSIGN_SIGN_AGENCY_1+"."+i);
										ctx.put("DATE_IDENTIFIER", DATE_ANCHOR_TAG_DOCUSIGN_DATE_AGENCY_1+"."+i);
									}
								}
							}
							//CR55 - HRP & all contact type
							else if(princiapalMap.get("is_principal").toString().equalsIgnoreCase("Y"))
							{
								if(esignProvider.equalsIgnoreCase("DocuEsignDirect")){
									ctx.put("AGENT_SIGNER_IDENTIFIER", AGENT_SIGNER_IDENTIFIER+""+(i+1));
									ctx.put("DATE_IDENTIFIER", DATE_IDENTIFIER+"_"+(i+1));
								}

								if(esignProvider.equalsIgnoreCase("DocuEsign")){
									ctx.put("AGENT_SIGNER_IDENTIFIER", ANCHOR_TAG_DOCUSIGN_SIGN_AGENCY_1+"."+i);
									ctx.put("DATE_IDENTIFIER", DATE_ANCHOR_TAG_DOCUSIGN_DATE_AGENCY_1+"."+i);
								}
							}
							else
							{
								if(esignProvider.equalsIgnoreCase("DocuEsignDirect")){
									ctx.put("AGENT_SIGNER_IDENTIFIER", AGENT_SIGNER_IDENTIFIER+""+(i+1));
									ctx.put("DATE_IDENTIFIER", DATE_IDENTIFIER+"_"+(i+1));
								}

								if(esignProvider.equalsIgnoreCase("DocuEsign")){
									ctx.put("AGENT_SIGNER_IDENTIFIER", ANCHOR_TAG_DOCUSIGN_SIGN_AGENCY_1+"."+i);
									ctx.put("DATE_IDENTIFIER", DATE_ANCHOR_TAG_DOCUSIGN_DATE_AGENCY_1+"."+i);
								}
							}
						}
					}
					
					
					
					String templateFile = htmlDir + "foxsl/public"; 
					if(i == 0){

						//CR55 - non-HRP & LS
						if(ctx.get("getContactTypeLS") != null)
						{
							if(ctx.get("getContactTypeLS").toString().contains("Licensed Producer"))
							{
								ctx.put("applicationFormFlag", "N");
							}
						}

						ctx.put("applicationFormFlag", "Y");
						ctx.put("backgroundCheckFormFlag", "N");
						ctx.put("backgroundCheckFormMultipleFlag", "N");
						if(ctx.get("agency_sweep_form_security") != null && ctx.get("agency_sweep_form_security").toString().equals("Y") && isBankRecordWithPaymentTypeAgencySweepExists != null && isBankRecordWithPaymentTypeAgencySweepExists.equals("Y")){
							ctx.put("agencySweepFormFlag", "Y");
						}

						if(esignProvider != null){
							if(esignProvider.equalsIgnoreCase("AssureEsign")){
								ctx.put("applicationFormFlag", "Y");
								if(ctx.get("background_check_form_security") != null && ctx.get("background_check_form_security").toString().equals("Y")){
									ctx.put("backgroundCheckFormFlag", "Y");
								}
								ctx.put("backgroundCheckFormMultipleFlag", "N");
							}
						}
					}
					
					if(i != 0 ){
						ctx.put("applicationFormFlag", "N");

						//CR55
						princiapalMap = (Map)principalList.get(i-1);
						String person_id_t =princiapalMap.get("person_id").toString();

						// non-HRP & LS
						if(ctx.get("getContactTypeLS") != null)
						{
							if(ctx.get("getContactTypeLS").toString().contains(person_id_t) && ctx.get("background_check_form_security") != null && ctx.get("background_check_form_security").toString().equals("Y"))
							{
								ctx.put("backgroundCheckFormFlag", "Y");
							}
							// HRP
							else if(princiapalMap.get("is_principal").equals("Y") && ctx.get("background_check_form_security") != null && ctx.get("background_check_form_security").toString().equals("Y")){
								ctx.put("backgroundCheckFormFlag", "Y");
							}

							// non-HRP & non-LS
							else if(ctx.get("background_check_form_security") != null && ctx.get("background_check_form_security").toString().equals("Y"))
							{
								ctx.put("backgroundCheckFormFlag", "N");
							}
						}

						// HRP
						else if(princiapalMap.get("is_principal").equals("Y") && ctx.get("background_check_form_security") != null && ctx.get("background_check_form_security").toString().equals("Y")){
							ctx.put("backgroundCheckFormFlag", "Y");
						}

						// non-HRP & non-LS
						else if(ctx.get("background_check_form_security") != null && ctx.get("background_check_form_security").toString().equals("Y"))
						{
							ctx.put("backgroundCheckFormFlag", "N");
						}


						if(ctx.get("agency_sweep_form_security") != null && ctx.get("agency_sweep_form_security").toString().equals("Y") && isBankRecordWithPaymentTypeAgencySweepExists != null && isBankRecordWithPaymentTypeAgencySweepExists.equals("Y")){						
							ctx.put("agencySweepFormFlag", "Y");
						}

						ctx.put("backgroundCheckFormMultipleFlag", "N");
					}
					
					templateFile = templateFile + ".xsl"; 
					String xmlFile = htmlDir + "documenttempxml.xml";
					File file = new File(xmlFile);
					if(file.exists()){
						file.delete();
						file.createNewFile();
					}
					
					/*Context newCtx = new Context();
					newCtx.setProject(ctx.getProject());
					newCtx.putAll(ctx);
					new DocumentImpl().populateDataXml(ctx, newCtx, xmlFile);*/
					
					//ByteArrayOutputStream bout = convertPOToPDF(templateFile, xmlFile, (Context)ctx, (ServletContextURIResolver)ctx.get("DocumentUriResolver"), (ServletContext)ctx.get("DocumentServletContext"));
					ByteArrayOutputStream bout = new XML2PDF().generatePDFFromTemplate(templateFile,(Context) ctx,(HttpServletRequest) ctx.get(HtmlConstants.DOCUMENTREQUEST),(HttpServletResponse) ctx.get(HtmlConstants.DOCUMENTRESPONSE), (ServletContextURIResolver) ctx.get(HtmlConstants.DOCUMENTURIRESOLVER), (ServletContext)ctx.get(HtmlConstants.DOCUMENTSERVLETCONTEXT));
					/*if(i == 0)
						file = new File(htmlDir + "applicationESign.pdf");
					if(i != 0){
						
						String personName = "";
						if(princiapalMap!=null){
							personName = princiapalMap.get("person_name").toString();
							String documentName =  "backgroundCheckESign_"+personName +".pdf"; 
							file = new File(htmlDir + documentName);
							personName = "";
						}
						
						
					}
					if(file.exists()){
						file.delete();
						file.createNewFile();
					}
					
					FileOutputStream fout = new FileOutputStream(file);
					fout.write(bout.toByteArray());
					fout.close();*/
					
					boutArray[i] = bout;
					
					
					if(esignProvider != null){
						if(esignProvider.equalsIgnoreCase("AssureEsign")){
							break;
						}
					}		


					if(ctx.get("background_check_form_security") != null && ctx.get("background_check_form_security").toString().equals("N")){
						break;
					}


				}
			}
			
			//going to upload documents in DMS
			for(int i=0; i<boutArray.length; i++){
				if(boutArray.length != 1){
					if(i == 0)
						ctx.put("document_name","applicationESign.pdf");
					if(i != 0){
						String personName = "";
						
						princiapalMap = (Map)principalList.get(i-1);
						if(princiapalMap!=null){
							//CR55 - non-HRP & LS
							String person_id_t =princiapalMap.get("person_id").toString();
							if(ctx.get("getContactTypeLS") != null)
							{
								if(ctx.get("getContactTypeLS").toString().contains(person_id_t))
								{
									personName = princiapalMap.get("person_name").toString();
									String documentName = "backgroundCheckESign_" + personName + ".pdf";
									ctx.put("document_name", documentName);
									personName = "";
								} 
								// HRP & all contact types
								else if(princiapalMap.get("is_principal").toString().equalsIgnoreCase("Y"))
								{
									personName = princiapalMap.get("person_name").toString();
									String documentName = "backgroundCheckESign_" + personName + ".pdf";
									ctx.put("document_name", documentName);
									personName = "";
								} 
								// Others
								else
								{
									personName = princiapalMap.get("person_name").toString();
									String documentName = "backgroundCheckESign_NULL" + ".pdf";
									ctx.put("document_name", documentName);
									personName = "";
								}
							}
							// HRP & all contact types
							else if(princiapalMap.get("is_principal").toString().equalsIgnoreCase("Y"))
							{
								personName = princiapalMap.get("person_name").toString();
								String documentName = "backgroundCheckESign_" + personName + ".pdf";
								ctx.put("document_name", documentName);
								personName = "";
							}
							// Others
							else
							{
								personName = princiapalMap.get("person_name").toString();
								String documentName = "backgroundCheckESign_NULL" + ".pdf";
								ctx.put("document_name", documentName);
								personName = "";
							}
						}
						
					}
				}else if(boutArray.length == 1){
					ctx.put("document_name","Public.pdf");
				}
				
				uploadDocumentsToDms(ctx,boutArray[i].toByteArray());
				ctx.remove("document_name");

				if(ctx.get("background_check_form_security") != null && ctx.get("background_check_form_security").toString().equals("N")){
					break;
				}


			}
			
			if(ctx.get(Constants.INET_ERRORS_LIST) != null){
				return null;
			}
			
			//going to send document for ESignature
			if(isEsignEnabled != null && isEsignEnabled.equals("Y")){
				String esign_provider = ctx.get("esign_provider") != null ? ctx.get("esign_provider").toString() : null;
				if(esign_provider != null){
					if(esign_provider.equalsIgnoreCase("AssureEsign")){
						sendForAssureSign(ctx, boutArray[0], agency_name, email_add);
					}else if(esign_provider.equalsIgnoreCase("DocuEsign")){
						sendForDocuSign(ctx, boutArray,principalList);
					}else if(esign_provider.equalsIgnoreCase("DocuEsignDirect")){
						
						boolean adapter = true;
						String esignAdapterEnable = "N";
						try {
							esignAdapterEnable = SystemProperties.getInstance().getString("esign.adapter.enabled");
						}						
						catch (Exception e) {
							logger.error("Unable To get the Property for Esign Adapter, Setting Default Value to N");
						}
						
						if(esignAdapterEnable.equalsIgnoreCase("Y")) {
							sendDocForEsign(ctx,boutArray,principalList);
						}else {
							sendForDocuSignDirect(ctx, boutArray,principalList);
						}
						
					}

					
				}
				
				if(ctx.get(Constants.INET_ERRORS_LIST) != null){
					return null;
				}
			}
			
			//inserting status comment in database
			//ctx.put("comment", "Sent For ESignature");
			ctx.put("last_updated_by", "PublicAdmin");
			
			logger.debug("Going to update status in database");
			Object obj = SqlResources.getSqlMapProcessor(ctx).findByKey("SqlStmts.UserStatementviewgetAgecnyApptRequestDataByAarRequestId", ctx);
			if(obj != null && obj instanceof Map){
				Map map = (Map)obj;
				ctx.put("workflow_function", map.get("workflow_function"));
				ctx.put("fromuser_id", map.get("workflow_user"));
				ctx.put("touser_id", map.get("workflow_user"));
				ctx.put("workflow_statusid", map.get("aar_statusid"));
				ctx.put("toworkflow_statusid", map.get("toworkflowstatus_id"));
			}
			
			SqlResources.getSqlMapProcessor(ctx).insert("SqlStmts.UserStatementviewinsertStatusComment", ctx);
			logger.debug("Status comment inserted");
			
			
		}
		
		
		return null;
	}
	
	
	private void populateDataXml(Context ctx, String xmlFile) {
		StringBuffer buffer = new StringBuffer("<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n");
		try{			
			// Data writer
			IOUtils.writeToFile(xmlFile, buffer.append(new XMLUtils().generateResponseXml(ctx,ctx,false)));
		}catch(Exception e){
			e.printStackTrace();
		}
	}

	private ByteArrayOutputStream convertPOToPDF(String foFile, String xmlFile, Context ctx, ServletContextURIResolver uriResolver, ServletContext servletContext) throws Exception {
    	
    	ByteArrayOutputStream bout = new ByteArrayOutputStream();
		try {
			File xmlfile = new File(xmlFile);
			File fofile = new File(foFile);
			
			// configure fopFactory as desired
			FopFactory fopFactory = FopFactory.newInstance();
			//tell the FOPFactory object where to look for resources
		    fopFactory.setURIResolver(uriResolver);

			//fopFactory.setUserConfig(new File("cfg.xml"));
			FOUserAgent foUserAgent = fopFactory.newFOUserAgent();
			foUserAgent.setBaseURL("file:///" + servletContext.getRealPath("/") );

			// configure foUserAgent as desired
			// Setup output		 
			bout = new ByteArrayOutputStream();
			 
			// Construct fop with desired output format
			Fop fop = fopFactory.newFop(MimeConstants.MIME_PDF, foUserAgent, bout);
							
			// Setup XSLT
			TransformerFactory factory = TransformerFactory.newInstance();
			
			//tell the TransformerFactory where to find resources  
		    factory.setURIResolver(uriResolver);
		    
		    //Transformer transformer = factory.newTransformer(new StreamSource(fofile));	
		    Source xsltSrc = null;
            
            String templateContent = new XML2PDF().parseReportTemplate(ctx, foFile);
            xsltSrc = new StreamSource(new StringReader(templateContent));
        
            Transformer transformer = factory.newTransformer(xsltSrc);       

		    
		    //tell the Transformer object where to find resources 
		    transformer.setURIResolver(uriResolver);

			// Setup input for XSLT transformation
			Source src = new StreamSource(xmlfile);
			 
			// Resulting SAX events (the generated FO) must be piped through to FOP
			Result result = new SAXResult(fop.getDefaultHandler());
			
			// Start XSLT transformation and FOP processing
			transformer.transform(src, result);			
		} catch(Exception e) {			 
			e.printStackTrace();
		}
		return bout;
	}
	
	//Method created to send document for AssureSign
	private void sendForAssureSign(IContext ctx, ByteArrayOutputStream bout, String agency_name,
			String email_add) throws Exception{
		try{
			int maxPages = 3;
			
			if(ctx.get("marketdata_list_1") == null || (ctx.get("marketdata_list_1") instanceof List &&
					((List)ctx.get("marketdata_list_1")).size() == 0)){
				maxPages--;
			}else if(ctx.get("marketdata_list_1") != null && ctx.get("marketdata_list_1") instanceof List &&
					((List)ctx.get("marketdata_list_1")).size() > 6){
				maxPages++;
			}
			
			if(ctx.get("agent_list_1") != null && ctx.get("agent_list_1") instanceof List &&
					((List)ctx.get("agent_list_1")).size() > 0){
				maxPages = maxPages + ((List)ctx.get("agent_list_1")).size()*3;
			}
			
			OlsEsignResponse response = new OLSESignWS().doSignatureWithTemplate(bout.toByteArray(), agency_name, email_add, maxPages, ctx.getProject());
			if(response == null || response.getDocID() == null || response.getDocID().equals(HtmlConstants.EMPTY)){
				DataUtils.populateError((Context)ctx, "carrierError","Error in Sending document for ESign");
				logger.error("ESign doc has not been sent successfully");
				return;
			}
			
			//going to insert esign status in database
			Context newCtx = new Context();
			newCtx.setProject(ctx.getProject());
			
			newCtx.put("status_desc", "Sent For ESignature");
			Object obj = SqlResources.getSqlMapProcessor(newCtx).findByKey("SqlStmts.UserStatementviewgetStatusIdByDesc", newCtx);
			if(obj != null){
				Map map = (Map)obj;
				newCtx.put("status", map.get("invitation_status_id"));
			}
			
			newCtx.put("document_id_var", response.getDocID());
			newCtx.put("doc_auth_token", response.getDocAuthToken());
			newCtx.put("document_type", "BGAuthorization");
			newCtx.put("last_updated_by", "publicadmin");
			newCtx.put("operationType", "I");
			newCtx.put("aar_requestid", ctx.get("aar_requestid"));
			
			new SetParametersForStoredProcedures().setParametersInContext(newCtx, "status,aar_requestid");
			SqlResources.getSqlMapProcessor(ctx).insert("tbl_esign_status.insert_update_esign_status_p_java", newCtx);
			
			logger.debug("Pdf Doc has sent to agency for esign.");
		}catch (Exception e) {
			DataUtils.populateError((Context)ctx, "carrierError","Error in Sending document for ESign");
			logger.error("Unable to send document for ESignature due to error : " + e.getMessage());
		}
	}
	
	//Method created to send document for DocuSign
	private void sendForDocuSign(IContext ctx, ByteArrayOutputStream[] boutArary,List principalList) throws Exception {
		try{
			ESignatureUtil esign = new ESignatureUtil();
			List<DocRequest> docRequests = new ArrayList<DocRequest>();
			if(principalList!=null && principalList.size()>0){
				for(int k=0; k<2; k++){
					
					if(k == 0){
						
							for(int i=0; i<principalList.size(); i++){
								DocRequest docreq = new DocRequest();
								
								ByteArrayOutputStream bout = boutArary[i];
								docreq.setContent(bout.toByteArray());
								List<SignerInfoBean> signers = new ArrayList<SignerInfoBean>();
								docreq.setIdentifier(ESignConstants.DOCUMENT_IDENTIFIER_APPFORM);
								Map row = (Map)principalList.get(i);
								SignerInfoBean signerInfo = new SignerInfoBean();
								
								signerInfo.setIdentifier(ESignConstants.ANCHOR_TAG_AGENCY_SIGNER_IDENTIFIER);
								signerInfo.setEmailAddress(row.get("e_mail").toString());
								if(row.get("printName")!=null)
									signerInfo.setName(row.get("printName").toString());
								if(row.get("personInitial")!=null)
									signerInfo.setInitials(row.get("personInitial").toString());
								
								signers.add(signerInfo);
								docreq.setSignerInfo(signers);
								docRequests.add(docreq);
								break;
								
							}
						
					}
					else{
						
						for(int i=0; i<principalList.size(); i++){
							DocRequest docreq = new DocRequest();
							
							ByteArrayOutputStream bout = boutArary[i+1];
							docreq.setContent(bout.toByteArray());
							List<SignerInfoBean> signers = new ArrayList<SignerInfoBean>();
							docreq.setIdentifier(ESignConstants.DOCUMENT_IDENTIFIER_APPBG+"_"+(i+1));
							Map row = (Map)principalList.get(i);
							SignerInfoBean signerInfo = new SignerInfoBean();
							
							signerInfo.setIdentifier(ESignConstants.ANCHOR_TAG_AGENCY_SIGNER_IDENTIFIER);
							signerInfo.setEmailAddress(row.get("e_mail").toString());
							if(row.get("printName")!=null)
								signerInfo.setName(row.get("printName").toString());
							if(row.get("personInitial")!=null)
								signerInfo.setInitials(row.get("personInitial").toString());
							
							signers.add(signerInfo);
							docreq.setSignerInfo(signers);
							docRequests.add(docreq);
						}
						
						break;
					}
					
					
					
				}
			}else{
				logger.error("No Principal Admin Agent found");
			}
			
			
			DocResponse docRes = null; 
			try{
				logger.debug("Going to hit DocuSign");
				docRes = esign.sendDocForESign(docRequests);
				logger.debug("Response got from DocuSign " + docRes);
			}catch (Throwable e1) {
				logger.error("Got error while sending document" + e1.getMessage());
				e1.printStackTrace();
			}
			/*
			//Added code for Testing untill ESign start work
			DocResponse docRes = new DocResponse();
			docRes.setCode("SUCCESS");
			docRes.setToken("PONE_" + System.currentTimeMillis());
			docRes.setIdentifier("PONE_" + System.currentTimeMillis());
			//Ended
			*/
			if(docRes == null || docRes.getCode().toString().equals(HtmlConstants.EMPTY) || 
					("ERROR".equalsIgnoreCase(docRes.getCode().toString()) || "FAILURE".equalsIgnoreCase(docRes.getCode().toString()))){
				
				DataUtils.populateError((Context)ctx, "carrierError", "Unable to send document for ESignature");
				logger.error("Unable to send document for ESignature due to error : " + docRes.getMessage());
				return;
			}
			
			//going to insert int database
			Context newCtx = new Context();
			newCtx.setProject(ctx.getProject());
			
			newCtx.put("document_id_var", docRes.getIdentifier());
			newCtx.put("doc_auth_token", docRes.getToken());
			newCtx.put("document_type", "BGAuthorization");
			newCtx.put("last_updated_by", "publicadmin");
			newCtx.put("operationType", "I");
			newCtx.put("aar_requestid", ctx.get("aar_requestid"));
			
			if(docRes.getCode() != null && docRes.getCode().equalsIgnoreCase("SUCCESS")){
				newCtx.put("status_comment", "SENT");
			}
			
			//going to insert in database
			new SetParametersForStoredProcedures().setParametersInContext(newCtx, "status,aar_requestid");
			SqlResources.getSqlMapProcessor(ctx).insert("tbl_esign_status.insert_update_esign_status_p_java", newCtx);
			
			logger.debug("Pdf Doc has sent to agency for esign.");
		}catch (Exception e) {
			DataUtils.populateError((Context)ctx, "carrierError","Error in Sending document for ESign");
			logger.error("Unable to send document for ESignature due to error : " + e.getMessage());
		}
	}
	
	private void sendForDocuSignDirect(IContext ctx, ByteArrayOutputStream[] boutArary,List principalList) throws Exception {
		try{
			DocuSignUtil docuSign = new DocuSignUtil();
			List<DocuSignRequest> docuSignRequestList = new ArrayList<DocuSignRequest>();
			if(principalList!=null && principalList.size()>0){
				for(int k=0; k<2; k++){
					if(k == 0){
						logger.debug("inside sendForDocuSignDirect2");
						DocuSignRequest docuSignRequest = new DocuSignRequest();
						PublicUtils obj=new PublicUtils();
						obj.getSubjectLine(docuSignRequest, ctx);
						ByteArrayOutputStream bout = boutArary[0];
						docuSignRequest.setContent(bout.toByteArray());
						docuSignRequest.setDocumentId(1);
						List<RecipientInfoBean> recipientInfoList = new ArrayList<RecipientInfoBean>();
						docuSignRequest.setIdentifier(ESignConstants.DOCUMENT_IDENTIFIER_APPFORM);
						Map row = (Map)principalList.get(0);
						RecipientInfoBean recipientInfo = new RecipientInfoBean();
						
						
						//recipientInfo.setIdentifier(ESignConstants.AGENT_SIGNER_IDENTIFIER+""+1);
						List<String> identiferList = new ArrayList<String>();
						identiferList.add(ESignConstants.AGENT_SIGNER_IDENTIFIER+""+1);
						identiferList.add(DATE_IDENTIFIER+"_"+1);
						if(DataUtils.getAccessType((Context)ctx, "esign_custom_tab_security")==1)
							identiferList.add(CUSTOM_TAB_IDENTFIER+"_"+1);
						recipientInfo.setRecipientIdentifierList(identiferList);
						recipientInfo.setRecipientDoc(docuSignRequest.getIdentifier());
						recipientInfo.setRecipientId(1);
						recipientInfo.setEmailAddress(row.get("e_mail").toString());
						if(row.get("printName")!=null)
							recipientInfo.setName(row.get("printName").toString());
						if(row.get("personInitial")!=null)
							recipientInfo.setInitials(row.get("personInitial").toString());
						recipientInfo.setRoutingOrder(1);
					//	recipientInfo.setPersonid(row.get("person_id").toString());
					//	recipientInfo.setObjectidentifier(ctx.get("aar_requestid").toString());
						
						if(DataUtils.getAccessType((Context)ctx, "esign_custom_tab_security")==1)
						{
							ctx.put("customtab_template_code","applicationForm");
							if(row.get("person_id") != null && !HtmlConstants.EMPTY.equals(row.get("person_id").toString())) {
								ctx.put("personid", row.get("person_id").toString());
								logger.debug("Application Form person_id::"+row.get("person_id").toString());
							}
							CustomTabUtil custtab=new CustomTabUtil();
							recipientInfo.setCustomtabmap(custtab.getCustomTabList(ctx,""+docuSignRequest.getDocumentId()));
							if(recipientInfo.getCustomtabmap()==null)
							{
								DataUtils.populateError((Context)ctx, "carrierError", "Unable to send document for ESignature");
								return;
							}
							recipientInfo.setObjectidentifier(""+docuSignRequest.getDocumentId());
						}
						recipientInfoList.add(recipientInfo);
						docuSignRequest.setRecipientInfoList(recipientInfoList);
						docuSignRequest.setDocAnchorInfo(identiferList);
						
						
						docuSignRequestList.add(docuSignRequest);
						
					
						docuSignRequestList = setAutoGeneratedDocumentForEsign(ctx,docuSignRequestList,principalList);

						if(ctx.get("background_check_form_security") != null && ctx.get("background_check_form_security").toString().equals("N")){
							break;
						}
					}
					else{
						for(int i=0; i<principalList.size(); i++){
							DocuSignRequest docuSignRequest = new DocuSignRequest();

							ByteArrayOutputStream bout = boutArary[i+1];
							docuSignRequest.setContent(bout.toByteArray());
							// 'i+2' has done because documentId should be positive and 1 is already assign for APPFORM document
							docuSignRequest.setDocumentId(i+2);
							List<RecipientInfoBean> recipientInfoList = new ArrayList<RecipientInfoBean>();

							docuSignRequest.setIdentifier(ESignConstants.DOCUMENT_IDENTIFIER_APPBG);
							Map row = (Map)principalList.get(i);
							//CR055 nonHRP & LS
							String person_id_t =row.get("person_id").toString();
							if(ctx.get("getContactTypeLS") != null)
							{
								if(ctx.get("getContactTypeLS").toString().contains(person_id_t))
								{
									RecipientInfoBean recipientInfo = new RecipientInfoBean();
									//recipientInfo.setIdentifier(ESignConstants.AGENT_SIGNER_IDENTIFIER +"" +(i+2));

									List<String> identiferList = new ArrayList<String>();
									identiferList.add(ESignConstants.AGENT_SIGNER_IDENTIFIER+""+(i+2));
									identiferList.add(DATE_IDENTIFIER+"_"+(i+2));
									if(DataUtils.getAccessType((Context)ctx, "esign_custom_tab_security")==1)
										identiferList.add(CUSTOM_TAB_IDENTFIER+"_"+(i+2));
									recipientInfo.setRecipientIdentifierList(identiferList);
									recipientInfo.setRecipientDoc(docuSignRequest.getIdentifier());


									recipientInfo.setRecipientId(i+2);

									recipientInfo.setRoutingOrder(1);
									recipientInfo.setEmailAddress(row.get("e_mail").toString());
									//recipientInfo.setPersonid(row.get("person_id").toString());
									//	recipientInfo.setObjectidentifier(row.get("person_id").toString());
									if(row.get("printName")!=null)
										recipientInfo.setName(row.get("printName").toString());
									if(row.get("personInitial")!=null)
										recipientInfo.setInitials(row.get("personInitial").toString());

									if(DataUtils.getAccessType((Context)ctx, "esign_custom_tab_security")==1)
									{
										ctx.put("customtab_template_code","bgcheckForm");
										if(row.get("person_id") != null && !HtmlConstants.EMPTY.equals(row.get("person_id").toString())) {
											ctx.put("person_id", row.get("person_id").toString());
											ctx.put("personid", row.get("person_id").toString());
											logger.debug("bgcheck form person_id::"+row.get("person_id").toString());
										}


										CustomTabUtil custtab=new CustomTabUtil();
										recipientInfo.setCustomtabmap(custtab.getCustomTabList(ctx,""+docuSignRequest.getDocumentId()));
										if(recipientInfo.getCustomtabmap()==null)
										{
											DataUtils.populateError((Context)ctx, "carrierError", "Unable to send document for ESignature");
											return;
										}
										recipientInfo.setObjectidentifier(""+docuSignRequest.getDocumentId());
									}
									recipientInfoList.add(recipientInfo);
									docuSignRequest.setRecipientInfoList(recipientInfoList);
									docuSignRequest.setDocAnchorInfo(identiferList);
									//docuSignRequest.setCustomtabmap(bgcheckFormMap);
									//docuSignRequest.setObjectidentifier(row.get("person_id").toString());


									docuSignRequestList.add(docuSignRequest);
								}
								// HRP & all contact types
								else if(row.get("is_principal").toString().equalsIgnoreCase("Y"))
								{
									RecipientInfoBean recipientInfo = new RecipientInfoBean();
									//recipientInfo.setIdentifier(ESignConstants.AGENT_SIGNER_IDENTIFIER +"" +(i+2));

									List<String> identiferList = new ArrayList<String>();
									identiferList.add(ESignConstants.AGENT_SIGNER_IDENTIFIER+""+(i+2));
									identiferList.add(DATE_IDENTIFIER+"_"+(i+2));
									if(DataUtils.getAccessType((Context)ctx, "esign_custom_tab_security")==1)
										identiferList.add(CUSTOM_TAB_IDENTFIER+"_"+(i+2));
									recipientInfo.setRecipientIdentifierList(identiferList);
									recipientInfo.setRecipientDoc(docuSignRequest.getIdentifier());


									recipientInfo.setRecipientId(i+2);

									recipientInfo.setRoutingOrder(1);
									recipientInfo.setEmailAddress(row.get("e_mail").toString());
									//recipientInfo.setPersonid(row.get("person_id").toString());
									//	recipientInfo.setObjectidentifier(row.get("person_id").toString());
									if(row.get("printName")!=null)
										recipientInfo.setName(row.get("printName").toString());
									if(row.get("personInitial")!=null)
										recipientInfo.setInitials(row.get("personInitial").toString());

									if(DataUtils.getAccessType((Context)ctx, "esign_custom_tab_security")==1)
									{
										ctx.put("customtab_template_code","bgcheckForm");
										if(row.get("person_id") != null && !HtmlConstants.EMPTY.equals(row.get("person_id").toString())) {
											ctx.put("person_id", row.get("person_id").toString());
											ctx.put("personid", row.get("person_id").toString());
											logger.debug("bgcheck form person_id::"+row.get("person_id").toString());
										}


										CustomTabUtil custtab=new CustomTabUtil();
										recipientInfo.setCustomtabmap(custtab.getCustomTabList(ctx,""+docuSignRequest.getDocumentId()));
										if(recipientInfo.getCustomtabmap()==null)
										{
											DataUtils.populateError((Context)ctx, "carrierError", "Unable to send document for ESignature");
											return;
										}
										recipientInfo.setObjectidentifier(""+docuSignRequest.getDocumentId());
									}
									recipientInfoList.add(recipientInfo);
									docuSignRequest.setRecipientInfoList(recipientInfoList);
									docuSignRequest.setDocAnchorInfo(identiferList);
									//docuSignRequest.setCustomtabmap(bgcheckFormMap);
									//docuSignRequest.setObjectidentifier(row.get("person_id").toString());


									docuSignRequestList.add(docuSignRequest);
								}
							}
							else if(row.get("is_principal").toString().equalsIgnoreCase("Y"))
							{
								RecipientInfoBean recipientInfo = new RecipientInfoBean();
								//recipientInfo.setIdentifier(ESignConstants.AGENT_SIGNER_IDENTIFIER +"" +(i+2));

								List<String> identiferList = new ArrayList<String>();
								identiferList.add(ESignConstants.AGENT_SIGNER_IDENTIFIER+""+(i+2));
								identiferList.add(DATE_IDENTIFIER+"_"+(i+2));
								if(DataUtils.getAccessType((Context)ctx, "esign_custom_tab_security")==1)
									identiferList.add(CUSTOM_TAB_IDENTFIER+"_"+(i+2));
								recipientInfo.setRecipientIdentifierList(identiferList);
								recipientInfo.setRecipientDoc(docuSignRequest.getIdentifier());


								recipientInfo.setRecipientId(i+2);

								recipientInfo.setRoutingOrder(1);
								recipientInfo.setEmailAddress(row.get("e_mail").toString());
								//recipientInfo.setPersonid(row.get("person_id").toString());
								//	recipientInfo.setObjectidentifier(row.get("person_id").toString());
								if(row.get("printName")!=null)
									recipientInfo.setName(row.get("printName").toString());
								if(row.get("personInitial")!=null)
									recipientInfo.setInitials(row.get("personInitial").toString());

								if(DataUtils.getAccessType((Context)ctx, "esign_custom_tab_security")==1)
								{
									ctx.put("customtab_template_code","bgcheckForm");
									if(row.get("person_id") != null && !HtmlConstants.EMPTY.equals(row.get("person_id").toString())) {
										ctx.put("person_id", row.get("person_id").toString());
										ctx.put("personid", row.get("person_id").toString());
										logger.debug("bgcheck form person_id::"+row.get("person_id").toString());
									}


									CustomTabUtil custtab=new CustomTabUtil();
									recipientInfo.setCustomtabmap(custtab.getCustomTabList(ctx,""+docuSignRequest.getDocumentId()));
									if(recipientInfo.getCustomtabmap()==null)
									{
										DataUtils.populateError((Context)ctx, "carrierError", "Unable to send document for ESignature");
										return;
									}
									recipientInfo.setObjectidentifier(""+docuSignRequest.getDocumentId());
								}
								recipientInfoList.add(recipientInfo);
								docuSignRequest.setRecipientInfoList(recipientInfoList);
								docuSignRequest.setDocAnchorInfo(identiferList);
								//docuSignRequest.setCustomtabmap(bgcheckFormMap);
								//docuSignRequest.setObjectidentifier(row.get("person_id").toString());


								docuSignRequestList.add(docuSignRequest);
							}
						}

						break;
					}
					
					
					
				}
			}else{
				logger.error("No Principal Admin Agent found");
			}
			
			
			
			
			EnvelopeSummary docRes = null; 
			String errorMsg = "";
			try{
				if(ctx.get("inet_errors_list")!=null && !"".equals(ctx.get("inet_errors_list")))
				{
					return;
				}
				logger.debug("Going to hit DocuSign  ");
				logger.debug(" docuSignRequestList :  "+ docuSignRequestList.toString());
				docRes = docuSign.sendDocument(docuSignRequestList);
				logger.debug("Response got from DocuSign " + docRes);
			}catch (Throwable e1) {
				logger.error("Got error while sending document" + e1.getMessage());
				
				e1.printStackTrace();
			}
			
			if(docRes == null || docRes.getStatus().equals(HtmlConstants.EMPTY) || 
					("ERROR".equalsIgnoreCase(docRes.getStatus().toString()) || "FAILURE".equalsIgnoreCase(docRes.getStatus().toString()))){
				
				DataUtils.populateError((Context)ctx, "carrierError", "Unable to send document for ESignature");
				logger.error("Unable to send document for ESignature due to error : "+ errorMsg);
				return;
			}
			
			//going to insert int database
			Context newCtx = new Context();
			newCtx.setProject(ctx.getProject());
			
			newCtx.put("document_id_var", docRes.getEnvelopeId());
			//newCtx.put("doc_auth_token", docRes.);
			newCtx.put("document_type", "BGAuthorization");
			newCtx.put("last_updated_by", "publicadmin");
			newCtx.put("operationType", "I");
			newCtx.put("aar_requestid", ctx.get("aar_requestid"));
			
			if(docRes.getStatus() != null && "SENT".equalsIgnoreCase(docRes.getStatus().toString())){
				newCtx.put("status_comment", "SENT");
			}
			
			//going to insert in database
			new SetParametersForStoredProcedures().setParametersInContext(newCtx, "status,aar_requestid");
			SqlResources.getSqlMapProcessor(ctx).insert("tbl_esign_status.insert_update_esign_status_p_java", newCtx);
			
			logger.debug("Pdf Doc has sent to agency for esign.");
		}catch (Exception e) {
			DataUtils.populateError((Context)ctx, "carrierError","Error in Sending document for ESign");
			logger.error("Unable to send document for ESignature due to error : " + e.getMessage());
		}
	}
	
	private List<DocuSignRequest> setAutoGeneratedDocumentForEsign(IContext ctx, List<DocuSignRequest> docuSignRequestList, List<Map> principalList) throws Exception{

		ctx.put("onlyGeneratedDocument","Y");

		new SetParametersForStoredProcedures().setParametersInContext(ctx, "onlyGeneratedDocument,aar_requestid");
		List<Map> generatedDocumentList = SqlResources.getSqlMapProcessor(ctx).select("tbl_agency_document_attachments.getDocumentListByRequestid_p", ctx); 
		if(generatedDocumentList != null && generatedDocumentList.size() > 0) {
			for(int i=0; i<generatedDocumentList.size(); i++) {
				Map rowMap =  generatedDocumentList.get(i);

				String documentName  = rowMap.get("document_name") != null?rowMap.get("document_name").toString():null;
				String document_template_type_code  = rowMap.get("document_template_type_code") != null?rowMap.get("document_template_type_code").toString():null;

				ctx.put("file_name", documentName);
				String dmsUploadEnabled = SystemProperties.getInstance().getString("dms.enabled");
				if(dmsUploadEnabled != null && dmsUploadEnabled.equals("Y"))
					ctx.put("dmsUploadEnabled", "N"); //to download document from DMS
				else
					ctx.put("dmsUploadEnabled", "Y"); 
				byte[] rb = new DocumentUploadBO().getDocumentFromDMS(ctx);

				DocuSignRequest docuSignRequest = new DocuSignRequest();


				docuSignRequest.setContent(rb);
				docuSignRequest.setDocumentId(principalList.size()+(i+2));
				List<RecipientInfoBean> recipientInfoList = new ArrayList<RecipientInfoBean>();
				docuSignRequest.setIdentifier(document_template_type_code);
				Map row = (Map)principalList.get(0);
				//CR055 non-HRP & LS
				String person_id_t =row.get("person_id").toString();
				if(ctx.get("getContactTypeLS") != null)
				{
					if(ctx.get("getContactTypeLS").toString().contains(person_id_t))
					{
						RecipientInfoBean recipientInfo = new RecipientInfoBean();

						List<String> identiferList = new ArrayList<String>();
						identiferList.add(ESignConstants.AGENT_SIGNER_IDENTIFIER+"" + document_template_type_code);
						identiferList.add(DATE_IDENTIFIER+"_"+document_template_type_code);
						recipientInfo.setRecipientIdentifierList(identiferList);
						recipientInfo.setRecipientDoc(docuSignRequest.getIdentifier());
						recipientInfo.setRecipientId(1);
						recipientInfo.setEmailAddress(row.get("e_mail").toString());
						if(row.get("printName")!=null)
							recipientInfo.setName(row.get("printName").toString());
						if(row.get("personInitial")!=null)
							recipientInfo.setInitials(row.get("personInitial").toString());
						recipientInfo.setRoutingOrder(1);
						recipientInfoList.add(recipientInfo);
						docuSignRequest.setRecipientInfoList(recipientInfoList);
						docuSignRequest.setDocAnchorInfo(identiferList);
						docuSignRequestList.add(docuSignRequest);
					}
					//HRP & all contact types
					else if(row.get("is_principal").toString().equalsIgnoreCase("Y"))
					{
						RecipientInfoBean recipientInfo = new RecipientInfoBean();

						List<String> identiferList = new ArrayList<String>();
						identiferList.add(ESignConstants.AGENT_SIGNER_IDENTIFIER+"" + document_template_type_code);
						identiferList.add(DATE_IDENTIFIER+"_"+document_template_type_code);
						recipientInfo.setRecipientIdentifierList(identiferList);
						recipientInfo.setRecipientDoc(docuSignRequest.getIdentifier());
						recipientInfo.setRecipientId(1);
						recipientInfo.setEmailAddress(row.get("e_mail").toString());
						if(row.get("printName")!=null)
							recipientInfo.setName(row.get("printName").toString());
						if(row.get("personInitial")!=null)
							recipientInfo.setInitials(row.get("personInitial").toString());
						recipientInfo.setRoutingOrder(1);
						recipientInfoList.add(recipientInfo);
						docuSignRequest.setRecipientInfoList(recipientInfoList);
						docuSignRequest.setDocAnchorInfo(identiferList);
						docuSignRequestList.add(docuSignRequest);
					}
				}
				//HRP & all contact types
				else if(row.get("is_principal").toString().equalsIgnoreCase("Y"))
				{
					RecipientInfoBean recipientInfo = new RecipientInfoBean();

					List<String> identiferList = new ArrayList<String>();
					identiferList.add(ESignConstants.AGENT_SIGNER_IDENTIFIER+"" + document_template_type_code);
					identiferList.add(DATE_IDENTIFIER+"_"+document_template_type_code);
					recipientInfo.setRecipientIdentifierList(identiferList);
					recipientInfo.setRecipientDoc(docuSignRequest.getIdentifier());
					recipientInfo.setRecipientId(1);
					recipientInfo.setEmailAddress(row.get("e_mail").toString());
					if(row.get("printName")!=null)
						recipientInfo.setName(row.get("printName").toString());
					if(row.get("personInitial")!=null)
						recipientInfo.setInitials(row.get("personInitial").toString());
					recipientInfo.setRoutingOrder(1);
					recipientInfoList.add(recipientInfo);
					docuSignRequest.setRecipientInfoList(recipientInfoList);
					docuSignRequest.setDocAnchorInfo(identiferList);
					docuSignRequestList.add(docuSignRequest);
				}
			}
		}

		return docuSignRequestList;
	}
	

	private void uploadDocumentsToDms(IContext ctx, byte[] bout)throws Exception{
		try{
			String isDMSIntegrationdone = SystemProperties.getInstance().getString("dms.integrationdone");
			if(isDMSIntegrationdone != null && isDMSIntegrationdone.equals("Y")){
				//going to insert document in database first to get document_id
				try{
					ctx.put("contents", bout);
					Object obj = SqlResources.getSqlMapProcessor(ctx).findByKey("SqlStmts.UserStatementviewgetOtherDocumentID", ctx);
					if(obj != null && obj instanceof Map){
						Map map = (Map)obj;
						String documentTypeId = map.get("document_id").toString();
						ctx.put("document_type_id",documentTypeId);
					}
					ctx.put("operationType", "I");
					ctx.put("object_id",ctx.get("aar_requestid").toString());
					new SetParametersForStoredProcedures().setParametersInContext(ctx, "document_id,object_id,document_type_id");
					SqlResources.getSqlMapProcessor(ctx).insert("tbl_agency_documents.insert_update_delete_agency_documents_p_java", ctx);
					
					ctx.put("object_id",ctx.get("document_id").toString());
					String documentName = ctx.get("document_name").toString();
					if (documentName != null && !documentName.equals("")) {
						String fileName = documentName.substring(
								documentName.lastIndexOf("\\") + 1,
								documentName.lastIndexOf("."));
						String extn = documentName.substring(documentName.lastIndexOf(".") + 1, documentName.length());

						SimpleDateFormat sdf = new SimpleDateFormat("_yyyy-MM-dd_hh-mm-ss");
						//documentName = fileName + sdf.format(new Date()) + "."+ extn;
						
						//going to trim fileName size
						documentName = fileName+"_"+ctx.get("aar_requestid")+sdf.format(new Date())+"."+extn;
						
						if(documentName.length() > 65){
							int appendedLength = ("_"+ctx.get("aar_requestid")+sdf.format(new Date())+"."+extn).length();
							appendedLength = 65-appendedLength;
							fileName = fileName.substring(0, appendedLength);
							
							documentName = fileName+"_"+ctx.get("aar_requestid")+sdf.format(new Date())+"."+extn;
						}
						
						logger.debug("Uploading file : " + documentName);
						ctx.put("document_name", documentName);
					} else {
						ctx.put("fileerror", "Y");
						return ;
					}
					ctx.put("document_category", ctx.get("document_category_security").toString());
					SqlResources.getSqlMapProcessor(ctx).insert("tbl_agency_document_attachments.insert", ctx);
					logger.debug("File inserted in database.");
				}catch(Exception e){
					logger.error("Unable to insert file in Database due to error : - " + e.getMessage());
					
					DataUtils.populateError((Context)ctx, "documentName", "downloadDocErrorKey");
				    DataUtils.populateError((Context)ctx, "pageError", "downloadDocErrorKey");
				    return;
				}
				
				//going to get DMS provider
				String dmsProvider = SystemProperties.getInstance().getString("dms.provider");
				if(dmsProvider != null){
					if(dmsProvider.equalsIgnoreCase("wss3")){
						//uploading file on sharepoint
						try{
							logger.debug("Going to upload file at sharepoint ---- ");
							new DocumentUploadBO().uploadDocumentToSharePoint((Context)ctx);
							logger.debug("File Uploaded.");
						}catch (Exception e1) {
							logger.error("Unable to upload file at sharepoint due to error : - " + e1.getMessage());
							DataUtils.populateError((Context)ctx, "documentName", "downloadDocErrorKey");
						    DataUtils.populateError((Context)ctx, "pageError", "downloadDocErrorKey");
						    return;	
						}
					}else if(dmsProvider.equalsIgnoreCase("filesystem")){
						//uploading file on DMS
						try{
							String dmsUploadEnabled = SystemProperties.getInstance().getString("dms.enabled");
							ctx.put("dmsUploadEnabled", dmsUploadEnabled);
							logger.debug("Going to upload file at DMS ---- ");
							new DocumentUploadBO().uploadDocumentToDMS((Context)ctx);
						}catch (Exception e1) {
							logger.error("Unable to upload file at DMS due to error : - " + e1.getMessage());
							//Removing from database
							SqlResources.getSqlMapProcessor(ctx).delete("tbl_agency_document_attachments.delete", ctx);
							logger.debug("Document removed.");
							DataUtils.populateError((Context)ctx, "documentName", "downloadDocErrorKey");
						    DataUtils.populateError((Context)ctx, "pageError", "downloadDocErrorKey");
						    return;	
						}
					} 
				}
			}
		}catch (Exception e) {
			logger.error("Unable to upload file due to error : - DMS integration not done");
			DataUtils.populateError((Context)ctx, "documentName", "downloadDocErrorKey");
		    DataUtils.populateError((Context)ctx, "pageError", "downloadDocErrorKey");
		    return;	
		}
	}
	
	public static void sendDocForEsign(IContext ctx, ByteArrayOutputStream[] boutArary,List principalList) throws Exception {
		
		try{
			List<Map<String,String>> esignRequestsDataList = new ArrayList<Map<String,String>>();
				Map<String,String> esignRequestMap = null;
				int document_id = 1;
				int recipient_id = 1;
				for(int k=0; k<2; k++){

					if(k == 0){

						ByteArrayOutputStream bout = boutArary[0];
						Map row = (Map)principalList.get(0);
						esignRequestMap = new HashMap<String,String>();

						esignRequestMap.put("UserName", row.get("printName").toString());
						esignRequestMap.put("Initials", row.get("personInitial").toString());
						esignRequestMap.put("Email", row.get("e_mail").toString());
						esignRequestMap.put("doc_identifier", ESignConstants.DOCUMENT_IDENTIFIER_APPFORM);
						esignRequestMap.put("recipient_identifier", ESignConstants.AGENT_SIGNER_IDENTIFIER+""+recipient_id);
						esignRequestMap.put("recipient_date_identifier", DATE_IDENTIFIER+"_"+recipient_id);
						esignRequestMap.put("routingOrder", "1");

						esignRequestMap.put("Content", Base64.encodeBase64String(bout.toByteArray()));
						esignRequestMap.put("document_id", String.valueOf(document_id));
						document_id++;
						esignRequestMap.put("recipient_id", String.valueOf(recipient_id));
						recipient_id++;
						esignRequestsDataList.add(esignRequestMap);

						ctx.put("onlyGeneratedDocument","Y");

						new SetParametersForStoredProcedures().setParametersInContext(ctx, "onlyGeneratedDocument,aar_requestid");
						List<Map> generatedDocumentList = SqlResources.getSqlMapProcessor(ctx).select("tbl_agency_document_attachments.getDocumentListByRequestid_p", ctx); 
						if(generatedDocumentList != null && generatedDocumentList.size() > 0) {
							for(int i=0; i<generatedDocumentList.size(); i++) {
								Map rowMap =  generatedDocumentList.get(i);

								String documentName  = rowMap.get("document_name") != null?rowMap.get("document_name").toString():null;
								String document_template_type_code  = rowMap.get("document_template_type_code") != null?rowMap.get("document_template_type_code").toString():null;

								ctx.put("file_name", documentName);
								String dmsUploadEnabled = SystemProperties.getInstance().getString("dms.enabled");
								if(dmsUploadEnabled != null && dmsUploadEnabled.equals("Y"))
									ctx.put("dmsUploadEnabled", "N"); //to download document from DMS
								else
									ctx.put("dmsUploadEnabled", "Y"); 
								byte[] rb = new DocumentUploadBO().getDocumentFromDMS(ctx);

								//DocuSignRequest docuSignRequest = new DocuSignRequest();
								esignRequestMap = new HashMap<String,String>();
								esignRequestMap.put("Content", Base64.encodeBase64String(rb));
								esignRequestMap.put("document_id", String.valueOf(principalList.size()+(i+2)));
								//document_id++;
								esignRequestMap.put("doc_identifier", document_template_type_code);
								esignRequestMap.put("recipient_id", String.valueOf(principalList.size()+(i+2)));
								//recipient_id++;
								esignRequestMap.put("recipient_identifier", ESignConstants.AGENT_SIGNER_IDENTIFIER+""+document_template_type_code);
								esignRequestMap.put("recipient_date_identifier", DATE_IDENTIFIER+"_"+document_template_type_code);
								esignRequestMap.put("routingOrder", "1");


								esignRequestMap.put("Email", row.get("e_mail").toString());
								if(row.get("printName")!=null);
								esignRequestMap.put("UserName", row.get("printName").toString());

								if(row.get("personInitial")!=null)
									esignRequestMap.put("Initials", row.get("personInitial").toString());

								esignRequestsDataList.add(esignRequestMap);

							}

							if(ctx.get("background_check_form_security") != null && ctx.get("background_check_form_security").toString().equals("N")){
								break;
							}				
						}
					}
					else{

						for(int i=0; i<principalList.size(); i++){

							esignRequestMap = new HashMap<String,String>();


							ByteArrayOutputStream bout = boutArary[i+1];
							Map row = (Map)principalList.get(i);


							//CR055 non-HRP & LS
							String person_id_t =row.get("person_id").toString();
							if(ctx.get("getContactTypeLS") != null)
							{
								if(ctx.get("getContactTypeLS").toString().contains(person_id_t))
								{
									esignRequestMap.put("UserName", row.get("printName").toString());
									esignRequestMap.put("Initials", row.get("personInitial").toString());
									esignRequestMap.put("Email", row.get("e_mail").toString());
									esignRequestMap.put("doc_identifier", ESignConstants.DOCUMENT_IDENTIFIER_APPBG+"_"+(i+1));
									esignRequestMap.put("recipient_identifier", ESignConstants.AGENT_SIGNER_IDENTIFIER+""+recipient_id);
									esignRequestMap.put("recipient_date_identifier", DATE_IDENTIFIER+"_"+recipient_id);
									esignRequestMap.put("routingOrder", "1");
									esignRequestMap.put("document_id", String.valueOf(document_id));
									document_id++;
									esignRequestMap.put("recipient_id", String.valueOf(recipient_id));
									recipient_id++;
									esignRequestMap.put("Content", Base64.encodeBase64String(bout.toByteArray()));

									esignRequestsDataList.add(esignRequestMap);
								}
								// HRP & all contact types
								else if(row.get("is_principal").toString().equalsIgnoreCase("Y"))
								{
									esignRequestMap.put("UserName", row.get("printName").toString());
									esignRequestMap.put("Initials", row.get("personInitial").toString());
									esignRequestMap.put("Email", row.get("e_mail").toString());
									esignRequestMap.put("doc_identifier", ESignConstants.DOCUMENT_IDENTIFIER_APPBG+"_"+(i+1));
									esignRequestMap.put("recipient_identifier", ESignConstants.AGENT_SIGNER_IDENTIFIER+""+recipient_id);
									esignRequestMap.put("recipient_date_identifier", DATE_IDENTIFIER+"_"+recipient_id);
									esignRequestMap.put("routingOrder", "1");
									esignRequestMap.put("document_id", String.valueOf(document_id));
									document_id++;
									esignRequestMap.put("recipient_id", String.valueOf(recipient_id));
									recipient_id++;
									esignRequestMap.put("Content", Base64.encodeBase64String(bout.toByteArray()));

									esignRequestsDataList.add(esignRequestMap);
								}
							}
							else if(row.get("is_principal").toString().equalsIgnoreCase("Y"))
							{
								esignRequestMap.put("UserName", row.get("printName").toString());
								esignRequestMap.put("Initials", row.get("personInitial").toString());
								esignRequestMap.put("Email", row.get("e_mail").toString());
								esignRequestMap.put("doc_identifier", ESignConstants.DOCUMENT_IDENTIFIER_APPBG+"_"+(i+1));
								esignRequestMap.put("recipient_identifier", ESignConstants.AGENT_SIGNER_IDENTIFIER+""+recipient_id);
								esignRequestMap.put("recipient_date_identifier", DATE_IDENTIFIER+"_"+recipient_id);
								esignRequestMap.put("routingOrder", "1");
								esignRequestMap.put("document_id", String.valueOf(document_id));
								document_id++;
								esignRequestMap.put("recipient_id", String.valueOf(recipient_id));
								recipient_id++;
								esignRequestMap.put("Content", Base64.encodeBase64String(bout.toByteArray()));

								esignRequestsDataList.add(esignRequestMap);
							}
						}

						break;
					}

				}
				
				if(esignRequestsDataList != null && esignRequestsDataList.size() > 0) {
					
					JSONObject esignPayloadJson = converttoESignPayLoad(esignRequestsDataList);
					logger.debug("Esign Payload JSON : " + esignPayloadJson.toString());
					
					try{
						logger.debug("Going to hit Esign Adapter");
						//docRes = esign.sendDocForESign(docRequests);
						String message = callEsignAdapter(esignPayloadJson.toString(), (Context)ctx);
						logger.debug("Response got from ESign Adapter " + message);
					}catch (Throwable e1) {
						logger.error("Got error while sending document " + e1.getMessage());
						e1.printStackTrace();
					}
					
				}else {
					logger.debug("ESign Request Data List NOt Found");
				}
				
		
		}catch (Exception e) {
			
			new SetParametersForStoredProcedures().setParametersInContext(ctx, "aar_requestid");
			SqlResources.getSqlMapProcessor(ctx).insert("tbl_agency_documents.deleteAutoPopulatedDocumentsOnEsignFail_p", ctx);
			
			DataUtils.populateError((Context)ctx, "carrierError","Error in Sending document for ESign");
			logger.error("Unable to send document for ESignature due to error : " + e.getMessage());
		}
		
		
	}
	
	
	private static JSONObject converttoESignPayLoad(List<Map<String, String>> esignRequestsDataList) {

		JSONObject esignRequestList = new JSONObject();   
		JSONObject esignRequests = new JSONObject();   
		JSONArray esignRequestArray = new JSONArray();   
		logger.debug("esignRequestsDataList : " +  esignRequestsDataList);
		
		for (int i = 0; i < esignRequestsDataList.size(); i++) {
			Map<String, String> esignRequestMap = esignRequestsDataList.get(i);
			JSONObject esignRequestObject = new JSONObject();
			if (esignRequestMap.get("Content") != null)
				esignRequestObject.put("Content", esignRequestMap.get("Content"));

			if (esignRequestMap.get("doc_identifier") != null)
				esignRequestObject.put("Identifier", esignRequestMap.get("doc_identifier"));

			esignRequestObject.put("DocumentId", esignRequestMap.get("document_id"));
			
			if (esignRequestMap.get("UserName") != null) {

				JSONArray receipientInfoObject = new JSONArray();  
				JSONObject recipientObject = new JSONObject();
				//TODO - Remove commented lines
//				JSONArray signerIdentifierObject = new JSONArray();  
//				JSONObject identifierObject = new JSONObject();
				List<String> identifierObject = new ArrayList<String>();
				//JSONObject signerIdentifierObject = new JSONObject();
				
				//JSONArray docAnchorArrayObject = new JSONArray();  
				//JSONObject docAnchorObject = new JSONObject();
				List<String> docAnchorObject = new ArrayList<String>();
				
				recipientObject.put("ID", esignRequestMap.get("recipient_id"));
				recipientObject.put("Type", "Signer");
				recipientObject.put("RequireIDLookup", "false");

				if (esignRequestMap.get("UserName") != null)
					recipientObject.put("UserName", esignRequestMap.get("UserName"));

				if (esignRequestMap.get("Email") != null)
					recipientObject.put("Email", esignRequestMap.get("Email"));
				
				if (esignRequestMap.get("Initials") != null)
					recipientObject.put("Initials", esignRequestMap.get("Initials"));
				
				if (esignRequestMap.get("doc_identifier") != null)
					recipientObject.put("RecipientDoc", esignRequestMap.get("doc_identifier"));
				
				if (esignRequestMap.get("routingOrder") != null)
					recipientObject.put("RoutingOrder", esignRequestMap.get("routingOrder"));
				
				if (esignRequestMap.get("recipient_identifier") != null) {
					recipientObject.put("Identifier", esignRequestMap.get("recipient_identifier"));
					identifierObject.add(esignRequestMap.get("recipient_identifier"));
					//identifierObject.put("RecipientIdentifier", esignRequestMap.get("recipient_identifier"));
					//docAnchorObject.put("DocAnchor", esignRequestMap.get("recipient_identifier"));
					docAnchorObject.add(esignRequestMap.get("recipient_identifier"));
					//docAnchorArrayObject.put(docAnchorObject);
					//signerIdentifierObject.put(identifierObject);
					
				}
					
				if (esignRequestMap.get("recipient_date_identifier") != null) {
					recipientObject.put("DateIdentifier", esignRequestMap.get("recipient_date_identifier"));
					//identifierObject.put("RecipientIdentifier", esignRequestMap.get("recipient_date_identifier"));
					identifierObject.add(esignRequestMap.get("recipient_date_identifier"));
					//docAnchorObject.put("DocAnchor", esignRequestMap.get("recipient_date_identifier"));
					docAnchorObject.add(esignRequestMap.get("recipient_date_identifier"));
					//docAnchorArrayObject.put(docAnchorObject);
					//signerIdentifierObject.put(identifierObject);
				}
				
				//recipientObject.put("RecipientIdentifierList",signerIdentifierObject);
				recipientObject.put("RecipientIdentifierList",identifierObject);
				receipientInfoObject.put(recipientObject);
				
				JSONObject recipientInfoCover = new JSONObject();
				recipientInfoCover.put("RecipientInfo", receipientInfoObject);
				esignRequestObject.put("RecipientInfoList", recipientInfoCover);
				esignRequestObject.put("DocAnchorInfo", docAnchorObject);

			}
			esignRequestArray.put(esignRequestObject);
		}
		
		if(esignRequestArray.length() > 0) {
			esignRequests.put("ESignRequest", esignRequestArray);
			esignRequestList.put("ESignRequests", esignRequests);
			
			JSONObject finalJsonObj = new JSONObject();
			finalJsonObj.put("ESignatureRequest", esignRequestList);
			return finalJsonObj;
			
		}else {
			return null;
		}
		
	

	}

	
	private static String callEsignAdapter(String payloadString, Context ctx)
		        throws Exception {
		Map<String,Object> responseMap = new HashMap();
		String wsURL ="";
		String username ="";
		String password ="";
		String esignatureAdapter ="";
		String version ="1.0.0.0";
		int connectionRequestTimeout = 30;
		int socketTimeout = 30;
		int connectTimeout = 30;
		
		try {
		    wsURL = SystemProperties.getInstance().getProperty("integration.ws.baseURL"); 
		    username = SystemProperties.getInstance().getProperty("integration.ws.username"); 
		    password = SystemProperties.getInstance().getProperty("integration.ws.password");
		    esignatureAdapter = SystemProperties.getInstance().getProperty("integration.adapter.esignature");
		    version = SystemProperties.getInstance().getProperty("integration.adapter.esignature.version");
		}catch (Exception e) {
			responseMap.put("status","failed");
			responseMap.put("message","Unable to find Intg Properties");
			logger.error("Error While fetching Property for Intg");
			
			DataUtils.populateError((Context)ctx, "carrierError", "Unable to send document for ESignature");
			logger.error("Unable to send document for ESignature due to error : " + responseMap);
			return "ERROR";
		}
		
		try {
			String connectionRequestTimeoutString = SystemProperties.getInstance().getProperty("integration.ws.connectionRequestTimeout");
			if(connectionRequestTimeoutString != null && !HtmlConstants.EMPTY.equals(connectionRequestTimeoutString))
				connectionRequestTimeout = Integer.parseInt(connectionRequestTimeoutString);
				
			String socketTimeoutString = SystemProperties.getInstance().getProperty("integration.ws.socketTimeout"); 
			if(socketTimeoutString != null && !HtmlConstants.EMPTY.equals(socketTimeoutString))
				socketTimeout = Integer.parseInt(socketTimeoutString);
			
			String connectTimeoutString = SystemProperties.getInstance().getProperty("integration.ws.connectTimeout");
			if(connectTimeoutString != null && !HtmlConstants.EMPTY.equals(connectTimeoutString))
				connectTimeout = Integer.parseInt(connectTimeoutString);
			
		}catch (Exception e) {
			logger.error("Error While fetching timeout properties for Intg, Default set to 30 seconds ");
			
		}
		    IntegrationPlatformClient ipc = new IntegrationPlatformClient(wsURL, username, password);
		    ipc.setConnectionRequestTimeout(connectionRequestTimeout);
		    ipc.setConnectTimeout(connectTimeout);
		    ipc.setSocketTimeout(socketTimeout);
		    
		    
		    
			IntegrationRequest request = new IntegrationRequest();
		    
		    if(esignatureAdapter != null && !"".equalsIgnoreCase(esignatureAdapter) )
		    	request.setAdapterName(esignatureAdapter);
		    else
		    	request.setAdapterName("dm-esignature-adapter");
			
		    request.setVersion(version);
			request.setSubject("SendForEsign");
			request.setContentType("application/json");
			request.setDataSource("payload");
			request.setPayload(payloadString);
			request.setOption("docusign");
			request.setObject(ctx.get("aar_requestid").toString());
		    request.setRequestedBy("PublicAgency");
		    request.setErrorKey("AdaptorErrors");

		  
		    logger.debug("Esign Request " + request.toString());
		    
		    try{
		    	IntegrationResponse ir = ipc.sendAndReceive(request);
		       
		    	logger.debug("ESign Response " + ir);
		    	if (200 == ir.getStatusCode()) {
		    		if (ir.getPayload() != null && !HtmlConstants.EMPTY.equals(ir.getPayload())) {
					logger.debug("Response Payload : " + ir.getPayload().toString());
					

						JSONObject responsePayload = new JSONObject(ir.getPayload().toString());
						
						String status = "";
			            String message = "";
			            String identifier = "";
			            String auth_token = null;
						if(ir.getStatus() != null)
							status = ir.getStatus().toString();
						
						if(responsePayload.has("message"))
							message = responsePayload.get("message").toString();
						if(responsePayload.has("identifier"))
							identifier = responsePayload.get("identifier").toString();
						if(responsePayload.has("authToken"))
							auth_token = responsePayload.get("authToken").toString();
			            
			            if(status == null || status.equals(HtmlConstants.EMPTY)  
		    					|| ("ERROR".equalsIgnoreCase(status) || "FAILURE".equalsIgnoreCase(status))
		    					|| "failed".equalsIgnoreCase(status))
			            {
			            	ctx.put("errorInEsignConnectvity", "Y");
			            	logger.error("Error Received from intg :" + message);
							
							
			            }else{
			            	if(message == null || message.equals(HtmlConstants.EMPTY) || 
			    					("ERROR".equalsIgnoreCase(message) || "FAILURE".equalsIgnoreCase(message))){
			    					
			    				
			    				new SetParametersForStoredProcedures().setParametersInContext(ctx, "aar_requestid");
			    				SqlResources.getSqlMapProcessor(ctx).insert("tbl_agency_documents.deleteAutoPopulatedDocumentsOnEsignFail_p", ctx);
			    				
			    				DataUtils.populateError((Context)ctx, "carrierError", "Unable to send document for ESignature");
			    				logger.error("Unable to send document for ESignature due to error : " + message);
			    				return message;
			    			}
			    			
			    			Context newCtx = new Context();
			    			newCtx.setProject(ctx.getProject());
			    			
			    			newCtx.put("document_id_var", identifier);
			    			newCtx.put("doc_auth_token", auth_token);
			    			newCtx.put("document_type", "BGAuthorization");
			    			newCtx.put("last_updated_by", "publicadmin");
			    			newCtx.put("operationType", "I");
			    			newCtx.put("aar_requestid", ctx.get("aar_requestid"));
			    			
			    			if(status != null && (status.equalsIgnoreCase("SUCCESS") || status.equalsIgnoreCase("Document sent for esign successfully"))){
			    				newCtx.put("status_comment", "SENT");
			    			}
			    			
			    			//going to insert in database
			    			new SetParametersForStoredProcedures().setParametersInContext(newCtx, "status,aar_requestid");
			    			SqlResources.getSqlMapProcessor(ctx).insert("tbl_esign_status.insert_update_esign_status_p_java", newCtx);
			    			
			    			logger.debug("Pdf Doc has sent to agency for esign.");
			                return message;
			            }
			        
						
					} else {
						//Response paylod is empty and no error from Adapter
						
						DataUtils.populateError((Context)ctx, "Response Payload", "Response Payload is empty");
					}
				}else if(ir.getErrorKey() != null) {
					JSONObject errorJsonObject = new JSONObject(ir.getErrorKey().toString());
					if(errorJsonObject.keySet().contains("errors")) {

						JSONArray errorPayloadArray = (JSONArray)errorJsonObject.get("errors");
						
						if(errorPayloadArray != null && errorPayloadArray.length() > 0) {
							Map<String,String> errorMap = new HashMap<String,String>();
							for(int i=0; i<errorPayloadArray.length(); i++) {
								JSONObject errosJSON = errorPayloadArray.getJSONObject(i);
								
								Set<String> errorSet = errosJSON.keySet();
								for(String errorKey : errorSet) {
									String errorMsg = errosJSON.getString(errorKey);
									DataUtils.populateError(ctx, errorKey, errorMsg);
									errorMap.put(errorKey,errorMsg);
								}
							}
							
		    			
		    			logger.error("Unable to send document for ESignature due to error : " + errorMap);
							
						}
					
					}
					else if(errorJsonObject.keySet() != null) {
						Set<String> errorSet = errorJsonObject.keySet();
						Map<String,String> errorMap = new HashMap<String,String>();
						for(String errorKey : errorSet) {
							String errorMsg = errorJsonObject.getString(errorKey);
							DataUtils.populateError(ctx, errorKey, errorMsg);
							logger.error(errorKey +" " + errorMsg);
							errorMap.put(errorKey,errorMsg);
						}
						
						logger.error("Unable to send document for ESignature due to error : " + errorMap);
						
					}
				}else if(ir.getPayload() != null){
						DataUtils.populateError(ctx, "Error Payload", ir.getPayload().toString());
						logger.error(ir.getPayload().toString());
				}else {
					//Response paylod is empty and no error from Adapter
					DataUtils.populateError((Context)ctx, "Response Payload", "Response Payload is empty");
					
				}
		        
		        if (ctx.get(Constants.INET_ERRORS_LIST) != null) {
		        	DataUtils.populateError((Context)ctx, "carrierError", "Unable to send document for ESignature");
		        	new SetParametersForStoredProcedures().setParametersInContext(ctx, "aar_requestid");
    				SqlResources.getSqlMapProcessor(ctx).insert("tbl_agency_documents.deleteAutoPopulatedDocumentsOnEsignFail_p", ctx);
		        }
		        	
		        
		    }
		    catch(Exception e){
		    	ctx.put("errorInEsignConnectvity", "Y");
		    	logger.error("Error Received from intg : " + DataUtils.getExceptionStackTrace(e));
				
				new SetParametersForStoredProcedures().setParametersInContext(ctx, "aar_requestid");
				SqlResources.getSqlMapProcessor(ctx).insert("tbl_agency_documents.deleteAutoPopulatedDocumentsOnEsignFail_p", ctx);
				DataUtils.populateError((Context)ctx, "carrierError", "Unable to send document for ESignature");
		    }
		    return null;
		}
	
}
