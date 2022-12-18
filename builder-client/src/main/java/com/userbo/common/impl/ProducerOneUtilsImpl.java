
package com.userbo.common.impl;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;

import javax.servlet.ServletContext;
import javax.xml.transform.Result;
import javax.xml.transform.Source;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.sax.SAXResult;
import javax.xml.transform.stream.StreamSource;

import org.apache.fop.apps.FOUserAgent;
import org.apache.fop.apps.Fop;
import org.apache.fop.apps.FopFactory;
import org.apache.fop.apps.MimeConstants;
import org.apache.fop.servlet.ServletContextURIResolver;

import com.manage.mail.MailSender;
import com.manage.managecomponent.components.SetParametersForStoredProcedures;
import com.manage.managemetadata.functions.commonfunctions.DataUtils;
import com.manage.util.XMLUtils;
import com.ormapping.ibatis.SqlResources;
import com.util.CacheManager;
import com.util.Context;
import com.util.HtmlConstants;
import com.util.IContext;
import com.util.IOUtils;
import com.util.InetLogger;
import com.util.StringUtils;
import com.util.SystemProperties;

public class ProducerOneUtilsImpl {
	public static String DATE_PATTERN = "MM-dd-YYYY hh:mm";
	private static InetLogger logger = InetLogger.getInetLogger("ProducerOneUtils");
	private static final String rownum = "rownum";
	private static String tempProdCode = null;
	private static String prodNumId = null;
	
	public static String getCustomizedProducerCode(Context ctx) {

		String generatedSubProducerNumber = "";
		String outputParam="";
		try {
			// call procedure

			int producerNumberId = Integer.parseInt(ctx.get("producer_number_id").toString());
			String prodNumIdTemp = ctx.get("producer_number_id").toString();
			ctx.put("producer_number_id", producerNumberId);
			ctx.put("output", outputParam);
			
			List subProdCodeDB = (List) SqlResources.getSqlMapProcessor(ctx).select("person.getLatestSubProducerCode_p",
					ctx);
			
			System.out.println(subProdCodeDB);
			String prevSubProducerCode = "";

			if (subProdCodeDB != null && subProdCodeDB.size() != 0) {
				HashMap<String, String> map = (HashMap<String, String>) subProdCodeDB.get(subProdCodeDB.size() - 1);
				prevSubProducerCode = map.get("sub_producer");
			}

			if (prodNumIdTemp == null || !prodNumIdTemp.equals(prodNumId)) {
				tempProdCode = null;
				prodNumId = prodNumIdTemp;
			}

			int temp = 0;
			if ((prevSubProducerCode != null && !prevSubProducerCode.equals("")) || tempProdCode != null) {
				if (tempProdCode == null) {
					tempProdCode = prevSubProducerCode;
				} else {
					prevSubProducerCode = tempProdCode;
				}
				/**/
				if (StringUtils.isNumeric(prevSubProducerCode)) {
					int intPrevSubProducerCode = Integer.parseInt(prevSubProducerCode);
					if (intPrevSubProducerCode == 98)
						generatedSubProducerNumber = "1A";
					else
						generatedSubProducerNumber = String.valueOf(intPrevSubProducerCode + 1);
				} else {

					if (prevSubProducerCode.charAt(0) == '1') {
						if (prevSubProducerCode.equals("1Z")) {
							generatedSubProducerNumber = "AA";
						} else {
							char c = prevSubProducerCode.charAt(1);
							c += 1;
							generatedSubProducerNumber = String.valueOf(prevSubProducerCode.charAt(0))
									+ String.valueOf(c);
						}
					} else {
						char c1 = prevSubProducerCode.charAt(0);
						char c2 = prevSubProducerCode.charAt(1);
						if (c2 == 'Z') {
							c1++;
							c2 = 'A';
						} else {
							c2++;
						}
						generatedSubProducerNumber = String.valueOf(c1) + String.valueOf(c2);
					}
				}
			} else {
				generatedSubProducerNumber = "01";
			}

			if (generatedSubProducerNumber != null && generatedSubProducerNumber.length() < 2) {
				generatedSubProducerNumber = "0" + generatedSubProducerNumber;
			}
			tempProdCode = generatedSubProducerNumber;
		} catch (Exception e) {
			// TODO: handle exception
			logger.info(e.getMessage());
		}
		ctx.put("sub_producer", generatedSubProducerNumber);
		logger.debug(ctx, "Su_producer number");
		
		return generatedSubProducerNumber;

	}
	
