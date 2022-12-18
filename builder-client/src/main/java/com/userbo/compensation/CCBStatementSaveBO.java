package com.userbo.compensation;


import java.util.List;
import java.util.Map;

import com.manage.managecomponent.components.Businessobject;
import com.manage.managecomponent.components.SetParametersForStoredProcedures;
import com.manage.managemetadata.functions.commonfunctions.DataUtils;
import com.ormapping.ibatis.SqlResources;
import com.util.Context;
import com.util.HtmlConstants;
import com.util.IContext;
import com.util.InetLogger;
import com.util.SystemProperties;

@SuppressWarnings("serial")
public class CCBStatementSaveBO extends Businessobject{
	private static InetLogger logger = InetLogger.getInetLogger(CCBStatementSaveBO.class);
	public boolean evaluate(IContext arg0) throws Exception {
		// TODO Auto-generated method stub
		return false;
	}
	@SuppressWarnings({ "unchecked"})
	public Object execute(IContext ctx) throws Exception {
		// Check Recalculation 
		try{
		String username = null;
		int producerProfitSharingId=0;
		if(ctx.get("user_id") != null && !"".equals(ctx.get("user_id"))) 
			username = ctx.get("user_id").toString();
		if(ctx.get("producer_profit_sharing_id") != null && !HtmlConstants.EMPTY.equals(ctx.get("producer_profit_sharing_id"))){ 
				producerProfitSharingId = Integer.parseInt(ctx.get("producer_profit_sharing_id").toString());
		}
		if(ctx.get("checkRecalculation") != null && !HtmlConstants.EMPTY.equals(ctx.get("checkRecalculation").toString()) && "Y".equals(ctx.get("checkRecalculation").toString())){
				String underwritingBonus = null;
				String growthBonus = null;
				int eligibilityRequirement=0;
				ctx.put("isAdjustmentSave", "Y");
				ctx.put("isAdjustmentRecalculate", "Y");
				if(ctx.get("underwriting_bonus")!=null && !HtmlConstants.EMPTY.equals(ctx.get("underwriting_bonus"))){ 
					underwritingBonus = ctx.get("underwriting_bonus").toString();
					ctx.put("underwriting_bonus", Double.parseDouble(removeSpecialChar(removeSpecialChar(underwritingBonus))));
				}else{
					ctx.put("underwriting_bonus", null);
				}
				if(ctx.get("growth_bonus")!=null && !HtmlConstants.EMPTY.equals(ctx.get("growth_bonus"))){ 
					growthBonus = ctx.get("growth_bonus").toString();
					ctx.put("growth_bonus", Double.parseDouble(removeSpecialChar(removeSpecialChar(growthBonus))));
				}else{
					ctx.put("growth_bonus", null);
				}
				if(ctx.get("notes") != null && !HtmlConstants.EMPTY.equals(ctx.get("notes"))){
					ctx.put("notes", ctx.get("notes"));
				}else{
					ctx.put("notes", null);
				}
				if(ctx.get("include_exclude_eligibility")!= null && !HtmlConstants.EMPTY.equals(ctx.get("include_exclude_eligibility"))){ 
					eligibilityRequirement= Integer.parseInt(ctx.get("include_exclude_eligibility").toString());
					ctx.put("include_exclude_eligibility", eligibilityRequirement);
				}else{
					ctx.put("include_exclude_eligibility", eligibilityRequirement);
				}
				if(ctx.get("producer_profit_sharing_id") != null && !HtmlConstants.EMPTY.equals(ctx.get("producer_profit_sharing_id"))){
					ctx.put("producer_profit_sharing_id", Integer.parseInt(ctx.get("producer_profit_sharing_id").toString()));
				}
				if(ctx.get("user_id") != null && !HtmlConstants.EMPTY.equals(ctx.get("user_id"))){ 
					ctx.put("last_updated_by", ctx.get("user_id").toString());
					}
				
				if(ctx.get("Stop_loss_per_occurrence") != null && !HtmlConstants.EMPTY.equals(ctx.get("Stop_loss_per_occurrence"))){ 
					String Stop_loss_per_occurrence = ctx.get("Stop_loss_per_occurrence").toString();
					ctx.put("Stop_loss_per_occurrence", Double.parseDouble(removeSpecialChar(removeSpecialChar(Stop_loss_per_occurrence))));
					
					}
				
				if(ctx.get("Loss_ratio_Permissible") != null && !HtmlConstants.EMPTY.equals(ctx.get("Loss_ratio_Permissible"))){ 
					String Loss_ratio_Permissible = ctx.get("Loss_ratio_Permissible").toString();
					ctx.put("Loss_ratio_Permissible", Double.parseDouble(removeSpecialChar(removeSpecialChar(Loss_ratio_Permissible))));
					
					}
				
				if(ctx.get("Minimum_Qualifying_Premimum") != null && !HtmlConstants.EMPTY.equals(ctx.get("Minimum_Qualifying_Premimum"))){ 
					String Minimum_Qualifying_Premimum = ctx.get("Minimum_Qualifying_Premimum").toString();
					ctx.put("Minimum_Qualifying_Premimum", Double.parseDouble(removeSpecialChar(removeSpecialChar(Minimum_Qualifying_Premimum))));
					
					}
				
				InsertCCBStatementIntoTemp(producerProfitSharingId,ctx);
				//SaveCCBStatementDataTemp(ctx,producerProfitSharingId);
				SaveCCBStatementDetailDataTemp(ctx,producerProfitSharingId);
				try {
					String client_db_name = SystemProperties.getInstance().getString("appl."+ctx.getProject()+".Client.DB.Name");
					ctx.put("Client_Db_Name", client_db_name);
				} catch (Exception e) {
					logger.error("Client Db name Property Not Found");
				}
				
				new SetParametersForStoredProcedures().setParametersInContext(ctx, "Loss_ratio_Permissible,Minimum_Qualifying_Premimum,Stop_loss_per_occurrence");
				
				SqlResources.getSqlMapProcessor(ctx).update("producer_number.UpdateProfitSharingStatementTemp_p",ctx);
				
		}
		// Check Save Calculation
		if(ctx.get("checkSaveCalculation") != null && !HtmlConstants.EMPTY.equals(ctx.get("checkSaveCalculation").toString()) && "Y".equals(ctx.get("checkSaveCalculation").toString())){
			String underwritingBonus = null;
			String growthBonus = null;
			ctx.put("isAdjustmentSubmitApprove", "Y");
			ctx.put("isAdjustmentRecalculate", "Y");
			ctx.put("isAdjustmentEdit", "Y");
			ctx.remove("isAdjustmentSave");
			ctx.put("last_updated_by", username);
			if(ctx.get("include_exclude_eligibility") != null && !HtmlConstants.EMPTY.equals(ctx.get("include_exclude_eligibility"))){
				ctx.put("include_exclude_eligibility", Integer.parseInt(ctx.get("include_exclude_eligibility").toString()));
			}else{
				ctx.put("include_exclude_eligibility",null);
			}
			ctx.put("producer_profit_sharing_id", producerProfitSharingId);
			if(ctx.get("underwriting_bonus")!=null && !HtmlConstants.EMPTY.equals(ctx.get("underwriting_bonus"))){ 
				underwritingBonus = ctx.get("underwriting_bonus").toString();
				ctx.put("underwriting_bonus", Double.parseDouble(removeSpecialChar(removeSpecialChar(underwritingBonus))));
			}else{
				ctx.put("underwriting_bonus", null);
			}
			if(ctx.get("growth_bonus")!=null && !HtmlConstants.EMPTY.equals(ctx.get("growth_bonus"))){ 
				growthBonus = ctx.get("growth_bonus").toString();
				ctx.put("growth_bonus", Double.parseDouble(removeSpecialChar(removeSpecialChar(growthBonus))));
			}else{
				ctx.put("growth_bonus", null);
			}
			if(ctx.get("notes") != null && !HtmlConstants.EMPTY.equals(ctx.get("notes"))){
				ctx.put("notes", ctx.get("notes"));
			}else{
				ctx.put("notes", null);
			}
			if(ctx.get("Stop_loss_per_occurrence") != null && !HtmlConstants.EMPTY.equals(ctx.get("Stop_loss_per_occurrence"))){ 
				String Stop_loss_per_occurrence = ctx.get("Stop_loss_per_occurrence").toString();
				ctx.put("Stop_loss_per_occurrence", Double.parseDouble(removeSpecialChar(removeSpecialChar(Stop_loss_per_occurrence))));
				
				}
			
			if(ctx.get("Loss_ratio_Permissible") != null && !HtmlConstants.EMPTY.equals(ctx.get("Loss_ratio_Permissible"))){ 
				String Loss_ratio_Permissible = ctx.get("Loss_ratio_Permissible").toString();
				ctx.put("Loss_ratio_Permissible", Double.parseDouble(removeSpecialChar(removeSpecialChar(Loss_ratio_Permissible))));
				
				}
			
			if(ctx.get("Minimum_Qualifying_Premimum") != null && !HtmlConstants.EMPTY.equals(ctx.get("Minimum_Qualifying_Premimum"))){ 
				String Minimum_Qualifying_Premimum = ctx.get("Minimum_Qualifying_Premimum").toString();
				ctx.put("Minimum_Qualifying_Premimum", Double.parseDouble(removeSpecialChar(removeSpecialChar(Minimum_Qualifying_Premimum))));
				
				}
			saveCCBStatement(ctx);
			//SaveCCBStatementDataTemp(ctx,producerProfitSharingId);
			SaveCCBStatementDetailDataTemp(ctx,producerProfitSharingId);
			new SetParametersForStoredProcedures().setParametersInContext(ctx, "Loss_ratio_Permissible,Minimum_Qualifying_Premimum,Stop_loss_per_occurrence");
			SqlResources.getSqlMapProcessor(ctx).update("producer_number.UpdateProfitSharingStatement_p",ctx);
			deleteCCBFromTemp(ctx);
			}
		// Check Submit For Approval
		if(ctx.get("checkSubmitForApproval") != null && !HtmlConstants.EMPTY.equals(ctx.get("checkSubmitForApproval").toString()) && "Y".equals(ctx.get("checkSubmitForApproval").toString())){
			updateStatementApproval(ctx);
		}
		// Check Modify Producers 
		if(ctx.get("modifyHierarchyProducers") != null && !HtmlConstants.EMPTY.equals(ctx.get("modifyHierarchyProducers")) && "Y".equals(ctx.get("modifyHierarchyProducers"))){
				modifyProducers(ctx);
		}
		}catch(Exception e){
			logger.debug("Exception in CCBStatementSaveBO : ");
			logger.error("Unable to process due to error : " + DataUtils.getExceptionStackTrace(e));
		}
		return null;
	}
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public void SaveCCBStatementDataTemp(IContext ctx,int producerProfitSharingId){
	try{
	String currentWrittenPremium = null;
	String producerProfitSharingSummaryId=null;
	String priortWrittenPremium = null;
	String earnedPremiumPremium = null;
	String incurredLoss = null;
	String lossAdjustmentExpense = null;
	String commissionAmount = null;
	String pyLossAmount = null;
	String premiumTaxAmount = null;
	String involutaryAmount = null;
	String reinsuranceAmountAmount = null;
	String expenseChargeAmount = null;
	 /*Phase 3- recalculation*/	
	String CYEvalAmount=null;
	String PYEvalAmount=null; 
	String LossAmount=null; 
	String PayoutFactor=null;
	String LossRatio=null;
	String ContCommPay= null;
	/*Phase 3- recalculation*/
	
	ctx.put("producer_profit_sharing_id", producerProfitSharingId);
	List requiredPremiumList= (List)ctx.get("GetIncentive_payout_summary_list_01");
	if(requiredPremiumList != null && requiredPremiumList.size()>0){
		for(int i=0; i<requiredPremiumList.size()-1; i++){
			Map map = (Map) requiredPremiumList.get(i);
			if(map!=null){
				if(map.get("producer_profit_sharing_summary_id") !=null && !HtmlConstants.EMPTY.equals(map.get("producer_profit_sharing_summary_id"))){
					producerProfitSharingSummaryId=map.get("producer_profit_sharing_summary_id").toString();
					ctx.put("producer_profit_sharing_summary_id", Integer.parseInt(producerProfitSharingSummaryId));
				}
				if(map.get("current_written_premium") !=null && !HtmlConstants.EMPTY.equals(map.get("current_written_premium"))){
					currentWrittenPremium=map.get("current_written_premium").toString();
					ctx.put("current_written_premium", Double.parseDouble(removeSpecialChar(currentWrittenPremium)));
				}
				if(map.get("prior_written_premium")!=null && !HtmlConstants.EMPTY.equals(map.get("prior_written_premium"))){
					priortWrittenPremium = map.get("prior_written_premium").toString();
					ctx.put("prior_written_premium", Double.parseDouble(removeSpecialChar(priortWrittenPremium)));
				}
				if(ctx.get("earned_premium_"+i)!=null && !HtmlConstants.EMPTY.equals(ctx.get("earned_premium_"+i))){ 
					earnedPremiumPremium = ctx.get("earned_premium_"+i).toString();
					ctx.put("earned_premium", Double.parseDouble(removeSpecialChar(removeSpecialChar(earnedPremiumPremium))));
				}
				if(ctx.get("incurred_losses_"+i)!=null && !HtmlConstants.EMPTY.equals(ctx.get("incurred_losses_"+i))){
					incurredLoss = ctx.get("incurred_losses_"+i).toString();
					ctx.put("incurred_loss", Double.parseDouble(removeSpecialChar(incurredLoss)));
				}
				
				if(ctx.get("loss_ratio_"+i)!=null && !HtmlConstants.EMPTY.equals(ctx.get("loss_ratio_"+i))){
					LossRatio = ctx.get("loss_ratio_"+i).toString();
					ctx.put("loss_ratio", Double.parseDouble(removeSpecialChar(LossRatio)));
				}
				
				/*Phase 3- recalculation*/	
				if(ctx.get("CY_Eval_"+i)!=null && !HtmlConstants.EMPTY.equals(ctx.get("CY_Eval_"+i))){
					CYEvalAmount = ctx.get("CY_Eval_"+i).toString();
					ctx.put("CY_Eval", Double.parseDouble(removeSpecialChar(CYEvalAmount)));
				}
				
				if(ctx.get("PY_Eval_"+i)!=null && !HtmlConstants.EMPTY.equals(ctx.get("PY_Eval_"+i))){
					PYEvalAmount = ctx.get("PY_Eval_"+i).toString();
					ctx.put("PY_Eval", Double.parseDouble(removeSpecialChar(PYEvalAmount)));
				}
				
				if(ctx.get("Loss_amt_Cont_Comm_"+i)!=null && !HtmlConstants.EMPTY.equals(ctx.get("Loss_amt_Cont_Comm_"+i))){
					LossAmount = ctx.get("Loss_amt_Cont_Comm_"+i).toString();
					ctx.put("Loss_amt_Cont_Comm", Double.parseDouble(removeSpecialChar(LossAmount)));
				}
				
				if(ctx.get("payout_factor_"+i)!=null && !HtmlConstants.EMPTY.equals(ctx.get("payout_factor_"+i))){
					PayoutFactor = ctx.get("payout_factor_"+i).toString();
					ctx.put("payout_factor", Double.parseDouble(removeSpecialChar(PayoutFactor)));
				}
				
				
				if(ctx.get("cont_comm_pay_"+i)!=null && !HtmlConstants.EMPTY.equals(ctx.get("cont_comm_pay_"+i))){
					ContCommPay = ctx.get("cont_comm_pay_"+i).toString();
					ctx.put("cont_comm_pay", Double.parseDouble(removeSpecialChar(ContCommPay)));
				}
				
				
				/*Phase 3- recalculation*/

				if(map.get("loss_adjustment_expense")!=null && !HtmlConstants.EMPTY.equals(map.get("loss_adjustment_expense"))){
					lossAdjustmentExpense = map.get("loss_adjustment_expense").toString();
					ctx.put("loss_adjustment_expense", Double.parseDouble(removeSpecialChar(lossAdjustmentExpense)));
				}
				if(ctx.get("earned_commission_amount_"+i)!=null && !HtmlConstants.EMPTY.equals(ctx.get("earned_commission_amount_"+i))){
					commissionAmount = ctx.get("earned_commission_amount_"+i).toString();
					ctx.put("commission_amount", Double.parseDouble(removeSpecialChar(commissionAmount)));
				}
				if(map.get("premium_tax_amount")!=null && !HtmlConstants.EMPTY.equals(map.get("premium_tax_amount"))){
					premiumTaxAmount = map.get("premium_tax_amount").toString();
					ctx.put("premium_tax_amount", Double.parseDouble(removeSpecialChar(premiumTaxAmount)));
				}
				if(map.get("involutary_amount")!=null && !HtmlConstants.EMPTY.equals(map.get("involutary_amount"))){
					involutaryAmount = map.get("involutary_amount").toString();
					ctx.put("involutary_amount", Double.parseDouble(removeSpecialChar(involutaryAmount)));
				}
				if(ctx.get("py_losses_"+i)!=null && !HtmlConstants.EMPTY.equals(ctx.get("py_losses_"+i))){
					pyLossAmount = ctx.get("py_losses_"+i).toString();
					ctx.put("py_losses", Double.parseDouble(removeSpecialChar(pyLossAmount)));
				}
				if(map.get("involutary_amount")!=null && !HtmlConstants.EMPTY.equals(map.get("involutary_amount"))){
					involutaryAmount = map.get("involutary_amount").toString();
					ctx.put("involutary_amount", Double.parseDouble(removeSpecialChar(involutaryAmount)));
				}
				if(map.get("reinsurance_amount")!=null && !HtmlConstants.EMPTY.equals(map.get("reinsurance_amount"))){
					reinsuranceAmountAmount = map.get("reinsurance_amount").toString();
					ctx.put("reinsurance_amount", Double.parseDouble(removeSpecialChar(reinsuranceAmountAmount)));
				}
				if(map.get("expense_charge")!=null && !HtmlConstants.EMPTY.equals(map.get("expense_charge"))){
					expenseChargeAmount = map.get("expense_charge").toString();
					ctx.put("expense_charge", Double.parseDouble(removeSpecialChar(expenseChargeAmount)));
				}
				ctx.put("lob_id", map.get("lob_id") != null ? map.get("lob_id") :null);
				ctx.put("product_id", map.get("product_id") != null ? map.get("product_id") :null);
				ctx.put("company_id", map.get("company_id") != null ? map.get("company_id") :null);
				ctx.put("coverage_id", map.get("coverage_id") != null ? map.get("coverage_id") :null);
				ctx.put("last_updated_by", ctx.get("user_id") != null ? ctx.get("user_id") :null);
			}
			new SetParametersForStoredProcedures().setParametersInContext(ctx, "last_updated_by,lob_id,product_id,company_id,coverage_id,loss_ratio");
			if(ctx.get("checkRecalculation") != null && !HtmlConstants.EMPTY.equals(ctx.get("checkRecalculation")) && "Y".equals(ctx.get("checkRecalculation").toString())){ 
				SqlResources.getSqlMapProcessor(ctx).update("producer_number.UpdateCCBProfitSharingSummary_Temp",ctx);
			}else{
					SqlResources.getSqlMapProcessor(ctx).update("producer_number.UpdateCCBProfitSharingSummary_p",ctx);
					}
				}
			}
	}catch(Exception ex){
		logger.debug("Exception in Save CCB Statement Data Temp : ");
		logger.error("Unable to Save CCB Statement Data Temp due to error : " + DataUtils.getExceptionStackTrace(ex));
		}
	}
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public void SaveCCBStatementDetailDataTemp(IContext ctx,int producerProfitSharingId){
		try{
		String currentWrittenPremium = null;
		String producerProfitSharingSummaryId=null;
		String priortWrittenPremium = null;
		String earnedPremiumPremium = null;
		String incurredLoss = null;
		String lossAdjustmentExpense = null;
		String commissionAmount = null;
		String pyLossAmount = null;
		String premiumTaxAmount = null;
		String involutaryAmount = null;
		String reinsuranceAmountAmount = null;
		String expenseChargeAmount = null;
		/*phase 3- recalculation*/
		String CYEvalAmount=null; 
		String PYEvalAmount=null; 
		String LossAmount=null; 
		String PayoutFactor=null;
		String LossRatio=null;
		String ContCommPay= null;
		/*phase 3- recalculation*/

		ctx.put("producer_profit_sharing_id", producerProfitSharingId);
		List requiredPremiumList= (List)ctx.get("GetIncentive_payout_details_list_01");
		if(ctx.get("checkRecalculation") != null && !HtmlConstants.EMPTY.equals(ctx.get("checkRecalculation")) && "Y".equals(ctx.get("checkRecalculation").toString())){ 
			if(requiredPremiumList != null && requiredPremiumList.size()>0){
				for(int i=0; i<requiredPremiumList.size()-1; i++){
					Map map = (Map) requiredPremiumList.get(i);
					if(map!=null){
						if(map.get("producer_profit_sharing_details_id") !=null && !HtmlConstants.EMPTY.equals(map.get("producer_profit_sharing_details_id"))){
							producerProfitSharingSummaryId=map.get("producer_profit_sharing_details_id").toString();
							ctx.put("producer_profit_sharing_details_id", Integer.parseInt(producerProfitSharingSummaryId));
						}
						if(map.get("current_written_premium") !=null && !HtmlConstants.EMPTY.equals(map.get("current_written_premium"))){
							currentWrittenPremium=map.get("current_written_premium").toString();
							ctx.put("current_written_premium", Double.parseDouble(removeSpecialChar(currentWrittenPremium)));
						}
						if(map.get("prior_written_premium")!=null && !HtmlConstants.EMPTY.equals(map.get("prior_written_premium"))){
							priortWrittenPremium = map.get("prior_written_premium").toString();
							ctx.put("prior_written_premium", Double.parseDouble(removeSpecialChar(priortWrittenPremium)));
						}
						if(ctx.get("earned_premium_"+i)!=null && !HtmlConstants.EMPTY.equals(ctx.get("earned_premium_"+i))){ 
							earnedPremiumPremium = ctx.get("earned_premium_"+i).toString();
							ctx.put("earned_premium", Double.parseDouble(removeSpecialChar(removeSpecialChar(earnedPremiumPremium))));
						}
						
						
						if(ctx.get("incurred_losses_"+i)!=null && !HtmlConstants.EMPTY.equals(ctx.get("incurred_losses_"+i))){
							incurredLoss = ctx.get("incurred_losses_"+i).toString();
							ctx.put("incurred_loss", Double.parseDouble(removeSpecialChar(incurredLoss)));
						}
						/*phase 3- recalculation*/	
						
						if(ctx.get("loss_ratio_"+i)!=null && !HtmlConstants.EMPTY.equals(ctx.get("loss_ratio_"+i))){
							LossRatio = ctx.get("loss_ratio_"+i).toString();
							ctx.put("loss_ratio", Double.parseDouble(removeSpecialChar(LossRatio)));
						}
						
						
						if(ctx.get("CY_Eval_"+i)!=null && !HtmlConstants.EMPTY.equals(ctx.get("CY_Eval_"+i))){
							CYEvalAmount = ctx.get("CY_Eval_"+i).toString();
							ctx.put("CY_Eval", Double.parseDouble(removeSpecialChar(CYEvalAmount)));
						}
						if(ctx.get("PY_Eval_"+i)!=null && !HtmlConstants.EMPTY.equals(ctx.get("PY_Eval_"+i))){
							PYEvalAmount = ctx.get("PY_Eval_"+i).toString();
							ctx.put("PY_Eval", Double.parseDouble(removeSpecialChar(PYEvalAmount)));
						}
						
						if(ctx.get("Loss_amt_Cont_Comm_"+i)!=null && !HtmlConstants.EMPTY.equals(ctx.get("Loss_amt_Cont_Comm_"+i))){
							LossAmount = ctx.get("Loss_amt_Cont_Comm_"+i).toString();
							ctx.put("Loss_amt_Cont_Comm", Double.parseDouble(removeSpecialChar(LossAmount)));
						}
						
						if(ctx.get("payout_factor_"+i)!=null && !HtmlConstants.EMPTY.equals(ctx.get("payout_factor_"+i))){
							PayoutFactor = ctx.get("payout_factor_"+i).toString();
							ctx.put("payout_factor", Double.parseDouble(removeSpecialChar(PayoutFactor)));
						}
						
						
						if(ctx.get("cont_comm_pay_"+i)!=null && !HtmlConstants.EMPTY.equals(ctx.get("cont_comm_pay_"+i))){
							ContCommPay = ctx.get("cont_comm_pay_"+i).toString();
							ctx.put("cont_comm_pay", Double.parseDouble(removeSpecialChar(ContCommPay)));
						}
					
						/*phase 3- recalculation*/
		
						if(map.get("loss_adjustment_expense")!=null && !HtmlConstants.EMPTY.equals(map.get("loss_adjustment_expense"))){
							lossAdjustmentExpense = map.get("loss_adjustment_expense").toString();
							ctx.put("loss_adjustment_expense", Double.parseDouble(removeSpecialChar(lossAdjustmentExpense)));
						}
						if(ctx.get("earned_commission_amount_"+i)!=null && !HtmlConstants.EMPTY.equals(ctx.get("earned_commission_amount_"+i))){
							commissionAmount = ctx.get("earned_commission_amount_"+i).toString();
							ctx.put("commission_amount", Double.parseDouble(removeSpecialChar(commissionAmount)));
						}
						if(map.get("premium_tax_amount")!=null && !HtmlConstants.EMPTY.equals(map.get("premium_tax_amount"))){
							premiumTaxAmount = map.get("premium_tax_amount").toString();
							ctx.put("premium_tax_amount", Double.parseDouble(removeSpecialChar(premiumTaxAmount)));
						}
						if(map.get("involutary_amount")!=null && !HtmlConstants.EMPTY.equals(map.get("involutary_amount"))){
							involutaryAmount = map.get("involutary_amount").toString();
							ctx.put("involutary_amount", Double.parseDouble(removeSpecialChar(involutaryAmount)));
						}
						if(ctx.get("py_losses_"+i)!=null && !HtmlConstants.EMPTY.equals(ctx.get("py_losses_"+i))){
							pyLossAmount = ctx.get("py_losses_"+i).toString();
							ctx.put("py_losses", Double.parseDouble(removeSpecialChar(pyLossAmount)));
						}
						if(map.get("involutary_amount")!=null && !HtmlConstants.EMPTY.equals(map.get("involutary_amount"))){
							involutaryAmount = map.get("involutary_amount").toString();
							ctx.put("involutary_amount", Double.parseDouble(removeSpecialChar(involutaryAmount)));
						}
						if(map.get("reinsurance_amount")!=null && !HtmlConstants.EMPTY.equals(map.get("reinsurance_amount"))){
							reinsuranceAmountAmount = map.get("reinsurance_amount").toString();
							ctx.put("reinsurance_amount", Double.parseDouble(removeSpecialChar(reinsuranceAmountAmount)));
						}
						if(map.get("expense_charge")!=null && !HtmlConstants.EMPTY.equals(map.get("expense_charge"))){
							expenseChargeAmount = map.get("expense_charge").toString();
							ctx.put("expense_charge", Double.parseDouble(removeSpecialChar(expenseChargeAmount)));
						}
						ctx.put("producer_profit_sharing_details_id", map.get("producer_profit_sharing_details_id") != null ? map.get("producer_profit_sharing_details_id") :null);
						ctx.put("lob_id", map.get("lob_id") != null ? map.get("lob_id") :null);
						ctx.put("product_id", map.get("product_id") != null ? map.get("product_id") :null);
						ctx.put("company_id", map.get("company_id") != null ? map.get("company_id") :null);
						ctx.put("coverage_id", map.get("coverage_id") != null ? map.get("coverage_id") :null);
						ctx.put("last_updated_by", ctx.get("user_id") != null ? ctx.get("user_id") :null);
					}
					new SetParametersForStoredProcedures().setParametersInContext(ctx, "last_updated_by,lob_id,product_id,company_id,coverage_id,loss_ratio");
					if(ctx.get("checkRecalculation") != null && !HtmlConstants.EMPTY.equals(ctx.get("checkRecalculation")) && "Y".equals(ctx.get("checkRecalculation").toString())){ 
						SqlResources.getSqlMapProcessor(ctx).update("producer_number.UpdateCCBProfitSharingDetail_Temp",ctx);
					}
					
					/*	Commented for BMIC
					else{
							SqlResources.getSqlMapProcessor(ctx).update("producer_number.UpdateCCBProfitSharingDetail_p",ctx);
							}*/
					}
				}
			}
		}catch(Exception ex){
			logger.debug("Exception in Save CCB Statement Data Temp : ");
			logger.error("Unable to Save CCB Statement Data Temp due to error : " + DataUtils.getExceptionStackTrace(ex));
			}
		}
	
