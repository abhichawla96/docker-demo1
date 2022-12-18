<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.1"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:fo="http://www.w3.org/1999/XSL/Format"
	exclude-result-prefixes="fo"
	xmlns:fn="http://www.w3.org/2005/02/xpath-functions"
	xmlns:java="java">
	
	<xsl:template match="/">
		<fo:root>
			<fo:layout-master-set>
				<fo:simple-page-master master-name="A4-portrait" page-width="21cm"   
					page-height="29.7cm" margin-top="0.2in" margin-bottom="1.0in" margin-left="0.5in" 
					margin-right="0.5in">
					<fo:region-body margin-top="0.5in"/>
					<fo:region-before extent="1.0in"/> 
					<fo:region-after /> 					
				</fo:simple-page-master>
			</fo:layout-master-set>	
			<fo:page-sequence master-reference="A4-portrait">
				<fo:static-content flow-name="xsl-region-before">
					<fo:block text-align="left">				  	
				  		<fo:external-graphic src="images/p1LogoMail.png" content-height="2em" content-width="7em"/>            	
				  	</fo:block>	
				</fo:static-content>			
				<fo:flow flow-name="xsl-region-body">
					<fo:block>
						<fo:table>
							<fo:table-column/>
						 	<fo:table-body>
								<fo:table-row>
									<fo:table-cell>
										<fo:block font-size="13px" font-family="Arial" font-weight="bold" text-align="center"></fo:block>
									</fo:table-cell>
								</fo:table-row>
								<fo:table-row>
									<fo:table-cell>
										<fo:block font-size="13px" font-family="Arial" font-weight="bold" text-align="center">Call Report</fo:block>
									</fo:table-cell>
								</fo:table-row>
						  	</fo:table-body>
						</fo:table>
					</fo:block>
					
					<fo:block margin-top="6mm">
						<fo:block font-size="10px" font-family="Arial" font-weight="bold">Agency Entity Visit Details</fo:block>
						<fo:table border="0.6pt solid #6bc2f8" width="99.5%">
							<fo:table-column column-width="17%"></fo:table-column>
							<fo:table-column column-width="35%"></fo:table-column>
							<fo:table-column column-width="17%"></fo:table-column>
							<fo:table-column column-width="31%"></fo:table-column>
							<fo:table-body>
								<fo:table-row>
									<fo:table-cell padding-start="3pt" padding-top="3pt">
										<fo:block font-size="10px" font-family="Arial" font-weight="bold">Agency Entity :</fo:block>
									</fo:table-cell>
									<fo:table-cell padding-top="3pt"> 
										<fo:block font-size="10px" font-family="Arial"><xsl:value-of select="response/name_desc"/></fo:block>
									</fo:table-cell>
									<fo:table-cell padding-top="3pt">
										<fo:block font-size="10px" font-family="Arial" font-weight="bold">Report Documented By :</fo:block>
									</fo:table-cell>
									<fo:table-cell padding-top="3pt">
										<fo:block font-size="10px" font-family="Arial"><xsl:value-of select="response/report_document_by"/></fo:block>
									</fo:table-cell>
								</fo:table-row>
								<fo:table-row>
									<fo:table-cell>
										<fo:block margin-left="4px"  margin-top="6px" font-size="10px" font-family="Arial" font-weight="bold">Type :</fo:block>
									</fo:table-cell>
									<fo:table-cell>
										<fo:block margin-top="6px" font-size="10px" font-family="Arial"><xsl:value-of select="response/call_type_desc"/></fo:block>
									</fo:table-cell>
									<fo:table-cell>
										<fo:block margin-top="6px" font-size="10px" font-family="Arial" font-weight="bold">Visit Date :</fo:block>
									</fo:table-cell>
									<fo:table-cell>
										<fo:block margin-top="6px" font-size="10px" font-family="Arial"><xsl:value-of select="response/date_time"/></fo:block>
									</fo:table-cell>
									
								</fo:table-row>
								<fo:table-row>
								<!-- <xsl:if test="response/location_name!='null' and response/location_name!=''">
									<fo:table-cell padding-start="3pt">
										<fo:block margin-top="6px" font-size="10px" font-family="Arial" font-weight="bold">Location :</fo:block>
									</fo:table-cell>
									<fo:table-cell>
										<fo:block margin-top="6px" font-size="10px" font-family="Arial"><xsl:value-of select="response/location_name"/></fo:block>
									</fo:table-cell>
								 </xsl:if> -->
								
									<fo:table-cell padding-start="1pt">
										<fo:block  wrap-option="no-wrap" margin-top="6px" font-size="10px" font-family="Arial" font-weight="bold">Status:</fo:block>
									</fo:table-cell>
									<fo:table-cell>
										<fo:block margin-top="6px" font-size="10px" font-family="Arial"><xsl:value-of select="response/call_status_desc"/></fo:block>
									</fo:table-cell>
									
									
									<!-- <fo:table-cell>
										<fo:block margin-top="6px" font-size="10px" font-family="Arial" font-weight="bold">Visit Duration :</fo:block>
									</fo:table-cell>
									<fo:table-cell>
										<fo:block margin-top="6px" font-size="10px" font-family="Arial"><xsl:value-of select="response/visit_duration"/></fo:block>
									</fo:table-cell> -->
								</fo:table-row>
								<fo:table-row>
									<fo:table-cell padding-start="3pt">
										<fo:block margin-top="6px" font-size="10px" font-family="Arial" font-weight="bold">Territory Manager :</fo:block>
									</fo:table-cell>
									<fo:table-cell>
										<fo:block margin-top="6px" font-size="10px" font-family="Arial"><xsl:value-of select="response/market_rep_desc"/></fo:block>
									</fo:table-cell>
										
								    <fo:table-cell>
										<fo:block margin-top="6px" font-size="10px" font-family="Arial" font-weight="bold">Follow-up Date :</fo:block>
									</fo:table-cell>
									<xsl:if test="response/addProspectAgencyCallReportDetails_followup_date!=null or response/addProspectAgencyCallReportDetails_followup_date!= '' ">
									<fo:table-cell>
										<fo:block margin-top="6px" font-size="10px" font-family="Arial"><xsl:value-of select="response/addProspectAgencyCallReportDetails_followup_date"/></fo:block>
									</fo:table-cell>
									</xsl:if>
									<xsl:if test="response/addAgencyCallReportDetails_followup_date!=null or response/addAgencyCallReportDetails_followup_date!= '' ">
									<fo:table-cell>
									<fo:block margin-top="6px" font-size="10px" font-family="Arial"><xsl:value-of select="response/addAgencyCallReportDetails_followup_date"/></fo:block>
									</fo:table-cell>
									</xsl:if>
									
								<!-- 	<fo:table-cell padding-start="1pt">
										<fo:block  wrap-option="no-wrap" margin-top="6px" font-size="10px" font-family="Arial" font-weight="bold">Territory:</fo:block>
									</fo:table-cell>
									<fo:table-cell>
										<fo:block margin-top="6px" font-size="10px" font-family="Arial"><xsl:value-of select="response/zone_desc"/></fo:block>
									</fo:table-cell> -->
								</fo:table-row>
								<!-- <fo:table-row>
									<fo:table-cell padding-start="3pt">
										<fo:block margin-top="6px" font-size="10px" font-family="Arial" font-weight="bold">Business Address :</fo:block>
									</fo:table-cell>
									<fo:table-cell>
										<fo:block margin-top="6px" font-size="10px" font-family="Arial"><xsl:value-of select="response/physicaladdress"/></fo:block>
									</fo:table-cell>
									<fo:table-cell>
										<fo:block margin-top="6px" font-size="10px" font-family="Arial" font-weight="bold">Mailing Address :</fo:block>
									</fo:table-cell>
									<fo:table-cell>
										<fo:block margin-top="6px" font-size="10px" font-family="Arial"><xsl:value-of select="response/mailingaddress"/></fo:block>
									</fo:table-cell>
								</fo:table-row> -->
								<!-- <fo:table-row>
									<fo:table-cell padding-start="3pt">
										<fo:block margin-top="6px" font-size="10px" font-family="Arial" font-weight="bold">Phone :</fo:block>
									</fo:table-cell>
									<fo:table-cell>
										<fo:block margin-top="6px" font-size="10px" font-family="Arial"><xsl:value-of select="response/phone"/></fo:block>
									</fo:table-cell>
									<fo:table-cell>
										<fo:block margin-top="6px" font-size="10px" font-family="Arial" font-weight="bold">Fax :</fo:block>
									</fo:table-cell>
									<fo:table-cell>
										<fo:block margin-top="6px" font-size="10px" font-family="Arial"><xsl:value-of select="response/fax"/></fo:block>
									</fo:table-cell>
								</fo:table-row> -->
							</fo:table-body>	
						</fo:table>
						<fo:block font-size="10px" font-family="Arial" font-weight="bold" margin-top="8mm">Additional Visit Details</fo:block>	
						<fo:table border="0.6pt solid #6bc2f8" width="99.5%">
							<fo:table-column column-width="35%"></fo:table-column>
							<fo:table-column></fo:table-column>
							<fo:table-body>
								 <fo:table-row>
									<fo:table-cell padding-start="3pt">
										<fo:block margin-top="6px" font-size="10px" font-family="Arial" font-weight="bold">Purpose of Call :</fo:block>
									</fo:table-cell>
									<fo:table-cell>
										<fo:block margin-top="6px" font-size="10px" font-family="Arial"><xsl:value-of select="response/purpose_of_call_description"/></fo:block>
									</fo:table-cell>
								 </fo:table-row>	
								
									
								<xsl:if test="response/purpose_of_call_description='Other'">
										 <fo:table-row> 
											<fo:table-cell padding-start="3pt">
												<fo:block margin-top="6px" font-size="10px" font-family="Arial" font-weight="bold">Purpose of Call Description:</fo:block>
										    </fo:table-cell>
									        <fo:table-cell>
												<fo:block margin-top="6px" font-size="10px" font-family="Arial"><xsl:value-of select="response/purpose_of_call_other_desc"/></fo:block>
											</fo:table-cell>
											</fo:table-row>	
								</xsl:if>
								<fo:table-row>
									<fo:table-cell padding-start="3pt">
										<fo:block margin-top="6px" font-size="10px" font-family="Arial" font-weight="bold">Call Objective :</fo:block>
									</fo:table-cell>
									<fo:table-cell>
										<fo:block margin-top="6px" font-size="10px" font-family="Arial"><xsl:value-of select="response/call_objective"/></fo:block>
									</fo:table-cell>
								</fo:table-row>
								<fo:table-row>
									<fo:table-cell padding-start="3pt">
										<fo:block margin-top="6px" font-size="10px" font-family="Arial" font-weight="bold">Other Call Objective :</fo:block>
									</fo:table-cell>
									<fo:table-cell>
										<fo:block margin-top="6px" font-size="10px" font-family="Arial"><xsl:value-of select="response/other_call_objective"/></fo:block>
									</fo:table-cell>
								</fo:table-row>
							 <!--<fo:table-row>
									<fo:table-cell padding-start="3pt" padding-top="3pt">
										<fo:block font-size="10px" font-family="Arial" font-weight="bold">Description :</fo:block>
									</fo:table-cell>
									<fo:table-cell padding-top="3pt">
										<fo:block font-size="10px" font-family="Arial"><xsl:value-of select="response/chair_person"/></fo:block>
									</fo:table-cell>
								</fo:table-row>-->
								
								<!-- <fo:table-row>
									<fo:table-cell padding-start="3pt">
										<fo:block margin-top="6px" font-size="10px" font-family="Arial" font-weight="bold">Other Notes/Questions to be Asked :</fo:block>
									</fo:table-cell>
									<fo:table-cell>
										<fo:block margin-top="6px" font-size="10px" font-family="Arial"><xsl:value-of select="response/questions_tobeasked"/></fo:block>
									</fo:table-cell>
								</fo:table-row> -->
								<fo:table-row>
									<fo:table-cell padding-start="3pt">
										<fo:block margin-top="6px" font-size="10px" font-family="Arial" font-weight="bold">Discussion Summary :</fo:block>
									</fo:table-cell>
									<fo:table-cell>
										<fo:block margin-top="6px" font-size="10px" font-family="Arial"><xsl:value-of select="response/topics_discussed"/></fo:block>
									</fo:table-cell>
								</fo:table-row>
								<fo:table-row>
									<fo:table-cell padding-start="3pt">
										<fo:block margin-top="6px" font-size="10px" font-family="Arial" font-weight="bold">Actions to be Taken :</fo:block>
									</fo:table-cell>
									<fo:table-cell>
										<fo:block margin-top="6px" font-size="10px" font-family="Arial"><xsl:value-of select="response/results_of_call"/></fo:block>
									</fo:table-cell>
								</fo:table-row>
								<fo:table-row>
									<fo:table-cell padding-start="3pt">
										<fo:block margin-top="6px" font-size="10px" font-family="Arial" font-weight="bold">Market Intelligence :</fo:block>
									</fo:table-cell>
									<fo:table-cell>
										<fo:block margin-top="6px" font-size="10px" font-family="Arial"><xsl:value-of select="response/competitive_intelligence"/></fo:block>
									</fo:table-cell>
								</fo:table-row>
								<fo:table-row>
									<fo:table-cell padding-start="3pt">
										<fo:block margin-top="6px" font-size="10px" font-family="Arial" font-weight="bold">Additional Comments :</fo:block>
									</fo:table-cell>
									<fo:table-cell>
										<fo:block margin-top="6px" font-size="10px" font-family="Arial"><xsl:value-of select="response/additional_comments"/></fo:block>
									</fo:table-cell>
								</fo:table-row>
								
								
							</fo:table-body>		
						
						</fo:table>
						<fo:block font-size="10px" font-family="Arial" font-weight="bold" margin-top="8mm">Producer Participants </fo:block>
						<fo:table border="0.6pt solid #6bc2f8" width="99.5%">
							<fo:table-column column-width="15%"></fo:table-column>
							<fo:table-column column-width="25%"></fo:table-column>
							<fo:table-column column-width="40%"></fo:table-column>
							<fo:table-column ></fo:table-column>
							<fo:table-body>
								<fo:table-row>
									<fo:table-cell padding-start="3pt" background-color="#6bc2f8">
										<fo:block margin-top="6px" font-size="10px" font-family="Arial" font-weight="bold">Name</fo:block>
									</fo:table-cell>
									<fo:table-cell background-color="#6bc2f8">
										<fo:block margin-top="6px" font-size="10px" font-family="Arial" font-weight="bold">Role</fo:block>
									</fo:table-cell>
									<fo:table-cell background-color="#6bc2f8">
										<fo:block margin-top="6px" font-size="10px" font-family="Arial" font-weight="bold">Email</fo:block>
									</fo:table-cell>
									<fo:table-cell background-color="#6bc2f8">
										<fo:block margin-top="6px" font-size="10px" font-family="Arial" font-weight="bold">Phone</fo:block>
									</fo:table-cell>
								</fo:table-row>
								<xsl:for-each select="response/addAgencyPersonnel_list_listfreeform_1/data">
									<fo:table-row>
										<fo:table-cell padding-start="3pt" padding-top="3pt" padding-bottom="3pt" padding-end="3pt"><fo:block font-size="10px" font-family="Arial"><xsl:value-of select="name"/></fo:block></fo:table-cell>
										<fo:table-cell padding-top="3pt" padding-bottom="3pt" padding-end="3pt"><fo:block font-size="10px" font-family="Arial"><xsl:value-of select="role"/></fo:block></fo:table-cell>
										<fo:table-cell padding-top="3pt" padding-bottom="3pt" padding-end="3pt"><fo:block font-size="10px" font-family="Arial"><xsl:value-of select="email"/></fo:block></fo:table-cell>
										<fo:table-cell padding-top="3pt" padding-bottom="3pt" padding-end="3pt"><fo:block font-size="10px" font-family="Arial"><xsl:value-of select="phone"/></fo:block></fo:table-cell>
									</fo:table-row>
								</xsl:for-each>
							</fo:table-body>
						</fo:table>
						
						<fo:block font-size="10px" font-family="Arial" font-weight="bold" margin-top="8mm">Participating Employee</fo:block>
						<fo:table border="0.6pt solid #6bc2f8" width="100%">
							<fo:table-column column-width="23%"></fo:table-column>
							<fo:table-column column-width="23%"></fo:table-column>
							<fo:table-column column-width="23%"></fo:table-column>
							<fo:table-column column-width="30.5%"></fo:table-column>
							<fo:table-body>
								<fo:table-row>
									<fo:table-cell padding-start="3pt" background-color="#6bc2f8">
										<fo:block margin-top="6px" font-size="10px" font-family="Arial" font-weight="bold">Name</fo:block>
									</fo:table-cell>
									<fo:table-cell background-color="#6bc2f8">
										<fo:block margin-top="6px" font-size="10px" font-family="Arial" font-weight="bold">Notes</fo:block>
									</fo:table-cell>
									<fo:table-cell background-color="#6bc2f8">
										<fo:block margin-top="6px" font-size="10px" font-family="Arial" font-weight="bold"></fo:block>
									</fo:table-cell>
									<fo:table-cell background-color="#6bc2f8">
										<fo:block margin-top="6px" font-size="10px" font-family="Arial" font-weight="bold"></fo:block>
									</fo:table-cell>
								</fo:table-row>
								<xsl:for-each select="response/addCarrierEmployees_list_listfreeform_1/data">
									<fo:table-row>
										<fo:table-cell padding-start="3pt" padding-top="3pt" padding-bottom="3pt" padding-end="3pt"><fo:block font-size="10px" font-family="Arial"><xsl:value-of select="name"/></fo:block></fo:table-cell>
										<fo:table-cell padding-start="3pt" padding-top="3pt" padding-bottom="3pt" padding-end="3pt"><fo:block font-size="10px" font-family="Arial"><xsl:value-of select="comments"/></fo:block></fo:table-cell>
										<fo:table-cell padding-top="3pt" padding-bottom="3pt" padding-end="3pt"><fo:block font-size="10px" font-family="Arial"></fo:block></fo:table-cell>
										<fo:table-cell padding-top="3pt" padding-bottom="3pt" padding-end="3pt"><fo:block font-size="10px" font-family="Arial"></fo:block></fo:table-cell>
									</fo:table-row>
								</xsl:for-each>
							</fo:table-body>
						</fo:table>
						
						<fo:block font-size="10px" font-family="Arial" font-weight="bold" margin-top="8mm">Action Plan</fo:block>	
						<fo:table border="0.6pt solid #6bc2f8" width="100%">
							<fo:table-column column-width="21%"></fo:table-column>
							<fo:table-column column-width="23%"></fo:table-column>
							<fo:table-column column-width="21%"></fo:table-column>
							<fo:table-column column-width="34.5%"></fo:table-column>
							<fo:table-body>
								<fo:table-row>
									<fo:table-cell padding-start="3pt" background-color="#6bc2f8">
										<fo:block margin-top="6px" font-size="10px" font-family="Arial" font-weight="bold">Action Plan</fo:block>
									</fo:table-cell>
									<fo:table-cell background-color="#6bc2f8">
										<fo:block margin-top="6px" font-size="10px" font-family="Arial" font-weight="bold">Action Items</fo:block>
									</fo:table-cell>
									<fo:table-cell background-color="#6bc2f8">
										<fo:block margin-top="6px" font-size="10px" font-family="Arial" font-weight="bold">Assigned To</fo:block>
									</fo:table-cell>
									<fo:table-cell background-color="#6bc2f8">
										<fo:block margin-top="6px" font-size="10px" font-family="Arial" font-weight="bold">Due Date</fo:block>
									</fo:table-cell>
									
								</fo:table-row>
								<xsl:for-each select="response/addActionPlan_list_listfreeform_1/data">
									<fo:table-row>
										<fo:table-cell padding-start="3pt" padding-top="3pt" padding-bottom="3pt" padding-end="3pt"><fo:block font-size="10px" font-family="Arial"><xsl:value-of select="action_plan_name"/></fo:block></fo:table-cell>
										<fo:table-cell padding-top="3pt" padding-bottom="3pt" padding-end="3pt"><fo:block font-size="10px" font-family="Arial"><xsl:value-of select="Action_items"/></fo:block></fo:table-cell>
										<fo:table-cell padding-top="3pt" padding-bottom="3pt" padding-end="3pt"><fo:block font-size="10px" font-family="Arial"><xsl:value-of select="Assigned_to"/></fo:block></fo:table-cell>
										<fo:table-cell padding-top="3pt" padding-bottom="3pt" padding-end="3pt"><fo:block font-size="10px" font-family="Arial"><xsl:value-of select="Due_date"/></fo:block></fo:table-cell>
									</fo:table-row>
								</xsl:for-each>
							</fo:table-body>
						</fo:table>
						
						
						<fo:block font-size="10px" font-family="Arial" font-weight="bold" margin-top="8mm">New Business Prospects </fo:block>
						<fo:table border="0.6pt solid #6bc2f8" width="99.5%">
							<fo:table-column column-width="33%"></fo:table-column>
							<fo:table-column column-width="33%"></fo:table-column>
							<fo:table-column column-width="34%"></fo:table-column>
							<fo:table-body>
								<fo:table-row>
									<fo:table-cell padding-start="3pt" background-color="#6bc2f8">
										<fo:block margin-top="6px" font-size="10px" font-family="Arial" font-weight="bold">New Business Prospects</fo:block>
									</fo:table-cell>
									<fo:table-cell background-color="#6bc2f8">
										<fo:block margin-top="6px" font-size="10px" font-family="Arial" font-weight="bold"></fo:block>
									</fo:table-cell>
									<fo:table-cell background-color="#6bc2f8">
										<fo:block margin-top="6px" font-size="10px" font-family="Arial" font-weight="bold">Expiration Date</fo:block>
									</fo:table-cell>
								</fo:table-row>
								<xsl:for-each select="response/addBusinessProspects_list_listfreeform_1/data">
									<fo:table-row>
										<fo:table-cell padding-start="3pt" padding-top="3pt" padding-bottom="3pt" padding-end="3pt"><fo:block font-size="10px" font-family="Arial"><xsl:value-of select="call_report_prospects_desc"/></fo:block></fo:table-cell>
										<fo:table-cell padding-top="3pt" padding-bottom="3pt" padding-end="3pt"><fo:block font-size="10px" font-family="Arial"></fo:block></fo:table-cell>
										<fo:table-cell padding-top="3pt" padding-bottom="3pt" padding-end="3pt"><fo:block font-size="10px" font-family="Arial"><xsl:value-of select="call_report_prospects_date"/></fo:block></fo:table-cell>
									</fo:table-row>
								</xsl:for-each>
							</fo:table-body>
						</fo:table>
						
						<fo:block font-size="10px" font-family="Arial" font-weight="bold" margin-top="8mm">Key Renewals </fo:block>
						<fo:table border="0.6pt solid #6bc2f8" width="99.5%">
							<fo:table-column column-width="33%"></fo:table-column>
							<fo:table-column column-width="33%"></fo:table-column>
							<fo:table-column column-width="34%"></fo:table-column>
							<fo:table-body>
								<fo:table-row>
									<fo:table-cell padding-start="3pt" background-color="#6bc2f8">
										<fo:block margin-top="6px" font-size="10px" font-family="Arial" font-weight="bold">Key Renewals</fo:block>
									</fo:table-cell>
									<fo:table-cell background-color="#6bc2f8">
										<fo:block margin-top="6px" font-size="10px" font-family="Arial" font-weight="bold"></fo:block>
									</fo:table-cell>
									<fo:table-cell background-color="#6bc2f8">
										<fo:block margin-top="6px" font-size="10px" font-family="Arial" font-weight="bold">Expiration Date</fo:block>
									</fo:table-cell>
								</fo:table-row>
								<xsl:for-each select="response/addKeyRenewals_list_listfreeform_1/data">
									<fo:table-row>
										<fo:table-cell padding-start="3pt" padding-top="3pt" padding-bottom="3pt" padding-end="3pt"><fo:block font-size="10px" font-family="Arial"><xsl:value-of select="call_report_prospects_desc"/></fo:block></fo:table-cell>
										<fo:table-cell padding-top="3pt" padding-bottom="3pt" padding-end="3pt"><fo:block font-size="10px" font-family="Arial"></fo:block></fo:table-cell>
										<fo:table-cell padding-top="3pt" padding-bottom="3pt" padding-end="3pt"><fo:block font-size="10px" font-family="Arial"><xsl:value-of select="call_report_prospects_date"/></fo:block></fo:table-cell>
									</fo:table-row>
								</xsl:for-each>
							</fo:table-body>
						</fo:table>
						
						
						
					</fo:block>
					
				</fo:flow>	
			</fo:page-sequence>
		</fo:root>
	</xsl:template>	
		
	
</xsl:stylesheet>	