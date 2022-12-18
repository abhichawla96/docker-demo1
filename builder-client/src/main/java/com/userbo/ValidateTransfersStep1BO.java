package com.userbo;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.StringTokenizer;

import javax.servlet.http.HttpServletRequest;

import com.util.InetLogger;

import com.manage.managebusinessrules.rules.RuleImpl;
import com.manage.managebusinessrules.rules.RulesResources;
import com.manage.managecomponent.components.Businessobject;
import com.manage.managecomponent.components.SetParametersForStoredProcedures;
import com.manage.managemetadata.functions.commonfunctions.DataUtils;
import com.ormapping.ibatis.SqlResources;
import com.userbo.integration.SendDocForESign;
import com.util.Constants;
import com.util.Context;
import com.util.DateUtils;
import com.util.HtmlConstants;
import com.util.IContext;
import com.util.StringUtils;

public class ValidateTransfersStep1BO extends Businessobject{
	/*private static Logger logger = Logger.getLogger(ValidateTransfersStep1BO.class);*/
	private static InetLogger logger = InetLogger.getInetLogger(ValidateTransfersStep1BO.class);

	public boolean evaluate(IContext arg0) throws Exception {
		// TODO Auto-generated method stub
		return false;
	}

	public Object execute(IContext ctx) throws Exception {
		String method = ctx.get("method") != null ? ctx.get("method").toString() : null;
		if(StringUtils.isBlank(method))
			return null;

		if(method.equals("producernumbersearchfrom") || method.equals("producernumbersearchto")){
			validateProducerNumberWhileOnblur(ctx);
			return null;
		}else if(method.equals("fromsubmitsearch") || method.equals("tosubmitsearch")){
			validateProducerNumberWhileSubmitSearch(ctx);
			return null;
		}else if(method.equals("transfersStep1Next")){
			validateTransfersStep1WhileNext(ctx);
			return null;
		}else if(method.equals("transfersStep2Next")){
			validateTransfersStep2WhileNext(ctx);
			return null;
		}else if(method.equals("transfersStep1View")){
			getTransfersStep1DataForEditEvent(ctx);
		}else if(method.equals("getCommissionScheduleToBeTransfered")){
			getCommissionScheduleToBeTransfered(ctx);
		}else if(method.equals("addWholesaleTransferFilters")){
			addWholesaleTransferFilters(ctx);
		}else if(method.equals("deleteWholesaleTransferFilters")){
			deleteWholesaleTransferFilters(ctx);
		}

		/*if((ctx.get("method") != null && ctx.get("method").equals("transfersStep1View"))
				&& (ctx.get("inet_eventid") != null && ctx.get("inet_eventid").equals("edit"))){
			new SetParametersForStoredProcedures().setParametersInContext(ctx, "producer_number_transfer_id");
			List dataList = SqlResources.getSqlMapProcessor(ctx).select("producer_number_transfer.GetProducernumberStep1_p", ctx);
			if(dataList != null && dataList.size() > 0 && dataList.get(0) instanceof Map){
				Map rowMap = (Map)dataList.get(0);
				Set keysSet = rowMap.keySet();
				Iterator itr = keysSet.iterator();
				while(itr.hasNext()){
					String key = itr.next().toString();
					ctx.put(key, rowMap.get(key));
				}
			}
			return null;
		}*/

		/*if(ctx.get("method") != null && ctx.get("method").equals("transfersStep2View")){
			List finalList = new ArrayList();
			if(ctx.get("transfersStep2_list_mom_1") != null && ctx.get("transfersStep2_list_mom_1") instanceof List){
				List dataList = (List)ctx.get("transfersStep2_list_mom_1");
				Map map = new HashMap();
				for(int i=0; i<dataList.size(); i++){
					map = new HashMap();
					Map rowMap = (Map)dataList.get(i);

					map.put("profit_center_name_new", rowMap.get("profit_center_name"));
					map.put("business_segment_name_new", rowMap.get("business_segment_name"));
					map.put("company_new", rowMap.get("company"));
					map.put("state_new", rowMap.get("state"));
					map.put("effective_date_new", rowMap.get("effective_date"));
					map.put("expire_new_date_new", rowMap.get("expire_new_date"));
					map.put("expire_renew_date_new", rowMap.get("expire_renew_date"));
					map.put("validation_id_new", rowMap.get("validation_id"));
					map.put("producer_number_id_new", rowMap.get("producer_number_id"));
					map.put("is_checked_new", rowMap.get("is_checked"));
					map.put("producer_number_transfer_id_new", rowMap.get("producer_number_transfer_id"));
					finalList.add(map);
				}
			}
			ctx.remove("transfersStep2_list_mom_1");
			ctx.put("transfersStep2_list_mom_1", finalList);
			return null;
		}*/

		/*if(ctx.get("method") != null && ctx.get("method").equals("transfersStep3View")){
			ctx.put("transfersStep2_list_mom_0", ctx.get("transfersStep2_list_mom_0"));
			ctx.put("transfersStep2_list_mom_1", ctx.get("transfersStep2_list_mom_1"));
			return null;
		}*/

		return null;
	}

	private void validateProducerNumberWhileOnblur(IContext ctx) throws Exception{
		ctx.put("isSkipView", "Y");

		String producer_number_fromto = ctx.get("method").equals("producernumbersearchfrom") ? ctx.get("producer_number_from").toString() : ctx.get("producer_number_to").toString();

		HttpServletRequest req = (HttpServletRequest)ctx.get("DocumentRequest");

		ctx.put("producer_number_fromto", producer_number_fromto);
		Object obj = SqlResources.getSqlMapProcessor(ctx).findByKey("SqlStmts.UserStatementManualBoQueriescheckProducerNumberExists", ctx);
		if(obj != null && obj instanceof Map){
			Map map = (Map)obj;
			if(map.get("producerNumberRowCount") == null || map.get("producerNumberRowCount").equals(HtmlConstants.EMPTY)
					|| Integer.parseInt(map.get("producerNumberRowCount").toString()) <= 0){
				//DataUtils.populateError((Context)ctx, "pageError", "Please enter valid Producer Number");
				DataUtils.populateError((Context)ctx, "pageError", "TransferProducerNumberErrorKey");
				ctx.put("skipProcCall", "Y");
				ctx.put("isproducersearch", "N");
				ctx.put("issearch", "Y");

				if(ctx.get("method").equals("producernumbersearchfrom")){
					ctx.put("producer_number_from", null);
				}else if(ctx.get("method").equals("producernumbersearchto")){
					ctx.put("producer_number_to", null);
				}

				return;
			}
		}else{
			//DataUtils.populateError((Context)ctx, "pageError", "Please enter valid Producer Number");
			DataUtils.populateError((Context)ctx, "pageError", "TransferProducerNumberErrorKey");
			ctx.put("skipProcCall", "Y");
			ctx.put("isproducersearch", "N");
			ctx.put("issearch", "Y");

			if(ctx.get("method").equals("producernumbersearchfrom")){
				ctx.put("producer_number_from", null);
			}else if(ctx.get("method").equals("producernumbersearchto")){
				ctx.put("producer_number_to", null);
			}

			return;
		}
		if((ctx.get("producer_number_from") != null && !ctx.get("producer_number_from").equals(HtmlConstants.EMPTY)) &&
				(ctx.get("producer_number_to") != null && !ctx.get("producer_number_to").equals(HtmlConstants.EMPTY))
				&& ctx.get("producer_number_from").equals(ctx.get("producer_number_to"))){
			//DataUtils.populateError((Context)ctx, "pageError", "The Transfer From and To producer number(s) cannot be same");
			DataUtils.populateError((Context)ctx, "pageError", "TransferProducerNumber9ErrorKey");
			ctx.put("skipProcCall", "Y");
			ctx.put("isproducersearch", "N");
			ctx.put("issearch", "Y");

			if(ctx.get("method").equals("producernumbersearchfrom")){
				ctx.put("producer_number_from", null);
			}else if(ctx.get("method").equals("producernumbersearchto")){
				ctx.put("producer_number_to", null);
			}

			return;
		}

		if(ctx.get("method").equals("producernumbersearchfrom")){
			ctx.put("producer_number_submitsearch_var", producer_number_fromto);
			obj = SqlResources.getSqlMapProcessor(ctx).findByKey("SqlStmts.sqlStatementsviewgetProducerNumberData", ctx);
			if(obj == null){
				DataUtils.populateError((Context)ctx, "producer_number_from", "activeAgencyCodeErrorKey");
				ctx.put("skipProcCall", "Y");
				ctx.put("isproducersearch", "N");
				ctx.put("issearch", "Y");
				ctx.put("producer_number_from", null);

				return;
			}

			ctx.putAll((Map)obj);

			SqlResources.getSqlMapProcessor(ctx).findByKey("producer_number_transfer.CheckProducerNoSalesRepresentativeOrNot_p", ctx);
			if(ctx.get("returnVal") != null && !ctx.get("returnVal").toString().equals(HtmlConstants.EMPTY)){
				if(ctx.get("returnVal").toString().equals("1")){
					DataUtils.populateError((Context)ctx, "pageError", "BrokerCodeSalesRepErrorKey");
					ctx.put("skipProcCall", "Y");
					ctx.put("isproducersearch", "N");
					ctx.put("issearch", "Y");
					ctx.put("producer_number_from", null);

					return;
				}else if(ctx.get("returnVal").toString().equals("2")){
					DataUtils.populateError((Context)ctx, "pageError", "AssignedAdminSalesRepErrorKey");
					ctx.put("skipProcCall", "Y");
					ctx.put("isproducersearch", "N");
					ctx.put("issearch", "Y");
					ctx.put("producer_number_from", null);

					return;
				}else if(ctx.get("returnVal").toString().equals("0") && (ctx.get("selling_producer_name") == null || ctx.get("selling_producer_name").toString().equals(HtmlConstants.EMPTY))){
					DataUtils.populateError((Context)ctx, "pageError", "BrokerCodeNotInSeriesErrorKey");
					ctx.put("skipProcCall", "Y");
					ctx.put("isproducersearch", "N");
					ctx.put("issearch", "Y");
					ctx.put("producer_number_from", null);

					return;
				}
			}

			ctx.put("producer_number_from", ctx.get("selling_producer_number"));
			ctx.put("producer_number_var", null);
			ctx.put("producer_number_submitsearch_var", null);

			return;
		}else if(ctx.get("method").equals("producernumbersearchto")){
			ctx.put("producer_number_submitsearch_var", producer_number_fromto);
			obj = SqlResources.getSqlMapProcessor(ctx).findByKey("SqlStmts.sqlStatementsviewgetProducerNumberData1", ctx);
			if(obj == null){
				DataUtils.populateError((Context)ctx, "producer_number_to", "activeAgencyCodeErrorKey");
				ctx.put("skipProcCall", "Y");
				ctx.put("isproducersearch", "N");
				ctx.put("issearch", "Y");
				ctx.put("producer_number_to", null);

				return;
			}

			ctx.putAll((Map)obj);

			SqlResources.getSqlMapProcessor(ctx).findByKey("producer_number_transfer.CheckProducerNoSalesRepresentativeOrNot_p", ctx);
			if(ctx.get("returnVal") != null && !ctx.get("returnVal").toString().equals(HtmlConstants.EMPTY)){
				if(ctx.get("returnVal").toString().equals("1")){
					DataUtils.populateError((Context)ctx, "pageError", "BrokerCodeSalesRepErrorKey");
					ctx.put("skipProcCall", "Y");
					ctx.put("isproducersearch", "N");
					ctx.put("issearch", "Y");
					ctx.put("producer_number_to", null);

					return;
				}else if(ctx.get("returnVal").toString().equals("2")){
					DataUtils.populateError((Context)ctx, "pageError", "AssignedAdminSalesRepErrorKey");
					ctx.put("skipProcCall", "Y");
					ctx.put("isproducersearch", "N");
					ctx.put("issearch", "Y");
					ctx.put("producer_number_to", null);

					return;
				}else if(ctx.get("returnVal").toString().equals("0") && (ctx.get("buyer_producer_name") == null || ctx.get("buyer_producer_name").toString().equals(HtmlConstants.EMPTY))){
					DataUtils.populateError((Context)ctx, "pageError", "BrokerCodeNotInSeriesErrorKey");
					ctx.put("skipProcCall", "Y");
					ctx.put("isproducersearch", "N");
					ctx.put("issearch", "Y");
					ctx.put("producer_number_to", null);

					return;
				}
			}

			ctx.put("producer_number_to", ctx.get("buyer_producer_number"));
			ctx.put("producer_number_var", null);
			ctx.put("producer_number_submitsearch_var", null);

			return;
		}
	}

