package com.processor;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;
import java.util.TreeMap;

import com.manage.managecomponent.tabsconfiguration.TabsConfigurationResources;
import com.manage.managecomponent.tabsconfiguration.TabsconfigurationresourceImpl;
import com.manage.managemetadata.functions.commonfunctions.DataUtils;
import com.util.CacheManager;
import com.util.Context;
import com.util.HtmlConstants;
import com.util.InetLogger;
import com.util.StringUtils;
import com.util.SystemProperties;

/**
 * @author Amit Jain, Outline Systems Inc.
 * @Created on Oct 27, 2011
 */
public class TabsConfiguration {
	private static InetLogger logger = InetLogger.getInetLogger(TabsConfiguration.class);
	
	//Client ID For Accident Fund
	public static final int Client_ID=1025;//1023;  //1009
	public static String uploadDocument_breadcrumb = "N";
	public static String applicationVersion = "2.3.0.0.V001";
	public static final String applicationQAVersion = ".1";
	public static final String applicationCopyRight = "Copyright 2007 - "+ Calendar.getInstance().get(Calendar.YEAR) +" Duck Creek Technologies. All rights reserved.";
	private String ERROR_FORWARD_URL_PROPERTY = "appl.error.forward.url";
	public static String errorForwardUrl = "";
	private String COMMISSION_FLOW_PROPERTY = "appl.commission.manual.flow";
	//private Map TABIDSMAP = new HashMap(); //to apply disabled security instead of hide
	public static String agencySummaryCheckList_breadcrumb = "N";
	public static String selectEmailTemplate_breadcrumb = "N";
	public static String selectPdfTemplate_breadcrumb = "N";
	
	public static String sendOnboardingInvitationNameClearanceStep_breadcrumb = "N";
	public static String sendOnboardingInvitationEmailTemplateManagement_breadcrumb = "N";
	public static String workflowPopup_breadcrumb = "N";
	public static String taskpopup_breadcrumb = "N";
	public static String addNewProductValidationStep1_breadcrumb = "N";
	public static String addNewProductValidationStep2_breadcrumb = "N";
	
	public static String addNewProductValidationStep1ForSelfService_breadcrumb = "N";
	public static String addNewProductValidationStep2ForSelfService_breadcrumb = "N";
	
	public Map contextTabsConfigMap = new HashMap();
	
