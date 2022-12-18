<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.1"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:fo="http://www.w3.org/1999/XSL/Format"
	exclude-result-prefixes="fo"
	xmlns:fn="http://www.w3.org/2005/02/xpath-functions"
	xmlns:java="java">
 
	<xsl:template match="/" name="backgroundCheckFormMultiple">
		
		<fo:block margin-top="5mm">
			<fo:block font-family="Arial" font-size="12px" font-weight="bold" text-align="center">
				AUTHORIZATION TO CONDUCT BACKGROUND INVESTIGATION
			</fo:block>
			<!-- 48682 DocuSign Feature START -->
			<fo:block margin-top="5mm">
            <fo:table border="0.0pt solid black">
               <fo:table-column />
               <fo:table-column />
               <fo:table-body>
                  <fo:table-row height="5mm">
                     <fo:table-cell width="150pt">
                        <fo:block font-size="9px" font-family="Arial" font-weight="bold">
                           <fo:inline>Agent Background Questions</fo:inline>
                        </fo:block>
                     </fo:table-cell>
                     <fo:table-cell>
                        <fo:block />
                     </fo:table-cell>
                  </fo:table-row>
               </fo:table-body>
            </fo:table>
         </fo:block>
         <fo:block margin-top="5mm">
            <fo:table border="1.0pt solid black">
               <fo:table-column />
               <fo:table-column />
               <fo:table-column />
               <fo:table-body>
                  <xsl:for-each select="response/agentQuestions_list_1/data">
                     <fo:table-row border="1.0pt solid black">
                        <fo:table-cell width="400pt" border="1.0pt solid black" padding-start="5px" padding-top="3px" padding-bottom="3px">
                           <fo:block font-size="8px" font-family="Arial">
                            <!--   <xsl:value-of select="position()" /> -->
                              
                              <xsl:value-of select="question" />
                           </fo:block>
                        </fo:table-cell>
                        <fo:table-cell border="1.0pt solid black" padding-top="15px" padding-bottom="15px">
                              <fo:block font-size="1px" font-family="Arial" color="white" text-align="center">
								<xsl:value-of select="questionid"/>#<xsl:value-of select="../../person_id"/>_CUSTOM_TAB_IDENTFIER_CUSTOM_RADIO_Y
							  </fo:block>
                        </fo:table-cell>
						<fo:table-cell border="1.0pt solid black" padding-top="15px" padding-bottom="15px">
							<fo:block font-size="1px" font-family="Arial" color="white" text-align="center">
	                            <xsl:value-of select="questionid" />#<xsl:value-of select="../../person_id"/>_CUSTOM_TAB_IDENTFIER_CUSTOM_RADIO_N
	                        </fo:block>
                        </fo:table-cell>
                     </fo:table-row>
                     
                    <fo:table-row border="1.0pt solid black">
                        <fo:table-cell border="1.0pt solid black" width="300pt" padding-start="5px" padding-top="3px" padding-bottom="3px" number-columns-spanned="3">
                            <fo:block font-size="8px" font-family="Arial">
                                 Comments :   
                            </fo:block>
							<fo:block font-size="8px" font-family="Arial" color="white">
								<xsl:value-of select="questionid" />#<xsl:value-of select="../../person_id"/>_CUSTOM_TAB_IDENTFIER_CUSTOM_COMMENTS
							</fo:block>
                        </fo:table-cell>
                    </fo:table-row>
                    
                  </xsl:for-each>
               </fo:table-body>
            </fo:table>
         </fo:block>
         <fo:block break-after="page" />
         <!-- 48682 DocuSign Feature END -->
			<fo:block font-family="Arial" font-size="9px" margin-top="10mm">
				I hereby acknowledge that I have received and reviewed a notice that a Consumer Report may be prepared on me for Agency/Agent Appointment Purposes
				as defined in the Fair Credit Reporting Act. I hereby authorize <fo:inline font-weight="bold">Builders Mutual Insurance Company</fo:inline>  
				or any contact(s) acting on their behalf to obtain a Consumer Report on me and to investigate my character and background for the purpose of determining my suitability as a 
				<fo:inline font-weight="bold"><xsl:value-of select="companyname"/></fo:inline> Individual/Broker and complying with any applicable state and/or federal law.
			</fo:block>
			<fo:block font-family="Arial" font-size="9px" margin-top="5mm">	
				I release <fo:inline font-weight="bold">Builders Mutual Insurance Company</fo:inline> and any person(s) acting on its behalf from any and all liability from obtaining or providing information
				related to my character and background.
			</fo:block>
			<fo:block font-family="Arial" font-size="9px" margin-top="25.3mm">
				<fo:table>
					<fo:table-column></fo:table-column>
					<fo:table-column></fo:table-column>
					<fo:table-column></fo:table-column>
					<fo:table-body>
						<fo:table-row height="5mm">
							<fo:table-cell width="80pt">
								<fo:block>Signature :
								</fo:block>
							</fo:table-cell>
							<fo:table-cell width="180pt">
								<fo:block>
									<fo:inline text-decoration="underline" font-weight="bold" font-size="10px">
									<fo:inline color="white">
										<fo:block><xsl:value-of select="response/AGENT_SIGNER_IDENTIFIER"/></fo:block>
									 </fo:inline>
								 </fo:inline>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell>
								<fo:block>Date : &#160;&#160;&#160; 
									<fo:inline text-decoration="underline" font-weight="bold" font-size="10px">
										<fo:inline color="white"  >
											<fo:block><xsl:value-of select="response/AGENT_DATE_IDENTIFIER"/></fo:block>
										 </fo:inline>
									 </fo:inline>
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						<fo:table-row height="5mm">
							<fo:table-cell>
								<fo:block>Print Name : </fo:block>
							</fo:table-cell>
							<fo:table-cell number-columns-spanned="2">
								<fo:block><xsl:value-of select="printname"/></fo:block>
							</fo:table-cell>
						</fo:table-row>
						<fo:table-row height="5mm">
							<fo:table-cell>
								<fo:block>Company Name : </fo:block>
							</fo:table-cell>
							<fo:table-cell number-columns-spanned="2">
								<fo:block><xsl:value-of select="companyname"/></fo:block>
							</fo:table-cell>
						</fo:table-row>
					</fo:table-body>
				</fo:table>		
			</fo:block>
			
		</fo:block>
	</xsl:template>
</xsl:stylesheet>	
