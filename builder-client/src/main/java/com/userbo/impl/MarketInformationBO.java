package com.userbo.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.manage.managecomponent.components.Businessobject;
import com.manage.managecomponent.components.SetParametersForStoredProcedures;
import com.manage.managemetadata.functions.commonfunctions.DataUtils;
import com.ormapping.ibatis.SqlResources;
import com.util.Constants;
import com.util.Context;
import com.util.DateUtils;
import com.util.HtmlConstants;
import com.util.IContext;
import com.util.InetLogger;
import com.util.StringUtils;

public class MarketInformationBO extends Businessobject {
	private InetLogger logger = InetLogger.getLogger(MarketInformationBO.class);
	private String LIST_NAME = "agencyMarketInformation_list_1"; 
	private String perosnalInformationListName = "personalinformation_list_listfreeform_1"; 
	private String agencyMergersListName = "agencymergers_list_listfreeform_1"; 
	private String agencyTerminatedListName = "agencyterminated_list_listfreeform_1";
	private String agencyCompanyPremiumLicensed = "agencyMarketInformation_list_listfreeform_1";
	private String agencyPremiumVolumelistName = "agencyPremiumVolumeStep7_list_mom_1";
	private String agencyBusinessPlanListName = "agencyBusinessPlanStep7_list_mom_1";
	private String agencyBusinessDistributionListName = "agencyBusinessDistributionStep7_list_mom_1";
	private String MarketInformationListName = "MarketInformation_list_1";
	private String agencySegmentClassesDetailsList = "agencySegmentClasses_list_listfreeform_1";
	private String agencyProgramBusinessList = "agencyProgramBusiness_list_listfreeform_1";
	@Override
	public Object execute(IContext ctx) throws Exception {
		if(ctx.get("method") == null || ctx.get("method").toString().equals(HtmlConstants.EMPTY))
			return null;
		
		HttpSession sess = null;
		if(ctx.get("DocumentRequest") != null && ctx.get("DocumentRequest") instanceof HttpServletRequest){
			sess = ((HttpServletRequest)ctx.get("DocumentRequest")).getSession();
		}
		
		if(sess == null)
			return null;
					
		String method = ctx.get("method").toString();
		if(method.equals("addDataToSession")){
			addDataToSession(ctx, sess);
		}else if(method.equals("insertDataToDB")){
			insertDataToDB(ctx, sess);
		}else if(method.equals("saveAgencyCompanyPremiumRow")){
			saveAgencyCompanyPremiumLicensedRow(ctx, sess);
		}else if(method.equals("saveSegmentClassesDetailsRow")){
			saveSegmentClassesDetailsRow(ctx, sess);
		}else if(method.equals("saveProgramBusinessDetailsRow")){
			saveProgramBusinessDetailsRow(ctx, sess);
		}else if(method.equals("saveAgencyTerminatedRow")){
			saveAgencyTerminatedRow(ctx, sess);
		}else if(method.equals("savePersonalInformationRow")){
			savePersonalInformationRow(ctx, sess);
		}else if(method.equals("saveAgencyMergersRow")){
			saveAgencyMergersRow(ctx, sess);
		}
		
		
		
		return null;
	}

	@Override
	public boolean evaluate(IContext data) throws Exception {
		// TODO Auto-generated method stub
		return false;
	}

	private void addDataToSession(IContext ctx, HttpSession sess) throws Exception {
		List agencyBankInfoList = new ArrayList();
		
		if(sess.getAttribute(LIST_NAME) != null &&
				sess.getAttribute(LIST_NAME) instanceof List){
			agencyBankInfoList = (List)sess.getAttribute(LIST_NAME);
		}
		
		String aar_carrierid = (ctx.get("aar_carrierid") != null && !ctx.get("aar_carrierid").toString().equals(HtmlConstants.EMPTY)) ? ctx.get("aar_carrierid").toString() : null;
		String aar_carrier = (ctx.get("aar_carrier") != null && !ctx.get("aar_carrier").toString().equals(HtmlConstants.EMPTY)) ? ctx.get("aar_carrier").toString() : null;
		String commissionrate = (ctx.get("commissionrate") != null && !ctx.get("commissionrate").toString().equals(HtmlConstants.EMPTY)) ? ctx.get("commissionrate").toString() : null;
		String loss_ratio = (ctx.get("loss_ratio") != null && !ctx.get("loss_ratio").toString().equals(HtmlConstants.EMPTY)) ? ctx.get("loss_ratio").toString() : null;
		String dateofappointment = (ctx.get("dateofappointment") != null && !ctx.get("dateofappointment").toString().equals(HtmlConstants.EMPTY)) ? ctx.get("dateofappointment").toString() : null;
		String agency_comparativerate = (ctx.get("agency_comparativerate") != null && !ctx.get("agency_comparativerate").toString().equals(HtmlConstants.EMPTY)) ? ctx.get("agency_comparativerate").toString() : null;
		String aar_lobid = (ctx.get("aar_lobid") != null && !ctx.get("aar_lobid").toString().equals(HtmlConstants.EMPTY)) ? ctx.get("aar_lobid").toString() : null;
		String writtenpremium = (ctx.get("writtenpremium") != null && !ctx.get("writtenpremium").toString().equals(HtmlConstants.EMPTY)) ? ctx.get("writtenpremium").toString() : null;
		String retentionrate = (ctx.get("retentionrate") != null && !ctx.get("retentionrate").toString().equals(HtmlConstants.EMPTY)) ? ctx.get("retentionrate").toString() : null;
		String agency_management = (ctx.get("agency_management") != null && !ctx.get("agency_management").toString().equals(HtmlConstants.EMPTY)) ? ctx.get("agency_management").toString() : null;
		String agency_volume = (ctx.get("agency_volume") != null && !ctx.get("agency_volume").toString().equals(HtmlConstants.EMPTY)) ? ctx.get("agency_volume").toString() : null;
		String aar_carrierid_desc = (ctx.get("aar_carrierid_desc") != null && !ctx.get("aar_carrierid_desc").toString().equals(HtmlConstants.EMPTY)) ? ctx.get("aar_carrierid_desc").toString() : null;
		String aar_lobid_desc = (ctx.get("aar_lobid_desc") != null && !ctx.get("aar_lobid_desc").toString().equals(HtmlConstants.EMPTY)) ? ctx.get("aar_lobid_desc").toString() : null;
		
		if(!StringUtils.isBlank(aar_carrierid) || !StringUtils.isBlank(aar_carrier) || !StringUtils.isBlank(commissionrate) ||
				!StringUtils.isBlank(loss_ratio) || !StringUtils.isBlank(dateofappointment) || !StringUtils.isBlank(agency_comparativerate) ||
				!StringUtils.isBlank(aar_lobid) || !StringUtils.isBlank(writtenpremium) || !StringUtils.isBlank(retentionrate) ||
				!StringUtils.isBlank(agency_management) || !StringUtils.isBlank(agency_volume)){
			
			Map map = new HashMap();
			map.put("aar_carrierid", aar_carrierid);
			map.put("aar_carrier", aar_carrier);
			map.put("commissionrate", commissionrate);
			map.put("loss_ratio", loss_ratio);
			map.put("dateofappointment", dateofappointment);
			map.put("agency_comparativerate", agency_comparativerate);
			map.put("aar_lobid", aar_lobid);
			map.put("writtenpremium", writtenpremium);
			map.put("retentionrate", retentionrate);
			map.put("agency_management", agency_management);
			map.put("agency_volume", agency_volume);
			
			if(StringUtils.isBlank(aar_carrier))
				map.put("aar_carrierid_desc", aar_carrierid_desc);
			else
				map.put("aar_carrierid_desc", aar_carrier);
			
			map.put("lob_desc", aar_lobid_desc);
			
			map.put("isNew", "Y");
			map.put("rownum", agencyBankInfoList.size()+1);
			
			agencyBankInfoList.add(map);
			
			ctx.put(LIST_NAME, agencyBankInfoList);
		}else{
			DataUtils.populateError((Context)ctx, "marketError", "");
		}
	}
	