	public static String getSevenDigitAgencyCode(Context ctx) 
	{		
		return null;
	}
		
	
	

public static String checkContains(Context ctx){
    
	String stringFound = "false";
    String inputString=null;
    String stringToCampare="5";
    
    if(ctx.containsKey("contacttypid") && ctx.get("contacttypid")!=null && !"".equals(ctx.get("contacttypid").toString())){
    	inputString=ctx.get("contacttypid").toString();
    }
    /* else condition to check contact type on view action */
    else if(ctx.containsKey("contacttype") && ctx.get("contacttype")!=null && !"".equals(ctx.get("contacttype").toString())){
    	inputString=ctx.get("contacttype").toString();
    }
    if(inputString == null || "".equals(inputString)){
        return stringFound;
    }else{
        StringTokenizer tokens = new StringTokenizer(inputString, ",");
        
        if(tokens.countTokens() > 0){
            while (tokens.hasMoreTokens()) {
                String tokenValue = tokens.nextToken();
                if (tokenValue != null && !HtmlConstants.EMPTY.equals(tokenValue)) {
                    if (tokenValue.equals(stringToCampare)) {
                        stringFound = "true";
                        break;
                    }
                }
                
            }
              
        }
        
    }
    ctx.put("EqualsFlag", stringFound);
    return stringFound;
}
public static String generateMovingLocationLetter(Context ctx)
{
	try
	{
	List list= (List)ctx.get("uploadDocument_list_1");
	List newList=new ArrayList();
	Map<String,String> map1=new HashMap<String,String>();
	String fileName="";
	if (!list.isEmpty()) 
	{
		for (int i = 0; i < list.size(); i++) 
		{
			Map map = (Map) list.get(i);
			fileName=map.get("document_name").toString();
			map.put("file_name", fileName);
			map.put("document_type_id", "7");
			list.clear();
			list.add(map);
			ctx.put("uploadPopup_list_1", list);
		}
	}
	}
	catch (Exception e) {
		e.printStackTrace();
	}
	
	return "";
}
public static String attachAndSendEmail (Context ctx)
{
	try
	{
		boolean flag = false;
		int count = 0;		
		Map cmap=null;
		String selectedRecords=null;
		List arrAppointmentLicensesList=null;
		
		if(ctx.get("LetterType")!=null && !"".equals(ctx.get("LetterType"))){
		//select type agency or agent 
		ctx.put("BulkAppointmentMode","Y");
		if(ctx.get("LetterType").equals("agencyletter")){
			if(ctx.get("BulkAppointmentMode").equals("Y")){
				arrAppointmentLicensesList=(List)ctx.get("getBulkAppointTerminationLetter_mom_list_01");
			}else
			{
			arrAppointmentLicensesList=(List)ctx.get("AgencyLicensesAppointments_mom_list_1");
			}
			
		}else{
			if(ctx.get("BulkAppointmentMode").equals("Y")){
				arrAppointmentLicensesList=(List)ctx.get("getBulkAppointTerminationLetter_mom_list_01");
			}else{
				 arrAppointmentLicensesList=(List)ctx.get("getAgentLicesneDetails_mom_list_1");
			}
		}
		
		if(ctx.get("method") != null && ctx.get("method").equals("downloadBulkAppointmentLetter")){
			Integer id=0;
			for( int c=0;c<arrAppointmentLicensesList.size();c++){
				cmap=null;
				cmap=(HashMap) arrAppointmentLicensesList.get(c);
				if(cmap!=null){	
					if(ctx.get("BulkAppointmentMode").equals("Y") && ctx.get("isApppointPage").equals("entityAppoint")){
						id=(Integer) cmap.get("agency_licenses_appointment_id");
					 }
					 else if(ctx.get("BulkAppointmentMode").equals("Y") && ctx.get("isApppointPage").equals("agentAppoint")){
						 id=(Integer) cmap.get("agent_licenses_appointment_id");
					 }
					String ctxID=(String)ctx.get("ajax_field_chkLetter_"+c);
						if(ctxID!=null ){
							if(ctxID.equals("Y") && cmap.get("termination_transaction_id")!=null && Integer.parseInt(cmap.get("termination_transaction_id").toString())==0){
								if(count>0){
									
									selectedRecords=selectedRecords.concat(",").concat(String.valueOf(id));
									
								}else{
									
									selectedRecords=String.valueOf(id);
									if(cmap.get("is_terminated")!=null ){
										//flag=true;
									}
								}
								
								count++;
								
							}
						}
				}
			}
			getAppointmentLetterData(ctx,selectedRecords);
			
		}
		else
			{
				
			}
			}
		}
	catch (Exception e) {
		e.printStackTrace();
	}
	return "";
	
}
	