	public void getTabsConf(){
		String buildEnvironment = "PROD";
		String commissionFlowIndicator = null;
		InputStream stream=null;
		try {

			Properties properties = new Properties();
			String path = ".." + File.separator + ".." + File.separator + "META-INF" + File.separator + "maven"
					+ File.separator + "com.duckcreek" + File.separator + "Product" + File.separator + "pom.properties";
			stream = TabsConfiguration.class.getClassLoader().getResourceAsStream(path); // define properties file here
			applicationVersion = SystemProperties.getInstance().getString("appl.ProducerOne.version");
			if(stream!=null) {
				properties.load(stream);
				if (properties.containsKey("version") &&  !properties.getProperty("version").isEmpty() && !properties.getProperty("version").contains("{"))
					applicationVersion = properties.getProperty("version");
	            properties=null;
			}
		} catch (Exception e1) {
			
		} finally {
			if (stream != null) {
				try {
					stream.close();
				} catch (IOException e) {

				}
			}
		}
		
		try{
			buildEnvironment = getValueFromPropertyFile("appl.ProducerOne.environment");
			//isM1IntegrationEnabled = getValueFromPropertyFile("appl.ProducerOne.m1.integration.enabled");
		}catch (Exception e) {
			// TODO: handle exception
		}
		
		try{
			if(SystemProperties.getInstance().getProperty(ERROR_FORWARD_URL_PROPERTY) != null)
				errorForwardUrl = SystemProperties.getInstance().getProperty(ERROR_FORWARD_URL_PROPERTY).toString();
			}catch (Exception e) {
				// TODO: handle exception
		}
		try {
			if(SystemProperties.getInstance().getProperty(COMMISSION_FLOW_PROPERTY) != null)
				commissionFlowIndicator = SystemProperties.getInstance().getProperty(COMMISSION_FLOW_PROPERTY).toString();
		} catch (Exception e) {
				commissionFlowIndicator ="N";
			// TODO: handle exception
		}
			
		if(buildEnvironment!=null && !HtmlConstants.EMPTY.equals(buildEnvironment) && "QA".equalsIgnoreCase(buildEnvironment)){
			applicationVersion = applicationVersion + applicationQAVersion;
		}
		
		Map<String, String> showHideTabsConfMap = null;
		if(CacheManager.get("Tabs_Conf") == null)
			showHideTabsConfMap = new HashMap<String, String>();
		else
			showHideTabsConfMap = (Map)CacheManager.get("Tabs_Conf");
		
		if(CacheManager.get("Tabs_Conf_Map") == null)
			contextTabsConfigMap = new HashMap<String, String>();
		else
			contextTabsConfigMap = (Map)CacheManager.get("Tabs_Conf_Map");
			
		//going to load tabsconfiguration.xml
		try{
			Context ctx = new Context();
			ctx.setProject("ProducerOne");
			List tabsConfigResList = TabsConfigurationResources.getInstance(ctx).getTabsConfigurationResourceList();
			if(tabsConfigResList != null && tabsConfigResList.size() > 0){
				for(int i=0; i<tabsConfigResList.size(); i++){
					TabsconfigurationresourceImpl impl = (TabsconfigurationresourceImpl)tabsConfigResList.get(i);
					
					if(StringUtils.isBlank(impl.getValue()))
						showHideTabsConfMap.put(impl.getName(), impl.getAccesslevel() == 1 ? "Y" : "N");

					if(!StringUtils.isBlank(impl.getContextname()))
						contextTabsConfigMap.put(impl.getContextname(), impl.getAccesslevel() == 1 ? "Y" : "N");
					else
						contextTabsConfigMap.put(impl.getName(), impl.getAccesslevel() == 1 ? "Y" : "N");
					
					//going to set default value for configuration if mentioned in xml file
					if(!StringUtils.isBlank(impl.getValue())){
						String value = impl.getValue();
						
						//checking value from properties file
						if(value.length() > 1){
							try{
								value = SystemProperties.getInstance().getString(value);
							}catch (Exception e) {
								// TODO: handle exception
							}
						}
						
						//checking value from label conf
						if(value.length() > 1){
							try{
								value = DataUtils.getLabelFromLabelConf(value);
							}catch(Exception e){
								// TODO: handle exception
							}
						}
						
						if(value == null)
							value = impl.getValue();
						
						if(!StringUtils.isBlank(impl.getContextname())){
							contextTabsConfigMap.put(impl.getContextname(), value);
						}else{
							contextTabsConfigMap.put(impl.getName(), value);
						}
					}
				}
			}
		}catch (Exception e) {
			logger.error("Unable to read tabsconfiguration.xml due to error : " + e.getMessage());
		}
		//ended
		
		try {
			CacheManager.put("Tabs_Conf", showHideTabsConfMap);
			
			getMergerAcquistionsDropDown();
			getMergerAcquistionsDropDownForSearch();
			
			contextTabsConfigMap.put("Client_ID", Client_ID);
			contextTabsConfigMap.put("ClientID", Client_ID);
			contextTabsConfigMap.put("commissionFlowIndicator", commissionFlowIndicator); 
			contextTabsConfigMap.put("applicationVersion",applicationVersion);
			contextTabsConfigMap.put("applicationCopyRight",applicationCopyRight);

            //Added code to define methods on which custom fields save/update will fire
			Map customFieldsMethodsMap = new HashMap();
			customFieldsMethodsMap.put("save", null);
			customFieldsMethodsMap.put("update", null);
			customFieldsMethodsMap.put("updateAgencyDetails", null);
			customFieldsMethodsMap.put("updateAgentGeneral", null);
			contextTabsConfigMap.put("customFieldsMethodsMap", customFieldsMethodsMap);
			//Ended code
			contextTabsConfigMap.put("errorForwardUrl",errorForwardUrl);
			contextTabsConfigMap.put("uploadDocument_breadcrumb",uploadDocument_breadcrumb);
			contextTabsConfigMap.put("agencySummaryCheckList_breadcrumb", agencySummaryCheckList_breadcrumb);
			contextTabsConfigMap.put("selectEmailTemplate_breadcrumb", selectEmailTemplate_breadcrumb);
			contextTabsConfigMap.put("selectPdfTemplate_breadcrumb", selectPdfTemplate_breadcrumb);
			
			contextTabsConfigMap.put("sendOnboardingInvitationNameClearanceStep_breadcrumb", sendOnboardingInvitationNameClearanceStep_breadcrumb);
			contextTabsConfigMap.put("sendOnboardingInvitationEmailTemplateManagement_breadcrumb", sendOnboardingInvitationEmailTemplateManagement_breadcrumb);
			contextTabsConfigMap.put("workflowPopup_breadcrumb", workflowPopup_breadcrumb);
			contextTabsConfigMap.put("taskpopup_breadcrumb", taskpopup_breadcrumb);
			contextTabsConfigMap.put("addNewProductValidationStep1_breadcrumb", addNewProductValidationStep1_breadcrumb);
			contextTabsConfigMap.put("addNewProductValidationStep2_breadcrumb", addNewProductValidationStep2_breadcrumb);
			
			contextTabsConfigMap.put("addNewProductValidationStep1ForSelfService_breadcrumb", addNewProductValidationStep1ForSelfService_breadcrumb);
			contextTabsConfigMap.put("addNewProductValidationStep2ForSelfService_breadcrumb", addNewProductValidationStep2ForSelfService_breadcrumb);
			
			/*TABIDSMAP.put("agencytab_security", DataUtils.getLabelFromLabelConf("agency_detail_label"));
			TABIDSMAP.put("locationtab_security", DataUtils.getLabelFromLabelConf("location_details_label"));
			TABIDSMAP.put("isShowAgencyBankInformationTab", DataUtils.getLabelFromLabelConf("tabs1_bank_information_label"));
			TABIDSMAP.put("checkIsShowDocumentContractsTab", DataUtils.getLabelFromLabelConf("contractslabel"));
			TABIDSMAP.put("checkIsShowRequestTab", DataUtils.getLabelFromLabelConf("requesttablabel"));
			TABIDSMAP.put("bulkEntityAppointNew_parenttab", DataUtils.getLabelFromLabelConf("niprtablabel"));
			TABIDSMAP.put("checkIsShowAgencyAppointAuthorizeTab", DataUtils.getLabelFromLabelConf("appointauthorizetablabel"));
			TABIDSMAP.put("agency_NIPR_tab_security", DataUtils.getLabelFromLabelConf("niprtransactionlabel"));
			TABIDSMAP.put("checkIsShowAgencyPDBAppointmentTab", DataUtils.getLabelFromLabelConf("pdbappointmentstablabel"));
			TABIDSMAP.put("checkIsShowAgencyAppointRIRSTab", DataUtils.getLabelFromLabelConf("appointauthorizeRIRStablabel"));
			TABIDSMAP.put("checkIsShowAgencyCompetitorsAppointmentTab", DataUtils.getLabelFromLabelConf("agencycompetitorappointmentstablabel"));
			TABIDSMAP.put("agencypdbalerts_tab_security", DataUtils.getLabelFromLabelConf("agencypdbalertslabel"));
			TABIDSMAP.put("isHideShowNIPRLicensingTab", DataUtils.getLabelFromLabelConf("licensing_label"));
			TABIDSMAP.put("notepad_security", DataUtils.getLabelFromLabelConf("notepadtablabel"));
			TABIDSMAP.put("isMarketInformationApplicableToAgency", DataUtils.getLabelFromLabelConf("marketinformationtablabel"));
			TABIDSMAP.put("isShowAgencyExternalSystemTabTrue", DataUtils.getLabelFromLabelConf("externalsystemtablabel"));
			TABIDSMAP.put("background_inquiry_tab_security", DataUtils.getLabelFromLabelConf("agencybackgroundinquirytablabel"));
			TABIDSMAP.put("historytab_security", DataUtils.getLabelFromLabelConf("historytablabel"));
			TABIDSMAP.put("agency_profile_tab_security", DataUtils.getLabelFromLabelConf("agencyProfileTabLabel"));
			TABIDSMAP.put("agenttab_security", DataUtils.getLabelFromLabelConf("contact_details_list_label"));
			TABIDSMAP.put("isShowAgentDetailsTabAtTopLevel", DataUtils.getLabelFromLabelConf("contact_detail_label"));
			TABIDSMAP.put("hidePersonAssociatedAgencyTab", DataUtils.getLabelFromLabelConf("associatedlocationslabel"));
			TABIDSMAP.put("agentnotepad_security", DataUtils.getLabelFromLabelConf("agentnotepadtablabel"));
			TABIDSMAP.put("producer_code_association_security", DataUtils.getLabelFromLabelConf("producer_association_label"));
			TABIDSMAP.put("agentcetraining_tab_security", DataUtils.getLabelFromLabelConf("appointauthorizeCETrainingtablabel"));
			TABIDSMAP.put("agent_school_tab_level_security", DataUtils.getLabelFromLabelConf("agent_school_list_details_label"));
			TABIDSMAP.put("bulkAgentAppointNew_parenttab", DataUtils.getLabelFromLabelConf("agentniprtablabel"));
			TABIDSMAP.put("checkIsShowAgentAppointAuthorizeTab", DataUtils.getLabelFromLabelConf("appointauthorizetablabel"));
			TABIDSMAP.put("isShowAgentNIPRTab", DataUtils.getLabelFromLabelConf("niprtransactionlabel"));
			TABIDSMAP.put("checkIsShowAgentAppointRIRSTab", DataUtils.getLabelFromLabelConf("appointauthorizeRIRStablabel"));
			TABIDSMAP.put("checkIsShowAgentCompetitorsAppointmentTab", DataUtils.getLabelFromLabelConf("agentcompetitorappointmentstablabel"));
			TABIDSMAP.put("agentpdbalerts_tab_security", DataUtils.getLabelFromLabelConf("agentpdbalertslabel"));
			TABIDSMAP.put("agentniprlicensing_tab_security", DataUtils.getLabelFromLabelConf("licensing_label"));
			TABIDSMAP.put("contact_background_inquiry_tab_security", DataUtils.getLabelFromLabelConf("agentbackgroundinquirytablabel"));
			TABIDSMAP.put("contact_external_system_tab_security", DataUtils.getLabelFromLabelConf("externalsystemtablabel"));
			TABIDSMAP.put("contact_spinn_security", DataUtils.getLabelFromLabelConf("spinnlabel"));
			TABIDSMAP.put("checkIsShowProducerNumberTab", DataUtils.getLabelFromLabelConf("agency_code_list"));
			TABIDSMAP.put("producerdetail_tab_security", DataUtils.getLabelFromLabelConf("producerfieldlabel"));
			TABIDSMAP.put("checkIsShowProducerBillingTermTab", DataUtils.getLabelFromLabelConf("billingtermtablabel"));
			TABIDSMAP.put("isShowProducerValidationTab", DataUtils.getLabelFromLabelConf("validationstablabel"));
			TABIDSMAP.put("checkIsShowAgentJudgementTab", DataUtils.getLabelFromLabelConf("agent_judgement_tab_label"));
			TABIDSMAP.put("producernotepad_security", DataUtils.getLabelFromLabelConf("producernotepadtablabel"));
			TABIDSMAP.put("isShowProdNumBankInformationTab", DataUtils.getLabelFromLabelConf("bankInformationtablabel"));
			TABIDSMAP.put("checkIsShowDocumentInsuranceTab", DataUtils.getLabelFromLabelConf("insurancelabel"));
			TABIDSMAP.put("carrierTabs_producerapplicationtab", DataUtils.getLabelFromLabelConf("producerApplicationslabel"));
			TABIDSMAP.put("carrierTabs_w9tab", DataUtils.getLabelFromLabelConf("W9label"));
			TABIDSMAP.put("carrierTabs_othertab", DataUtils.getLabelFromLabelConf("Otherlabel"));
			TABIDSMAP.put("commissionschedule_tab_security", DataUtils.getLabelFromLabelConf("commissionSchedulelabel"));
			TABIDSMAP.put("commissionstatement_tab_security", DataUtils.getLabelFromLabelConf("commissionStatementlabel"));
			TABIDSMAP.put("isShowCommissionAdjustmentTab", DataUtils.getLabelFromLabelConf("adjustmentlabel"));
			TABIDSMAP.put("incentiveschedule_tab_security", DataUtils.getLabelFromLabelConf("incentivelabel"));
			TABIDSMAP.put("incentivestatement_tab_security", DataUtils.getLabelFromLabelConf("incentiveStatementlabel"));
			TABIDSMAP.put("accountbalancesummary_tab_security", DataUtils.getLabelFromLabelConf("incentiveCommissionSummarylabel"));
			TABIDSMAP.put("hideShowAgencyProfileReportTab", DataUtils.getLabelFromLabelConf("agencyProfileReportslabel"));
			TABIDSMAP.put("complete_hierarchy_security", DataUtils.getLabelFromLabelConf("completeHierarhcyTabLabel"));
			TABIDSMAP.put("agency_code_hierarchy_security", DataUtils.getLabelFromLabelConf("reporting_tab_hierarchy_label"));
			TABIDSMAP.put("isShowPersonHierarchy", DataUtils.getLabelFromLabelConf("individualtablabel"));
			TABIDSMAP.put("location_hierarchy_old_security", DataUtils.getLabelFromLabelConf("hierarchytablabel"));
			TABIDSMAP.put("commission_hierarchy_security", DataUtils.getLabelFromLabelConf("commissionhierarchylabel"));
			//TABIDSMAP.put("isShowClusterHierarchyTrue", DataUtils.getLabelFromLabelConf("clusterhierarchytablabel"));
			TABIDSMAP.put("isShowSecurityHierarchyTab", DataUtils.getLabelFromLabelConf("securityhierarchytablabel"));
			TABIDSMAP.put("isShowIncentiveHierarchyTab", DataUtils.getLabelFromLabelConf("incentivehierarchylabel"));
			TABIDSMAP.put("isShowAlternateHierarchyTab", DataUtils.getLabelFromLabelConf("alternatehierarchylabel"));
			TABIDSMAP.put("isShowPointInTimeHierarchy", DataUtils.getLabelFromLabelConf("pointintimehierarchylabel"));
			TABIDSMAP.put("acra_hierarchy_security", DataUtils.getLabelFromLabelConf("ACRAHierarchyTablabel"));
			TABIDSMAP.put("reporting_hierarchy_security", DataUtils.getLabelFromLabelConf("reporting_hierarchy_tab_label"));
			TABIDSMAP.put("commission_hierarchy_new_security", DataUtils.getLabelFromLabelConf("commissionhierarchylabel"));
			TABIDSMAP.put("cluster_hierarchy_security", DataUtils.getLabelFromLabelConf("cluster_hierarchy_tab_label"));
			TABIDSMAP.put("create_hierarchy_tab_security", DataUtils.getLabelFromLabelConf("create_hierarchy_label"));
			
			contextTabsConfigMap.put(HtmlConstants.TABIDSMAP, TABIDSMAP);*/
			
			//Setting tabsConifgMap data in cache and will use later to populate in Context
			CacheManager.put("Tabs_Conf_Map", contextTabsConfigMap);
		} catch (Exception e) {
			//e.printStackTrace();
			logger.error("Unable to execute getTabsConf method due to error : " + DataUtils.getExceptionStackTrace(e));
		}
	}
	