	@SuppressWarnings("unchecked")
	public void updateStatementApproval(IContext ctx) {
		try{
		int producerProfitSharingId=0;
		if(ctx.get("producer_profit_sharing_id") != null && !HtmlConstants.EMPTY.equals(ctx.get("producer_profit_sharing_id"))){ 
			producerProfitSharingId = Integer.parseInt(ctx.get("producer_profit_sharing_id").toString());
			ctx.put("producer_profit_sharing_id", producerProfitSharingId);
		}
		SqlResources.getSqlMapProcessor(ctx).update("producer_number.UpdateStatementApproval",ctx);
		}catch(Exception e){
			logger.debug("Exception in Update Statement Approval : ");
			logger.error("Unable to Update Statement Approval due to error : " + DataUtils.getExceptionStackTrace(e));
		}
	}
	@SuppressWarnings("unchecked")
	public void InsertCCBStatementIntoTemp( int producerProfitSharingId, IContext ctx) {
		ctx.put("producer_profit_sharing_id", producerProfitSharingId);
		ctx.put("last_updated_by", ctx.get("user_id") != null ? ctx.get("user_id") :null);
		try{
		SqlResources.getSqlMapProcessor(ctx).insert("producer_number.SP_InsertCCBStatementIntoTemp_P",ctx);
		}catch(Exception e){
			logger.debug("Exception in Insert CCBStatement Into Temp : ");
			logger.error("Unable to Insert CCBStatement Into Temp due to error : " + DataUtils.getExceptionStackTrace(e));
		}
	}
	@SuppressWarnings("unchecked")
	public void saveCCBStatement(IContext ctx) {
		try{
		String username= null;
		String actionType="U";
		int producerProfitSharingId=0;
		if(ctx.get("user_id") != null && !HtmlConstants.EMPTY.equals(ctx.get("user_id"))) 
			username = ctx.get("user_id").toString();
			ctx.put("lastupdatedby", username);
			if(ctx.get("producer_profit_sharing_id") != null && !HtmlConstants.EMPTY.equals(ctx.get("producer_profit_sharing_id"))){ 
				producerProfitSharingId = Integer.parseInt(ctx.get("producer_profit_sharing_id").toString());
				ctx.put("producer_profit_sharing_id", producerProfitSharingId);
			}
			ctx.put("actionType", actionType);
			SqlResources.getSqlMapProcessor(ctx).update("producer_number.SP_Generate_Statement_History",ctx);
		}catch(Exception e){
			logger.debug("Exception in CCBStatementSaveBO : ");
			logger.error("Unable to process due to error : " + DataUtils.getExceptionStackTrace(e));
		}
	}
	