	private void validateProducerNumberWhileSubmitSearch(IContext ctx) throws Exception{
		ctx.put("isSkipView", "Y");
		ctx.remove("selling_dba");
		ctx.remove("buyer_dba");

		if(ctx.get(Constants.INET_ERRORS_LIST) != null)
			return;

		if(ctx.get(Constants.INET_PAGE) != null && ctx.get(Constants.INET_PAGE).toString().equals("bobtransfersStep1")){
			if(ctx.get("searchtype") != null){
				if(ctx.get("searchtype").toString().equals("F")){
					if(ctx.get("producer_number_from_varchar") == null || ctx.get("producer_number_from_varchar").toString().equals(HtmlConstants.EMPTY)){
						DataUtils.populateError((Context)ctx, "pageError1", "msgselectrecordforletter1ErrorKey");
						return;
					}
//Commented for BMIC
				/*	if(ctx.get("producer_number_to_varchar") != null && ctx.get("producer_number_from_varchar").toString().equals(ctx.get("producer_number_to_varchar").toString())){
						DataUtils.populateError((Context)ctx, "pageError1", "fromToAgentNumberCanNotSameErrorKey");
						return;
					}*/
				}

				if(ctx.get("searchtype").toString().equals("T")){
					if(ctx.get("producer_number_to_varchar") == null || ctx.get("producer_number_to_varchar").toString().equals(HtmlConstants.EMPTY)){
						DataUtils.populateError((Context)ctx, "pageError1", "msgselectrecordforletter1ErrorKey");
						return;
					}
					/*
					//Commented code for BMIC Specific requirement 
					if(ctx.get("producer_number_from_varchar") != null && ctx.get("producer_number_from_varchar").toString().equals(ctx.get("producer_number_to_varchar").toString())){
						DataUtils.populateError((Context)ctx, "pageError1", "fromToAgentNumberCanNotSameErrorKey");
						return;
					}*/
				}
			}

			return;
		}

		if(ctx.get(Constants.INET_PAGE) != null && ctx.get(Constants.INET_PAGE).toString().equals("bobtransfers")){
			if(ctx.get("searchtype") != null){
				if(ctx.get("searchtype").toString().equals("F")){
					if(ctx.get("producer_number_from_search_code") == null || ctx.get("producer_number_from_search_code").toString().equals(HtmlConstants.EMPTY)){
						DataUtils.populateError((Context)ctx, "pageError1", "msgselectrecordforletter1ErrorKey");
						return;
					}
				}

				if(ctx.get("searchtype").toString().equals("T")){
					if(ctx.get("producer_number_to_search_code") == null || ctx.get("producer_number_to_search_code").toString().equals(HtmlConstants.EMPTY)){
						DataUtils.populateError((Context)ctx, "pageError1", "msgselectrecordforletter1ErrorKey");
						return;
					}
				}
			}

			return;
		}

		if(ctx.get(Constants.INET_PAGE) != null && ctx.get(Constants.INET_PAGE).toString().equals("bobtransfersStep2")){
			if(ctx.get("searchtype") != null){
				if(ctx.get("searchtype").toString().equals("T")){
					if(ctx.get("producer_number_to_varchar") == null || ctx.get("producer_number_to_varchar").toString().equals(HtmlConstants.EMPTY)){
						DataUtils.populateError((Context)ctx, "pageError1", "msgselectrecordforletter1ErrorKey");
						return;
					}
				}
			}

			return;
		}

		String producer_number_fromto = null;
		HttpServletRequest req = (HttpServletRequest)ctx.get("DocumentRequest");

		if(ctx.get(Constants.INET_PAGE) != null && ctx.get(Constants.INET_PAGE).toString().equals("agencyFunctions_selectFunctionType")){
			if(ctx.get("searchtype") != null && ctx.get("searchtype").toString().equals("F")){
				if(ctx.get("toBeProcessed_producer_number") == null || ctx.get("toBeProcessed_producer_number").toString().equals(HtmlConstants.EMPTY)){
					ctx.put("toBeProcessed_producer_number_id",null);
					ctx.put("toBeProcessed_producer_number",null);
					req.removeAttribute("toBeProcessed_producer_number");
					req.removeAttribute("toBeProcessed_producer_number_id");
					DataUtils.removeValueFromSession((Context)ctx, "toBeProcessed_producer_number");
					DataUtils.removeValueFromSession((Context)ctx, "toBeProcessed_producer_number_id");
					DataUtils.populateError((Context)ctx, "toBeProcessed_producer_number", "toBeProcessedProducerNumberEmptyErrorKey");
					return;
				}

				producer_number_fromto = ctx.get("toBeProcessed_producer_number") != null ? ctx.get("toBeProcessed_producer_number").toString() : null;
				ctx.put("producer_number_fromto", producer_number_fromto);

				Object obj = SqlResources.getSqlMapProcessor(ctx).findByKey("SqlStmts.UserStatementManualBoQueriescheckProducerNumberExists", ctx);
				ctx.put("producer_number_fromto", null);
				if(obj != null && obj instanceof Map){
					Map map = (Map)obj;
					if(map.get("producerNumberRowCount") == null || map.get("producerNumberRowCount").equals(HtmlConstants.EMPTY)
							|| Integer.parseInt(map.get("producerNumberRowCount").toString()) <= 0){
						ctx.put("toBeProcessed_producer_number_id",null);
						ctx.put("toBeProcessed_producer_number",null);
						req.removeAttribute("toBeProcessed_producer_number");
						req.removeAttribute("toBeProcessed_producer_number_id");
						DataUtils.removeValueFromSession((Context)ctx, "toBeProcessed_producer_number");
						DataUtils.removeValueFromSession((Context)ctx, "toBeProcessed_producer_number_id");
						DataUtils.populateError((Context)ctx, "toBeProcessed_producer_number", "TransferProducerNumberErrorKey");
						return;
					}
				}
				else{
					ctx.put("toBeProcessed_producer_number_id",null);
					ctx.put("toBeProcessed_producer_number",null);
					req.removeAttribute("toBeProcessed_producer_number");
					req.removeAttribute("toBeProcessed_producer_number_id");
					DataUtils.removeValueFromSession((Context)ctx, "toBeProcessed_producer_number");
					DataUtils.removeValueFromSession((Context)ctx, "toBeProcessed_producer_number_id");
					DataUtils.populateError((Context)ctx, "toBeProcessed_producer_number", "TransferProducerNumberErrorKey");
					return;
				}

				obj =  SqlResources.getSqlMapProcessor(ctx).findByKey("SqlStmts.sqlStatementsviewgetProducerInOnBlurAgencyFunction", ctx);
				if(obj != null && obj instanceof Map){
					Map map = (Map)obj;
					if(map.get("toBeProcessed_producer_number_id") != null || !map.get("toBeProcessed_producer_number_id").equals(HtmlConstants.EMPTY)){
						ctx.put("toBeProcessed_producer_number_id", map.get("toBeProcessed_producer_number_id"));
					}
				}
				else{
					ctx.put("toBeProcessed_producer_number",null);
					ctx.put("toBeProcessed_producer_number_id",null);
					req.removeAttribute("toBeProcessed_producer_number");
					req.removeAttribute("toBeProcessed_producer_number_id");

					DataUtils.removeValueFromSession((Context)ctx, "toBeProcessed_producer_number");
					DataUtils.removeValueFromSession((Context)ctx, "toBeProcessed_producer_number_id");

					DataUtils.populateError((Context)ctx, "toBeProcessed_producer_number", "TransferProducerNumberErrorKey");
				}
			}
			producer_number_fromto= null;
			return;
		}

		producer_number_fromto = ctx.get("producer_number_submitsearch_var") != null ? ctx.get("producer_number_submitsearch_var").toString() : null;

		ctx.put("producer_number_fromto", producer_number_fromto);
		Object obj = SqlResources.getSqlMapProcessor(ctx).findByKey("SqlStmts.UserStatementManualBoQueriescheckProducerNumberExists", ctx);
		if(obj != null && obj instanceof Map){
			Map map = (Map)obj;
			if(map.get("producerNumberRowCount") == null || map.get("producerNumberRowCount").equals(HtmlConstants.EMPTY)
					|| Integer.parseInt(map.get("producerNumberRowCount").toString()) <= 0){
				//DataUtils.populateError((Context)ctx, "pageError", "Please enter valid Producer Number");
				DataUtils.populateError((Context)ctx, "pageError", "TransferProducerNumberErrorKey");
				ctx.put("skipProcCall", "Y");
				ctx.put("isproducersearch", "N");
				ctx.put("issearch", "Y");

				if(ctx.get("method").equals("producernumbersearchfrom")){
					ctx.put("producer_number_from", null);
				}else if(ctx.get("method").equals("producernumbersearchto")){
					ctx.put("producer_number_to", null);
				}

				return;
			}
		}else{
			//DataUtils.populateError((Context)ctx, "pageError", "Please enter valid Producer Number");
			DataUtils.populateError((Context)ctx, "pageError", "TransferProducerNumberErrorKey");
			ctx.put("skipProcCall", "Y");
			ctx.put("isproducersearch", "N");
			ctx.put("issearch", "Y");

			if(ctx.get("method").equals("producernumbersearchfrom")){
				ctx.put("producer_number_from", null);
			}else if(ctx.get("method").equals("producernumbersearchto")){
				ctx.put("producer_number_to", null);
			}

			return;
		}
		if((ctx.get("producer_number_from") != null && !ctx.get("producer_number_from").equals(HtmlConstants.EMPTY)) &&
				(ctx.get("producer_number_to") != null && !ctx.get("producer_number_to").equals(HtmlConstants.EMPTY))
				&& ctx.get("producer_number_from").equals(ctx.get("producer_number_to"))){
			//DataUtils.populateError((Context)ctx, "pageError", "The Transfer From and To producer number(s) cannot be same");
			DataUtils.populateError((Context)ctx, "pageError", "TransferProducerNumber9ErrorKey");
			ctx.put("skipProcCall", "Y");
			ctx.put("isproducersearch", "N");
			ctx.put("issearch", "Y");

			if(ctx.get("method").equals("producernumbersearchfrom")){
				ctx.put("producer_number_from", null);
			}else if(ctx.get("method").equals("producernumbersearchto")){
				ctx.put("producer_number_to", null);
			}

			return;
		}

		if(ctx.get("method").equals("fromsubmitsearch")){
			if(ctx.get("producer_number_to") != null && !ctx.get("producer_number_to").toString().equals(HtmlConstants.EMPTY)){
				if(producer_number_fromto.equals(ctx.get("producer_number_to").toString())){
					DataUtils.populateError((Context)ctx, "pageError4", "TransferProducerNumber9ErrorKey");
					//ctx.put("skipProcCall", "Y");
					ctx.put("isproducersearch", "N");
					//ctx.put("issearch", "Y");
					ctx.put("producer_number_from", null);
					ctx.put("producer_number_submitsearch_var", null);
					ctx.put("isRemoveProducerSearch", "Y");

					ctx.put("selling_producer_name", null);
					ctx.put("selling_producer_number", null);
					ctx.put("selling_producer_status_cde", null);
					ctx.put("selling_subproducer_indicator", null);
					ctx.put("selling_parent_producer_number_id", null);
					ctx.put("selling_subprdcr_effective_date", null);

					//removing values from request because in case of error values comies from request
					req.removeAttribute("producer_number_from");
					req.removeAttribute("producer_number_submitsearch_var");
					req.removeAttribute("isRemoveProducerSearch");

					req.removeAttribute("selling_producer_name");
					req.removeAttribute("selling_producer_number");
					req.removeAttribute("selling_producer_status_cde");
					req.removeAttribute("selling_subproducer_indicator");
					req.removeAttribute("selling_parent_producer_number_id");
					req.removeAttribute("selling_subprdcr_effective_date");

					DataUtils.removeValueFromSession((Context)ctx, "producer_number_from");
					DataUtils.removeValueFromSession((Context)ctx, "producer_number_submitsearch_var");
					DataUtils.removeValueFromSession((Context)ctx, "selling_producer_name");
					DataUtils.removeValueFromSession((Context)ctx, "selling_producer_number");
					DataUtils.removeValueFromSession((Context)ctx, "selling_producer_status_cde");
					DataUtils.removeValueFromSession((Context)ctx, "selling_subproducer_indicator");
					DataUtils.removeValueFromSession((Context)ctx, "selling_parent_producer_number_id");
					DataUtils.removeValueFromSession((Context)ctx, "selling_subprdcr_effective_date");
					return;
				}
			}

			ctx.putAll((Map)obj);
			obj = SqlResources.getSqlMapProcessor(ctx).findByKey("SqlStmts.sqlStatementsviewgetProducerNumberData", ctx);
			ctx.putAll((Map)obj);

			ctx.put("producer_number_from", producer_number_fromto);
			ctx.put("producer_number_var", null);
			ctx.put("producer_number_submitsearch_var", null);
			return;
		}else if(ctx.get("method").equals("tosubmitsearch")){
			if(ctx.get("producer_number_from") != null && !ctx.get("producer_number_from").toString().equals(HtmlConstants.EMPTY)){
				if(producer_number_fromto.equals(ctx.get("producer_number_from").toString())){
					DataUtils.populateError((Context)ctx, "pageError4", "TransferProducerNumber9ErrorKey");
					//ctx.put("skipProcCall", "Y");
					ctx.put("isproducersearch", "N");
					//ctx.put("issearch", "Y");
					ctx.put("producer_number_to", null);
					ctx.put("producer_number_submitsearch_var", null);
					ctx.put("isRemoveProducerSearch", "Y");

					ctx.put("buyer_producer_name", null);
					ctx.put("buyer_producer_number", null);
					ctx.put("buyer_producer_status_cde", null);
					ctx.put("buyer_subproducer_indicator", null);
					ctx.put("buyer_parent_producer_number_id", null);
					ctx.put("buyer_subprdcr_effective_date", null);

					//removing values from request because in case of error values comies from request
					req.removeAttribute("producer_number_to");
					req.removeAttribute("producer_number_submitsearch_var");
					req.removeAttribute("isRemoveProducerSearch");

					req.removeAttribute("buyer_producer_name");
					req.removeAttribute("buyer_producer_number");
					req.removeAttribute("buyer_producer_status_cde");
					req.removeAttribute("buyer_subproducer_indicator");
					req.removeAttribute("buyer_parent_producer_number_id");
					req.removeAttribute("buyer_subprdcr_effective_date");

					DataUtils.removeValueFromSession((Context)ctx, "producer_number_to");
					DataUtils.removeValueFromSession((Context)ctx, "producer_number_submitsearch_var");
					DataUtils.removeValueFromSession((Context)ctx, "buyer_producer_name");
					DataUtils.removeValueFromSession((Context)ctx, "buyer_producer_number");
					DataUtils.removeValueFromSession((Context)ctx, "buyer_producer_status_cde");
					DataUtils.removeValueFromSession((Context)ctx, "buyer_subproducer_indicator");
					DataUtils.removeValueFromSession((Context)ctx, "buyer_parent_producer_number_id");
					DataUtils.removeValueFromSession((Context)ctx, "buyer_subprdcr_effective_date");
					return;
				}
			}

			ctx.putAll((Map)obj);
			obj = SqlResources.getSqlMapProcessor(ctx).findByKey("SqlStmts.sqlStatementsviewgetProducerNumberData1", ctx);
			ctx.putAll((Map)obj);

			ctx.put("producer_number_to", producer_number_fromto);
			ctx.put("producer_number_var", null);
			ctx.put("producer_number_submitsearch_var", null);
			return;
		}
	}