	@SuppressWarnings("unchecked")
	private static void getAppointmentLetterData(IContext ctx,String selectedRecords)  {
	try
	{
		Context apptLetterContext = new Context();
		String adminMailURL = null;
		String adminPhone = null;
		String entityAgentLabel = null;
		String clientFullName = null;
		String templatePdfFile="";
		String outputPdfDir="";
		String pdf_document_name="";
		String xmlFile="";
		String templatePath="";
		String p1LogoPath="";
		String  state="";
		MailSender mailSender = new MailSender();
		List<String> attachFilesList = new ArrayList<String>();
		
		DateFormat df = DateFormat.getDateInstance(DateFormat.FULL);
		templatePath = SystemProperties.getInstance().getString("appl.home.dir");
		xmlFile = SystemProperties.getInstance().getString("appl.home.dir") + "documenttempxml.xml";
		templatePdfFile = templatePath + "/foxsl" + "/appointmentLetterSendEmail.xsl"; // PDF template file
		outputPdfDir = SystemProperties.getInstance().getString("appl.ProducerOne.commission.stmt.output.pdf.path");// PDF Output path
		pdf_document_name ="AppointmentLetter_"+ctx.get("person_id")+".pdf";
		p1LogoPath = SystemProperties.getInstance().getString("appl.home.dir") + "images";
		p1LogoPath = p1LogoPath.replace('\\', '/');
		apptLetterContext.put("p1LogoPath", p1LogoPath);
		//ctx.put("date", df.format(new Date()));
		apptLetterContext.put("date", df.format(new Date()));
		if(SystemProperties.getInstance().getString("mail.admin.address") != null && !HtmlConstants.EMPTY.equals(SystemProperties.getInstance().getString("mail.admin.address"))) {
			adminMailURL = SystemProperties.getInstance().getString("mail.admin.address");
			apptLetterContext.put("adminSupportMail", adminMailURL);
		}
		if(SystemProperties.getInstance().getString("appl."+ctx.getProject()+".admin.address.phone") != null && !HtmlConstants.EMPTY.equals(SystemProperties.getInstance().getString("appl."+ctx.getProject()+".admin.address.phone"))) {
			adminPhone = SystemProperties.getInstance().getString("appl."+ctx.getProject()+".admin.address.phone");
			apptLetterContext.put("adminPhone", adminPhone);
		}
		if(ctx.get("clientFullName") != null && !HtmlConstants.EMPTY.equals(ctx.get("clientFullName"))){ 
			clientFullName =ctx.get("clientFullName").toString();
			clientFullName = clientFullName.replaceAll("&amp;", "&");
			apptLetterContext.put("clientFullName", clientFullName);
		}
		List appLetterList = new ArrayList();
		if(ctx.get("LetterType").equals("agencyletter")){
			HashMap agencyMap = (HashMap)SqlResources.getSqlMapProcessor(ctx).findByKey("agency_master.findByKey",ctx);
			if(agencyMap != null){
				String agencyName = (String) agencyMap.get("name");
				//ctx.put("agencyname", agencyName);
				apptLetterContext.put("agencyname", agencyName);
				apptLetterContext.put("Agent_Name", agencyName);
			}
			ctx.put("type", "A");
			ctx.put("object_id", agencyMap.get("agency_id") != null && !HtmlConstants.EMPTY.equals(agencyMap.get("agency_id")) ? Integer.parseInt(agencyMap.get("agency_id").toString()): null);
			ctx.put("AgencyAddresType", ctx.get("AgencyAddresType") != null && !HtmlConstants.EMPTY.equals(ctx.get("AgencyAddresType")) ? ctx.get("AgencyAddresType").toString(): null);
			ctx.put("AgentAddresType", ctx.get("AgentAddresType") != null && !HtmlConstants.EMPTY.equals(ctx.get("AgentAddresType")) ? ctx.get("AgentAddresType").toString(): null);
			ctx.put("isShowAgencyBusinessAddress", ctx.get("isShowAgencyBusinessAddress") != null && !HtmlConstants.EMPTY.equals(ctx.get("isShowAgencyBusinessAddress")) ? ctx.get("isShowAgencyBusinessAddress").toString(): null);
			new SetParametersForStoredProcedures().setParametersInContext(ctx, "isShowAgencyBusinessAddress,AgentAddresType,AgencyAddresType,person_id,agency_id");
			Map addressMap = (Map)SqlResources.getSqlMapProcessor(ctx).findByKey("person.GetAppointmentTerminationLetterAddress_p",ctx);
			//ctx.put("addressMap", addressMap);
			apptLetterContext.putAll(addressMap);
			apptLetterContext.put("addressMap", addressMap);
			Map<String,String> map = CacheManager.get("Labels_Conf") == null ? null : (HashMap)CacheManager.get("Labels_Conf");
	        if(map != null && map.containsKey("entitytablabel"))
	        	entityAgentLabel = map.get("entitytablabel");
	        
	       apptLetterContext.put("entityAgentLabel", entityAgentLabel);
		}else{
			@SuppressWarnings("rawtypes")
			HashMap agentMap = (HashMap)SqlResources.getSqlMapProcessor(ctx).findByKey("person.findByKey",ctx);
			if(agentMap != null){
				String agentFirstName = (String) agentMap.get("prdcr_first_name");
				String agentLastName = (String) agentMap.get("prdcr_last_name");
				String agentName=agentFirstName+" "+agentLastName;
				//ctx.put("agencyname", agentName);
				apptLetterContext.put("agentname", agentName);
				apptLetterContext.put("Agent_Name", agentName);
				
			}
			HashMap agencyMap = (HashMap)SqlResources.getSqlMapProcessor(ctx).findByKey("agency_master.findByKey",ctx);
			if(agencyMap != null){
				String agencyName = (String) agencyMap.get("name");
				//ctx.put("agencyname", agencyName);
				apptLetterContext.put("agencyname", agencyName);
				apptLetterContext.put("Agent_Name", agencyName);
			}
			
			
			//Map addressMap = (Map)SqlResources.getSqlMapProcessor(ctx).findByKey("SqlStmts.UserStatementManualBoQueriesGetAgentAddressForAppointmentsAppointmentLetter",ctx);
			//ctx.put("addressMap", addressMap);
			
			ctx.put("type", "I");
			ctx.put("object_id", agentMap.get("person_id") != null && !HtmlConstants.EMPTY.equals(agentMap.get("person_id")) ? Integer.parseInt(agentMap.get("person_id").toString()): null);
			ctx.put("AgencyAddresType", ctx.get("AgencyAddresType") != null && !HtmlConstants.EMPTY.equals(ctx.get("AgencyAddresType")) ? ctx.get("AgencyAddresType").toString(): null);
			ctx.put("AgentAddresType", ctx.get("AgentAddresType") != null && !HtmlConstants.EMPTY.equals(ctx.get("AgentAddresType")) ? ctx.get("AgentAddresType").toString(): null);
			ctx.put("isShowAgencyBusinessAddress", ctx.get("isShowAgencyBusinessAddress") != null && !HtmlConstants.EMPTY.equals(ctx.get("isShowAgencyBusinessAddress")) ? ctx.get("isShowAgencyBusinessAddress").toString(): null);
			new SetParametersForStoredProcedures().setParametersInContext(ctx, "isShowAgencyBusinessAddress,AgentAddresType,AgencyAddresType,person_id,agency_id");
			Map addressMap = (Map)SqlResources.getSqlMapProcessor(ctx).findByKey("person.GetAppointmentTerminationLetterAddress_p",ctx);
			apptLetterContext.putAll(addressMap);
			apptLetterContext.put("addressMap", addressMap);
			
			Map<String,String> map = CacheManager.get("Labels_Conf") == null ? null : (HashMap)CacheManager.get("Labels_Conf");
	        if(map != null && map.containsKey("individualtablabel"))
	        	entityAgentLabel = map.get("individualtablabel");
	        
	        apptLetterContext.put("entityAgentLabel", entityAgentLabel);
		}
		
		List appointmentLetterList = null;
		ctx.put("commaseperatedAppointedID", selectedRecords);
		apptLetterContext.put("commaseperatedAppointedID", selectedRecords);
		
		if(ctx.get("LetterType").equals("agentletter")){
			ctx.put("personID", ctx.get("person_id"));
			apptLetterContext.put("personID", ctx.get("person_id"));
			
			new SetParametersForStoredProcedures().setParametersInContext(ctx, "commaseperatedAppointedID,personID");
			appointmentLetterList = SqlResources.getSqlMapProcessor(ctx).select("person.GetAgentAppointmentRecords_p", ctx);
		}else{
			new SetParametersForStoredProcedures().setParametersInContext(ctx, "commaseperatedAppointedID,agency_id");
			 appointmentLetterList = SqlResources.getSqlMapProcessor(ctx).select("person.GetAgencyAppointmentRecords_p", ctx);
		}
		
		if(appointmentLetterList != null && appointmentLetterList.size() > 0){
			//ctx.put("appointmentLetterList", appointmentLetterList);
			apptLetterContext.put("appointmentLetterList", appointmentLetterList);
			apptLetterContext.put("appointment_letter_list_01", appointmentLetterList);
		}
		
		ctx.put("apptLetter_context", apptLetterContext);
		generatePdf(apptLetterContext, templatePdfFile, outputPdfDir, pdf_document_name, xmlFile);
		for (int i = 0; i < appointmentLetterList.size(); i++) {
			Map map = (Map) appointmentLetterList.get(i);
			state=map.get("abbreviation").toString();
		}
		attachFilesList.add(SystemProperties.getInstance().getString("appl.ProducerOne.commission.stmt.output.pdf.path")+"AppointmentLetter_"+ctx.get("person_id")+".pdf");
		if (ctx.get("email_id")!=null && ctx.get("name")!=null)
		{
			String email=ctx.get("email_id").toString();
			String name=ctx.get("name").toString();
			sendEmail(SystemProperties.getInstance().getString("mail.from"), attachFilesList, apptLetterContext, email,name,state);
		}
		
		
		
	}
	catch (Exception e) {
		e.printStackTrace();
	}
	
}
	public static void generatePdf(IContext ctx, String templateFile, String outputDir, String newFileName,
			String xmlFile) throws Exception {
		File file = new File(xmlFile);
		if (file.exists()) {
			file.delete();
			file.createNewFile();
		}

		populateDataXml(ctx, xmlFile);
		ByteArrayOutputStream bout = convertPOToPDF(templateFile, xmlFile, (Context) ctx);
		byte[] rb = bout.toByteArray();

		// ctx.put("contents", rb);
		FileOutputStream fos = new FileOutputStream(outputDir + "/" + newFileName);
		fos.write(rb);
		fos.close();
		bout.close();
		System.gc();
	}
	private static void populateDataXml(IContext ctx, String xmlFile) {
		StringBuffer buffer = new StringBuffer("<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n");
		try {
			// Data writer
			Context localCtx = new Context();
			localCtx.putAll(ctx);
			IOUtils.writeToFile(xmlFile, buffer.append(new XMLUtils().generateResponseXml(localCtx, (Context) ctx)));
		} catch (Exception e) {
			logger.error("populate data to XML : populateDataXml :: " + DataUtils.getExceptionStackTrace(e));
		}
	}
	public static ByteArrayOutputStream convertPOToPDF(String foFile, String xmlFile, Context ctx,
			ServletContextURIResolver uriResolver, ServletContext servletContext) throws Exception {

		ByteArrayOutputStream bout = new ByteArrayOutputStream();
		try {
			File xmlfile = new File(xmlFile);
			File fofile = new File(foFile);

			// configure fopFactory as desired
			FopFactory fopFactory = FopFactory.newInstance();
			// tell the FOPFactory object where to look for resources
			fopFactory.setURIResolver(uriResolver);

			// fopFactory.setUserConfig(new File("cfg.xml"));
			FOUserAgent foUserAgent = fopFactory.newFOUserAgent();
			foUserAgent.setBaseURL("file:///" + servletContext.getRealPath("/"));

			// configure foUserAgent as desired
			// Setup output
			bout = new ByteArrayOutputStream();

			// Construct fop with desired output format
			Fop fop = fopFactory.newFop(MimeConstants.MIME_PDF, foUserAgent, bout);

			// Setup XSLT
			TransformerFactory factory = TransformerFactory.newInstance();

			// tell the TransformerFactory where to find resources
			factory.setURIResolver(uriResolver);

			Transformer transformer = factory.newTransformer(new StreamSource(fofile));

			// tell the Transformer object where to find resources
			transformer.setURIResolver(uriResolver);

			// Setup input for XSLT transformation
			Source src = new StreamSource(xmlfile);

			// Resulting SAX events (the generated FO) must be piped through to FOP
			Result result = new SAXResult(fop.getDefaultHandler());

			// Start XSLT transformation and FOP processing
			transformer.transform(src, result);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return bout;
	}
	private static ByteArrayOutputStream convertPOToPDF(String foFile, String xmlFile, Context ctx) throws Exception {
		ByteArrayOutputStream out = null;
		FopFactory fopFactory = null;
		TransformerFactory tFactory = null;

		out = new ByteArrayOutputStream();
		fopFactory = FopFactory.newInstance();
		tFactory = TransformerFactory.newInstance();
		Fop fop = null;
		Source src = null;
		Source xsltSrc = null;
		Transformer transformer = null;
		Result res = null;
		try {
			fop = fopFactory.newFop(MimeConstants.MIME_PDF, out);
			src = new StreamSource(xmlFile);
			xsltSrc = new StreamSource(foFile);
			transformer = tFactory.newTransformer(xsltSrc);
			res = new SAXResult(fop.getDefaultHandler());
			transformer.transform(src, res);
		} catch (Exception e) {
			logger.error("Error in transforming to PDF.." + DataUtils.getExceptionStackTrace(e));
		}

		return out;
	}
	public static void sendEmail(String from,List attachFilesList,Context ctx,String toEmail,String name,String state)
	{
		try
		{
		
		MailSender mailSender=new MailSender();
		String body="";
		
		
		body="<div style=\"font-size:14.5px; font-family:Arial;\">"+"Dear "+name+",</br></br>\n" + 
				"We have processed your request for appointment in "+state+". Please review the attached letter and save for your records.\n" + 
				"</br>\n" + 
				"</br>\n" 
				+ "</br>\n" + 
				"Thank you,\n" 
				  +"</br>\n" + 
				"Sales Support\n"
				+"</br>\n" + 
				"Builders Mutual Insurance Company\n"+"</div>";
		List to = new ArrayList<String>();
		to.add(toEmail);
		mailSender.setContenttype("text/html");
		mailSender.setFrom(from);
		mailSender.setSubject(SystemProperties.getInstance().getString("mail.subject"));
		mailSender.setToAddList(to);
		mailSender.setBody(body);
		mailSender.setAttachFilesList(attachFilesList);
		if (toEmail!=null)
		{
			mailSender.sendMail(ctx);
			
		}
		}
		catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/* Existing Agency Appointed to New Location - Dynamic Row Function - Start*/
	
	public static String sendEmailtoExistingAgency (Context ctx)
	{
		
		sendEmailWithTable(ctx);
		return "Function Called";
	}
	
	public static void sendEmailWithTable(Context ctx)
	{
		try
		{
			MailSender mailSender=new MailSender();
			String body="";
			Map cmap=null;
			Integer id=0;
			String commaSeparatedIds=new String();
			List selectedIds = new ArrayList();
			List arrAppointmentLicensesList=(List)ctx.get("getBulkAppointTerminationLetter_mom_list_01");
			for( int c=0;c<arrAppointmentLicensesList.size();c++)
			{
				cmap=null;
				cmap=(HashMap) arrAppointmentLicensesList.get(c);
				if(cmap!=null)
				{
					if(ctx.get("BulkAppointmentMode").equals("Y") && ctx.get("isApppointPage").equals("entityAppoint"))
					{
						id=(Integer) cmap.get("agency_licenses_appointment_id");
					}
					String ctxID=(String)ctx.get("ajax_field_chkLetter_"+c);
					if(ctxID!=null )
					{
						if(ctxID.equals("Y") && cmap.get("termination_transaction_id")!=null && Integer.parseInt(cmap.get("termination_transaction_id").toString())==0)
						{
							//selectedIds.add(arrAppointmentLicensesList.get(c));
							Map map=(Map)arrAppointmentLicensesList.get(c);
							if(commaSeparatedIds.equals(""))
							{
								commaSeparatedIds=commaSeparatedIds.concat(String.valueOf(map.get("agency_licenses_appointment_id")));
							}
							else
							{
								commaSeparatedIds=commaSeparatedIds.concat(",");
								commaSeparatedIds=commaSeparatedIds.concat(String.valueOf(map.get("agency_licenses_appointment_id")));
							}
						}
					}
				}
			}
			
			StringBuilder buf = new StringBuilder();
			 buf.append("<html> \n"+
	                    "<body> \n"+
	                    "<p style=\"font-size:13px; font-family:Arial;\">Date: ").append(ctx.get("curr_date")).append("</p> \n")

	 

	                    .append("<p style=\"margin: 0; font-size:13px; font-family:Arial;\">").append(ctx.get("agency_name")).append(", #").append(ctx.get("agency_code")).append("</p>")
	                    .append("<p style=\"margin: 0; font-size:13px; font-family:Arial;\">Attn: ").append(ctx.get("name")).append("</p> \n");
	                    if(ctx.get("addressline2")== null || "".equals(ctx.get("addressline2"))){
	                    	buf.append("<p style=\"margin: 0; font-size:13px; font-family:Arial;\">").append(ctx.get("addressline1")).append("</p> \n");
	                    }else{
	                    	buf.append("<p style=\"margin: 0; font-size:13px; font-family:Arial;\">").append(ctx.get("addressline1")).append(",").append(ctx.get("addressline2")).append("</p> \n");
	                    }
	                    buf.append("<p style=\"margin: 0; font-size:13px; font-family:Arial;\">").append(ctx.get("city")).append(", ").append(ctx.get("abbreviation")).append(" ").append(ctx.get("zip")).append("</p> \n")
	                    .append("<p style=\"font-size:13px; font-family:Arial;\">Appointment Date: ").append(ctx.get("curr_date")).append("</p> \n")

	 

	                    .append("<p style=\"font-size:13px; font-family:Arial;\">Re: Appointment\\Authorization with Builders Mutual Insurance Company</p> \n")
	                    .append("<p style=\"font-size:13px; font-family:Arial;\">The Appointment(s) for ").append(ctx.get("agency_name")).append(", #").append(ctx.get("agency_code")).append(" have been sent to the following states listed below.</p> \n")
	                    .append("<table style=\"border: black 1px solid; border-collapse: collapse; width: 60%;\"> \n")
	                    .append("<tr> \n")
	                    .append("<th style=\"border: black 1px solid; border-collapse: collapse; font-size:13px; font-family:Arial;\">Company</th> \n")
	                    .append("<th style=\"border: black 1px solid; border-collapse: collapse; font-size:13px; font-family:Arial;\">State</th> \n")
	                    .append("<th style=\"border: black 1px solid; border-collapse: collapse; font-size:13px; font-family:Arial;\">LOA</th> \n")
	                    .append("<th style=\"border: black 1px solid; border-collapse: collapse; font-size:13px; font-family:Arial;\">License#</th> \n")
	                    .append("<th style=\"border: black 1px solid; border-collapse: collapse; font-size:13px; font-family:Arial;\">Effective Date</th> \n")
	                    .append("</tr> \n");
	                    ctx.put("commaseperatedAppointedID", commaSeparatedIds);
	                    ctx.put("agency_id", 0);
	                    new SetParametersForStoredProcedures().setParametersInContext(ctx,"commaseperatedAppointedID,agency_id");
	                    List appointmentLetterList = SqlResources.getSqlMapProcessor(ctx).select("person.GetAgencyAppointmentRecords_p", ctx);
	                    for(int i=0; i<appointmentLetterList.size();i++)
	                    {
	                    Map map = (Map) appointmentLetterList.get(i);
	                    if(map.get("description")== null || "".equals(map.get("description"))){
	                    buf.append("<tr> \n")
	                    .append("<td style=\"border: black 1px solid; border-collapse: collapse; font-size:13px; font-family:Arial;\">").append(map.get("company")).append("</td> \n")
	                    .append("<td style=\"border: black 1px solid; border-collapse: collapse; font-size:13px; font-family:Arial;\">").append(map.get("abbreviation")).append("</td> \n")
	                    .append("<td style=\"border: black 1px solid; border-collapse: collapse; font-size:13px; font-family:Arial;\">").append("").append("</td> \n")
	                    .append("<td style=\"border: black 1px solid; border-collapse: collapse; font-size:13px; font-family:Arial;\">").append(map.get("license")).append("</td> \n")
	                    .append("<td style=\"border: black 1px solid; border-collapse: collapse; font-size:13px; font-family:Arial;\">").append(map.get("effective_date")).append("</td> \n")
	                    .append("</tr> \n");
	                    }else{
	                    buf.append("<tr> \n")
	                    .append("<td style=\"border: black 1px solid; border-collapse: collapse; font-size:13px; font-family:Arial;\">").append(map.get("company")).append("</td> \n")
	                    .append("<td style=\"border: black 1px solid; border-collapse: collapse; font-size:13px; font-family:Arial;\">").append(map.get("abbreviation")).append("</td> \n")
	                    .append("<td style=\"border: black 1px solid; border-collapse: collapse; font-size:13px; font-family:Arial;\">").append(map.get("description")).append("</td> \n")
	                    .append("<td style=\"border: black 1px solid; border-collapse: collapse; font-size:13px; font-family:Arial;\">").append(map.get("license")).append("</td> \n")
	                    .append("<td style=\"border: black 1px solid; border-collapse: collapse; font-size:13px; font-family:Arial;\">").append(map.get("effective_date")).append("</td> \n")
	                    .append("</tr> \n");
	                    }
	                    };
	                    buf  .append("</table> \n")
	                    .append("<p>&nbsp </p> \n")
	                    .append("<p style=\"font-size:13px; font-family:Arial;\">Sincerely,</p> \n")
	                    .append("<table border=\"0\" cellspacing=\"0\" cellpadding=\"0\" style=\"width:225pt; border-collapse:collapse;\"> \n")
	                    .append("<tr> \n")
	                    .append("<td valign=\"top\" style=\"width:58.5pt; height:60.7pt; padding:0 5.75pt 0 0; border-style:none solid none none; border-right-width:1pt; border-right-color:#D9D9D9;\"> \n")
	                    .append("<p style=\"font-size:11pt;font-family:Calibri,sans-serif;margin:0;line-height:105%;>")
	                    .append("<span style=\"font-family:Arial,sans-serif;\"></p> \n")
	                    .append("<img src=\"https://builder.outlinesys.com/BuilderClient/images/bmicLogo2.jpg\" width=\"90\" height=\"90\"> \n")
	                    .append("</span> \n")
	                    .append("</td> \n")
	                    .append("<td valign=\"top\" style=\"width:166.5pt;height:60.7pt;padding:0 0 0 5.75pt;\">")
	                    .append("<p style=\"margin: 0; font-size:13px; font-family:Arial;\">Sales Support </p> \n")
	                    .append("<p style=\"margin-top: 0; font-size:12px; font-family:Arial;\"><a href=\"mailto:salessupport@bmico.com\">salessupport@bmico.com</a></p> \n")
	                    .append("<p style=\"margin-bottom: 0; font-size:12px; font-family:Arial;\"><span style=\"color: red;\"><strong>CONTACT CENTER</strong></span></p> \n")
	                    .append("<p style=\"margin: 0; font-size:12px; font-family:Arial;\"> 800-809-4859, M-F 8am-6pm ET </p> \n")
	                    .append("<p style=\"margin: 0; font-size:12px; font-family:Arial;\"><strong>buildersmutual.com</strong></p> \n")
	                    .append("<p style=\"margin: 0; font-size:12px; font-family:Arial;\"><a href=\"https://www.facebook.com/buildersmutual\">Facebook | <a href=\"https://www.linkedin.com/company/builders-mutual-insurance-company\">LinkedIn | <a href=\"https://www.youtube.com/user/BuildersMutual/videos\">YouTube</a> \n")
	                    .append("</td></tr></tbody></table> \n")
	                    .append("<p style=\"font-size:10.5px; font-family:Arial;\">Nothing in this email shall commit BMIC to any purchase, sale, contract or other course of action.</p> \n")
	                    .append("<p style=\"float: left; font-size:13px; font-family:Arial;\"><em>This document shall be retained while your appointment is in effect and for at least 5 years after the termination of your appointment</em></p> \n")
	                    .append("</body> \n")
	                    .append("</html>");
        	body = buf.toString();
        	
			List to = new ArrayList<String>();
			
			String toEmail=ctx.get("email_id")!=null?ctx.get("email_id").toString():"";
			to.add(toEmail);
			mailSender.setContenttype("text/html");
			mailSender.setFrom(SystemProperties.getInstance().getString("mail.from")); 	/*SystemProperties.getInstance().getString("mail.from")*/
			mailSender.setSubject("Appointment\\Authorization with Builders Mutual Insurance Company"); /*SystemProperties.getInstance().getString("mail.subject")*/
			mailSender.setToAddList(to);
			mailSender.setBody(body);
			
			if (toEmail!=null)
			{
				mailSender.sendMail(ctx);
			}
		}
		catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/* Existing Agency Appointed to New Location - Dynamic Row Function - End*/
	
	/*Hiding agent checkbox for self service*/
	public static void showContactTypeList(Context ctx)
	{
		try
		{
			List<Map<String,String>> newList=new ArrayList<Map<String,String>>();
			List<Map<String,String>> contactTypeList=new ArrayList<Map<String,String>>();

			contactTypeList=(ArrayList<Map<String,String>>) ctx.get("contacttype_lku_mom_list_1");
				for (Map<String, String> map : contactTypeList) {
				if(!map.get("contact_typ_desc").equals("Restrict SS Commissions View"))																																											{
					newList.add(map);
				}
			}
			
			for (Map<String, String> map : newList) {
			System.out.println(map.get("contact_typ_desc"));	
			}
			ctx.put("contacttype_lku_mom_list_1",newList);
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		
		return;
	}	

	public static void getToSubProdCodeForIndTransfer(Context ctx) {
		try {
			String subProdNum=null;
			List spData =(List)ctx.get("transfersStep2_list_mom_2");
			if(spData !=null && spData.size()>0){
				/*for (Object object : spData) {
					
				}*/
				for (int i = 0; i < spData.size(); i++) 
				{
					Map map = (Map) spData.get(i);
					if(map.get("bobtransfersStep2_dest_producer_code")!=null){
						subProdNum=map.get("bobtransfersStep2_dest_producer_code").toString();
						break;
					}
				}
				ctx.put("bobtransfersStep2_dest_producer_code",subProdNum );
			
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
	
//phase 3 - reports 
	public static void displayCollectedPremium(Context ctx,String key,String value)
	{
		try
		{
		logger.debug("inside displayCollectedPremium function ");
			List<Map<String,String>> newList=new ArrayList<Map<String,String>>();
			List<Map<String,String>> spOutputList=new ArrayList<Map<String,String>>();

			spOutputList=(ArrayList<Map<String,String>>) ctx.get(key);
				for (Map<String, String> map : spOutputList) {				
				map.put("Collected_PREMIUM", map.get(value));
				newList.add(map);
			}
			ctx.put(key, newList);	
			logger.debug("list size :"+newList.size());		
		}
		catch (Exception e) {
			e.printStackTrace();
		}
	}	
	
}