	private void insertDataToDB(IContext ctx, HttpSession sess) throws Exception {
		int errorCount = 0;
		
		
		
		if(ctx.get("agencyPremiumVolumeCommittedListsize")!=null && !HtmlConstants.EMPTY.equals(ctx.get("agencyPremiumVolumeCommittedListsize").toString())){
          try {
              int agencyPremiumVolumeCommittedListsize = Integer.parseInt(ctx.get("agencyPremiumVolumeCommittedListsize").toString());
              String top3CompaniesAppointedListName = "agencyMarketInformation_list_listfreeform_1";
              
              if(ctx.get("agency_id") != null && !ctx.get("agency_id").toString().equals("")){
					SqlResources.getSqlMapProcessor(ctx).delete("SqlStmts.sqlStatementsviewdeleteAgencyPremiumVolumeCommitted", ctx);
				}else if(ctx.get("prospect_agency_id") != null && !ctx.get("prospect_agency_id").toString().equals("")){
					SqlResources.getSqlMapProcessor(ctx).delete("SqlStmts.sqlStatementsviewdeleteProspectPremiumVolumeCommitted", ctx);
				}
              
              boolean flag = false;
              boolean top3CompaniesAppointedFlag = false;
              
              for(int i=0; i<agencyPremiumVolumeCommittedListsize; i++){
                      Context newCtx = new Context();
                      newCtx.setProject(ctx.getProject());
                      
                      if(ctx.get("premium_volume_by_lob_security")!= null && ctx.get("premium_volume_by_lob_security").toString().equals("Y"))
                          newCtx.put("monthly_premium", ctx.get("monthly_premium1_"+i) != null && !HtmlConstants.EMPTY.equals(ctx.get("monthly_premium1_"+i)) ? ctx.get("monthly_premium1_"+i).toString() : null);
                      else
                          newCtx.put("monthly_premium", ctx.get("monthly_premium_"+i).toString());
                      
                      newCtx.put("yearly_premium", ctx.get("yearly_premium_"+i) != null && !HtmlConstants.EMPTY.equals(ctx.get("yearly_premium_"+i)) ? ctx.get("yearly_premium_"+i).toString() : null);
                      newCtx.put("next3year_premium",ctx.get("next3year_premium_"+i) != null && !HtmlConstants.EMPTY.equals(ctx.get("next3year_premium_"+i)) ? ctx.get("next3year_premium_"+i).toString() : null);
                      newCtx.put("lob_id",ctx.get("lob_id_"+i) != null && !HtmlConstants.EMPTY.equals(ctx.get("lob_id_"+i)) ? ctx.get("lob_id_"+i).toString() : null);
                      newCtx.put("agency_id", ctx.get("agency_id"));
                      newCtx.put("prospect_agency_id", ctx.get("prospect_agency_id"));
                      newCtx.put("last_updated_by", ctx.get("last_updated_by"));
                      newCtx.put("last_updated_ts", ctx.get("last_updated_ts"));
                      newCtx.put("national_code", ctx.get("national_code"));
                      newCtx.put("monthly_application_written", ctx.get("monthly_application_written_"+i).toString());
					  newCtx.put("annual_application_written", ctx.get("annual_application_written_"+i).toString());
                      
                      if(newCtx.get("monthly_premium") != null && !newCtx.get("monthly_premium").toString().equals(HtmlConstants.EMPTY))
                          newCtx.put("monthly_premium", DataUtils.removeAmountFormat(newCtx.get("monthly_premium")));
                      if(newCtx.get("yearly_premium") != null && !newCtx.get("yearly_premium").toString().equals(HtmlConstants.EMPTY))
                          newCtx.put("yearly_premium", DataUtils.removeAmountFormat(newCtx.get("yearly_premium")));
                      if(newCtx.get("next3year_premium") != null && !newCtx.get("next3year_premium").toString().equals(HtmlConstants.EMPTY))
                          newCtx.put("next3year_premium", DataUtils.removeAmountFormat(newCtx.get("next3year_premium")));
                      
                      if(newCtx.get("monthly_premium")!=null && !HtmlConstants.EMPTY.equals(newCtx.get("monthly_premium").toString())){
                             if(newCtx.get("yearly_premium")!=null && !HtmlConstants.EMPTY.equals(newCtx.get("yearly_premium").toString())){
                                 top3CompaniesAppointedFlag=true;
                              }
                           }
                      if(newCtx.get("monthly_premium")!=null && !HtmlConstants.EMPTY.equals(newCtx.get("monthly_premium").toString())){
                             if(newCtx.get("yearly_premium")==null || HtmlConstants.EMPTY.equals(newCtx.get("yearly_premium").toString())){
                                 flag=true;
                                 break;
                              }
                           }
                          if(newCtx.get("yearly_premium")!=null && !HtmlConstants.EMPTY.equals(newCtx.get("yearly_premium").toString())){
                            if(newCtx.get("monthly_premium")==null || HtmlConstants.EMPTY.equals(newCtx.get("monthly_premium").toString()) ){
                                flag=true;
                                 break;
                            }
                        }
                      
                          
                              SqlResources.getSqlMapProcessor(newCtx).insert("agencypremiumvolumecommitted.insert", newCtx);
                      
              }
              
              
              if(sess.getAttribute(top3CompaniesAppointedListName) != null &&
                  sess.getAttribute(top3CompaniesAppointedListName) instanceof List){
              List top3CompaniesAppointedList = (List)sess.getAttribute(top3CompaniesAppointedListName);
              if((top3CompaniesAppointedList == null || top3CompaniesAppointedList.size() == 0) && (ctx.get("isTop3CompaniesValidationRequiredMarketInformation") != null && "Y".equals(ctx.get("isTop3CompaniesValidationRequiredMarketInformation").toString()) )){
                if((ctx.get("carrier_id") == null || HtmlConstants.EMPTY.equals(ctx.get("carrier_id").toString()))
                	||(ctx.get("total_volume") == null || HtmlConstants.EMPTY.equals(ctx.get("total_volume").toString()))
                    ||(ctx.get("class1volume") == null || HtmlConstants.EMPTY.equals(ctx.get("class1volume").toString()))
                    ||(ctx.get("loss_ratio") == null || HtmlConstants.EMPTY.equals(ctx.get("loss_ratio").toString()))
                    ||(ctx.get("yearofappointment") == null || HtmlConstants.EMPTY.equals(ctx.get("yearofappointment").toString()))
                    ){
                	top3CompaniesAppointedFlag=true;
                    DataUtils.populateError((Context)ctx, "top3CompaniesAppointed", "top3CompaniesRowEmptyErrorKey");
                    
                     }
              
              
              }
          }
              
              
              if((flag || !top3CompaniesAppointedFlag) && (ctx.get("isPremiumVolumeCommitmentValidationRequiredMarketInformation") != null && "Y".equals(ctx.get("isPremiumVolumeCommitmentValidationRequiredMarketInformation").toString()) )){
                  DataUtils.populateError((Context)ctx, "premium_volume_commitment", "premiumVolumeCommitmentValidDataErrorKey");
                  return;
              }
              
          } catch (Exception e) {
              logger.error(e.getMessage());
          }  
      } 
		
		
		
		if(ctx.get("businessSourceListsize")!=null && !HtmlConstants.EMPTY.equals(ctx.get("businessSourceListsize").toString())){
			try {
				int businessSourceListsize = Integer.parseInt(ctx.get("businessSourceListsize").toString());
				double totalPercentage = 0.0;
				for(int i=0; i<businessSourceListsize; i++){
					if(ctx.get("percentage_"+i) != null && !HtmlConstants.EMPTY.equals(ctx.get("percentage_"+i).toString()))
						totalPercentage = totalPercentage + Double.parseDouble(ctx.get("percentage_"+i).toString());  
				}
				if(totalPercentage > 100){
					DataUtils.populateError((Context)ctx, "percentageError", "BusinessPercentErrorKey");
					errorCount++;
				}
				if(totalPercentage < 100 && totalPercentage > 0 && ctx.get("business_percent_less_than100_security").toString().equals("Y")){
					DataUtils.populateError((Context)ctx, "percentageError", "BusinessPercentLessThan100ErrorKey");
					errorCount++;
				}
			}catch(Exception e){
				logger.error(e.getMessage());
			}
		}
		
/*----------------------------------------------------------------------------------------------------------------------------------------------*/	
		
		if(ctx.get("agencyCompaniesLicensedListsize")!=null && !HtmlConstants.EMPTY.equals(ctx.get("agencyCompaniesLicensedListsize").toString())){
			try {
				int agencyCompaniesLicensedListsize = Integer.parseInt(ctx.get("agencyCompaniesLicensedListsize").toString());
				double Percentage = 0.0;
				for(int i=0; i<agencyCompaniesLicensedListsize; i++)
				{
					if(ctx.get("premium_percentage_"+i)!=null && !HtmlConstants.EMPTY.equals(ctx.get("premium_percentage_"+i).toString()))
					Percentage =Double.parseDouble(ctx.get("premium_percentage_"+i).toString());
					
					if(Percentage > 100){
						DataUtils.populateError((Context)ctx, "percentageError1", "writtenPremiumPercentageErrorKey");
						errorCount++;
					}
				}
				
			} catch (Exception e) {
				logger.error(e.getMessage());
			}  
		}
		if(errorCount>0)
			return;
		
/*-------------------------------------------------------------------------------------------------------------------------------------------*/
		//going to get associated national code with agency
		if(ctx.get("isMarketInformationApplicableToNationalCode") != null && 
			ctx.get("isMarketInformationApplicableToNationalCode").toString().equals("Y")){
			Map map = (Map)SqlResources.getSqlMapProcessor(ctx).findByKey("SqlStmts.sqlStatementsviewgetNationalCodeByAgencyId", ctx);
			ctx.putAll(map);
		}
		
		if(ctx.get("relationship")!=null && !HtmlConstants.EMPTY.equals(ctx.get("relationship").toString())){
			if(ctx.get("phoneNumber") != null && !ctx.get("phoneNumber").toString().equals(HtmlConstants.EMPTY))
				ctx.put("phone", ctx.get("phoneNumber").toString().replace("-", HtmlConstants.EMPTY));
			
			ctx.put("name", ctx.get("agencyname"));
			
			SqlResources.getSqlMapProcessor(ctx).insert("agencypersonalinformation.insert", ctx);
		}
		
		if(sess.getAttribute(perosnalInformationListName) != null &&
				sess.getAttribute(perosnalInformationListName) instanceof List){
			List perosnalInformationList = (List)sess.getAttribute(perosnalInformationListName);
			if(perosnalInformationList != null && perosnalInformationList.size() > 0){
				for(int i=0; i<perosnalInformationList.size(); i++){
					Map rowMap = (Map)perosnalInformationList.get(i);
					if(rowMap.get("isNew") != null && rowMap.get("isNew").equals("Y")){
						Context newCtx = new Context();
						newCtx.setProject(ctx.getProject());
						newCtx.putAll(rowMap);
						newCtx.put("name", newCtx.get("agencyname"));
						newCtx.put("phone", newCtx.get("phoneNumber"));
						newCtx.put("agency_id", ctx.get("agency_id"));
						newCtx.put("prospect_agency_id", ctx.get("prospect_agency_id"));
						newCtx.put("last_updated_by", ctx.get("last_updated_by"));
						newCtx.put("last_updated_ts", ctx.get("last_updated_ts"));
						newCtx.put("national_code", ctx.get("national_code"));
						
						if(newCtx.get("phoneNumber") != null && !newCtx.get("phoneNumber").toString().equals(HtmlConstants.EMPTY))
						newCtx.put("phone", newCtx.get("phoneNumber").toString().replace("-", HtmlConstants.EMPTY));
						
						SqlResources.getSqlMapProcessor(newCtx).insert("agencypersonalinformation.insert", newCtx);
					}
				}
			}
		}
		
/*-------------------------------------------------------------------------------------------------------------------------------------------*/
		
		if(ctx.get("agencymerger_name")!=null && !HtmlConstants.EMPTY.equals(ctx.get("agencymerger_name").toString())){
			if(ctx.get("volume") != null && !ctx.get("volume").toString().equals(HtmlConstants.EMPTY))
				ctx.put("volume", DataUtils.removeAmountFormat(ctx.get("volume")));
			
			SqlResources.getSqlMapProcessor(ctx).insert("agencymergers.insert", ctx);
		}
		
		
		if(sess.getAttribute(agencyMergersListName) != null &&
				sess.getAttribute(agencyMergersListName) instanceof List){
			List agencyMergersList = (List)sess.getAttribute(agencyMergersListName);
			if(agencyMergersList != null && agencyMergersList.size() > 0){
				for(int i=0; i<agencyMergersList.size(); i++){
					Map rowMap = (Map)agencyMergersList.get(i);
					if(rowMap.get("isNew") != null && rowMap.get("isNew").equals("Y")){
						Context newCtx = new Context();
						newCtx.setProject(ctx.getProject());
						newCtx.putAll(rowMap);
						
						newCtx.put("agency_id", ctx.get("agency_id"));
						newCtx.put("prospect_agency_id", ctx.get("prospect_agency_id"));
						newCtx.put("last_updated_by", ctx.get("last_updated_by"));
						newCtx.put("last_updated_ts", ctx.get("last_updated_ts"));
						newCtx.put("national_code", ctx.get("national_code"));
						
						if(newCtx.get("volume") != null && !newCtx.get("volume").toString().equals(HtmlConstants.EMPTY))
							newCtx.put("volume", DataUtils.removeAmountFormat(newCtx.get("volume")));
						
						SqlResources.getSqlMapProcessor(newCtx).insert("agencymergers.insert", newCtx);
					}
				}
			}
		}
		
/*-------------------------------------------------------------------------------------------------------------------------------------------*/
		
		if(ctx.get("annual_premium_volume")!=null && !HtmlConstants.EMPTY.equals(ctx.get("annual_premium_volume").toString())){
			
			if(ctx.get("annual_premium_volume") != null && !ctx.get("annual_premium_volume").toString().equals(HtmlConstants.EMPTY))
				ctx.put("annual_premium_volume", DataUtils.removeAmountFormat(ctx.get("annual_premium_volume")));
			if(ctx.get("date_closed")!=null && !ctx.get("date_closed").toString().equals(HtmlConstants.EMPTY)){
				if(DateUtils.isDateBefore(ctx.get("date_closed"), new Date("01/01/1900")))
	        		DataUtils.populateError((Context)ctx, "date_closed", "Invalid date closed");
			}
			if(ctx.get(Constants.INET_ERRORS_LIST)==null){
			SqlResources.getSqlMapProcessor(ctx).insert("agencyterminated.insert", ctx);
			}else
				return;
		}
		
		if(sess.getAttribute(agencyTerminatedListName) != null &&
				sess.getAttribute(agencyTerminatedListName) instanceof List){
			List agencyTerminatedList = (List)sess.getAttribute(agencyTerminatedListName);
			if(agencyTerminatedList != null && agencyTerminatedList.size() > 0){
				for(int i=0; i<agencyTerminatedList.size(); i++){
					Map rowMap = (Map)agencyTerminatedList.get(i);
					if(rowMap.get("isNew") != null && rowMap.get("isNew").equals("Y")){
						Context newCtx = new Context();
						newCtx.setProject(ctx.getProject());
						newCtx.putAll(rowMap);
						
						newCtx.put("agency_id", ctx.get("agency_id"));
						newCtx.put("prospect_agency_id", ctx.get("prospect_agency_id"));
						newCtx.put("last_updated_by", ctx.get("last_updated_by"));
						newCtx.put("last_updated_ts", ctx.get("last_updated_ts"));
						newCtx.put("national_code", ctx.get("national_code"));
						
						if(newCtx.get("annual_premium_volume") != null && !newCtx.get("annual_premium_volume").toString().equals(HtmlConstants.EMPTY))
							newCtx.put("annual_premium_volume", DataUtils.removeAmountFormat(newCtx.get("annual_premium_volume")));
						
						SqlResources.getSqlMapProcessor(newCtx).insert("agencyterminated.insert", newCtx);
					}
				}
			}
		}
		
/*-------------------------------------------------------------------------------------------------------------------------------------------*/
		
		
		if((ctx.get("carrier_id")!=null && !HtmlConstants.EMPTY.equals(ctx.get("carrier_id").toString()))){
			
			if((ctx.get("class1volume")!=null && !HtmlConstants.EMPTY.equals(ctx.get("class1volume").toString()))
					|| (ctx.get("PY_written_premium")!=null && !HtmlConstants.EMPTY.equals(ctx.get("PY_written_premium").toString()))
					|| (ctx.get("total_volume")!=null && !HtmlConstants.EMPTY.equals(ctx.get("total_volume").toString()))){
				ctx.put("total_volume", DataUtils.removeAmountFormat(ctx.get("total_volume")));
				ctx.put("class1volume", DataUtils.removeAmountFormat(ctx.get("class1volume")));
				ctx.put("PY_written_premium", DataUtils.removeAmountFormat(ctx.get("PY_written_premium")));
			}
			ctx.put("is_cl_auto_lsc_carrier",ctx.get("is_cl_auto_lsc_carrier") != null && !HtmlConstants.EMPTY.equals(ctx.get("is_cl_auto_lsc_carrier")) && ctx.get("is_cl_auto_lsc_carrier").toString().equals("Y") ? 1 : 0);
			if(ctx.get(Constants.INET_ERRORS_LIST) == null){
			    new SetParametersForStoredProcedures().setParametersInContext(ctx, "life_volume,pl_volume,cl_volume,total_volume,class1volume,PY_written_premium,carrier_id,loss_ratio,dateofappointment,years_represented,is_cl_auto_lsc_carrier");	
				SqlResources.getSqlMapProcessor(ctx).insert("agency_marketinformation.insert", ctx);
			}else{
			  return;
			}
			
		}
				
				if(sess.getAttribute(agencyCompanyPremiumLicensed) != null &&
						sess.getAttribute(agencyCompanyPremiumLicensed) instanceof List){
					List agencyTerminatedList = (List)sess.getAttribute(agencyCompanyPremiumLicensed);
					if(agencyTerminatedList != null && agencyTerminatedList.size() > 0){
						for(int i=0; i<agencyTerminatedList.size(); i++){
							Map rowMap = (Map)agencyTerminatedList.get(i);
							if(rowMap.get("isNew") != null && (rowMap.get("isNew").equals("Y") || rowMap.get("isNew").equals("SaveEdit")
									|| rowMap.get("isNew").equals("Edit"))){
								Context newCtx = new Context();
								newCtx.setProject(ctx.getProject());
								if(rowMap.get("isNew").equals("Y")){
									
									newCtx.putAll(rowMap);
									newCtx.put("last_updated_by", ctx.get("last_updated_by"));
									newCtx.put("last_updated_ts", ctx.get("last_updated_ts"));
									if(rowMap.get("total_volume") != null && !rowMap.get("total_volume").toString().equals(HtmlConstants.EMPTY))
										newCtx.put("total_volume", DataUtils.removeAmountFormat(rowMap.get("total_volume")));
									if(rowMap.get("class1volume") != null && !rowMap.get("class1volume").toString().equals(HtmlConstants.EMPTY))
										newCtx.put("class1volume", DataUtils.removeAmountFormat(rowMap.get("class1volume")));
									if(rowMap.get("PY_written_premium") != null && !rowMap.get("PY_written_premium").toString().equals(HtmlConstants.EMPTY))
										newCtx.put("PY_written_premium", DataUtils.removeAmountFormat(rowMap.get("PY_written_premium")));
									
									//updated by Shobhit as per BMIC requirements- start
									
									if(rowMap.get("life_volume") != null && !rowMap.get("life_volume").toString().equals(HtmlConstants.EMPTY))
										newCtx.put("life_volume", DataUtils.removeAmountFormat(rowMap.get("life_volume")));
									if(rowMap.get("pl_volume") != null && !rowMap.get("pl_volume").toString().equals(HtmlConstants.EMPTY))
										newCtx.put("pl_volume", DataUtils.removeAmountFormat(rowMap.get("pl_volume")));
									if(rowMap.get("cl_volume") != null && !rowMap.get("cl_volume").toString().equals(HtmlConstants.EMPTY))
										newCtx.put("cl_volume", DataUtils.removeAmountFormat(rowMap.get("cl_volume")));
									
									//updated by Shobhit as per BMIC requirements- end
									
									newCtx.put("agency_id", ctx.get("agency_id"));
									newCtx.put("prospect_agency_id", ctx.get("prospect_agency_id"));
									newCtx.put("is_cl_auto_lsc_carrier",rowMap.get("is_cl_auto_lsc_carrier") != null && !HtmlConstants.EMPTY.equals(rowMap.get("is_cl_auto_lsc_carrier")) && rowMap.get("is_cl_auto_lsc_carrier").toString().equals("Y") ? 1 : 0);
									
								}else if(rowMap.get("isNew").equals("Edit") || rowMap.get("isNew").equals("SaveEdit")){
									
									newCtx.put("carrier_id", ctx.get("carrier_id_desc_"+i));
									newCtx.put("total_volume", ctx.get("total_volume_"+i));
									newCtx.put("class1volume", ctx.get("class1volume_"+i));
									newCtx.put("loss_ratio", ctx.get("loss_ratio_"+i) != null ? ctx.get("loss_ratio_"+i).toString().replace("%", "") : "");
									newCtx.put("dateofappointment", ctx.get("dateofappointment_"+i));
									newCtx.put("agency_id", ctx.get("agency_id"));
									newCtx.put("prospect_agency_id", ctx.get("prospect_agency_id"));
									newCtx.put("marketinformation_id", rowMap.get("marketinformation_id"));
									//newCtx.put("total_volume", ctx.get("total_volume"+i));
									newCtx.put("class1volume", ctx.get("class1volume_"+i));
									newCtx.put("PY_written_premium", ctx.get("PY_written_premium_"+i));
									newCtx.put("years_represented", ctx.get("years_represented_"+i));
									newCtx.put("yearofappointment", ctx.get("yearofappointment_"+i));
									newCtx.put("other_company_description", ctx.get("other_company_description_"+i));
									rowMap.putAll(newCtx);
									newCtx.put("last_updated_by", ctx.get("last_updated_by"));
									newCtx.put("last_updated_ts", ctx.get("last_updated_ts"));
									if(ctx.get("class1volume_"+i) != null && !ctx.get("class1volume_"+i).toString().equals(HtmlConstants.EMPTY))
										newCtx.put("class1volume_", DataUtils.removeAmountFormat(ctx.get("class1volume_"+i)));
									if(ctx.get("total_volume_"+i) != null && !ctx.get("total_volume_"+i).toString().equals(HtmlConstants.EMPTY))
										newCtx.put("total_volume", DataUtils.removeAmountFormat(ctx.get("total_volume_"+i)));
									if(ctx.get("PY_written_premium_"+i) != null && !ctx.get("PY_written_premium_"+i).toString().equals(HtmlConstants.EMPTY))
										newCtx.put("PY_written_premium", DataUtils.removeAmountFormat(ctx.get("PY_written_premium_"+i)));
									newCtx.put("agency_id", ctx.get("agency_id"));
									newCtx.put("prospect_agency_id", ctx.get("prospect_agency_id"));
									newCtx.put("life_volume", ctx.get("life_volume"+i));
									newCtx.put("pl_volume", ctx.get("pl_volume"+i));
									newCtx.put("cl_volume", ctx.get("cl_volume"+i));
									newCtx.put("is_cl_auto_lsc_carrier",ctx.get("is_cl_auto_lsc_carrier"+i) != null && !HtmlConstants.EMPTY.equals(ctx.get("is_cl_auto_lsc_carrier"+i)) && ctx.get("is_cl_auto_lsc_carrier"+i).toString().equals("Y") ? 1 : 0);
								}
								
								newCtx.put("national_code", ctx.get("national_code"));
								
								if(rowMap.get("isNew").equals("Edit")){
									SqlResources.getSqlMapProcessor(newCtx).insert("agency_marketinformation.update", newCtx);
								}else if(rowMap.get("isNew") != null && !rowMap.get("isNew").equals("N")){
									SqlResources.getSqlMapProcessor(newCtx).insert("agency_marketinformation.insert", newCtx);
								}
									
								
							}
						}
					}
				}
				
/*-------------------------------------------------------------------------------------------------------------------------------------------*/
				
				if(ctx.get("businessSourceListsize")!=null && !HtmlConstants.EMPTY.equals(ctx.get("businessSourceListsize").toString())){
					try {
						int businessSourceListsize = Integer.parseInt(ctx.get("businessSourceListsize").toString());
						
						if(ctx.get("agency_id") != null && !ctx.get("agency_id").toString().equals("")){
							SqlResources.getSqlMapProcessor(ctx).delete("SqlStmts.sqlStatementsviewdeleteBusniessSource", ctx);
						}else if(ctx.get("prospect_agency_id") != null && !ctx.get("prospect_agency_id").toString().equals("")){
							SqlResources.getSqlMapProcessor(ctx).delete("SqlStmts.sqlStatementsviewdeleteProspectBusniessSource", ctx);
						}
						
						for(int i=0; i<businessSourceListsize; i++){
								Context newCtx = new Context();
								newCtx.setProject(ctx.getProject());
								newCtx.put("percentage", ctx.get("percentage_"+i).toString());
								newCtx.put("business_source_id",ctx.get("business_source_id_"+i).toString());
								newCtx.put("agency_id", ctx.get("agency_id"));
								newCtx.put("prospect_agency_id", ctx.get("prospect_agency_id"));
								newCtx.put("last_updated_by", ctx.get("last_updated_by"));
								newCtx.put("last_updated_ts", ctx.get("last_updated_ts"));
								newCtx.put("national_code", ctx.get("national_code"));
								
								SqlResources.getSqlMapProcessor(newCtx).insert("agency_business_source.insert", newCtx);
						}
					} catch (Exception e) {
						logger.error(e.getMessage());
					}
				}
				
	
/*-------------------------------------------------------------------------------------------------------------------------------------------*/
		
		if(ctx.get("agencyCompaniesLicensedListsize")!=null && !HtmlConstants.EMPTY.equals(ctx.get("agencyCompaniesLicensedListsize").toString())){
			try {
				int agencyCompaniesLicensedListsize = Integer.parseInt(ctx.get("agencyCompaniesLicensedListsize").toString());
				if(ctx.get("agency_id") != null && !ctx.get("agency_id").toString().equals("")){
					SqlResources.getSqlMapProcessor(ctx).delete("SqlStmts.sqlStatementsviewdeleteAgencyCompaniesLicense", ctx);
				} else if(ctx.get("prospect_agency_id") != null && !ctx.get("prospect_agency_id").toString().equals("")){
					SqlResources.getSqlMapProcessor(ctx).delete("SqlStmts.sqlStatementsviewdeleteProspectCompaniesLicense", ctx);
				}
				for(int i=0; i<agencyCompaniesLicensedListsize; i++){
						Context newCtx = new Context();
						newCtx.setProject(ctx.getProject());
						newCtx.put("lob_id",ctx.get("lob_id_"+i).toString());
						newCtx.put("agency_id", ctx.get("agency_id"));
						newCtx.put("prospect_agency_id", ctx.get("prospect_agency_id"));
						newCtx.put("no_of_appointments", ctx.get("no_of_appointments_"+i));
						newCtx.put("last_updated_by", ctx.get("last_updated_by"));
						newCtx.put("last_updated_ts", ctx.get("last_updated_ts"));
						newCtx.put("premium_percentage", ctx.get("premium_percentage_"+i));
						newCtx.put("national_code", ctx.get("national_code"));
						
						SqlResources.getSqlMapProcessor(newCtx).insert("agencycompanieslicensed.insert", newCtx);
				}
			} catch (Exception e) {
				logger.error(e.getMessage());
			}  
		}
/*-------------------------------------------------------------------------------------------------------------------------------------------*/

		if(ctx.get("isShowEntityMarketInformation").toString().equals("Y")){
			
			
			if(ctx.get("agencyLinesBusinessListsize")!=null && !HtmlConstants.EMPTY.equals(ctx.get("agencyLinesBusinessListsize").toString()) && ctx.get("isShowEntityMarketInformation").toString().equals("Y")){
				try {
					int agencyLinesBusinessListsize = Integer.parseInt(ctx.get("agencyLinesBusinessListsize").toString());
					double totalPercentage = 0.0;
					for(int i=0; i<agencyLinesBusinessListsize; i++){
						if(ctx.get("premium_percentage_"+i) != null && !HtmlConstants.EMPTY.equals(ctx.get("premium_percentage_"+i).toString()))
							totalPercentage = totalPercentage + Double.parseDouble(ctx.get("premium_percentage_"+i).toString());  
					}
					if(totalPercentage > 100){
						DataUtils.populateError((Context)ctx, "percentageError", "LinesBusinessPercentErrorKey");
						errorCount++;
					}
				}catch(Exception e){
					logger.error(e.getMessage());
				}
			}
			if(errorCount>0)
				return;
			if(ctx.get("agencyLinesBusinessListsize")!=null && !HtmlConstants.EMPTY.equals(ctx.get("agencyLinesBusinessListsize").toString()) && ctx.get("isShowEntityMarketInformation").toString().equals("Y")){
				try {
					int agencyLinesBusinessListsize = Integer.parseInt(ctx.get("agencyLinesBusinessListsize").toString());
									
					SqlResources.getSqlMapProcessor(ctx).delete("SqlStmts.sqlStatementsviewdeleteBusniessDistribution", ctx);
					
					for(int i=0; i<agencyLinesBusinessListsize; i++){
							Context newCtx = new Context();
							newCtx.setProject(ctx.getProject());
							newCtx.put("premium_percentage", ctx.get("premium_percentage_"+i).toString());
							newCtx.put("lob_id",ctx.get("lob_id_"+i).toString());
							newCtx.put("agency_id", ctx.get("agency_id"));
							newCtx.put("prospect_agency_id", ctx.get("prospect_agency_id"));
							newCtx.put("last_updated_by", ctx.get("last_updated_by"));
							newCtx.put("last_updated_ts", ctx.get("last_updated_ts"));
							newCtx.put("national_code", ctx.get("national_code"));
							
							SqlResources.getSqlMapProcessor(newCtx).insert("agencycompanieslicensed.insert", newCtx);
					}
				} catch (Exception e) {
					logger.error(e.getMessage());
				}
			}
			if(ctx.get("agencyPremiumVolumeAccountListsize")!=null && !HtmlConstants.EMPTY.equals(ctx.get("agencyPremiumVolumeAccountListsize").toString())){
				try {
					int agencyPremiumVolumeAccountListsize = Integer.parseInt(ctx.get("agencyPremiumVolumeAccountListsize").toString());
					double totalPercentage = 0.0;
					for(int i=0; i< agencyPremiumVolumeAccountListsize; i++){
						if(ctx.get("percentage_"+i) != null && !HtmlConstants.EMPTY.equals(ctx.get("percentage_"+i).toString()))
							totalPercentage = totalPercentage + Double.parseDouble(ctx.get("percentage_"+i).toString());  
					}
					if(totalPercentage > 100){
						DataUtils.populateError((Context)ctx, "percentage1Error", "PremiumVolumePercentErrorKey");
						errorCount++;
					}
				}catch(Exception e){
					logger.error(e.getMessage());
				}
			}
			if(errorCount>0)
				return;
			if(ctx.get("agencyPremiumVolumeAccountListsize")!=null && !HtmlConstants.EMPTY.equals(ctx.get("agencyPremiumVolumeAccountListsize").toString())){
				try {
					int agencyPremiumVolumeAccountListsize = Integer.parseInt(ctx.get("agencyPremiumVolumeAccountListsize").toString());
									
					SqlResources.getSqlMapProcessor(ctx).delete("SqlStmts.sqlStatementsviewdeletePremiumVolumeAccount", ctx);
					
					for(int i=0; i<agencyPremiumVolumeAccountListsize; i++){
							Context newCtx = new Context();
							newCtx.setProject(ctx.getProject());
							newCtx.put("percentage", ctx.get("percentage_"+i).toString());
							newCtx.put("premiumvolume_id",ctx.get("premiumvolume_id_"+i).toString());
							newCtx.put("agency_id", ctx.get("agency_id"));
							newCtx.put("prospect_agency_id", ctx.get("prospect_agency_id"));
							newCtx.put("last_updated_by", ctx.get("last_updated_by"));
							newCtx.put("last_updated_ts", ctx.get("last_updated_ts"));
							newCtx.put("national_code", ctx.get("national_code"));
							
							SqlResources.getSqlMapProcessor(newCtx).insert("agency_premiumvolume_account.insert", newCtx);
					}
				} catch (Exception e) {
					logger.error(e.getMessage());
				}
			}
			
			if(ctx.get("businessPlanListsize")!=null && !HtmlConstants.EMPTY.equals(ctx.get("businessPlanListsize").toString())){
				try {
					int businessPlanListsize = Integer.parseInt(ctx.get("businessPlanListsize").toString());
									
					SqlResources.getSqlMapProcessor(ctx).delete("SqlStmts.sqlStatementsviewdeleteBusniessPlan", ctx);
					
					for(int i=0; i<businessPlanListsize; i++){
							Context newCtx = new Context();
							newCtx.setProject(ctx.getProject());
							newCtx.put("businessplan_id",ctx.get("businessplan_id_"+i).toString());
							if(ctx.get("businessplan_id1_"+i)!=null && !HtmlConstants.EMPTY.equals(ctx.get("businessplan_id1_"+i).toString()))
								newCtx.put("businessplan_id1", ctx.get("businessplan_id1_"+i).toString());
							else
								newCtx.put("businessplan_id1",null);							
							newCtx.put("agency_id", ctx.get("agency_id"));
							newCtx.put("last_updated_by", ctx.get("last_updated_by"));
							newCtx.put("last_updated_ts", ctx.get("last_updated_ts"));
							newCtx.put("national_code", ctx.get("national_code"));
							
							SqlResources.getSqlMapProcessor(newCtx).insert("agency_business_plan.insert", newCtx);
					}
				} catch (Exception e) {
					logger.error(e.getMessage());
				}
			}
		}
/*-------------------------------------------------------------------------------------------------------------------------------------------*/	
		if((ctx.get("segment_class_name")!=null && !HtmlConstants.EMPTY.equals(ctx.get("segment_class_name").toString()))
				|| ((ctx.get("annual_premium")!=null && !HtmlConstants.EMPTY.equals(ctx.get("annual_premium").toString())))
				|| ((ctx.get("Key_contact_name")!=null && !HtmlConstants.EMPTY.equals(ctx.get("Key_contact_name").toString())))
				|| ((ctx.get("Key_contact_email")!=null && !HtmlConstants.EMPTY.equals(ctx.get("Key_contact_email").toString())))
				|| ((ctx.get("industry_classification_id")!=null && !HtmlConstants.EMPTY.equals(ctx.get("industry_classification_id").toString())))){
				
				ctx.put("annual_premium", DataUtils.removeAmountFormat(ctx.get("annual_premium")));
				
				new SetParametersForStoredProcedures().setParametersInContext(ctx, "segment_class_name,annual_premium,Key_contact_name,Key_contact_email,industry_classification_id");
				SqlResources.getSqlMapProcessor(ctx).insert("segment_industry_classes.insert", ctx);
			}
			
			if(sess.getAttribute(agencySegmentClassesDetailsList) != null &&
					sess.getAttribute(agencySegmentClassesDetailsList) instanceof List){
				List agencySegmentClassesDetails = (List)sess.getAttribute(agencySegmentClassesDetailsList);
				if(agencySegmentClassesDetails != null && agencySegmentClassesDetails.size() > 0){
					for(int i=0; i<agencySegmentClassesDetails.size(); i++){
						Map rowMap = (Map)agencySegmentClassesDetails.get(i);
						
						Context newCtx = new Context();
						newCtx.setProject(ctx.getProject());
						
						if(rowMap.get("isNew") != null && rowMap.get("isNew").equals("Y")){
							
							newCtx.putAll(rowMap);
							newCtx.put("segment_class_name", newCtx.get("segment_class_name"));
							newCtx.put("annual_premium", newCtx.get("annual_premium"));
							newCtx.put("Key_contact_name", newCtx.get("Key_contact_name"));
							newCtx.put("Key_contact_email", newCtx.get("Key_contact_email"));
							newCtx.put("agency_id", ctx.get("agency_id"));
							newCtx.put("prospect_agency_id", ctx.get("prospect_agency_id"));
							newCtx.put("last_updated_by", ctx.get("last_updated_by"));
							newCtx.put("last_updated_ts", ctx.get("last_updated_ts"));
							newCtx.put("industry_classification_id", newCtx.get("industry_classification_id"));
							rowMap.putAll(newCtx);
							if(newCtx.get("annual_premium") != null && !newCtx.get("annual_premium").toString().equals(HtmlConstants.EMPTY))
								newCtx.put("annual_premium", DataUtils.removeAmountFormat(newCtx.get("annual_premium")));	
						
							
						}else if(rowMap.get("isNew") != null && (rowMap.get("isNew").equals("Edit") || rowMap.get("isNew").equals("SaveEdit"))){
							
							
							newCtx.put("segment_class_name", ctx.get("segment_class_name_"+i));
							newCtx.put("annual_premium", ctx.get("annual_premium_"+i));
							newCtx.put("Key_contact_name", ctx.get("Key_contact_name_"+i));
							newCtx.put("Key_contact_email", ctx.get("Key_contact_email_"+i));
							newCtx.put("industry_classification_id", ctx.get("industry_classification_id_desc_"+i));
							newCtx.put("agency_id", ctx.get("agency_id"));
							newCtx.put("prospect_agency_id", ctx.get("prospect_agency_id"));
							newCtx.put("segment_industry_classes_id", rowMap.get("segment_industry_classes_id"));
							
							rowMap.putAll(newCtx);
							
							if(ctx.get("annual_premium_"+i) != null && !ctx.get("annual_premium_"+i).toString().equals(HtmlConstants.EMPTY))
								newCtx.put("annual_premium", DataUtils.removeAmountFormat(ctx.get("annual_premium_"+i)));	
							
							newCtx.put("last_updated_by", ctx.get("last_updated_by"));
							newCtx.put("last_updated_ts", ctx.get("last_updated_ts"));
							newCtx.put("agency_id", ctx.get("agency_id"));
							newCtx.put("prospect_agency_id", ctx.get("prospect_agency_id"));
						}
						
						newCtx.put("national_code", ctx.get("national_code"));
						
						if(rowMap.get("isNew") != null && rowMap.get("isNew").equals("Edit")){
							SqlResources.getSqlMapProcessor(newCtx).update("segment_industry_classes.update", newCtx);
						}else if(rowMap.get("isNew") != null && !rowMap.get("isNew").equals("N")){
							SqlResources.getSqlMapProcessor(newCtx).insert("segment_industry_classes.insert", newCtx);
						}
					}
				}
			}
			
/*-------------------------------------------------------------------------------------------------------------------------------------------*/		
			if((ctx.get("program_name")!=null && !HtmlConstants.EMPTY.equals(ctx.get("program_name").toString()))
					|| ((ctx.get("segment_class_name1")!=null && !HtmlConstants.EMPTY.equals(ctx.get("segment_class_name1").toString())))
					|| ((ctx.get("product_lines")!=null && !HtmlConstants.EMPTY.equals(ctx.get("product_lines").toString())))
					|| ((ctx.get("mga_mgu")!=null && !HtmlConstants.EMPTY.equals(ctx.get("mga_mgu").toString())))
					|| ((ctx.get("premium")!=null && !HtmlConstants.EMPTY.equals(ctx.get("premium").toString())))){
					
					ctx.put("segment_class_name", DataUtils.removeAmountFormat(ctx.get("segment_class_name1")));
					ctx.put("premium", DataUtils.removeAmountFormat(ctx.get("premium")));
					
					new SetParametersForStoredProcedures().setParametersInContext(ctx, "program_name,segment_class_name1,product_lines,mga_mgu,premium");
					SqlResources.getSqlMapProcessor(ctx).insert("program_business.insert", ctx);
				}
			
			if(sess.getAttribute(agencyProgramBusinessList) != null &&
					sess.getAttribute(agencyProgramBusinessList) instanceof List){
				List agencyProgramBusiness = (List)sess.getAttribute(agencyProgramBusinessList);
				if(agencyProgramBusiness != null && agencyProgramBusiness.size() > 0){
					for(int i=0; i<agencyProgramBusiness.size(); i++){
						Map rowMap = (Map)agencyProgramBusiness.get(i);
						Context newCtx = new Context();
						newCtx.setProject(ctx.getProject());
						
						if(rowMap.get("isNew") != null && rowMap.get("isNew").equals("Y")){
							
							newCtx.putAll(rowMap);
							newCtx.put("program_name", newCtx.get("program_name"));
							newCtx.put("segment_class_name", newCtx.get("segment_class_name1"));
							newCtx.put("product_lines", newCtx.get("product_lines"));
							newCtx.put("mga_mgu", newCtx.get("mga_mgu"));
							newCtx.put("premium", newCtx.get("premium"));
							newCtx.put("agency_id", ctx.get("agency_id"));
							newCtx.put("prospect_agency_id", ctx.get("prospect_agency_id"));
							newCtx.put("last_updated_by", ctx.get("last_updated_by"));
							newCtx.put("last_updated_ts", ctx.get("last_updated_ts"));
						
							
							if(newCtx.get("premium") != null && !newCtx.get("premium").toString().equals(HtmlConstants.EMPTY))
								newCtx.put("premium", DataUtils.removeAmountFormat(newCtx.get("premium")));	
						
							
						}else if(rowMap.get("isNew") != null && (rowMap.get("isNew").equals("Edit") || rowMap.get("isNew").equals("SaveEdit"))){
							
							newCtx.put("program_name", ctx.get("program_name_"+i));
							newCtx.put("segment_class_name", ctx.get("segment_class_name1_"+i));
							newCtx.put("product_lines", ctx.get("product_lines_"+i));
							newCtx.put("mga_mgu", ctx.get("mga_mgu_"+i));
							newCtx.put("premium", ctx.get("premium_"+i));
							newCtx.put("agency_id", ctx.get("agency_id"));
							newCtx.put("prospect_agency_id", ctx.get("prospect_agency_id"));
							newCtx.put("program_business_id", rowMap.get("program_business_id"));
							rowMap.putAll(newCtx);
							newCtx.put("last_updated_by", ctx.get("last_updated_by"));
							newCtx.put("last_updated_ts", ctx.get("last_updated_ts"));
							
							if(ctx.get("premium_"+i) != null && !ctx.get("premium_"+i).toString().equals(HtmlConstants.EMPTY))
								newCtx.put("premium", DataUtils.removeAmountFormat(ctx.get("premium_"+i)));	
							
						
						}
						
						newCtx.put("national_code", ctx.get("national_code"));
						
						if(rowMap.get("isNew") != null && rowMap.get("isNew").equals("Edit")){
							SqlResources.getSqlMapProcessor(newCtx).update("program_business.update", newCtx);
						}else if(rowMap.get("isNew") != null && !rowMap.get("isNew").equals("N")){
							SqlResources.getSqlMapProcessor(newCtx).insert("program_business.insert", newCtx);
							
						}
					}
				}
			}
			
/*-------------------------------------------------------------------------------------------------------------------------------------------*/		
			if(ctx.get("agencyPremiumVolumeByLOBListsize")!=null && !HtmlConstants.EMPTY.equals(ctx.get("agencyPremiumVolumeByLOBListsize").toString())){
				try {
					int agencyPremiumVolumeByLOBListsize = Integer.parseInt(ctx.get("agencyPremiumVolumeByLOBListsize").toString());
					if(ctx.get("agency_id") != null && !ctx.get("agency_id").toString().equals("")){
						SqlResources.getSqlMapProcessor(ctx).delete("SqlStmts.sqlStatementsviewdeleteAgencyPremiumVolumeCommitted", ctx);
					}else if(ctx.get("prospect_agency_id") != null && !ctx.get("prospect_agency_id").toString().equals("")){
						SqlResources.getSqlMapProcessor(ctx).delete("SqlStmts.sqlStatementsviewdeleteProspectPremiumVolumeCommitted", ctx);
					}
					
					for(int i=0; i<agencyPremiumVolumeByLOBListsize; i++){
							Context newCtx = new Context();
							newCtx.setProject(ctx.getProject());
							
							newCtx.put("yearly_premium", ctx.get("yearly_premium_"+i).toString());
							newCtx.put("next3year_premium", ctx.get("next3year_premium_"+i));
							newCtx.put("lob_id",ctx.get("lob_id_"+i).toString());
							newCtx.put("agency_id", ctx.get("agency_id"));
							newCtx.put("prospect_agency_id", ctx.get("prospect_agency_id"));
							newCtx.put("last_updated_by", ctx.get("last_updated_by"));
							newCtx.put("last_updated_ts", ctx.get("last_updated_ts"));
							newCtx.put("national_code", ctx.get("national_code"));
							
							if(ctx.get("premium_volume_by_lob_security")!= null && ctx.get("premium_volume_by_lob_security").toString().equals("Y")
									&& ctx.get("monthly_premium1_"+i)!=null)
								newCtx.put("monthly_premium", ctx.get("monthly_premium1_"+i));
							else if(ctx.get("monthly_premium_"+i)!=null)
								newCtx.put("monthly_premium", ctx.get("monthly_premium_"+i));
							
							if(newCtx.get("yearly_premium") != null && !newCtx.get("yearly_premium").toString().equals(HtmlConstants.EMPTY))
								newCtx.put("yearly_premium", DataUtils.removeAmountFormat(newCtx.get("yearly_premium")));
							if(newCtx.get("monthly_premium") != null && !newCtx.get("monthly_premium").toString().equals(HtmlConstants.EMPTY))
								newCtx.put("monthly_premium", DataUtils.removeAmountFormat(newCtx.get("monthly_premium")));
							SqlResources.getSqlMapProcessor(newCtx).insert("agencypremiumvolumecommitted.insert", newCtx);
					}
				} catch (Exception e) {
					logger.error(e.getMessage());
				}  
			}
			
/*-------------------------------------------------------------------------------------------------------------------------------------------*///			
			
		//going to check Comments section
		if(ctx.get("comments_or_remarks_security")!=null && ctx.get("comments_or_remarks_security").toString().equals("Y")){
			String agency_comments = ctx.get("agency_comments") != null ? ctx.get("agency_comments").toString() : HtmlConstants.EMPTY;
			String adminBrokerageDetailsStep6CommentsSize = (ctx.get("adminBrokerageDetailsStep6CommentsSize") != null && !ctx.get("adminBrokerageDetailsStep6CommentsSize").toString().equals(HtmlConstants.EMPTY)) ? ctx.get("adminBrokerageDetailsStep6CommentsSize").toString() : "-1";
			if(agency_comments.length() > 0 && agency_comments.length() > Integer.parseInt(adminBrokerageDetailsStep6CommentsSize))
				ctx.put("agency_comments", agency_comments.substring(0, Integer.parseInt(adminBrokerageDetailsStep6CommentsSize)));
			else
				ctx.put("agency_comments", agency_comments);
		}
	}
	
	
		private void saveAgencyCompanyPremiumLicensedRow(IContext ctx, HttpSession sess) throws Exception{
		if(ctx.get("rownum") != null && !HtmlConstants.EMPTY.equals(ctx.get("rownum").toString())){
			String rownum = ctx.get("rownum").toString();
			
			if(sess.getAttribute(agencyCompanyPremiumLicensed) != null &&
					sess.getAttribute(agencyCompanyPremiumLicensed) instanceof List){
				List agencyTerminatedList = (List)sess.getAttribute(agencyCompanyPremiumLicensed);
				if(agencyTerminatedList != null && agencyTerminatedList.size() > 0){
					
					
					for(int i=0; i<agencyTerminatedList.size(); i++){
						Map rowMap = (Map)agencyTerminatedList.get(i);
						
						if(rowMap.get("isNew") != null && rowMap.get("rownum") != null && (rowMap.get("isNew").equals("SaveEdit")
								|| rowMap.get("isNew").equals("Edit"))){
							
							Context newCtx = new Context();
							newCtx.setProject(ctx.getProject());
							//newCtx.putAll(rowMap);
							
							newCtx.put("carrier_id", ctx.get("carrier_id_desc_"+i));
							newCtx.put("other_company_description", ctx.get("other_company_description_"+i));
							newCtx.put("class1volume", ctx.get("class1volume_"+i));
							newCtx.put("life_volume", ctx.get("life_volume_"+i));
							newCtx.put("pl_volume", ctx.get("pl_volume_"+i));
							newCtx.put("cl_volume", ctx.get("cl_volume_"+i));
							newCtx.put("total_volume", ctx.get("total_volume_"+i));
							newCtx.put("loss_ratio", ctx.get("loss_ratio_"+i) != null ? ctx.get("loss_ratio_"+i).toString().replace("%", "") : "");
							newCtx.put("yearofappointment", ctx.get("yearofappointment_"+i));
							newCtx.put("agency_id", ctx.get("agency_id"));
							newCtx.put("prospect_agency_id", ctx.get("prospect_agency_id"));
							newCtx.put("marketinformation_id", rowMap.get("marketinformation_id"));
							newCtx.put("class1volume", ctx.get("class1volume_"+i));
							//newCtx.put("total_volume", ctx.get("total_volume"+i));
							newCtx.put("PY_written_premium", ctx.get("PY_written_premium_"+i));
							newCtx.put("years_represented", ctx.get("years_represented_"+i));
							newCtx.put("is_cl_auto_lsc_carrier",ctx.get("is_cl_auto_lsc_carrier_"+i) != null && !HtmlConstants.EMPTY.equals(ctx.get("is_cl_auto_lsc_carrier_"+i)) && ctx.get("is_cl_auto_lsc_carrier_"+i).toString().equals("Y") ? 1 : 0);
							rowMap.putAll(newCtx);
							
						
							
						}
					}
					
					for(int i=0; i<agencyTerminatedList.size(); i++){
						Map rowMap = (Map)agencyTerminatedList.get(i);
						if(rowMap.get("isNew") != null && rowMap.get("rownum") != null && (rowMap.get("isNew").equals("SaveEdit")
								|| rowMap.get("isNew").equals("Edit"))
								&& (rowMap.get("rownum").toString().equals(rownum))){
							
							Context newCtx = new Context();
							newCtx.setProject(ctx.getProject());
							//newCtx.putAll(rowMap);
							String carrier_id_desc = rowMap.get("carrier_id").toString();
							newCtx.put("carrier_id", ctx.get("carrier_id_desc_"+i));
							if(ctx.get("carrier_id_desc_SelectedText_"+i)  != null){
								newCtx.put("carrier_id_desc", ctx.get("carrier_id_desc_SelectedText_"+i).toString().replace("&amp;", "&"));
							}
							newCtx.put("other_company_description", ctx.get("other_company_description_"+i));
							newCtx.put("total_volume", ctx.get("total_volume_"+i));
							newCtx.put("class1volume", ctx.get("class1volume_"+i));
							newCtx.put("loss_ratio", ctx.get("loss_ratio_"+i) != null ? ctx.get("loss_ratio_"+i).toString().replace("%", "") : "");
							newCtx.put("yearofappointment", ctx.get("yearofappointment_"+i));
							newCtx.put("agency_id", ctx.get("agency_id"));
							newCtx.put("prospect_agency_id", ctx.get("prospect_agency_id"));
							newCtx.put("marketinformation_id", rowMap.get("marketinformation_id"));
							//newCtx.put("total_volume", ctx.get("total_volume_"+i));
							newCtx.put("class1volume", ctx.get("class1volume_"+i));
							newCtx.put("PY_written_premium", ctx.get("PY_written_premium_"+i));
							newCtx.put("years_represented", ctx.get("years_represented_"+i));
							rowMap.putAll(newCtx);
							if(ctx.get("total_volume_"+i) != null && !ctx.get("total_volume_"+i).toString().equals(HtmlConstants.EMPTY))
								newCtx.put("total_volume", DataUtils.removeAmountFormat(ctx.get("total_volume_"+i)));
							if(ctx.get("class1volume_"+i) != null && !ctx.get("class1volume_"+i).toString().equals(HtmlConstants.EMPTY))
								newCtx.put("class1volume", DataUtils.removeAmountFormat(ctx.get("class1volume_"+i)));
							if(ctx.get("PY_written_premium_"+i) != null 
									&& !ctx.get("PY_written_premium_"+i).toString().equals(HtmlConstants.EMPTY))
								newCtx.put("PY_written_premium", DataUtils.removeAmountFormat(ctx.get("PY_written_premium_"+i)));
							
							
							newCtx.put("last_updated_by", ctx.get("last_updated_by"));
							newCtx.put("last_updated_ts", ctx.get("last_updated_ts"));
							newCtx.put("life_volume", ctx.get("life_volume_"+i));
							newCtx.put("pl_volume", ctx.get("pl_volume_"+i));
							newCtx.put("cl_volume", ctx.get("cl_volume_"+i));
							newCtx.put("is_cl_auto_lsc_carrier",ctx.get("is_cl_auto_lsc_carrier_"+i) != null && !HtmlConstants.EMPTY.equals(ctx.get("is_cl_auto_lsc_carrier_"+i)) && ctx.get("is_cl_auto_lsc_carrier_"+i).toString().equals("Y") ? 1 : 0);
							
							if(ctx.get(Constants.INET_ERRORS_LIST) == null){
							
							if(rowMap.get("isNew") != null && rowMap.get("isNew").equals("Edit")){
								SqlResources.getSqlMapProcessor(newCtx).insert("agency_marketinformation.update", newCtx);
							}else if(rowMap.get("isNew") != null && !rowMap.get("isNew").equals("N")){
								SqlResources.getSqlMapProcessor(newCtx).insert("agency_marketinformation.insert", newCtx);
							}
							}else{
							  return;
							}
							rowMap.put("isNew","N");
							rowMap.put("is_cl_auto_lsc_carrier",rowMap.get("is_cl_auto_lsc_carrier") != null && rowMap.get("is_cl_auto_lsc_carrier").toString().equals("1") ? "Y" : "N");
							break;
						}
					}
					sess.setAttribute(agencyCompanyPremiumLicensed,agencyTerminatedList);
					ctx.put(agencyCompanyPremiumLicensed, agencyTerminatedList);
				}
			}
			
		}
	}