	private void validateTransfersStep1WhileNext(IContext ctx) throws Exception{
		if(ctx.get("inet_eventid") != null && ctx.get("inet_eventid").equals("edit")){
			return;
		}

		if(ctx.get("transfer_type") != null && ctx.get("transfer_type").toString().equals("ITR")){
			if((ctx.get("family_number") == null || ctx.get("family_number").toString().equals(HtmlConstants.EMPTY)) &&
					(ctx.get("first_name") == null || ctx.get("first_name").toString().equals(HtmlConstants.EMPTY)) &&
					(ctx.get("policy_number") == null || ctx.get("policy_number").toString().equals(HtmlConstants.EMPTY)) &&
					(ctx.get("agent_number") == null || ctx.get("agent_number").toString().equals(HtmlConstants.EMPTY))){
				DataUtils.populateError((Context)ctx, "pageError", "enteratleastonefilterErrorKey");
				return;
			}

			if(ctx.get("family_number") != null && !ctx.get("family_number").toString().equals(HtmlConstants.EMPTY)){
				Map map = (Map)SqlResources.getSqlMapProcessor(ctx).findByKey("producer_number_transfer.checkTransferFamilyNumber", ctx);
				if(map == null || map.get("family_number_count").toString().equals("0")){
					DataUtils.populateError((Context)ctx, "family_number", "familyNumberNotExists");
				}
			}

			if(ctx.get("first_name") != null && !ctx.get("first_name").toString().equals(HtmlConstants.EMPTY)){
				Map map = (Map)SqlResources.getSqlMapProcessor(ctx).findByKey("SqlStmts.sqlStatementsviewcheckTransferInsuredName", ctx);
				if(map == null || map.get("first_name_count").toString().equals("0")){
					DataUtils.populateError((Context)ctx, "first_name", "insuredNameNotExists");
				}
			}

			if(ctx.get("policy_number") != null && !ctx.get("policy_number").toString().equals(HtmlConstants.EMPTY)){
				Map map = (Map)SqlResources.getSqlMapProcessor(ctx).findByKey("SqlStmts.sqlStatementsviewcheckTransferPolicyNumber", ctx);
				if(map == null || map.get("policy_number_count").toString().equals("0")){
					DataUtils.populateError((Context)ctx, "policy_number", "policyNumberNotExists");
				}
			}

			if(ctx.get("agent_number") != null && !ctx.get("agent_number").toString().equals(HtmlConstants.EMPTY)){
				Map map = (Map)SqlResources.getSqlMapProcessor(ctx).findByKey("SqlStmts.sqlStatementsviewcheckTransferAgentNumber", ctx);
				if(map == null || map.get("agent_number_count").toString().equals("0")){
					DataUtils.populateError((Context)ctx, "agent_number", "agentNumberNotExists");
				}
			}

			return;
		}

		if(ctx.get("transfer_type") != null && ctx.get("transfer_type").toString().equals("WTR")){
			String producer_number_from_varchar = ctx.get("producer_number_from_varchar").toString();
			//ctx.put("message_description", DataUtils.getMessage((Context)ctx, "fromagentNumberNotExistsErrorKey"));

			ctx.put("producer_number", producer_number_from_varchar);
			SqlResources.getSqlMapProcessor(ctx).findByKey("producer_number_transfer.validateBOBTransfersData_p", ctx);
			if(ctx.get("errorMsg") != null && ctx.get("errorMsg").toString().equals("1")){
				DataUtils.populateError((Context)ctx, "producer_number_from_varchar", DataUtils.getMessage((Context)ctx, "fromagentNumberNotExistsErrorKey"));
			}

			String producer_number_to_varchar = ctx.get("producer_number_to_varchar").toString();
			//ctx.put("message_description", DataUtils.getMessage((Context)ctx, "agentNumberNotExistsErrorKey"));

			ctx.put("producer_number", producer_number_to_varchar);

			if(ctx.get("producer_number") != null && !ctx.get("producer_number").toString().equals(HtmlConstants.EMPTY)
					&& ctx.get(HtmlConstants.INET_METHOD) != null && ctx.get(HtmlConstants.INET_METHOD).toString().equals("next"))
			{
				ctx.put("agent_number", producer_number_from_varchar);
			}
			SqlResources.getSqlMapProcessor(ctx).findByKey("producer_number_transfer.validateBOBTransfersData_p", ctx);
			if(ctx.get("errorMsg") != null && ctx.get("errorMsg").toString().equals("1")){
				DataUtils.populateError((Context)ctx, "producer_number_to_varchar", DataUtils.getMessage((Context)ctx, "agentNumberNotExistsErrorKey"));
			}
//Commented code for BMIC specific changes
			/*if(ctx.get("producer_number_from_varchar") != null && ctx.get("producer_number_to_varchar") != null &&
					ctx.get("producer_number_from_varchar").toString().equalsIgnoreCase(ctx.get("producer_number_to_varchar").toString())){
				DataUtils.populateError((Context)ctx, "pageError", "fromToAgentNumberCanNotSameErrorKey");
			}*/

			return;
		}

		boolean foundError = false;
		if(ctx.get("transfer_effective_date") == null || ctx.get("transfer_effective_date").equals("")){
			//DataUtils.populateError((Context)ctx, "transfer_effective_date", "Please select Transfer effective date");
			DataUtils.populateError((Context)ctx, "transfer_effective_date", "TransferEffDateErrorKey");
			foundError = true;
		}else{
			if(!ProducerValidationDetailBO.validateDate(ctx.get("transfer_effective_date").toString())){
				DataUtils.populateError((Context)ctx, "transfer_effective_date", "Invalid date");
				foundError = true;
			}
		}

		if(ctx.get("producer_number_from") == null || ctx.get("producer_number_from").equals("")){
			//DataUtils.populateError((Context)ctx, "producer_number_from", "Please enter From Producer Number");
			DataUtils.populateError((Context)ctx, "producer_number_from", "TransferFromProducerNumberErrorKey");
			foundError = true;
		}
		if(ctx.get("producer_number_to") == null || ctx.get("producer_number_to").equals("")){
			//DataUtils.populateError((Context)ctx, "producer_number_to", "Please enter To Producer Number");
			DataUtils.populateError((Context)ctx, "producer_number_to", "TransferToProducerNumberErrorKey");
			foundError = true;
		}

		if(ctx.get("inet_eventid") == null || !ctx.get("inet_eventid").toString().equals("edit")){
			if(ctx.get("isMNACommentsMandatory") != null && ctx.get("isMNACommentsMandatory").toString().equals("Y")){
				if(ctx.get("transfer_comments") == null || ctx.get("transfer_comments").toString().equals(HtmlConstants.EMPTY)){
					DataUtils.populateError((Context)ctx, "transfer_comments", "CommentsErrorKey");
					foundError = true;
				}
			}
		}
//		if(ctx.get("producer_number_to") != null && !ctx.get("producer_number_to").equals("")){
//			Map map = (HashMap)SqlResources.getSqlMapProcessor(ctx).findByKey("producer_number_transfer.checkToProducerNumberIsSubProducer_p", ctx);
//			if(map != null && !map.isEmpty()){
//				DataUtils.populateError((Context)ctx, "pageError", "TransferToProducerNumberCannotSubProducerErrorKey");
//				foundError = true;
//			}
//		}
		if(foundError)
			return;

		if(ctx.get("selling_producer_number") == null ||
				ctx.get("selling_producer_number").equals("")){
			//DataUtils.populateError((Context)ctx, "pageError", "Please provide detail for producer/sub-producer number in From section");
			DataUtils.populateError((Context)ctx, "pageError", "TransferFromToProducerNumberErrorKey");
			return;
		}
		if(ctx.get("buyer_producer_number") == null ||
				ctx.get("buyer_producer_number").equals("")){
			//DataUtils.populateError((Context)ctx, "pageError", "Please provide detail for producer/sub-producer number in To section");
			DataUtils.populateError((Context)ctx, "pageError", "TransferToFromProducerNumberErrorKey");
			return;
		}

		if((ctx.get("transfersFrom") != null && !ctx.get("transfersFrom").equals("")) &&
				(ctx.get("transfersTo") != null && !ctx.get("transfersTo").equals(""))){
			if(Integer.parseInt(ctx.get("transfersFrom").toString()) < Integer.parseInt(ctx.get("transfersTo").toString())){
				//DataUtils.populateError((Context)ctx, "pageError", "Cannot select a Producer to Sub-producer transfer so please change selection in the From or To Type radio boxes");
				DataUtils.populateError((Context)ctx, "pageError", "TransferProducerNumber1ErrorKey");
				return;
			}
		}

		if(ctx.get("selling_producer_status_cde") != null &&
				!ctx.get("selling_producer_status_cde").equals("Active")){
			if(ctx.get("transfersFrom") != null && ctx.get("transfersFrom").equals("1")){
				//DataUtils.populateError((Context)ctx, "pageError", "Cannot create a transfer for a closed/pending Producer Number. Please select another From Producer Number");
				DataUtils.populateError((Context)ctx, "pageError", "TransferProducerNumber2ErrorKey");
				return;
			}else if(ctx.get("transfersFrom") != null && !ctx.get("transfersFrom").equals("1")){
				//DataUtils.populateError((Context)ctx, "pageError", "Cannot create a transfer for a closed/pending Sub-producer Number. Please select another From Sub-producer Number");
				DataUtils.populateError((Context)ctx, "pageError", "TransferProducerNumber3ErrorKey");
				return;
			}
		}

		if(ctx.get("buyer_producer_status_cde") != null &&
				!ctx.get("buyer_producer_status_cde").equals("Active")){
			if(ctx.get("transfersTo") != null && ctx.get("transfersTo").equals("2")){
				//DataUtils.populateError((Context)ctx, "pageError", "Cannot create a transfer for a closed/pending Sub-producer Number. Please select another To Sub-producer Number");
				DataUtils.populateError((Context)ctx, "pageError", "TransferProducerNumber4ErrorKey");
				return;
			}else if(ctx.get("transfersTo") != null && !ctx.get("transfersTo").equals("2")){
				//DataUtils.populateError((Context)ctx, "pageError", "Cannot create a transfer for a closed/pending Producer Number. Please select another To Producer Number");
				DataUtils.populateError((Context)ctx, "pageError", "TransferProducerNumber5ErrorKey");
				return;
			}
		}

		//Checking for Effective date with Transfers effective date
		Object probobj = SqlResources.getSqlMapProcessor(ctx).findByKey("SqlStmts.UserStatementManualBoQueriesgetProducerNumberDetail1", ctx);
		if(probobj != null && probobj instanceof Map){
			Map map = (Map)probobj;
			ctx.put("producer_number_id", map.get("producer_number_from_id").toString());
			probobj = SqlResources.getSqlMapProcessor(ctx).findByKey("SqlStmts.UserStatementManualBoQueriesgetProducerValidationsEffDate", ctx);
			if(probobj != null && probobj instanceof Map){
				Map mapObj = (Map)probobj;
				if(mapObj.get("subprdcr_effective_date") != null && !mapObj.get("subprdcr_effective_date").equals("")){
					if(DateUtils.isDateBefore(ctx.get("transfer_effective_date"), mapObj.get("subprdcr_effective_date"))){
						//DataUtils.populateError((Context)ctx, "pageError", "Transfer Effective Date cannot be less then Effective Date");
						DataUtils.populateError((Context)ctx, "pageError", "TransferEffectiveDateErrorKey");
						return;
					}
				}
				if(mapObj.get("subprdcr_expire_renew_date") != null && !mapObj.get("subprdcr_expire_renew_date").equals("")){
					if(DateUtils.isDateAfter(ctx.get("transfer_effective_date"), mapObj.get("subprdcr_expire_renew_date"))){
						//DataUtils.populateError((Context)ctx, "pageError", "Transfer Effective Date cannot be greater then Expire Renew Date");
						DataUtils.populateError((Context)ctx, "pageError", "TransferEffectiveDate1ErrorKey");
						return;
					}
				}
			}
		}

		if((ctx.get("transfersFrom") != null && !ctx.get("transfersFrom").equals("")) &&
				(ctx.get("transfersTo") != null && !ctx.get("transfersTo").equals(""))){
			if((ctx.get("transfersFrom").equals(ctx.get("transfersTo").toString())) &&
					ctx.get("transfersTo").equals("1")){
				Object obj = SqlResources.getSqlMapProcessor(ctx).findByKey("SqlStmts.UserStatementManualBoQueriesgetProducerNumberDetail1", ctx);
				if(obj != null && obj instanceof Map){
					Map map = (Map)obj;
					ctx.put("producer_number_from_id", map.get("producer_number_from_id").toString());
				}

				Object obj1 = SqlResources.getSqlMapProcessor(ctx).findByKey("SqlStmts.sqlStatementsviewgetCountForPrdcrNumValidations", ctx);
				if(obj1 != null && obj1 instanceof Map){
					Map map = (Map)obj1;
					if(map.get("prdcrNumValidationsCount") != null &&
							Integer.parseInt(map.get("prdcrNumValidationsCount").toString())<=0){
						//DataUtils.populateError((Context)ctx, "pageError", "There is no active product validation to transfer for the From Producer Number. Please select another From Producer Number");
						DataUtils.populateError((Context)ctx, "pageError", "TransferProducerNumber6ErrorKey");
						return;
					}
				}

			}
		}

		//Checking for Probation Effective date with Transfers effective date
		Object obj = SqlResources.getSqlMapProcessor(ctx).findByKey("SqlStmts.UserStatementManualBoQueriesgetMaxProbationDate", ctx);
		if(obj != null && obj instanceof Map){
			Map map = (Map)obj;
			if(map.get("maxProbEffectiveDate") != null &&
					DateUtils.isDateAfter(map.get("maxProbEffectiveDate"), ctx.get("transfer_effective_date"))){
				//DataUtils.populateError((Context)ctx, "pageError", "Please verify the Transfer Effective Date because it is less than the Effective Date of Active Probation Associated");
				DataUtils.populateError((Context)ctx, "pageError", "TransferProducerNumber7ErrorKey");
				return;
			}
		}

		if((ctx.get("transfersFrom") != null && !ctx.get("transfersFrom").equals("")) &&
				(ctx.get("transfersTo") != null && !ctx.get("transfersTo").equals(""))){
			if((ctx.get("transfersFrom").equals(ctx.get("transfersTo").toString())) &&
					ctx.get("transfersTo").equals("2")){
				if(ctx.get("buyer_subprdcr_effective_date") != null && !ctx.get("buyer_subprdcr_effective_date").equals("")){
					if(DateUtils.isDateAfter(ctx.get("buyer_subprdcr_effective_date"), ctx.get("transfer_effective_date"))){
						//DataUtils.populateError((Context)ctx, "pageError", "The Effective Date of To Sub-producer Number is not less than or equal to the Transfer Effective Date. Please change the Transfer Effective Date or select a different To Sub-producer Number");
						DataUtils.populateError((Context)ctx, "pageError", "TransferProducerNumber8ErrorKey");
						return;
					}
				}
				Context newCtx = new Context();
				newCtx.setProject(ctx.getProject());
				newCtx.put("producer_number_from", ctx.get("producer_number_from"));
				newCtx.put("producer_number_to", ctx.get("producer_number_to"));
				newCtx.put("transfer_type", "STOS");

				newCtx.put("producer_number", newCtx.get("producer_number_from"));
				Object obj10 = SqlResources.getSqlMapProcessor(newCtx).findByKey("SqlStmts.sqlStatementsviewgetProducerNumberIDFromCode", newCtx);
				if(obj10 != null && obj10 instanceof Map){
					Map map = (Map)obj10;
					newCtx.put("producer_number_from", map.get("producer_number_from_id").toString());
				}
				newCtx.put("producer_number", newCtx.get("producer_number_to"));
				Object obj11 = SqlResources.getSqlMapProcessor(newCtx).findByKey("SqlStmts.sqlStatementsviewgetProducerNumberIDFromCode", newCtx);
				if(obj11 != null && obj11 instanceof Map){
					Map map = (Map)obj11;
					newCtx.put("producer_number_to", map.get("producer_number_from_id").toString());
				}

				new SetParametersForStoredProcedures().setParametersInContext(newCtx, "producer_number_from,producer_number_to,transfer_type");
				Object obj1 = SqlResources.getSqlMapProcessor(ctx).findByKey("prdcr_probation.producernovalidationsmatchedornot_p", newCtx);
				if(obj1 != null && obj1 instanceof Map){
					Map map = (Map)obj1;
					if(map.get("") != null && Integer.parseInt(map.get("").toString())<=0){
						newCtx.put("transfer_type", "STOP");
						new SetParametersForStoredProcedures().setParametersInContext(newCtx, "producer_number_from,producer_number_to,transfer_type");
						Object obj2 = SqlResources.getSqlMapProcessor(ctx).select("prdcr_probation.fromproducernovalidationsunmatched_p", newCtx);
						ctx.put("isUnmatchedPopUp", "Y");
						ctx.put("transfer_type", "STOP");
						ctx.put("transfersStep1_list_1", (List)obj2);
						return;
					}else{
						ctx.put("transfer_type", "STOS");
						new SetParametersForStoredProcedures().setParametersInContext(newCtx, "producer_number_from,producer_number_to,transfer_type");
						Object obj2 = SqlResources.getSqlMapProcessor(ctx).select("prdcr_probation.fromproducernovalidationsunmatched_p", newCtx);
						ctx.put("isConfirmationPopUp", "Y");
						ctx.put("transfersStep1_list_2", (List)obj2);
						return;
					}
				}
			}

			if(Integer.parseInt(ctx.get("transfersFrom").toString()) >
				Integer.parseInt(ctx.get("transfersTo").toString())){
				Context newCtx = new Context();
				newCtx.setProject(ctx.getProject());
				newCtx.put("producer_number_from", ctx.get("producer_number_from"));
				newCtx.put("producer_number_to", ctx.get("producer_number_to"));
				newCtx.put("transfer_type", "STOP");

				newCtx.put("producer_number", newCtx.get("producer_number_from"));
				Object obj10 = SqlResources.getSqlMapProcessor(newCtx).findByKey("SqlStmts.sqlStatementsviewgetProducerNumberIDFromCode", newCtx);
				if(obj10 != null && obj10 instanceof Map){
					Map map = (Map)obj10;
					newCtx.put("producer_number_from", map.get("producer_number_from_id").toString());
				}
				newCtx.put("producer_number", newCtx.get("producer_number_to"));
				Object obj11 = SqlResources.getSqlMapProcessor(newCtx).findByKey("SqlStmts.sqlStatementsviewgetProducerNumberIDFromCode", newCtx);
				if(obj11 != null && obj11 instanceof Map){
					Map map = (Map)obj11;
					newCtx.put("producer_number_to", map.get("producer_number_from_id").toString());
				}
				new SetParametersForStoredProcedures().setParametersInContext(newCtx, "producer_number_from,producer_number_to,transfer_type");
				Object obj1 = SqlResources.getSqlMapProcessor(ctx).findByKey("prdcr_probation.producernovalidationsmatchedornot_p", newCtx);
				if(obj1 != null && obj1 instanceof Map){
					Map map = (Map)obj1;
					if(map.get("") != null && Integer.parseInt(map.get("").toString())<=0){
						newCtx.put("transfer_type", "STOP");
						new SetParametersForStoredProcedures().setParametersInContext(newCtx, "producer_number_from,producer_number_to,transfer_type");
						Object obj2 = SqlResources.getSqlMapProcessor(ctx).select("prdcr_probation.fromproducernovalidationsunmatched_p", newCtx);
						ctx.put("isUnmatchedPopUp", "Y");
						ctx.put("transfer_type", "STOP");
						ctx.put("transfersStep1_list_1", (List)obj2);
						return;
					}else{
						ctx.put("transfer_type", "STOP");
						ctx.put("isConfirmationPopUp", "Y");
						return;
					}
				}
			}
		}
	}