	private void getMergerAcquistionsDropDownForSearch() throws Exception {
		//if(Client_ID == 1009){
			List list = new ArrayList();
			
			String agencyCodeLabel = "Agency Code";
			String personLabel = "Person";
			try{
				Map<String,String> labelConfMap = CacheManager.get("Labels_Conf") == null ? null : (HashMap)CacheManager.get("Labels_Conf");
				
				agencyCodeLabel = labelConfMap.get("producerlabel");
				personLabel = labelConfMap.get("individualtablabel");
			}catch (Exception e) {
				// TODO: handle exception
			}
			
			TreeMap map = new TreeMap();
			map.put("mergertype_id_search", "9");
			map.put("mergertype_id_search_desc", "Agency Name Change");
			list.add(map);
			
			map = new TreeMap();
			map.put("mergertype_id_search", "2");
			map.put("mergertype_id_search_desc", "Moving " + agencyCodeLabel);
			list.add(map);
			
			map = new TreeMap();
			map.put("mergertype_id_search", "10");
			map.put("mergertype_id_search_desc", "Moving Multiple " + agencyCodeLabel + "s");
			list.add(map);
			
			map = new TreeMap();
			map.put("mergertype_id_search", "3");
			map.put("mergertype_id_search_desc", "Moving " + personLabel);
			list.add(map);
			
			map = new TreeMap();
			map.put("mergertype_id_search", "1");
			map.put("mergertype_id_search_desc", "Moving Location");
			list.add(map);
			
			/*map = new TreeMap();
			map.put("mergertype_id_search", "4");
			map.put("mergertype_id_search_desc", "Moving Primary Location");
			list.add(map);*/
			
			map = new TreeMap();
			map.put("mergertype_id_search", "6");
			map.put("mergertype_id_search_desc", "Making Location as Primary");
			list.add(map);
			
			map = new TreeMap();
			map.put("mergertype_id_search", "7");
			map.put("mergertype_id_search_desc", "Reassign National Agency");
			list.add(map);
			
			map = new TreeMap();
			map.put("mergertype_id_search", "8");
			map.put("mergertype_id_search_desc", "Merge Location");
			list.add(map);
			
			//CacheManager.put("mergertype_id_search_list", list);
			contextTabsConfigMap.put("mergertype_id_search_list", list);
		//}
	}
	