	private void saveSegmentClassesDetailsRow(IContext ctx, HttpSession sess) throws Exception{
		if(ctx.get("rownum") != null && !HtmlConstants.EMPTY.equals(ctx.get("rownum").toString())){
			String rownum = ctx.get("rownum").toString();
			
			if(sess.getAttribute(agencySegmentClassesDetailsList) != null &&
					sess.getAttribute(agencySegmentClassesDetailsList) instanceof List){
				List agencyTerminatedList = (List)sess.getAttribute(agencySegmentClassesDetailsList);
				if(agencyTerminatedList != null && agencyTerminatedList.size() > 0){
					
					
					for(int i=0; i<agencyTerminatedList.size(); i++){
						Map rowMap = (Map)agencyTerminatedList.get(i);
						
						if(rowMap.get("isNew") != null && rowMap.get("rownum") != null && (rowMap.get("isNew").equals("SaveEdit")
								|| rowMap.get("isNew").equals("Edit"))){
							
							Context newCtx = new Context();
							newCtx.setProject(ctx.getProject());
							//newCtx.putAll(rowMap);
							newCtx.put("industry_classification_id", ctx.get("industry_classification_id_desc_"+i));
							newCtx.put("segment_class_name", ctx.get("segment_class_name_"+i));
							newCtx.put("annual_premium", ctx.get("annual_premium_"+i));
							newCtx.put("Key_contact_name", ctx.get("Key_contact_name_"+i));
							newCtx.put("Key_contact_email", ctx.get("Key_contact_email_"+i));
							newCtx.put("agency_id", ctx.get("agency_id"));
							rowMap.putAll(newCtx);
							
						
							
						}
					}
					
					for(int i=0; i<agencyTerminatedList.size(); i++){
						Map rowMap = (Map)agencyTerminatedList.get(i);
						if(rowMap.get("isNew") != null && rowMap.get("rownum") != null && (rowMap.get("isNew").equals("SaveEdit")
								|| rowMap.get("isNew").equals("Edit"))
								&& (rowMap.get("rownum").toString().equals(rownum))){
							
							Context newCtx = new Context();
							newCtx.setProject(ctx.getProject());
							//newCtx.putAll(rowMap);
							
							String industry_classification_id_desc = rowMap.get("industry_classification_id").toString();
							newCtx.put("industry_classification_id", ctx.get("industry_classification_id_desc_"+i));
							if(ctx.get("industry_classification_id_desc_SelectedText_"+i)  != null){
								newCtx.put("industry_classification_id_desc", ctx.get("industry_classification_id_desc_SelectedText_"+i).toString().replace("&amp;", "&"));
							}
							
							newCtx.put("segment_class_name", ctx.get("segment_class_name_"+i));
							newCtx.put("annual_premium", ctx.get("annual_premium_"+i));
							newCtx.put("Key_contact_name", ctx.get("Key_contact_name_"+i));
							newCtx.put("Key_contact_email", ctx.get("Key_contact_email_"+i));
							newCtx.put("agency_id", ctx.get("agency_id"));
							
							newCtx.put("segment_industry_classes_id", rowMap.get("segment_industry_classes_id"));
							rowMap.putAll(newCtx);
							
							
							if(ctx.get("annual_premium_"+i) != null && !ctx.get("annual_premium_"+i).toString().equals(HtmlConstants.EMPTY))
								newCtx.put("annual_premium", DataUtils.removeAmountFormat(ctx.get("annual_premium_"+i)));	
							
							newCtx.put("last_updated_by", ctx.get("last_updated_by"));
							newCtx.put("last_updated_ts", ctx.get("last_updated_ts"));
							
							
							if(rowMap.get("isNew") != null && rowMap.get("isNew").equals("Edit")){
								SqlResources.getSqlMapProcessor(newCtx).update("segment_industry_classes.update", newCtx);
							}else if(rowMap.get("isNew") != null && !rowMap.get("isNew").equals("N")){
								SqlResources.getSqlMapProcessor(newCtx).insert("segment_industry_classes.insert", newCtx);
							}
								
							rowMap.put("isNew","N");
							break;
						}
					}
					sess.setAttribute(agencySegmentClassesDetailsList,agencyTerminatedList);
					ctx.put(agencySegmentClassesDetailsList, agencyTerminatedList);
				}
			}
			
		}
	}
	
	
	private void saveProgramBusinessDetailsRow(IContext ctx, HttpSession sess) throws Exception{
		if(ctx.get("rownum") != null && !HtmlConstants.EMPTY.equals(ctx.get("rownum").toString())){
			String rownum = ctx.get("rownum").toString();
			
			if(sess.getAttribute(agencyProgramBusinessList) != null &&
					sess.getAttribute(agencyProgramBusinessList) instanceof List){
				List agencyTerminatedList = (List)sess.getAttribute(agencyProgramBusinessList);
				if(agencyTerminatedList != null && agencyTerminatedList.size() > 0){
					
					
					for(int i=0; i<agencyTerminatedList.size(); i++){
						Map rowMap = (Map)agencyTerminatedList.get(i);
						
						if(rowMap.get("isNew") != null && rowMap.get("rownum") != null && (rowMap.get("isNew").equals("SaveEdit")
								|| rowMap.get("isNew").equals("Edit"))){
							
							Context newCtx = new Context();
							newCtx.setProject(ctx.getProject());
							//newCtx.putAll(rowMap);
							
							newCtx.put("program_name", ctx.get("program_name_"+i));
							newCtx.put("segment_class_name", ctx.get("segment_class_name1_"+i));
							newCtx.put("product_lines", ctx.get("product_lines_"+i));
							newCtx.put("mga_mgu", ctx.get("mga_mgu_"+i));
							newCtx.put("premium", ctx.get("premium_"+i));
							newCtx.put("agency_id", ctx.get("agency_id"));
							rowMap.putAll(newCtx);
							
						
							
						}
					}
					
					for(int i=0; i<agencyTerminatedList.size(); i++){
						Map rowMap = (Map)agencyTerminatedList.get(i);
						if(rowMap.get("isNew") != null && rowMap.get("rownum") != null && (rowMap.get("isNew").equals("SaveEdit")
								|| rowMap.get("isNew").equals("Edit"))
								&& (rowMap.get("rownum").toString().equals(rownum))){
							
							Context newCtx = new Context();
							newCtx.setProject(ctx.getProject());
							//newCtx.putAll(rowMap);
							
							newCtx.put("program_name", ctx.get("program_name_"+i));
							newCtx.put("segment_class_name1", ctx.get("segment_class_name1_"+i));
							newCtx.put("segment_class_name", ctx.get("segment_class_name1_"+i));
							newCtx.put("product_lines", ctx.get("product_lines_"+i));
							newCtx.put("mga_mgu", ctx.get("mga_mgu_"+i));
							newCtx.put("premium", ctx.get("premium_"+i));
							newCtx.put("agency_id", ctx.get("agency_id"));
							newCtx.put("program_business_id", rowMap.get("program_business_id"));
							rowMap.putAll(newCtx);
							if(ctx.get("premium_"+i) != null && !ctx.get("premium_"+i).toString().equals(HtmlConstants.EMPTY))
								newCtx.put("premium", DataUtils.removeAmountFormat(ctx.get("premium_"+i)));	
						
							newCtx.put("last_updated_by", ctx.get("last_updated_by"));
							newCtx.put("last_updated_ts", ctx.get("last_updated_ts"));
							
							
							if(rowMap.get("isNew") != null && rowMap.get("isNew").equals("Edit")){
								SqlResources.getSqlMapProcessor(newCtx).update("program_business.update", newCtx);
							}else if(rowMap.get("isNew") != null && !rowMap.get("isNew").equals("N")){
								SqlResources.getSqlMapProcessor(newCtx).insert("program_business.insert", newCtx);
								
							}
								
							rowMap.put("isNew","N");
							break;
						}
					}
					sess.setAttribute(agencyProgramBusinessList,agencyTerminatedList);
					ctx.put(agencyProgramBusinessList, agencyTerminatedList);
				}
			}
			
		}
	}
	