	//Method created to get data for transfersStep3 page
	private void validateTransfersStep2WhileNext(IContext ctx) throws Exception{
		int selectedPoliciesCount=0;

		List iterateList1 = (List)ctx.get("transfersStep2_list_mom_2");
		List finalList1 = new ArrayList();
		StringBuilder policyNumberCSVBuilder = new StringBuilder();
		if(iterateList1!=null  && iterateList1.size() > 0){
			for(int i=0; i<iterateList1.size(); i++){
				Map map = (Map)iterateList1.get(i);

				if(ctx.get("is_checked_"+i) != null && !ctx.get("is_checked_"+i).toString().equals(HtmlConstants.EMPTY) && ctx.get("is_checked_"+i).equals("Y"))
				{
					selectedPoliciesCount++;
					finalList1.add(map);
					policyNumberCSVBuilder.append(map.get("Policy_Number")).append(",");
					
				}
				ctx.put("transfersStep3_list_mom_2", finalList1);
				
			}		
		}
		
		
		
		
		if(ctx.get("transfer_type") != null && ctx.get("transfer_type").toString().equals("ITR")){
			if(ctx.get("inet_eventid") != null && ctx.get("inet_eventid").equals("edit")){
				
				String validations = (ctx.get("validations") != null && !ctx.get("validations").toString().equals(HtmlConstants.EMPTY)) ? ctx.get("validations").toString() : null;
			
				List finalList = new ArrayList();
				List list = (List)ctx.get("transfersStep2_list_mom_2");
				for(int i=0; i<list.size(); i++){
					Map map = (Map)list.get(i);

					//if(map.get("Policy_Number") != null && (","+validations+",").contains(","+map.get("Policy_Number").toString()+",")){
						finalList.add(map);
					//}
					
				}

				ctx.put("transfersStep3_list_mom_2", finalList);

				return;
			}else if(selectedPoliciesCount!= 0){
				ctx.put("validations",policyNumberCSVBuilder.toString().substring(0, policyNumberCSVBuilder.toString().length() - 1));
			}

			String producer_number_to_varchar = ctx.get("producer_number_to_varchar").toString();
			//ctx.put("message_description", DataUtils.getMessage((Context)ctx, "agentNumberNotExistsErrorKey"));

			ctx.put("producer_number", producer_number_to_varchar);
			SqlResources.getSqlMapProcessor(ctx).findByKey("producer_number_transfer.validateBOBTransfersData_p", ctx);
			if(ctx.get("errorMsg") != null && !ctx.get("errorMsg").toString().equals(HtmlConstants.EMPTY)){
				if(ctx.get("errorMsg").toString().equals("1"))
					DataUtils.populateError((Context)ctx, "producer_number_to_varchar", DataUtils.getMessage((Context)ctx, "agentNumberNotExistsErrorKey"));
				else if(ctx.get("errorMsg").toString().equals("2"))
					DataUtils.populateError((Context)ctx, "pageError", DataUtils.getMessage((Context)ctx, "policyNumberAlreadyScheduledErrorKey"));

				return;
			}

			if((ctx.get("inet_eventid") != null && ctx.get("inet_eventid").equals("edit")))
			{
				if(ctx.get("transfersStep2_list_mom_2") == null || (ctx.get("validations") == null || ctx.get("validations").toString().equals(HtmlConstants.EMPTY))){
					DataUtils.populateError((Context)ctx, "pageError", DataUtils.getMessage((Context)ctx, "selectAtLeastOnePolicyErrorKey"));
					return;
				}
				
			}
			else
			{
				/*ctx.get("transfersStep2_list_mom_2") == null  &&*/
				if(ctx.get("transfersStep2_list_mom_2") == null || selectedPoliciesCount ==0){
					DataUtils.populateError((Context)ctx, "pageError", DataUtils.getMessage((Context)ctx, "selectAtLeastOnePolicyErrorKey"));
					return;
				}
			}

			String validations = (ctx.get("validations") != null && !ctx.get("validations").toString().equals(HtmlConstants.EMPTY)) ? ctx.get("validations").toString() : null;
					

			String producer_number_from_varchar = null;
			// Added for BMIC
			String sub_producer_number_from_varchar = null;
			String sub_producer_number_to_varchar =(ctx.get("bobtransfersStep2_dest_producer_code")!=null && !ctx.get("bobtransfersStep2_dest_producer_code").toString().equals(HtmlConstants.EMPTY)) ? ctx.get("bobtransfersStep2_dest_producer_code").toString() : null;
			// Ended for BMIC
			List finalList = new ArrayList();
			List list = (List)ctx.get("transfersStep2_list_mom_2");
			for(int i=0; i<list.size(); i++){
				Map map = (Map)list.get(i);

				if(map.get("Policy_Number") != null && (","+validations+",").contains(","+map.get("Policy_Number").toString()+",")){
					if(map.get("agent_number") != null && !map.get("agent_number").toString().equals(HtmlConstants.EMPTY)){
						if(producer_number_from_varchar == null){
							producer_number_from_varchar = map.get("agent_number").toString();
							sub_producer_number_from_varchar =  (map.get("sub_producer_code_person_id") != null && !map.get("sub_producer_code_person_id").toString().equals(HtmlConstants.EMPTY)) ? map.get("sub_producer_code_person_id").toString() : null; // Added for BMIC
							
						}else{
							if(!(","+producer_number_from_varchar+",").contains(","+map.get("agent_number").toString()+",")){
								DataUtils.populateError((Context)ctx, "pageError", DataUtils.getMessage((Context)ctx, "policiesOfAgentNumberNotTransferredErrorKey"));
								return;
							}
						}
					}

					finalList.add(map);
				}
			}
           if(producer_number_from_varchar!=null){
        	   if(producer_number_from_varchar.equalsIgnoreCase(producer_number_to_varchar)
        			    && sub_producer_number_to_varchar.equalsIgnoreCase(sub_producer_number_from_varchar) ){ // Added for BMIC
   				DataUtils.populateError((Context)ctx, "pageError", DataUtils.getMessage((Context)ctx, "fromToAgentNumberCanNotSameErrorKey"));
   				return;
   			}
           }
			
            if(finalList.size()!=0){
            	ctx.put("transfersStep3_list_mom_2", finalList);
            }
			
			ctx.put("producer_number_from_varchar", producer_number_from_varchar);

			return;
		}

		if(ctx.get("inet_eventid") != null && ctx.get("inet_eventid").equals("edit")){
			return;
		}

		List transfersFromList = new ArrayList();
		List transfersToList = new ArrayList();

		if(ctx.get("transfersStep2_list_mom_0") != null && ctx.get("transfersStep2_list_mom_0") instanceof List){
			transfersFromList = (List)ctx.get("transfersStep2_list_mom_0");
		}
		if(ctx.get("transfersStep2_list_mom_1") != null && ctx.get("transfersStep2_list_mom_1") instanceof List){
			transfersToList = (List)ctx.get("transfersStep2_list_mom_1");
		}

		boolean isAnyProductValidationChanged = false;
		String selling_subproducer_indicator_flag=ctx.get("selling_subproducer_indicator_flag")!=null?ctx.get("selling_subproducer_indicator_flag").toString():"";
		String buyer_subproducer_indicator_flag=ctx.get("buyer_subproducer_indicator_flag")!=null?ctx.get("buyer_subproducer_indicator_flag").toString():"";

		if(transfersFromList != null && transfersFromList.size() > 0){
			int count = 0;
			List newFromList = new ArrayList();
			String validationsId = "";
			String validationsIdForCommAttachment = "";
			boolean noCheckBox=true;
			for(int i=0; i<transfersFromList.size(); i++){
				Map rowMap = (Map)transfersFromList.get(i);
				if(rowMap.get("active")!=null){
					int active=Integer.parseInt(rowMap.get("active").toString());

					if(active==1)
						noCheckBox=false;
				}
				if(ctx.get("is_checked_"+i) != null){

					if(ctx.get("transfer_effective_date") != null && !ctx.get("transfer_effective_date").equals("")){
						String transferEffectiveDate = ctx.get("transfer_effective_date").toString();
						String effectiveDate = rowMap.get("effective_date") != null ? rowMap.get("effective_date").toString() : "";
						if(DateUtils.isDateAfter(effectiveDate, transferEffectiveDate)){
							//DataUtils.populateError((Context)ctx, "pageError", "For one or more of the product validations, the Effective Date is greater than the Transfer Effective Date. Please change the product validations selection(s) in the From Producer Number or Transfer Effective Date");
							DataUtils.populateError((Context)ctx, "pageError", "TransferProducerNumber10ErrorKey");
							return;
						}

						//String keys = "profit_center_name|business_segment_name|company|state";
						String keys = null;
						String values = null;
						try{
							RuleImpl ruleImpl = RulesResources.getInstance(ctx).findRule("ProducerOneRule.isNotHideProfitCenter");
							if(ruleImpl != null && ruleImpl.evaluate((Context)ctx, null)){
								keys = "profit_center_name";
							}
							ruleImpl = RulesResources.getInstance(ctx).findRule("ProducerOneRule.isShowBusinessSgementNotProfitCenterInProductValidation");
							if(ruleImpl != null && ruleImpl.evaluate((Context)ctx, null)){
								keys = keys != null ? keys + "|business_segment_name" : "business_segment_name";
							}
							if(ctx.get("isShowCarrierCompanyInProductValidation") != null && !ctx.get("isShowCarrierCompanyInProductValidation").toString().equals("N")){
								keys = keys != null ? keys + "|company" : "company";
							}
							if(ctx.get("isShowOperatingCompanyInProductValidation") != null && !ctx.get("isShowOperatingCompanyInProductValidation").toString().equals("N")){
								keys = keys != null ? keys + "|operating_company" : "operating_company";
							}
							if(ctx.get("isShowUnderwWriterCompanyInProductValidation") != null && !ctx.get("isShowUnderwWriterCompanyInProductValidation").toString().equals("N")){
								keys = keys != null ? keys + "|company" : "company";
							}
							if(ctx.get("isShowStateInProductValidation") != null && !ctx.get("isShowStateInProductValidation").toString().equals("N")){
								keys = keys != null ? keys + "|state" : "state";
							}
							ruleImpl = RulesResources.getInstance(ctx).findRule("ProducerOneRule.isShowLobInProductValidation");
							if(ruleImpl != null && ruleImpl.evaluate((Context)ctx, null)){
								keys = keys != null ? keys + "|lob" : "lob";
							}
							if(ctx.get("isShowUnderwriterInProductValidation") != null && !ctx.get("isShowUnderwriterInProductValidation").toString().equals("N")){
								keys = keys != null ? keys + "|team" : "team";
							}
							if(ctx.get("isShowRegionInProductValidation") != null && !ctx.get("isShowRegionInProductValidation").toString().equals("N")){
								keys = keys != null ? keys + "|team" : "team";
							}
							if(ctx.get("isShowTierInProductValidation") != null && !ctx.get("isShowTierInProductValidation").toString().equals("N")){
								keys = keys != null ? keys + "|tier" : "tier";
							}
							if(ctx.get("isShowCSRInProductValidation") != null && !ctx.get("isShowCSRInProductValidation").toString().equals("N")){
								keys = keys != null ? keys + "|csrNames" : "csrNames";
							}
							if(ctx.get("isShowPPRInProductValidation") != null && !ctx.get("isShowPPRInProductValidation").toString().equals("N")){
								keys = keys != null ? keys + "|pprNames" : "pprNames";
							}
							if(ctx.get("isShowLAUInProductValidation") != null && !ctx.get("isShowLAUInProductValidation").toString().equals("N")){
								keys = keys != null ? keys + "|lauNames" : "lauNames";
							}
							if(ctx.get("isShowRNBDCInProductValidation") != null && !ctx.get("isShowRNBDCInProductValidation").toString().equals("N")){
								keys = keys != null ? keys + "|rnbdcNames" : "rnbdcNames";
							}
							if(ctx.get("isShowCSSInProductValidation") != null && !ctx.get("isShowCSSInProductValidation").toString().equals("N")){
								keys = keys != null ? keys + "|cssNames" : "cssNames";
							}
							if(ctx.get("isShowCommissionCodesInProductValidation") != null && !ctx.get("isShowCommissionCodesInProductValidation").toString().equals("N")){
								keys = keys != null ? keys + "|commission_code" : "commission_code";
							}

							if(keys != null)
								keys = "|" + keys + "|";

							if(keys != null){
								StringTokenizer tokens = new StringTokenizer(keys, "|");
								while(tokens.hasMoreTokens()){
									String token = tokens.nextToken();

									if(values == null){
										values = "" + rowMap.get(token);
									}else{
										values = values + "|" + rowMap.get(token);
									}
								}

								if(values != null)
									values = "|" + values + "|";
							}
						}catch (Exception e) {
							// TODO: handle exception
						}

						//String values = rowMap.get("profit_center_name") +"|"+ rowMap.get("business_segment_name") + "|" + rowMap.get("company") +"|"+ rowMap.get("state");

						List keysList = DataUtils.getTokenizedList(keys);
						List valuesList = DataUtils.getTokenizedList(values);

						if(transfersToList != null){
							Map map = DataUtils.getLookupDataMapByKey(transfersToList, keysList, valuesList);
							if(map != null){//if selling agency code product validation exists at buyer agency code
								boolean isAnyActiveValidationFoundAtBuyerAC = false;
								for(int j=0; j<transfersToList.size(); j++){
									Map toMap = (Map)transfersToList.get(j);

									toMap = DataUtils.getExactMap(toMap, keysList, valuesList);
									if(toMap != null && (toMap.get("expire_new_date") == null || toMap.get("expire_renew_date") == null)){
										isAnyActiveValidationFoundAtBuyerAC = true;
										break;
									}
								}

								//if any active product validation found at buyer agency code then no need to move that product validation
								if(isAnyActiveValidationFoundAtBuyerAC){
									rowMap.put("is_checked", "1");
									Object expire_new_date = rowMap.get("expire_new_date");
									Object expire_renew_date = rowMap.get("expire_renew_date");

									if(rowMap.get("expire_new_date") == null || rowMap.get("expire_new_date").equals("")){
										rowMap.put("expire_new_date", transferEffectiveDate);
									}
									if(rowMap.get("expire_renew_date") == null || rowMap.get("expire_renew_date").equals("")){
										rowMap.put("expire_renew_date", transferEffectiveDate);
									}

									map.put("is_checked", "0");
									validationsId = validationsId + "," + rowMap.get("validation_id");
								}else{
									//if validation is closed at buyer agency code
									if(!isAnyActiveValidationFoundAtBuyerAC && (map.get("expire_new_date") != null && map.get("expire_renew_date") != null)){
										if(!isAnyProductValidationChanged)
											isAnyProductValidationChanged = true;

										rowMap.put("is_checked", "1");
										Object expire_new_date = rowMap.get("expire_new_date");
										Object expire_renew_date = rowMap.get("expire_renew_date");

										if(rowMap.get("expire_new_date") == null || rowMap.get("expire_new_date").equals("")){
											rowMap.put("expire_new_date", transferEffectiveDate);
										}
										if(rowMap.get("expire_renew_date") == null || rowMap.get("expire_renew_date").equals("")){
											rowMap.put("expire_renew_date", transferEffectiveDate);
										}

										map = new HashMap();
										map.putAll(rowMap);
										map.put("effective_date", transferEffectiveDate);
										map.put("expire_new_date", expire_new_date);
										map.put("expire_renew_date", expire_renew_date);
										map.put("is_checked", "1");

										transfersToList.add(map);
										validationsId = validationsId + "," + rowMap.get("validation_id");
									}else{
										rowMap.put("is_checked", "1");
										Object expire_new_date = rowMap.get("expire_new_date");
										Object expire_renew_date = rowMap.get("expire_renew_date");

										if(rowMap.get("expire_new_date") == null || rowMap.get("expire_new_date").equals("")){
											rowMap.put("expire_new_date", transferEffectiveDate);
										}
										if(rowMap.get("expire_renew_date") == null || rowMap.get("expire_renew_date").equals("")){
											rowMap.put("expire_renew_date", transferEffectiveDate);
										}

										map.put("is_checked", "0");
										validationsId = validationsId + "," + rowMap.get("validation_id");
									}
								}
							}else{
								if(!isAnyProductValidationChanged)
									isAnyProductValidationChanged = true;

								rowMap.put("is_checked", "1");
								Object expire_new_date = rowMap.get("expire_new_date");
								Object expire_renew_date = rowMap.get("expire_renew_date");

								if(rowMap.get("expire_new_date") == null || rowMap.get("expire_new_date").equals("")){
									rowMap.put("expire_new_date", transferEffectiveDate);
								}
								if(rowMap.get("expire_renew_date") == null || rowMap.get("expire_renew_date").equals("")){
									rowMap.put("expire_renew_date", transferEffectiveDate);
								}

								map = new HashMap();
								map.putAll(rowMap);
								map.put("effective_date", transferEffectiveDate);
								map.put("expire_new_date", expire_new_date);
								map.put("expire_renew_date", expire_renew_date);
								map.put("is_checked", "1");

								transfersToList.add(map);
								validationsId = validationsId + "," + rowMap.get("validation_id");
							}
						}else{
							if(!isAnyProductValidationChanged)
								isAnyProductValidationChanged = true;

							rowMap.put("is_checked", "1");
						}
					}

					count++;

					validationsIdForCommAttachment = validationsIdForCommAttachment + "," + rowMap.get("validation_id");
				}else{
					rowMap.put("is_checked", "0");
				}

				ctx.put("validationsId", validationsId);
			}

			ctx.put("validationsIdForCommAttachment", validationsIdForCommAttachment);

			//if(count == transfersFromList.size()){
			if(count == 0){
				//DataUtils.populateError((Context)ctx, "pageError", "Please select at least one product validation to transfer.");
				if(noCheckBox){
					DataUtils.populateError((Context)ctx, "pageError", "Validation for this transfer are expired select another agency");
				}else{
				DataUtils.populateError((Context)ctx, "pageError", "TransferProducerNumber11ErrorKey");}
				return;
			}
		}else if(!( selling_subproducer_indicator_flag.equals("T") && buyer_subproducer_indicator_flag.equals("T"))){
			DataUtils.populateError((Context)ctx, "pageError", "TransferProducerNumber11ErrorKey");
			return;
		}

		if(isAnyProductValidationChanged)
			ctx.put("isAnyProductValidationChanged", "Y");

		ctx.put("transfersStep3_list_mom_0", transfersFromList);
		ctx.put("transfersStep3_list_mom_1", transfersToList);

		//if To agency code commission attachments found
		if(ctx.get("transfersStep2_list_1_1") != null && ctx.get("transfersStep2_list_1_1") instanceof List
				&& ((List)ctx.get("transfersStep2_list_1_1")).size() > 0){

			List transfersToCommAttList = (List)ctx.get("transfersStep2_list_1_1");
			for(int i=0; i<transfersToCommAttList.size(); i++){
				Map row = (Map)transfersToCommAttList.get(i);

				if(row.get("termination_date") == null || row.get("termination_date").toString().equals(HtmlConstants.EMPTY)){
					ctx.put("isToProducerNumberCommAttachmentFound", "Y");
					break;
				}

				//ctx.put("isToProducerNumberCommAttachmentFound", "N");
			}
		}

		//if From agency code commission attachments found
		if(ctx.get("transfersStep2_list_1_0") != null && ctx.get("transfersStep2_list_1_0") instanceof List
				&& ((List)ctx.get("transfersStep2_list_1_0")).size() > 0){
			List transfersCommFromList = (List)(List)ctx.get("transfersStep2_list_1_0");
			for(int i=0; i<transfersCommFromList.size(); i++){
				Map map = (Map)transfersCommFromList.get(i);

				if(map.get("termination_date") == null || map.get("termination_date").toString().equals(HtmlConstants.EMPTY)){
					ctx.put("isFromProducerNumberCommAttachmentFound", "Y");
					break;
				}
			}
		}

		//going to get list of commission schedule attachments
		/*List transfersFromCommissionList = new ArrayList();
		List transfersToCommissionList = new ArrayList();

		if(ctx.get("transfersStep2_list_1_0") != null && ctx.get("transfersStep2_list_1_0") instanceof List){
			transfersFromCommissionList = (List)ctx.get("transfersStep2_list_1_0");
		}
		if(ctx.get("transfersStep2_list_1_1") != null && ctx.get("transfersStep2_list_1_1") instanceof List){
			transfersToCommissionList = (List)ctx.get("transfersStep2_list_1_1");
		}

		if(isAnyChangeFound){
			//for(int i=0; i<transfersFromCommissionList)
		}

		ctx.put("transfersStep3_list_1_0", transfersFromCommissionList);
		ctx.put("transfersStep3_list_1_1", transfersToCommissionList);*/
	}