	@SuppressWarnings("unchecked")
	public void deleteCCBFromTemp(IContext ctx) {
		try{
		int producerProfitSharingId=0;
		if(ctx.get("producer_profit_sharing_id") != null && !HtmlConstants.EMPTY.equals(ctx.get("producer_profit_sharing_id"))){ 
			producerProfitSharingId = Integer.parseInt(ctx.get("producer_profit_sharing_id").toString());
			ctx.put("producer_profit_sharing_id", producerProfitSharingId);
		}
		SqlResources.getSqlMapProcessor(ctx).update("producer_number.SP_DeleteFromTemp_P",ctx);
		}catch(Exception e){
			logger.debug("Exception in CCBStatementSaveBO : ");
			logger.error("Unable to process due to error : " + DataUtils.getExceptionStackTrace(e));
		}
	}
	
	@SuppressWarnings({ "unused", "unchecked" })
	public void modifyProducers(IContext ctx) {
		try{

			String value1="";
			String value="";
			int eligibilityRequirement=0;
			String producerNumberValues = ctx.get("hidden_ajax_field_producer_number_id")!=null?ctx.get("hidden_ajax_field_producer_number_id").toString():"";
			String producerNumberDataValue = ctx.get("hidden_ajax_field_producer_number_id_dataValue")!=null?ctx.get("hidden_ajax_field_producer_number_id_dataValue").toString():"";
			if(producerNumberValues != null && !HtmlConstants.EMPTY.equals(producerNumberValues)){
			ctx.put("producer_in_heirarchy", convertCheckBoxValuesToXML(producerNumberValues,producerNumberDataValue));
			ctx.put("agencyCodeHierarchy", producerNumberValues);
			}else{
				ctx.put("producer_in_heirarchy",null);
				ctx.put("agencyCodeHierarchy", null);
			}
			String otherProducerNumberValues = ctx.get("hidden_ajax_field_producer_number_ids")!=null?ctx.get("hidden_ajax_field_producer_number_ids").toString():"";
			String otherProducerNumberDataValue = ctx.get("hidden_ajax_field_producer_number_ids_dataValue")!=null?ctx.get("hidden_ajax_field_producer_number_ids_dataValue").toString():"";
			if(otherProducerNumberValues != null && !HtmlConstants.EMPTY.equals(otherProducerNumberValues)){ 
				ctx.put("otherProducer_in_heirarchy", convertCheckBoxValuesToXML(otherProducerNumberValues,otherProducerNumberDataValue));
				ctx.put("agencyCodeOutSideHierarchy", otherProducerNumberValues);
			}else{
				ctx.put("otherProducer_in_heirarchy", null);
				ctx.put("agencyCodeOutSideHierarchy", null);
			}
			if(ctx.get("include_exclude_eligibility")!= null && !HtmlConstants.EMPTY.equals(ctx.get("include_exclude_eligibility"))){ 
				
				eligibilityRequirement= Integer.parseInt(ctx.get("include_exclude_eligibility").toString());
				ctx.put("include_exclude_eligibility", eligibilityRequirement);
			}else{
				ctx.put("include_exclude_eligibility", eligibilityRequirement);
			}
			if(ctx.get("producer_no") != null && !"".equals(ctx.get("producer_no"))){
				ctx.put("main_producer_number", ctx.get("producer_no").toString());
			}
			if(ctx.get("user_id") != null && !HtmlConstants.EMPTY.equals(ctx.get("user_id"))){ 
				ctx.put("last_updated_by", ctx.get("user_id").toString());
				}
			if(ctx.get("producer_number_incentive_schedule_id") != null && !HtmlConstants.EMPTY.equals(ctx.get("producer_number_incentive_schedule_id"))) {
				ctx.put("mainprdcrnum", ctx.get("producer_no") != null ? ctx.get("producer_no") : null);
				ctx.put("statesIds", String.valueOf(ctx.get("state_id")));
				ctx.put("ErrorOutput", null);
				if(ctx.get("attachmentExpired")!= null && !"".equals(ctx.get("attachmentExpired")) && "N".equals(ctx.get("attachmentExpired"))){ 
					new SetParametersForStoredProcedures().setParametersInContext(ctx, "effective_date,incentive_schedule_id,statesIds,mainprdcrnum");
					SqlResources.getSqlMapProcessor(ctx).select("incentive_schedule_lku.checkAttachIncentiveScheduleProducerNumber_p", ctx);
					if(ctx.get("returnVal")!=null && !HtmlConstants.EMPTY.equals(ctx.get("returnVal"))){
					int val = Integer.parseInt(ctx.get("returnVal").toString());
					if(val ==1){ 
						DataUtils.populateError((Context)ctx, "producerNotInHierarchyError", "producerNumberInActiveAgreementMsg");
						return;
						}
					}
				}
			}
			new SetParametersForStoredProcedures().setParametersInContext(ctx, "otherProducer_in_heirarchy,producer_in_heirarchy,last_updated_by,producer_number_incentive_schedule_id");
			SqlResources.getSqlMapProcessor(ctx).update("incentive_schedule_lku.updateCCBStatementAgencyCodes_p",ctx);
		}catch(Exception ex){
			logger.debug("Exception in Modify Producers : ");
			logger.error("Unable to Modify Producers due to error : " + DataUtils.getExceptionStackTrace(ex));
		}
	}
	private String removeSpecialChar(String value)
	{
	String strResult = "";
	if (value!= null && !"".equals(value))
		{
	    strResult = value;
	    if (strResult.contains("(") || value.contains(")"))
	    {
	        strResult = "-" + strResult;
	    }
	    if (!strResult.contains("%"))
	    {
	        strResult = strResult.replace(".00", "");
	    }
	    strResult = strResult.replace("$", "").replace("%", "").replace("(", "").replace(")", "").replace(",", "");
	}
	return strResult.trim();
	}
	private static String convertCheckBoxValuesToXML(String value,String dataValue) {
		String array[] = value.split(",");
		String dataArray[] = dataValue.split(",");
		StringBuilder xmlString = new StringBuilder("<Root>");
		for (int i = 0; i < array.length; i++) {
			if(!array[i].equals(""))
				xmlString.append("<Root1><id>").append(array[i]).append("</id>");
				xmlString.append("<id1>").append(dataArray[i]).append("</id1></Root1>");
		}
		xmlString.append("</Root>");
		if(xmlString.toString().equals("<Root></Root>")){
			return null;
		}
		return xmlString.toString();
	}
}