	private void getMergerAcquistionsDropDown() throws Exception {
		//if(Client_ID == 1009){
			List list = new ArrayList();
			
			String agencyCodeLabel = "Agency Code";
			String personLabel = "Person";
			try{
				Map<String,String> labelConfMap = CacheManager.get("Labels_Conf") == null ? null : (HashMap)CacheManager.get("Labels_Conf");
				
				agencyCodeLabel = labelConfMap.get("producerlabel");
				personLabel = labelConfMap.get("individualtablabel");
			}catch (Exception e) {
				// TODO: handle exception
			}
			
			TreeMap map = new TreeMap();
			map.put("mergertype_id", "9");
			map.put("mergertype_id_desc", "Agency Name Change");
			list.add(map);
			
			map = new TreeMap();
			map.put("mergertype_id", "2");
			map.put("mergertype_id_desc", "Moving " + agencyCodeLabel);
			list.add(map);
			
			map = new TreeMap();
			map.put("mergertype_id", "10");
			map.put("mergertype_id_desc", "Moving Multiple " + agencyCodeLabel + "s");
			list.add(map);
			
			map = new TreeMap();
			map.put("mergertype_id", "3");
			map.put("mergertype_id_desc", "Moving " + personLabel);
			list.add(map);
			
			map = new TreeMap();
			map.put("mergertype_id", "1");
			map.put("mergertype_id_desc", "Moving Location");
			list.add(map);
			
			/*map = new TreeMap();
			map.put("mergertype_id", "4");
			map.put("mergertype_id_desc", "Moving Primary Location");
			list.add(map);*/
			
			map = new TreeMap();
			map.put("mergertype_id", "6");
			map.put("mergertype_id_desc", "Making Location as Primary");
			list.add(map);
			
			map = new TreeMap();
			map.put("mergertype_id", "7");
			map.put("mergertype_id_desc", "Reassign National Agency");
			list.add(map);
			
			map = new TreeMap();
			map.put("mergertype_id", "8");
			map.put("mergertype_id_desc", "Merge Location");
			list.add(map);
			//CacheManager.put("mergertype_id_list", list);
			contextTabsConfigMap.put("mergertype_id_list", list);
		//}
	}
	
	//Method created to get value from property file located at Server
	private String getValueFromPropertyFile(String property) throws Exception{
		try{
			return SystemProperties.getInstance().getString(property);
		}catch (Exception e) {
			logger.error("Unable to get property : " + property + " from property file");
		}
		
		return HtmlConstants.EMPTY;
	}
}