	//Method created to get transfers step1 page data in case of edit event only
	private void getTransfersStep1DataForEditEvent(IContext ctx) throws Exception{
		if(ctx.get("producer_number_from")==null || ctx.get("producer_number_from")==""){
				ctx.remove("selling_dba");
		}
		if(ctx.get("producer_number_to")==null || ctx.get("producer_number_to")==""){
				ctx.remove("buyer_dba");
		}


		if(ctx.get("inet_eventid") != null && ctx.get("inet_eventid").equals("edit")){
			new SetParametersForStoredProcedures().setParametersInContext(ctx, "producer_number_transfer_id");
			List dataList = SqlResources.getSqlMapProcessor(ctx).select("producer_number_transfer.GetProducernumberStep1_p", ctx);
			if(dataList != null && dataList.size() > 0 && dataList.get(0) instanceof Map){
				Map rowMap = (Map)dataList.get(0);
				Set keysSet = rowMap.keySet();
				Iterator itr = keysSet.iterator();
				while(itr.hasNext()){
					String key = itr.next().toString();
					ctx.put(key, rowMap.get(key));
				}
			}

			return;
		}
	}

	//Method created to get producer_number_commission_schedule attachments to be transfered to To agency code
	private void getCommissionScheduleToBeTransfered(IContext ctx) throws Exception{
		if(ctx.get("transfersStep3_list_1_0") != null && ctx.get("transfersStep3_list_1_0") instanceof List &&
			((List)ctx.get("transfersStep3_list_1_0")).size() > 0){

			List commAttList = (List)ctx.get("transfersStep3_list_1_0");
			String producerNumberCommissionScheduleIds = null;

			for(int i=0; i<commAttList.size(); i++){
				Map row = (Map)commAttList.get(i);

				if((row.get("is_checked") != null && row.get("is_checked").toString().equals("1")) &&
						row.get("producer_number_commission_schedule_id") != null && !row.get("producer_number_commission_schedule_id").toString().equals(HtmlConstants.EMPTY)){
					if(producerNumberCommissionScheduleIds == null)
						producerNumberCommissionScheduleIds = row.get("producer_number_commission_schedule_id").toString();
					else
						producerNumberCommissionScheduleIds = producerNumberCommissionScheduleIds + "," + row.get("producer_number_commission_schedule_id").toString();
				}
			}

			ctx.put("producerNumberCommissionScheduleIds", producerNumberCommissionScheduleIds);
		}
	}