	private void saveAgencyTerminatedRow(IContext ctx, HttpSession sess) throws Exception{
		if(ctx.get("rownum") != null && !HtmlConstants.EMPTY.equals(ctx.get("rownum").toString())){
			String rownum = ctx.get("rownum").toString();
			
			if(sess.getAttribute(agencyTerminatedListName) != null &&
					sess.getAttribute(agencyTerminatedListName) instanceof List){
				List agencyTerminatedList = (List)sess.getAttribute(agencyTerminatedListName);
				if(agencyTerminatedList != null && agencyTerminatedList.size() > 0){
					
					
					for(int i=0; i<agencyTerminatedList.size(); i++){
						Map rowMap = (Map)agencyTerminatedList.get(i);
						
						if(rowMap.get("isNew") != null && rowMap.get("rownum") != null && (rowMap.get("isNew").equals("SaveEdit")
								|| rowMap.get("isNew").equals("Edit"))){
							
							Context newCtx = new Context();
							newCtx.setProject(ctx.getProject());
							//newCtx.putAll(rowMap);
							
							newCtx.put("company_name", ctx.get("company_name_"+i));
							newCtx.put("annual_premium_volume", ctx.get("annual_premium_volume_"+i));
							newCtx.put("date_closed", ctx.get("date_closed_"+i));
							newCtx.put("reason_for_action_taken_desc", ctx.get("reason_for_action_taken_desc_"+i));
							newCtx.put("agency_id", rowMap.get("agency_id"));
							newCtx.put("reason_other", ctx.get("reason_other_"+i));
							rowMap.putAll(newCtx);
						
							
						}
					}
					
					
					for(int i=0; i<agencyTerminatedList.size(); i++){
						Map rowMap = (Map)agencyTerminatedList.get(i);
						
						if(rowMap.get("isNew") != null && rowMap.get("rownum") != null && (rowMap.get("isNew").equals("SaveEdit")
								|| rowMap.get("isNew").equals("Edit"))
								&& (rowMap.get("rownum").toString().equals(rownum))){
							
							Context newCtx = new Context();
							newCtx.setProject(ctx.getProject());
							//newCtx.putAll(rowMap);
							
							newCtx.put("reason_for_action_taken", ctx.get("reason_for_action_taken_desc_"+i));
							newCtx.put("reason_for_action_taken_desc", ctx.get("reason_for_action_taken_desc_SelectedText_"+i).toString().replace("&amp;", "&"));
							newCtx.put("company_name", ctx.get("company_name_"+i));
							newCtx.put("annual_premium_volume", ctx.get("annual_premium_volume_"+i));
							newCtx.put("date_closed", ctx.get("date_closed_"+i));
							newCtx.put("agency_id", rowMap.get("agency_id"));
							newCtx.put("reason_other", ctx.get("reason_other_"+i));
							newCtx.put("agencyterminated_id", rowMap.get("agencyterminated_id"));
							rowMap.putAll(newCtx);
							
							
							if(ctx.get("annual_premium_volume_"+i) != null && !ctx.get("annual_premium_volume_"+i).toString().equals(HtmlConstants.EMPTY))
								newCtx.put("annual_premium_volume", DataUtils.removeAmountFormat(ctx.get("annual_premium_volume_"+i)));
							
							newCtx.put("last_updated_by", ctx.get("last_updated_by"));
							newCtx.put("last_updated_ts", ctx.get("last_updated_ts"));
							newCtx.put("prospect_agency_id", ctx.get("prospect_agency_id"));
							if(ctx.get("date_closed_"+i)!=null && !ctx.get("date_closed_"+i).toString().equals(HtmlConstants.EMPTY)){
								if(DateUtils.isDateBefore(ctx.get("date_closed_"+i), new Date("01/01/1900")))
					        		DataUtils.populateError((Context)ctx, "percentageError3", "Invalid date closed");
							}
							if(ctx.get(Constants.INET_ERRORS_LIST)==null){
							if(rowMap.get("isNew").equals("Edit")){
								SqlResources.getSqlMapProcessor(newCtx).insert("agencyterminated.update", newCtx);
							}else{
								SqlResources.getSqlMapProcessor(newCtx).insert("agencyterminated.insert", newCtx);
							}
							}
							rowMap.put("isNew","N");
							break;
						}
					}
					sess.setAttribute(agencyTerminatedListName,agencyTerminatedList);
					ctx.put(agencyTerminatedListName, agencyTerminatedList);
				}
			}
			
		}
	}
	
