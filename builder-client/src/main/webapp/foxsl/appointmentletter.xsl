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
				<fo:simple-page-master master-name="master0"
					page-width="8.5in" page-height="11in" margin-top="0.25in"
					margin-bottom="0.25in" margin-left="0.25in" margin-right="0.25in">
          <fo:region-body margin-top="0.8in" />
          <fo:region-before extent="1.0in" />
          <fo:region-after extent="0.2in" />
            </fo:simple-page-master>
			</fo:layout-master-set>	
			<fo:page-sequence master-reference="master0">			
				<fo:static-content flow-name="xsl-region-before">
					<fo:block text-align="left" color="white">
							<xsl:if test="not(response/personID)">	  	
				  		<fo:external-graphic src="images/bmicLogo4.jpg" content-height="80px" content-width="380px"/>            	
				  </xsl:if>
				  	</fo:block>	
				</fo:static-content>
				<fo:flow flow-name="xsl-region-body">
					<fo:block  margin-top="0.5in">
						<fo:table>
							<fo:table-column/>
							<fo:table-body>
							<!-- <xsl:for-each select="response/existingAgencyLetter_List_01/data/record_reason_code_session">
								 --><fo:table-row>
									<fo:table-cell>
									
										<fo:block font-size="11px" font-family="Arial, 'Helvetica Neue', Helvetica, sans-serif;">
									
									
										<fo:inline padding-left="15mm">Date:  <xsl:value-of select="response/curr_date"/>
										</fo:inline>
									   
										</fo:block>
										
									</fo:table-cell>
								</fo:table-row>
							
								<!-- </xsl:for-each> -->
							 	<!--<fo:table-row>
									<fo:table-cell>
										<fo:block font-size="11px"><xsl:value-of select="response/Agent_Name"/></fo:block>
									</fo:table-cell>
								</fo:table-row>-->
							 	<fo:table-row >
									<fo:table-cell >
										<fo:block margin-top="5mm" font-size="11px" font-family="Arial, 'Helvetica Neue', Helvetica, sans-serif;">
										<fo:inline padding-left="15mm"><xsl:value-of select="concat(normalize-space(response/Entity_Name), ',',' ', '#', normalize-space(response/agency_code))"/>
										</fo:inline></fo:block>
									</fo:table-cell>
								</fo:table-row>
								<fo:table-row>
									<fo:table-cell>
										<fo:block font-size="11px" font-family="Arial, 'Helvetica Neue', Helvetica, sans-serif;">
										<xsl:if test="not(response/personID)">
										<fo:inline padding-left="15mm">Attn:  <xsl:value-of select="response/hrp_fullname"/> 
										</fo:inline>
										</xsl:if>
										<!-- <xsl:else >
										<fo:inline padding-left="15mm">Appointee: <xsl:value-of select="response/Agent_Name"/>
										</fo:inline>
										</xsl:else> --></fo:block>
									</fo:table-cell>
								</fo:table-row>
								<fo:table-row>
									<fo:table-cell>
										<fo:block font-size="11px" font-family="Arial, 'Helvetica Neue', Helvetica, sans-serif;">
									 <xsl:if test="response/personID !='null' ">
										<fo:inline padding-left="15mm">Appointee: <xsl:value-of select="response/Agent_Name"/>
										</fo:inline>
										</xsl:if></fo:block>
									</fo:table-cell>
								</fo:table-row>
								<fo:table-row>
									<fo:table-cell>
										<fo:block font-size="11px" font-family="Arial, 'Helvetica Neue', Helvetica, sans-serif;">
										<fo:inline padding-left="15mm">
										<xsl:if test="response/Agent_Address2 !='' ">
                                        <xsl:value-of select="concat(normalize-space(response/Agent_Address1), ',',' ',normalize-space(response/Agent_Address2))"/>
                                         </xsl:if>
                                         <xsl:if test="response/Agent_Address2 ='' ">
                                         <xsl:value-of select="response/Agent_Address1"/>
                                         </xsl:if>
										</fo:inline>
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
								<!-- <fo:table-row>
									<fo:table-cell>
										<fo:block font-size="11px" font-family="Arial, 'Helvetica Neue', Helvetica, sans-serif;">
										<fo:inline padding-left="15mm"><xsl:value-of select="response/Agent_Address2"/>
										</fo:inline>
										</fo:block>
									</fo:table-cell>
								</fo:table-row -->>
								<fo:table-row>
									<fo:table-cell>
										<fo:block font-size="11px" font-family="Arial, 'Helvetica Neue', Helvetica, sans-serif;">
										<fo:inline padding-left="15mm"><xsl:value-of select="normalize-space(response/agencyCityStateZip)"/>
										</fo:inline></fo:block>
									</fo:table-cell>
								</fo:table-row>
								
					  		</fo:table-body>
					  		
						</fo:table>
						
					</fo:block>
					
					<fo:block margin-top="25px">
						<fo:table>
							<fo:table-column/>
							<fo:table-body>
								<fo:table-row>
									<fo:table-cell>
										<fo:block font-size="11px" font-family="Arial, 'Helvetica Neue', Helvetica, sans-serif;">
										<fo:inline padding-left="15mm">Appointment date: 
										<xsl:value-of select="response/curr_date"/>
										</fo:inline></fo:block>
									</fo:table-cell>
								</fo:table-row>
							</fo:table-body>	
						</fo:table>
					</fo:block>
					<fo:block margin-top="12px">
						<fo:table>
							<fo:table-column/>
							<fo:table-body>
								<fo:table-row>
									<fo:table-cell>
										<fo:block font-size="11px" font-family="Arial, 'Helvetica Neue', Helvetica, sans-serif;">
										<fo:inline padding-left="15mm">Re: Appointment\Authorization with Builders Mutual Insurance Company
										</fo:inline></fo:block>
									</fo:table-cell>
								</fo:table-row>
							</fo:table-body>	
						</fo:table>
					</fo:block>
					
					<fo:block margin-top="25px">
						<fo:table>
							<fo:table-column/>
							<fo:table-body>
								<fo:table-row>
									<fo:table-cell  padding-left="15mm">
										<fo:block font-size="11px" font-family="Arial, 'Helvetica Neue', Helvetica, sans-serif;">
										<xsl:if test="not(response/personID)">
										The Appointment(s) for  <xsl:value-of select="concat(normalize-space(response/Entity_Name), ',', ' ' ,'#', normalize-space(response/agency_code))"/> have been sent to the following states listed below.
										</xsl:if></fo:block>
										<fo:block font-size="11px" font-family="Arial, 'Helvetica Neue', Helvetica, sans-serif;">
										<xsl:if test="response/personID !='null' ">
										We’ve received and processed your appointment request with <xsl:value-of select="concat(normalize-space(response/Entity_Name), ',', ' ', '#', normalize-space(response/agency_code),'.')"/> The Appointment(s)\Authorization(s) for <xsl:value-of select="response/Agent_Name"/> have been sent to the following states listed below.
										</xsl:if></fo:block>
									</fo:table-cell>
								</fo:table-row>
							</fo:table-body>	
						</fo:table>
					</fo:block>
					
					<fo:block margin-top="20px" margin-left="15mm">
					<xsl:if test="not(response/personID)">
							
						<fo:table border="0.1pt solid black" width="100%">
							<fo:table-column></fo:table-column>	    		         
							<fo:table-column></fo:table-column>
							<fo:table-column></fo:table-column>
							<fo:table-column></fo:table-column>
							<fo:table-column></fo:table-column>
						 	<fo:table-body>
						 		<fo:table-row border="0.1pt solid black">
									<fo:table-cell border="0.1pt solid black">
										<fo:block font-size="11px" font-family="Arial, 'Helvetica Neue', Helvetica, sans-serif;" font-weight="bold" padding-start="5px" padding-top="3px" padding-bottom="3px" margin-right="15mm" text-align="center">Company</fo:block>
									</fo:table-cell>
									<fo:table-cell border="0.1pt solid black">
										<fo:block font-size="11px" font-family="Arial, 'Helvetica Neue', Helvetica, sans-serif;" font-weight="bold" padding-start="5px" padding-top="3px" padding-bottom="3px" margin-right="15mm" text-align="center">State</fo:block>
									</fo:table-cell>
									
									
									
									
									
									<fo:table-cell border="0.1pt solid black">
										<fo:block font-size="11px" font-family="Arial, 'Helvetica Neue', Helvetica, sans-serif;" font-weight="bold" padding-start="5px" padding-top="3px" padding-bottom="3px" margin-right="15mm" text-align="center">LOA #</fo:block>
									</fo:table-cell>
									
									<fo:table-cell border="0.1pt solid black">
										<fo:block font-size="11px" font-family="Arial, 'Helvetica Neue', Helvetica, sans-serif;" font-weight="bold" padding-start="5px" padding-top="3px" padding-bottom="3px" margin-right="15mm" text-align="center">License #</fo:block>
									</fo:table-cell> 
									<fo:table-cell border="0.1pt solid black">
										<fo:block font-size="11px" font-family="Arial, 'Helvetica Neue', Helvetica, sans-serif;" font-weight="bold" padding-start="5px" padding-top="3px" padding-bottom="3px" margin-right="15mm" text-align="center">Effective Date</fo:block>
									</fo:table-cell>
								</fo:table-row>
								<xsl:for-each select="response/appointment_letter_list_01/data">
									<fo:table-row border="0.1pt solid black">
										<fo:table-cell border="0.1pt solid black">
											<fo:block font-size="11px" margin-left="-12mm">
											<xsl:value-of select="company"/>
											</fo:block>
										</fo:table-cell>
										<fo:table-cell border="0.1pt solid black">
											<fo:block font-size="11px" font-family="Arial, 'Helvetica Neue', Helvetica, sans-serif;" padding-start="5px" padding-top="3px" padding-bottom="3px" margin-right="15mm" text-align="center">
												<xsl:value-of select="abbreviation"/>
											</fo:block>
										</fo:table-cell>
										
										<fo:table-cell border="0.1pt solid black">
											<fo:block font-size="11px" margin-left="-12mm">
											<xsl:value-of select="description"/>
											</fo:block>
										</fo:table-cell>
										<fo:table-cell border="0.1pt solid black">
											<fo:block font-size="11px" font-family="Arial, 'Helvetica Neue', Helvetica, sans-serif;" padding-start="5px" padding-top="3px" padding-bottom="3px" margin-right="15mm" text-align="center">
												<xsl:value-of select="license"></xsl:value-of>
											</fo:block>
										</fo:table-cell>
										
										<fo:table-cell border="0.1pt solid black">
											<fo:block font-size="11px" font-family="Arial, 'Helvetica Neue', Helvetica, sans-serif;" padding-start="5px" padding-top="3px" padding-bottom="3px" margin-right="15mm" text-align="center">
												<xsl:value-of select="effective_date"/>
											</fo:block>
										</fo:table-cell>
									</fo:table-row>
								</xsl:for-each>
						 	</fo:table-body>
						</fo:table>
						</xsl:if>
						<xsl:if test="response/personID !='null' ">
						<fo:table border="0.1pt solid black" width="100%">
							<fo:table-column></fo:table-column>	    		         
							<fo:table-column></fo:table-column>
							<fo:table-column></fo:table-column>
							<fo:table-column></fo:table-column>
							<fo:table-column></fo:table-column>
							<fo:table-column></fo:table-column>
						 	<fo:table-body>
						 		<fo:table-row border="0.1pt solid black">
									<fo:table-cell border="0.1pt solid black">
										<fo:block font-size="11px" font-family="Arial, 'Helvetica Neue', Helvetica, sans-serif;" font-weight="bold" padding-start="5px" padding-top="3px" padding-bottom="3px" margin-right="15mm" text-align="center">Company</fo:block>
									</fo:table-cell>
									<fo:table-cell border="0.1pt solid black">
										<fo:block font-size="11px" font-family="Arial, 'Helvetica Neue', Helvetica, sans-serif;" font-weight="bold" padding-start="5px" padding-top="3px" padding-bottom="3px" margin-right="15mm" text-align="center">State</fo:block>
									</fo:table-cell>
									
									<fo:table-cell border="0.1pt solid black">
										<fo:block font-size="11px" font-family="Arial, 'Helvetica Neue', Helvetica, sans-serif;" font-weight="bold" padding-start="5px" padding-top="3px" padding-bottom="3px" margin-right="15mm" text-align="center">LOA</fo:block>
									</fo:table-cell>
									
									<fo:table-cell border="0.1pt solid black">
										<fo:block font-size="11px" font-family="Arial, 'Helvetica Neue', Helvetica, sans-serif;" font-weight="bold" padding-start="5px" padding-top="3px" padding-bottom="3px" margin-right="15mm" text-align="center">NPN</fo:block>
									</fo:table-cell>
									
									<fo:table-cell border="0.1pt solid black">
										<fo:block font-size="11px" font-family="Arial, 'Helvetica Neue', Helvetica, sans-serif;" font-weight="bold" padding-start="5px" padding-top="3px" padding-bottom="3px" margin-right="15mm" text-align="center">License #</fo:block>
									</fo:table-cell>
									
									<fo:table-cell border="0.1pt solid black">
										<fo:block font-size="11px" font-family="Arial, 'Helvetica Neue', Helvetica, sans-serif;" font-weight="bold" padding-start="5px" padding-top="3px" padding-bottom="3px" margin-right="15mm" text-align="center">Effective Date</fo:block>
									</fo:table-cell>
								</fo:table-row>
								<xsl:for-each select="response/appointment_letter_list_01/data">
									<fo:table-row border="0.1pt solid black">
										<fo:table-cell border="0.1pt solid black">
											<fo:block font-size="11px" margin-left="-12mm">
											<xsl:value-of select="company"/>
											</fo:block>
										</fo:table-cell>
										<fo:table-cell border="0.1pt solid black">
											<fo:block font-size="11px" font-family="Arial, 'Helvetica Neue', Helvetica, sans-serif;" padding-start="5px" padding-top="3px" padding-bottom="3px" margin-right="15mm" text-align="center">
												<xsl:value-of select="abbreviation"/>
											</fo:block>
										</fo:table-cell>
										
										<fo:table-cell border="0.1pt solid black">
											<fo:block font-size="11px" margin-left="-12mm">
											<xsl:value-of select="description"/>
											</fo:block>
										</fo:table-cell>
										<fo:table-cell border="0.1pt solid black">
											<fo:block font-size="11px" font-family="Arial, 'Helvetica Neue', Helvetica, sans-serif;" padding-start="5px" padding-top="3px" padding-bottom="3px" margin-right="15mm" text-align="center">
												<xsl:value-of select="prdcr_cde"/>
											</fo:block>
										</fo:table-cell>
										
										<fo:table-cell border="0.1pt solid black">
											<fo:block font-size="11px" font-family="Arial, 'Helvetica Neue', Helvetica, sans-serif;" padding-start="5px" padding-top="3px" padding-bottom="3px" margin-right="15mm" text-align="center">
												<xsl:value-of select="license_num"></xsl:value-of>
											</fo:block>
										</fo:table-cell>
										<fo:table-cell border="0.1pt solid black">
											<fo:block font-size="11px" font-family="Arial, 'Helvetica Neue', Helvetica, sans-serif;" padding-start="5px" padding-top="3px" padding-bottom="3px" margin-right="15mm" text-align="center">
												<xsl:value-of select="effective_date"/>
											</fo:block>
										</fo:table-cell>
									</fo:table-row>
								</xsl:for-each>
						 	</fo:table-body>
						</fo:table>
						</xsl:if>
					</fo:block>
					
					<fo:block margin-top="55px">
						<fo:table>
							<fo:table-column></fo:table-column>	    		         
							<fo:table-column></fo:table-column>
							<fo:table-body >
								<fo:table-row>
									<fo:table-cell padding-left="15mm" >
										<!--<fo:block font-size="11px">Should you have any further questions, please do not hesitate to contact me directly at <xsl:value-of select="response/adminPhone"/></fo:block>-->
										<fo:block font-size="11px" font-family="Arial, 'Helvetica Neue', Helvetica, sans-serif;">Sincerely,</fo:block>
									</fo:table-cell>
								</fo:table-row>
								
							</fo:table-body>	
						</fo:table>
					</fo:block>
		
					<fo:block margin-top="15px" margin-bottom="5px">
						<fo:table>
						  		         
							<fo:table-body >
					            <fo:table-row>
					              <fo:table-cell border-after-width="4px" padding-left="15mm">
                                      <fo:block>
                                      <fo:external-graphic src="images/bmicLogo2.jpg" content-height="60px" content-width="80px"/>
                                   </fo:block>
                                  </fo:table-cell>
                                  
									<fo:table-cell padding-left="-60mm">
										<fo:block font-size="11px" font-family="Arial, 'Helvetica Neue', Helvetica, sans-serif;">Sales Support</fo:block>
										
										<fo:block font-size="9px" font-family="Arial, 'Helvetica Neue', Helvetica, sans-serif;" text-decoration="underline" color="blue">salessupport@bmico.com</fo:block>
										<fo:block margin-top="15px" font-size="9px" font-weight="bold" font-family="Arial, 'Helvetica Neue', Helvetica, sans-serif;" color="red">CONTACT CENTER</fo:block>
										<fo:block font-size="9px" font-family="Arial, 'Helvetica Neue', Helvetica, sans-serif;">800-809-4859, M-F 8am-6pm ET</fo:block>
										<fo:block font-size="9px" font-weight="bold" font-family="Arial, 'Helvetica Neue', Helvetica, sans-serif;">buildersmutual.com</fo:block>
										<fo:block font-size="9px" font-family="Arial, 'Helvetica Neue', Helvetica, sans-serif;" color="blue" > 
										<fo:inline text-decoration="underline">Facebook </fo:inline> | <fo:inline text-decoration="underline"> LinkedIn </fo:inline> |<fo:inline text-decoration="underline"> YouTube </fo:inline> </fo:block>
								
									</fo:table-cell>
								</fo:table-row>
								
					</fo:table-body>
					</fo:table>
					</fo:block>
					
					
					<fo:block >
						<fo:table>
							<fo:table-column/>
							<fo:table-body >
					<fo:table-row>
									<fo:table-cell margin-top="15mm" padding-left="15mm">
										<!-- <fo:block font-size="11px">or e-mail at <fo:inline font-weight="bold"><xsl:value-of select="response/adminSupportMail"/></fo:inline>.</fo:block>-->
										<fo:block font-size="11px" font-family="Arial, 'Helvetica Neue', Helvetica, sans-serif;">Nothing in this email shall commit BMIC to any purchase, sale, contract or other course of action.</fo:block>
									</fo:table-cell>
								</fo:table-row>
					</fo:table-body>
					</fo:table>
					</fo:block>
					
					<fo:block margin-top="15px" >
						<fo:table>
							<fo:table-column/>
							<fo:table-body >
					<fo:table-row>
									<fo:table-cell margin-top="10mm" padding-left="15mm">
										<!-- <fo:block font-size="11px">or e-mail at <fo:inline font-weight="bold"><xsl:value-of select="response/adminSupportMail"/></fo:inline>.</fo:block>-->
										<fo:block font-size="11px" font-style="italic">This document shall be retained while your appointment is in effect and for at least 5 years after the termination of your appointment.</fo:block>
									</fo:table-cell>
								</fo:table-row>
								
							</fo:table-body>	
						</fo:table>
					</fo:block>
					
					<!--<fo:block margin-top="35px">
						<fo:table>
							<fo:table-column/>
							<fo:table-body>
								<fo:table-row>
									<fo:table-cell>
										<fo:block font-size="11px">Sincerely,</fo:block>
									</fo:table-cell>
								</fo:table-row>
							</fo:table-body>	
						</fo:table>
					</fo:block>
					
					<fo:block margin-top="20px">
						<fo:table>
							<fo:table-column/>
							<fo:table-body>
								<fo:table-row>
									<fo:table-cell>
										<fo:block font-size="11px"><xsl:value-of select="response/user_name"/></fo:block>
									</fo:table-cell>
								</fo:table-row>
							</fo:table-body>	
						</fo:table>
					</fo:block>
					
					--><!--<fo:block margin-top="15px">
						<fo:table>
							<fo:table-column></fo:table-column>
							<fo:table-column></fo:table-column>
							<fo:table-body>
								<fo:table-row>
									<fo:table-cell width="15px"><fo:block font-size="11px" font-family="Arial, 'Helvetica Neue', Helvetica, sans-serif;">cc : </fo:block></fo:table-cell>
									<fo:table-cell>
										<fo:block>
											<fo:table>
												<fo:table-column/>
												<fo:table-body>
													<fo:table-row>
														<fo:table-cell>
															<fo:block font-size="11px"><xsl:value-of select="response/agentname"/></fo:block>
														</fo:table-cell>
													</fo:table-row>
												 	<fo:table-row>
														<fo:table-cell>
															<fo:block font-size="11px"><xsl:value-of select="response/agencyname"/></fo:block>
														</fo:table-cell>
													</fo:table-row>
													<fo:table-row>
														<fo:table-cell>
															<fo:block font-size="11px"><xsl:value-of select="response/addressMap/data/addressline1"/></fo:block>
														</fo:table-cell>
													</fo:table-row>
													<fo:table-row>
														<fo:table-cell>
															<fo:block font-size="11px"><xsl:value-of select="response/addressMap/data/addressline2"/></fo:block>
														</fo:table-cell>
													</fo:table-row>
													<fo:table-row>
														<fo:table-cell>
															<fo:block font-size="11px"><xsl:value-of select="response/addressMap/data/city"/>&#160;</fo:block>
														</fo:table-cell>
													</fo:table-row>
													<fo:table-row>
														<fo:table-cell>
															<fo:block font-size="11px"><xsl:value-of select="response/addressMap/data/description"></xsl:value-of>&#160;<xsl:value-of select="response/addressMap/data/zip"/></fo:block>
														</fo:table-cell>
													</fo:table-row>
										  		</fo:table-body>
											</fo:table>
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
							</fo:table-body>
						</fo:table>
						
					</fo:block>-->
				</fo:flow>	
				
				
			</fo:page-sequence>
		</fo:root>
	</xsl:template>			

</xsl:stylesheet>	