	//Method created to add wholesale transfers filter data for transfersStep3 page
	private void addWholesaleTransferFilters(IContext ctx) throws Exception{
		if(ctx.get("transfer_type") != null && ctx.get("transfer_type").toString().equals("WTR")){
			List filtersList = new ArrayList();
            int usedPolicyCount=0;
            boolean usedPolicyFlag=false;
			if(ctx.get("transfersStep2_list_mom_2") != null){
				filtersList = (List)ctx.get("transfersStep2_list_mom_2");
				for(int i=0; i<filtersList.size(); i++){
					Map map = (Map)filtersList.get(i);
					usedPolicyCount=usedPolicyCount+Integer.parseInt(map.get("numberofpolicies").toString());
				}
			}

			if(ctx.get("producer_number_transfer_filters_list_1") != null && ctx.get("producer_number_transfer_filters_list_1") instanceof List &&
					((List)ctx.get("producer_number_transfer_filters_list_1")).size() > 0){
				
				Map map = (Map)((List)ctx.get("producer_number_transfer_filters_list_1")).get(0);
				
				if(map.get("state_desc") == null || map.get("company_desc") == null){
					ctx.put("pageMsg", DataUtils.getMessage((Context)ctx, "noPoliciesFoundKey"));
					return;
				}
				
			
				if(ctx.get("numberofpolicies") != null && !ctx.get("numberofpolicies").toString().equals(HtmlConstants.EMPTY) &&
						map.get("numberofpolicies") != null && !map.get("numberofpolicies").toString().equals(HtmlConstants.EMPTY)){
					int ctxnumberofpolicies = Integer.parseInt(ctx.get("numberofpolicies").toString());
					int mapnumberofpolicies = Integer.parseInt(map.get("numberofpolicies").toString());
					if(mapnumberofpolicies==0){
						DataUtils.populateError((Context)ctx, "pageError", DataUtils.getMessage((Context)ctx, "policyNumberAlreadyScheduledErrorKey"));
						return;
					}
					if((ctxnumberofpolicies+usedPolicyCount)==mapnumberofpolicies){
						usedPolicyFlag=true;
						filtersList.clear();
					}
				}

				SqlResources.getSqlMapProcessor(ctx).findByKey("producer_number_transfer.validateBOBTransfersData_p", ctx);
				if(ctx.get("errorMsg") != null && ctx.get("errorMsg").toString().equals("2")){
					DataUtils.populateError((Context)ctx, "pageError", DataUtils.getMessage((Context)ctx, "policyNumberAlreadyScheduledErrorKey"));
					return;
				}

				map.put("row_num", filtersList.size()+1);

				if(ctx.get("numberofpolicies") != null && !ctx.get("numberofpolicies").toString().equals(HtmlConstants.EMPTY) &&
						map.get("numberofpolicies") != null && !map.get("numberofpolicies").toString().equals(HtmlConstants.EMPTY)){
					int ctxnumberofpolicies = Integer.parseInt(ctx.get("numberofpolicies").toString());
					int mapnumberofpolicies = Integer.parseInt(map.get("numberofpolicies").toString());
					if(!usedPolicyFlag){
						ctxnumberofpolicies = ctxnumberofpolicies-mapnumberofpolicies;
					}
					else{
						ctxnumberofpolicies=0;
					}
					ctx.put("numberofpolicies", ctxnumberofpolicies);
				}

				//map.put("validations", ctx.get("validations"));
				if(map.get("totalpolicies") != null && !map.get("totalpolicies").toString().equals(HtmlConstants.EMPTY)){
					map.put("validations", map.get("totalpolicies").toString().trim());
					ctx.put("validations", map.get("totalpolicies").toString().trim());
				}

				filtersList.add(map);

				ctx.put("transfersStep2_list_mom_2", filtersList);

				if(ctx.get("validationsId") == null || ctx.get("validationsId").toString().equals(HtmlConstants.EMPTY))
					ctx.put("validations", ctx.get("validations").toString().trim());
				else
					ctx.put("validations", ctx.get("validationsId").toString().trim() + "," + ctx.get("validations").toString().trim());
			}else{
				ctx.put("pageMsg", DataUtils.getMessage((Context)ctx, "noPoliciesFoundKey"));
			}
		}
	}

