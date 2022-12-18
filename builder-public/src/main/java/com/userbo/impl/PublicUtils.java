package com.userbo.impl;


import java.io.File;
import java.io.IOException;
import java.io.StringReader;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.StringTokenizer;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.lang.RandomStringUtils;
import org.apache.commons.validator.UrlValidator;
import com.util.InetLogger;
import org.jdom.Element;
import org.jdom.JDOMException;
import org.jdom.input.SAXBuilder;
import org.jdom.output.XMLOutputter;
import org.json.JSONObject;

import com.manage.managecomponent.components.SetParametersForStoredProcedures;
import com.manage.managemetadata.functions.commonfunctions.DataUtils;
import com.manage.managemetadata.messages.MessageImpl;
import com.manage.managemetadata.messages.MessageResources;
import com.manage.managemetadata.security.SecurityResources;
import com.manage.managemetadata.util.exception.ValidationException;
import com.mercuryinsurance.p3.ws.RoutingNumberValidation;
import com.mercuryinsurance.p3.ws.schema.responsevalidateecheckpayment.ResponseValidateEcheckPayment;
import com.mercuryinsurance.p3.ws.schema.validateecheckpayment.ValidateEcheckPayment;
import com.ormapping.ibatis.SqlResources;
import com.osi.integration.client.IntegrationClient;
import com.util.CacheManager;
import com.util.Constants;
import com.util.Context;
import com.util.DateUtils;
import com.util.HtmlConstants;
import com.util.IContext;
import com.util.StringUtils;
import com.util.SystemProperties;

public class PublicUtils {
   /* private static Logger logger = Logger.getLogger(PublicUtils.class);*/
    private static InetLogger logger = InetLogger.getLogger(PublicUtils.class);
	
	/**
	 * @author Aman Sethi
	 * @description Method created to change step 2 and 5 description for Licensed producer
	 * @updation Aman Sethi updated on 06/30/2020
	 */
	
	
	public static void changeStepThreeToFiveLabelsForSecondaryRegistrationType(Context ctx){
        if(ctx.get("registration_type")!=null && StringUtils.isNotBlank(ctx.get("registration_type").toString()))
        {
               if(ctx.get("registration_type").toString().equalsIgnoreCase("SCAG") && StringUtils.isNotBlank(ctx.get("commission_to_be_paid").toString()) && ctx.get("commission_to_be_paid")!=null)
               {
            	   if(ctx.get("commission_to_be_paid").toString().equalsIgnoreCase("primary")) {
	                    ctx.put("public_step3_agency_contracts_label", "public_step3_agency_contracts_secondary_label");
	                    ctx.put("public_step4_market_information_label", "public_step4_market_information_secondary_label");
	                    ctx.put("public_step5_document_upload_label", "public_step5_document_upload_secondary_label");
            	   }
               }
               else if(ctx.get("registration_type").toString().equalsIgnoreCase("PRERG"))
               {
            	   ctx.put("public_step3_agency_contracts_label", "public_step3_agency_contracts_producer_label");
            	   ctx.put("public_step5_document_upload_label", "public_step5_document_upload_producer_label");
               }
        }
        }
	
	
	/* Phase 3- Restrict SS Commissions View Checkbox */
	public static void showContactTypeList1(Context ctx)
	{
		try
		{
			List<Map<String,String>> newList=new ArrayList<Map<String,String>>();
			List<Map<String,String>> contactTypeList=new ArrayList<Map<String,String>>();

			contactTypeList=(ArrayList<Map<String,String>>) ctx.get("adminBrokerageDetailsStep2_contactTypes_list_2");
			
				for (Map<String, String> map : contactTypeList) {
					
				
				if(!map.get("contact_typ_desc").equals("Restrict SS Commissions View"))																																											{
					newList.add(map);
				}
			}
			
			for (Map<String, String> map : newList) {
			System.out.println(map.get("contact_typ_desc"));	
			}
			ctx.put("adminBrokerageDetailsStep2_contactTypes_list_2",newList);
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		
		return;
	}	

	
	
	public static void splitContactType(Context ctx)
	{
		try
		{
			
			if (ctx.get("contact_type_desc")!=null && !ctx.get("contact_type_desc").toString().isEmpty())
			{
				if (ctx.get("contact_type_desc").toString().contains("Licensed Producer"))
				{
					ctx.put("contactTypeFlag", "Y");
				}
				else
				{
					ctx.put("contactTypeFlag", "N");	
				}
				if (ctx.get("contact_type_desc").toString().contains("Principal"))
				{
					ctx.put("contactTypeFlagPrincipal", "Y");
				}
				else
				{
					ctx.put("contactTypeFlagPrincipal", "N");	
				}
				if (ctx.get("isEditClicked")!=null && !ctx.get("isEditClicked").toString().equals(""))
				{
					if (ctx.get("isEditClicked").toString().equalsIgnoreCase("Y"))
					{
						ctx.put("contactTypeFlagPrincipal", "N");
						ctx.put("contactTypeFlag", "N");
						ctx.put("cbia_designation", null);
						ctx.put("year_recieved", null);
						
					}
				}
			}
			if (ctx.get("inet_method").toString().equalsIgnoreCase("edit"))
			{
				List list = (List)ctx.get("adminBrokerageDetailsStep2_list_1");
				String contacts="";
				String personId="";
				
				if (!list.isEmpty())
				{
					for (int i = 0; i < list.size(); i++) 
					{
						Map map = (Map) list.get(i);
						
						
						personId=map.get("principal_person_id").toString();
						if (personId.equalsIgnoreCase(ctx.get("principal_person_id").toString()))
						{
							contacts=map.get("contacttype").toString();
							break;
						}
					}
						if (contacts.contains("Licensed Producer"))
						{
							ctx.put("contactTypeFlag", "Y");
						}
						else
						{
							ctx.put("contactTypeFlag", "N");	
						}
					
						if (contacts.contains("Principal"))
						{
							ctx.put("contactTypeFlagPrincipal", "Y");
						}
						else
						{
							ctx.put("contactTypeFlagPrincipal", "N");	
						}
						
					
				}
			}
		}
		catch (Exception e) {
			e.printStackTrace();
		}
	}
	public static void setHRPAndOwnership(Context ctx) 
	{
		
		String hrp="";
		String hrpValue="";
		try
		{
			String hrpSubstring = ctx.get("adminBrokerageDetailsStep2_list_1").toString();
			if (!hrpSubstring.equals("[]"))
			{
				if (ctx.get("inet_method").toString().equalsIgnoreCase("save"))
				{
					while (hrpSubstring.contains("is_highest_ranking_principal"))
					{
						hrp=hrpSubstring.substring(hrpSubstring.indexOf("is_highest_ranking_principal=")+29,hrpSubstring.indexOf("is_highest_ranking_principal=")+30);
						hrpSubstring=hrpSubstring.substring(hrpSubstring.indexOf("is_highest_ranking_principal=")+1,hrpSubstring.length());
						
						if (hrp.equalsIgnoreCase("1"))
						{
							hrpValue=hrp;
							break;
							
						}
					}
						if (ctx.get("is_highest_ranking_principal").toString().equalsIgnoreCase("1") && hrpValue.equalsIgnoreCase("1"))
						{
							DataUtils.populateError((Context) ctx, "is_highest_ranking_principal", "hrpAlreadyExists");
						}
						else
						{
							ctx.put("contactTypeFlagPrincipal", "N");
							ctx.put("contactTypeFlag", "N");
							
						}
				}
			}
			
		}
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		
	}
}