	private void savePersonalInformationRow(IContext ctx, HttpSession sess) throws Exception{
		if(ctx.get("rownum") != null && !HtmlConstants.EMPTY.equals(ctx.get("rownum").toString())){
			String rownum = ctx.get("rownum").toString();
			
			if(sess.getAttribute(perosnalInformationListName) != null &&
					sess.getAttribute(perosnalInformationListName) instanceof List){
				List perosnalInformationList = (List)sess.getAttribute(perosnalInformationListName);
				if(perosnalInformationList != null && perosnalInformationList.size() > 0){
					
					
					for(int i=0; i<perosnalInformationList.size(); i++){
						Map rowMap = (Map)perosnalInformationList.get(i);
						
						if(rowMap.get("isNew") != null && rowMap.get("rownum") != null && (rowMap.get("isNew").equals("SaveEdit")
								|| rowMap.get("isNew").equals("Edit"))){
							
							Context newCtx = new Context();
							newCtx.setProject(ctx.getProject());
							//newCtx.putAll(rowMap);
							
							newCtx.put("agencyname", ctx.get("agencyname_"+i));
							newCtx.put("company", ctx.get("company_"+i));
							newCtx.put("address", ctx.get("address_"+i));
							newCtx.put("phoneNumber", ctx.get("phoneNumber_"+i));
							newCtx.put("agency_id", rowMap.get("agency_id"));
							newCtx.put("relationship",  ctx.get("relationship_"+i));
							rowMap.putAll(newCtx);
						
							
						}
					}
					
					
					for(int i=0; i<perosnalInformationList.size(); i++){
						Map rowMap = (Map)perosnalInformationList.get(i);
						
						if(rowMap.get("isNew") != null && rowMap.get("rownum") != null && (rowMap.get("isNew").equals("SaveEdit")
								|| rowMap.get("isNew").equals("Edit"))
								&& (rowMap.get("rownum").toString().equals(rownum))){
							
							Context newCtx = new Context();
							newCtx.setProject(ctx.getProject());
							//newCtx.putAll(rowMap);
							
							newCtx.put("name", ctx.get("agencyname_"+i));
							newCtx.put("company", ctx.get("company_"+i));
							newCtx.put("address", ctx.get("address_"+i));
							newCtx.put("phone", ctx.get("phoneNumber_"+i));
							newCtx.put("agency_id", rowMap.get("agency_id"));
							newCtx.put("relationship", ctx.get("relationship_"+i));
							newCtx.put("personalinformation_id", rowMap.get("personalinformation_id"));
							rowMap.putAll(newCtx);
							
							
							if(ctx.get("phoneNumber_"+i) != null && !ctx.get("phoneNumber_"+i).toString().equals(HtmlConstants.EMPTY))
								newCtx.put("phone", newCtx.get("phone").toString().replace("-", HtmlConstants.EMPTY));
							
							
							newCtx.put("last_updated_by", ctx.get("last_updated_by"));
							newCtx.put("last_updated_ts", ctx.get("last_updated_ts"));
							newCtx.put("prospect_agency_id", ctx.get("prospect_agency_id"));
							
							if(rowMap.get("isNew") != null && rowMap.get("rownum") != null && (rowMap.get("isNew").equals("SaveEdit")
									|| rowMap.get("isNew").equals("Edit"))){
								SqlResources.getSqlMapProcessor(newCtx).insert("agencypersonalinformation.update", newCtx);
							}else{
								SqlResources.getSqlMapProcessor(newCtx).insert("agencypersonalinformation.insert", newCtx);
							}
								
							rowMap.put("isNew","N");
							break;
						}
					}
					sess.setAttribute(perosnalInformationListName,perosnalInformationList);
					ctx.put(perosnalInformationListName, perosnalInformationList);
				}
			}
			
		}
	}
	private void saveAgencyMergersRow(IContext ctx, HttpSession sess) throws Exception{
		if(ctx.get("rownum") != null && !HtmlConstants.EMPTY.equals(ctx.get("rownum").toString())){
			String rownum = ctx.get("rownum").toString();
			
			if(sess.getAttribute(agencyMergersListName) != null &&
					sess.getAttribute(agencyMergersListName) instanceof List){
				List agencyMergersList = (List)sess.getAttribute(agencyMergersListName);
				if(agencyMergersList != null && agencyMergersList.size() > 0){
					
					
					for(int i=0; i<agencyMergersList.size(); i++){
						Map rowMap = (Map)agencyMergersList.get(i);
						
						if(rowMap.get("isNew") != null && rowMap.get("rownum") != null && (rowMap.get("isNew").equals("SaveEdit")
								|| rowMap.get("isNew").equals("Edit"))){
							
							Context newCtx = new Context();
							newCtx.setProject(ctx.getProject());
							//newCtx.putAll(rowMap);
							
							newCtx.put("agencymerger_name", ctx.get("agencymerger_name_"+i));
							newCtx.put("date_acquired", ctx.get("date_acquired_"+i));
							newCtx.put("volume", ctx.get("volume_"+i));
							newCtx.put("agency_id", rowMap.get("agency_id"));
							rowMap.putAll(newCtx);
						
							
						}
					}
					
					
					for(int i=0; i<agencyMergersList.size(); i++){
						Map rowMap = (Map)agencyMergersList.get(i);
						
						if(rowMap.get("isNew") != null && rowMap.get("rownum") != null && (rowMap.get("isNew").equals("SaveEdit")
								|| rowMap.get("isNew").equals("Edit"))
								&& (rowMap.get("rownum").toString().equals(rownum))){
							
							Context newCtx = new Context();
							newCtx.setProject(ctx.getProject());
							//newCtx.putAll(rowMap);
							
							newCtx.put("agencymerger_name", ctx.get("agencymerger_name_"+i));
							newCtx.put("date_acquired", ctx.get("date_acquired_"+i));
							newCtx.put("volume", ctx.get("volume_"+i));
							newCtx.put("agency_id", rowMap.get("agency_id"));
							newCtx.put("agencymerger_id", rowMap.get("agencymerger_id"));
							rowMap.putAll(newCtx);
							
							
							if(ctx.get("volume_"+i) != null && !ctx.get("volume_"+i).toString().equals(HtmlConstants.EMPTY))
								newCtx.put("volume", DataUtils.removeAmountFormat(ctx.get("volume_"+i)));
							
							
							newCtx.put("last_updated_by", ctx.get("last_updated_by"));
							newCtx.put("last_updated_ts", ctx.get("last_updated_ts"));
							newCtx.put("prospect_agency_id", ctx.get("prospect_agency_id"));
							
							
							if(rowMap.get("isNew").equals("Edit")){
								SqlResources.getSqlMapProcessor(newCtx).insert("agencymergers.update", newCtx);
							}else{
								SqlResources.getSqlMapProcessor(newCtx).insert("agencymergers.insert", newCtx);
							}
								
							rowMap.put("isNew","N");
							break;
						}
					}
					sess.setAttribute(agencyMergersListName,agencyMergersList);
					ctx.put(agencyMergersListName, agencyMergersList);
				}
			}
			
		}
	}

}