	//Method created to delete from wholesale transfers filter data for transfersStep3 page
	private void deleteWholesaleTransferFilters(IContext ctx) throws Exception{
		if(ctx.get("transfer_type") != null && ctx.get("transfer_type").toString().equals("WTR")){
			List filtersList = new ArrayList();

			if(ctx.get("transfersStep2_list_mom_2") != null){
				filtersList = (List)ctx.get("transfersStep2_list_mom_2");
			}

			List finalList = new ArrayList();

			for(int i=0; i<filtersList.size(); i++){
				Map map = (Map)filtersList.get(i);

				if(map.get("row_num") != null && !map.get("row_num").toString().equals(HtmlConstants.EMPTY) &&
						ctx.get("row_num") != null && !ctx.get("row_num").toString().equals(HtmlConstants.EMPTY) &&
						Integer.parseInt(ctx.get("row_num").toString()) == Integer.parseInt(map.get("row_num").toString())){

					if(ctx.get("numberofpolicies") != null && !ctx.get("numberofpolicies").toString().equals(HtmlConstants.EMPTY) &&
							map.get("numberofpolicies") != null && !map.get("numberofpolicies").toString().equals(HtmlConstants.EMPTY)){
						int ctxnumberofpolicies = Integer.parseInt(ctx.get("numberofpolicies").toString());
						int mapnumberofpolicies = Integer.parseInt(map.get("numberofpolicies").toString());

						ctxnumberofpolicies = ctxnumberofpolicies+mapnumberofpolicies;

						ctx.put("numberofpolicies", ctxnumberofpolicies);
					}

					if(ctx.get("validations") != null){
						String validations = ctx.get("validations").toString();
						validations = validations.replace(map.get("validations").toString(), HtmlConstants.EMPTY);
						ctx.put("validations", validations);
					}

					continue;
				}

				map.put("row_num", (finalList.size()+1)+"");
				finalList.add(map);
			}

			ctx.put("transfersStep2_list_mom_2", finalList);
		}
	}
}
