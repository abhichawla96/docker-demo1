<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.1"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format"
	exclude-result-prefixes="fo" xmlns:fn="http://www.w3.org/2005/02/xpath-functions"
	xmlns:java="java">
	<xsl:output method="xml" indent="no" />
	<xsl:template match="/" name="applicationForm">
		<fo:block>
			<fo:block>
				<fo:table>
					<fo:table-column />
					<fo:table-body>
						<fo:table-row>
							<fo:table-cell>
							<xsl:if test="response/registration_type_code='PRAG' or response/registration_type_code='SCAG'">
								<fo:block font-size="12px" font-family="Arial"
									font-weight="bold" text-align="center">AGENCY/BROKERAGE PRINCIPAL/KEY CONTACT/PRODUCER INFORMATION</fo:block>
									</xsl:if>
										<xsl:if test="response/registration_type_code='PRERG'">
								<fo:block font-size="12px" font-family="Arial"
									font-weight="bold" text-align="center">PRODUCER APPLICATION FOR
									APPOINTMENT</fo:block>
									</xsl:if>
							</fo:table-cell>
						</fo:table-row>
					</fo:table-body>
				</fo:table>
			</fo:block>

			<fo:block margin-top="5mm">
				<fo:table border="0.0pt solid black">
					<fo:table-column border="0.0pt solid black"
						column-width="270pt" />
					<fo:table-column border="0.0pt solid black"
						column-width="190pt" />

					<fo:table-body>
						<fo:table-row border="0.0pt solid black" height="5mm">
							<fo:table-cell border="0.0pt solid black">
								<fo:table border="0.0pt solid black">
									<fo:table-column column-width="130pt" />
									<fo:table-column column-width="220pt" />
									<fo:table-body>
										<fo:table-row border="0.0pt solid black" height="5mm">
											<fo:table-cell border="0.0pt solid black">
												<fo:table border="0.0pt solid black">
													<fo:table-column />
													<fo:table-body>
														<fo:table-row border="0.0pt solid black"
															height="5mm">
															<fo:table-cell border="0.0pt solid black">
																<fo:block font-size="8px" font-family="Arial"
																	font-weight="bold" text-decoration="underline">General Information
																</fo:block>
															</fo:table-cell>
														</fo:table-row>
													</fo:table-body>
												</fo:table>
											</fo:table-cell>
											<fo:table-cell border="0.0pt solid black">
												<fo:table border="0.0pt solid black">
													<fo:table-column />
													<fo:table-body>
														<fo:table-row border="0.0pt solid black"
															height="5mm">
															<fo:table-cell border="0.0pt solid black">
																<fo:block font-size="8px" font-family="Arial"></fo:block>
															</fo:table-cell>
														</fo:table-row>
													</fo:table-body>
												</fo:table>
											</fo:table-cell>

										</fo:table-row>
										<fo:table-row border="0.0pt solid black" height="5mm">
											<fo:table-cell border="0.0pt solid black">
												<fo:table border="0.0pt solid black">
													<fo:table-column />
													<fo:table-body>
														<fo:table-row border="0.0pt solid black"
															height="5mm">
															<fo:table-cell border="0.0pt solid black">
																<fo:block font-size="8px" font-family="Arial">Agency
																	Name : </fo:block>
															</fo:table-cell>
														</fo:table-row>
													</fo:table-body>
												</fo:table>
											</fo:table-cell>
											<fo:table-cell border="0.0pt solid black" padding-bottom="3mm">
												<fo:table border="0.0pt solid black">
													<fo:table-column />
													<fo:table-body>
														<fo:table-row border="0.0pt solid black"
															height="5mm">
															<fo:table-cell border="0.0pt solid black" width="1.8in">
																<fo:block font-size="8px" font-family="Arial"
																	>
																	<xsl:value-of select="response/aar_agencyname"></xsl:value-of>
																</fo:block>
															</fo:table-cell>
														</fo:table-row>
													</fo:table-body>
												</fo:table>
											</fo:table-cell>

										</fo:table-row>
										
										<!-- <xsl:if test="response/registration_type_code='PRERG'">
										<xsl:if test="response/extendedField_list_1 !='' ">
										<xsl:for-each select="response/extendedField_list_1/data">
										<fo:table-row border="0.0pt solid black" height="5mm">
											<fo:table-cell border="0.0pt solid black">
												<fo:table border="0.0pt solid black">
													<fo:table-column />
													<fo:table-body>
														<fo:table-row border="0.0pt solid black"
															height="5mm">
															<fo:table-cell border="0.0pt solid black">
																<fo:block font-size="8px" font-family="Arial">Are you a member of an HBA:
																	</fo:block>
															</fo:table-cell>
														</fo:table-row>
													</fo:table-body>
												</fo:table>
											</fo:table-cell>
											<fo:table-cell border="0.0pt solid black" padding-bottom="3mm">
												<fo:table border="0.0pt solid black">
													<fo:table-column />
													<fo:table-body>
														<fo:table-row border="0.0pt solid black"
															height="5mm">
															<fo:table-cell border="0.0pt solid black" width="1.8in">
																<xsl:if test="member_of_hba='N'">
																<fo:block font-size="8px" font-family="Arial">
																	No
																</fo:block>
																</xsl:if>
																<xsl:if test="member_of_hba='Y'">
																<fo:block font-size="8px" font-family="Arial">
																	Yes
																</fo:block>
																</xsl:if>
															</fo:table-cell>
														</fo:table-row>
													</fo:table-body>
												</fo:table>
											</fo:table-cell>

										</fo:table-row>
										</xsl:for-each>
										</xsl:if>
										</xsl:if> -->
										
										
										<xsl:if test="response/registration_type_code='PRERG'">
										<fo:table-row border="0.0pt solid black" height="5mm">
											<fo:table-cell border="0.0pt solid black">
												<fo:table border="0.0pt solid black">
													<fo:table-column />
													<fo:table-body>
														<fo:table-row border="0.0pt solid black"
															height="5mm">
															<fo:table-cell border="0.0pt solid black">
																<fo:block font-size="8px" font-family="Arial">Registration Type:
																	</fo:block>
															</fo:table-cell>
														</fo:table-row>
													</fo:table-body>
												</fo:table>
											</fo:table-cell>
											<fo:table-cell border="0.0pt solid black" padding-bottom="-3mm">
												<fo:table border="0.0pt solid black">
													<fo:table-column />
													<fo:table-body>
														<fo:table-row border="0.0pt solid black"
															height="5mm">
															<fo:table-cell border="0.0pt solid black" width="1.8in">
																<fo:block font-size="8px" font-family="Arial"
																	>
																	Producer Registration
																</fo:block>
															</fo:table-cell>
														</fo:table-row>
													</fo:table-body>
												</fo:table>
											</fo:table-cell>

										</fo:table-row>
										</xsl:if>
										
										<xsl:if test="response/registration_type_code='PRAG' or response/registration_type_code='SCAG'">
										<fo:table-row border="0.0pt solid black" height="5mm">
											<fo:table-cell border="0.0pt solid black">
												<fo:table border="0.0pt solid black">
													<fo:table-column />
													<fo:table-body>
														<fo:table-row border="0.0pt solid black"
															height="5mm">
															<fo:table-cell border="0.0pt solid black">
																<fo:block font-size="8px" font-family="Arial">
																	IS DBA Registered with DOI : </fo:block>
															</fo:table-cell>
														</fo:table-row>
													</fo:table-body>
												</fo:table>
											</fo:table-cell>
											<fo:table-cell border="0.0pt solid black">
												<fo:table border="0.0pt solid black">
													<fo:table-column />
													<fo:table-body>
														<fo:table-row border="0.0pt solid black"
															height="5mm">
															<fo:table-cell border="0.0pt solid black">
															 <fo:block>
															  <xsl:if test="response/isdbaregistered=1">
																<fo:block font-size="8px" font-family="Arial"
																	wrap-option="wrap">
																	Y
																</fo:block>
															 </xsl:if>
															 
															 <xsl:if test="response/isdbaregistered=0">
																<fo:block font-size="8px" font-family="Arial"
																	wrap-option="wrap">
																	N
																</fo:block>
															 </xsl:if>
															 </fo:block>
															</fo:table-cell>
														</fo:table-row>
													</fo:table-body>
												</fo:table>
											</fo:table-cell>

										</fo:table-row>
										</xsl:if>
										
										
										
										
										
										
										
										
										<xsl:if test="response/registration_type_code='PRAG' or response/registration_type_code='SCAG'">
										<fo:table-row border="0.0pt solid black" height="5mm">
											<fo:table-cell border="0.0pt solid black">
												<fo:table border="0.0pt solid black">
													<fo:table-column />
													<fo:table-body>
														<fo:table-row border="0.0pt solid black"
															height="5mm">
															<fo:table-cell border="0.0pt solid black">
																<fo:block font-size="8px" font-family="Arial">
																	W-9 Legal Name : </fo:block>
															</fo:table-cell>
														</fo:table-row>
													</fo:table-body>
												</fo:table>
											</fo:table-cell>
											<fo:table-cell border="0.0pt solid black">
												<fo:table border="0.0pt solid black">
													<fo:table-column />
													<fo:table-body>
														<fo:table-row border="0.0pt solid black"
															height="5mm">
															<fo:table-cell border="0.0pt solid black">
															 <fo:block font-size="8px" font-family="Arial">
															 <xsl:value-of select="response/taxpayer_name"></xsl:value-of>
															 
															 </fo:block>
															</fo:table-cell>
														</fo:table-row>
													</fo:table-body>
												</fo:table>
											</fo:table-cell>

										</fo:table-row>
										</xsl:if>
										
										
										
										<!-- <xsl:if test="response/registration_type_code='PRAG' or response/registration_type_code='SCAG'">
										<fo:table-row border="0.0pt solid black" height="5mm">
											<fo:table-cell border="0.0pt solid black">
												<fo:table border="0.0pt solid black">
													<fo:table-column />
													<fo:table-body>
														<fo:table-row border="0.0pt solid black"
															height="5mm">
															<fo:table-cell border="0.0pt solid black">
																<fo:block font-size="8px" font-family="Arial">
																	Tax Payer Name : </fo:block>
															</fo:table-cell>
														</fo:table-row>
													</fo:table-body>
												</fo:table>
											</fo:table-cell>
											<fo:table-cell border="0.0pt solid black">
												<fo:table border="0.0pt solid black">
													<fo:table-column />
													<fo:table-body>
														<fo:table-row border="0.0pt solid black"
															height="5mm">
															<fo:table-cell border="0.0pt solid black" width="1.9in">
																<fo:block font-size="8px" font-family="Arial"
																	wrap-option="wrap">
																	<xsl:value-of select="response/taxpayer_name"></xsl:value-of>
																</fo:block>
															</fo:table-cell>
														</fo:table-row>
													</fo:table-body>
												</fo:table>
											</fo:table-cell>

										</fo:table-row>
										</xsl:if> -->
										
										<xsl:if test="response/registration_type_code='PRAG' or response/registration_type_code='SCAG'">
										<fo:table-row border="0.0pt solid black" height="5mm">
											<fo:table-cell border="0.0pt solid black">
												<fo:table border="0.0pt solid black">
													<fo:table-column />
													<fo:table-body>
														<fo:table-row border="0.0pt solid black"
															height="5mm">
															<fo:table-cell border="0.0pt solid black">
																<fo:block font-size="8px" font-family="Arial">
																	Lines of Business : </fo:block>
															</fo:table-cell>
														</fo:table-row>
													</fo:table-body>
												</fo:table>
											</fo:table-cell>
											<fo:table-cell border="0.0pt solid black">
												<fo:table border="0.0pt solid black">
													<fo:table-column />
													<fo:table-body>
														<fo:table-row border="0.0pt solid black" height="5mm">
															<fo:table-cell border="0.0pt solid black">
																<fo:block>
																 <xsl:if test="response/agency_lob=1">
																<fo:block font-size="8px" font-family="Arial"
																	wrap-option="wrap">
																	Commercial Lines
																</fo:block>
															 </xsl:if>
															 <xsl:if test="response/agency_lob2=1">
																<fo:block font-size="8px" font-family="Arial"
																	wrap-option="wrap">
																	Commercial Lines
																</fo:block>
															 </xsl:if>
															 </fo:block>
															</fo:table-cell>
														</fo:table-row>
													</fo:table-body>
												</fo:table>
											</fo:table-cell>

										</fo:table-row>
										</xsl:if>
										
										<xsl:if test="response/registration_type_code='PRAG' or response/registration_type_code='SCAG'">										
										<fo:table-row border="0.0pt solid black" height="5mm">
											<fo:table-cell border="0.0pt solid black">
												<fo:table border="0.0pt solid black">
													<fo:table-column />
													<fo:table-body>
														<fo:table-row border="0.0pt solid black"
															height="5mm">
															<fo:table-cell border="0.0pt solid black">
																<fo:block font-size="8px" font-family="Arial">DBA :
																</fo:block>
															</fo:table-cell>
														</fo:table-row>
													</fo:table-body>
												</fo:table>
											</fo:table-cell>
											<fo:table-cell border="0.0pt solid black">
												<fo:table border="0.0pt solid black">
													<fo:table-column />
													<fo:table-body>
														<fo:table-row border="0.0pt solid black"
															height="5mm">
															<fo:table-cell border="0.0pt solid black" width="1.8in">
																<fo:block font-size="8px" font-family="Arial">
																	<xsl:value-of select="response/dba"></xsl:value-of>
																</fo:block>
															</fo:table-cell>
														</fo:table-row>
													</fo:table-body>
												</fo:table>
											</fo:table-cell>

										</fo:table-row>
										</xsl:if>
										
										<xsl:if test="response/registration_type_code='PRAG' or response/registration_type_code='SCAG'">
										<xsl:if test="response/isHideISDBA='N'">
											<fo:table-row border="0.0pt solid black" height="5mm">
												<fo:table-cell border="0.0pt solid black">
													<fo:table border="0.0pt solid black">
														<fo:table-column />
														<fo:table-body>
															<fo:table-row border="0.0pt solid black"
																height="5mm">
																<fo:table-cell border="0.0pt solid black">
																	<fo:block font-size="8px" font-family="Arial">IS DBA
																		Registered with DOI : </fo:block>
																</fo:table-cell>
															</fo:table-row>
														</fo:table-body>
													</fo:table>
												</fo:table-cell>
												<fo:table-cell border="0.0pt solid black">
													<fo:table border="0.0pt solid black">
														<fo:table-column />
														<fo:table-body>
															<fo:table-row border="0.0pt solid black"
																height="5mm">
																<fo:table-cell border="0.0pt solid black">
																	<fo:block font-size="8px" font-family="Arial">
																		<xsl:value-of select="response/isdbaregistered_pdf"></xsl:value-of>
																	</fo:block>
																</fo:table-cell>
															</fo:table-row>
														</fo:table-body>
													</fo:table>
												</fo:table-cell>

											</fo:table-row>
										</xsl:if>
										</xsl:if>
										
										<xsl:if test="response/registration_type_code='PRAG' or response/registration_type_code='SCAG'">
										<fo:table-row border="0.0pt solid black" height="5mm">
											<fo:table-cell border="0.0pt solid black">
												<fo:table border="0.0pt solid black">
													<fo:table-column />
													<fo:table-body>
														<fo:table-row border="0.0pt solid black"
															height="5mm">
															<fo:table-cell border="0.0pt solid black">
																<fo:block font-size="8px" font-family="Arial">Corporate/Parent
																	Agency Name : </fo:block>
															</fo:table-cell>
														</fo:table-row>
													</fo:table-body>
												</fo:table>
											</fo:table-cell>
											<fo:table-cell border="0.0pt solid black">
												<fo:table border="0.0pt solid black">
													<fo:table-column />
													<fo:table-body>
														<fo:table-row border="0.0pt solid black"
															height="5mm">
															<fo:table-cell border="0.0pt solid black" width="1.8in">
																<fo:block font-size="8px" font-family="Arial">
																	<xsl:value-of select="response/entity_name"></xsl:value-of>
																</fo:block>
															</fo:table-cell>
														</fo:table-row>
													</fo:table-body>
												</fo:table>
											</fo:table-cell>

										</fo:table-row>
										</xsl:if>
										
										
										<xsl:if test="response/registration_type_code='PRAG' or response/registration_type_code='SCAG'">
										<fo:table-row border="0.0pt solid black" height="5mm">
											<fo:table-cell border="0.0pt solid black">
												<fo:table border="0.0pt solid black">
													<fo:table-column />
													<fo:table-body>
														<fo:table-row border="0.0pt solid black"
															height="5mm">
															<fo:table-cell border="0.0pt solid black">
																<fo:block font-size="8px" font-family="Arial">Legal
																	Form : </fo:block>
															</fo:table-cell>
														</fo:table-row>
													</fo:table-body>
												</fo:table>
											</fo:table-cell>
											<fo:table-cell border="0.0pt solid black">
												<fo:table border="0.0pt solid black">
													<fo:table-column />
													<fo:table-body>
														<fo:table-row border="0.0pt solid black"
															height="5mm">
															<fo:table-cell border="0.0pt solid black"
																width="100px">
																<fo:block font-size="8px" font-family="Arial">
																	<xsl:value-of select="response/legaldescription"></xsl:value-of>
																</fo:block>
															</fo:table-cell>
														</fo:table-row>
													</fo:table-body>
												</fo:table>
											</fo:table-cell>

										</fo:table-row>
</xsl:if>
										<xsl:if test="response/registration_type_code='PRAG' or response/registration_type_code='SCAG'">
										<xsl:if test="response/legaldescription ='Type Unknown'">
											<fo:table-row border="0.0pt solid black" height="5mm">
												<fo:table-cell border="0.0pt solid black">
													<fo:table border="0.0pt solid black">
														<fo:table-column />
														<fo:table-body>
															<fo:table-row border="0.0pt solid black"
																height="5mm">
																<fo:table-cell border="0.0pt solid black">
																	<fo:block font-size="8px" font-family="Arial"></fo:block>
																</fo:table-cell>
															</fo:table-row>
														</fo:table-body>
													</fo:table>
												</fo:table-cell>
												<fo:table-cell border="0.0pt solid black">
													<fo:table border="0.0pt solid black">
														<fo:table-column />
														<fo:table-body>
															<fo:table-row border="0.0pt solid black"
																height="5mm">
																<fo:table-cell border="0.0pt solid black" width="1.9in">
																	<fo:block font-size="8px" font-family="Arial">
																		<xsl:value-of select="response/aar_producertype"></xsl:value-of>
																	</fo:block>
																</fo:table-cell>
															</fo:table-row>
														</fo:table-body>
													</fo:table>
												</fo:table-cell>

											</fo:table-row>
										</xsl:if>
</xsl:if>
										<xsl:if test="response/registration_type_code='PRAG' or response/registration_type_code='SCAG'">
										<fo:table-row border="0.0pt solid black" height="5mm">
											<fo:table-cell border="0.0pt solid black">
												<fo:table border="0.0pt solid black">
													<fo:table-column />
													<fo:table-body>
														<fo:table-row border="0.0pt solid black"
															height="5mm">
															<fo:table-cell border="0.0pt solid black">
																<fo:block font-size="8px" font-family="Arial">FEIN/Tax
																	ID : </fo:block>
															</fo:table-cell>
														</fo:table-row>
													</fo:table-body>
												</fo:table>
											</fo:table-cell>
											<fo:table-cell border="0.0pt solid black">
												<fo:table border="0.0pt solid black">
													<fo:table-column />
													<fo:table-body>
														<fo:table-row border="0.0pt solid black"
															height="5mm">
															<fo:table-cell border="0.0pt solid black">
																<fo:block font-size="8px" font-family="Arial">
																	<xsl:value-of select="response/aar_taxid_pdf"></xsl:value-of>
																</fo:block>
															</fo:table-cell>
														</fo:table-row>
													</fo:table-body>
												</fo:table>
											</fo:table-cell>

										</fo:table-row>
										</xsl:if>
										
										<xsl:if test="response/registration_type_code='PRAG' or response/registration_type_code='SCAG'">
										<xsl:if test="response/isHideTaxPayerName='N'">
											<fo:table-row border="0.0pt solid black" height="5mm">
												<fo:table-cell border="0.0pt solid black">
													<fo:table border="0.0pt solid black">
														<fo:table-column />
														<fo:table-body>
															<fo:table-row border="0.0pt solid black"
																height="5mm">
																<fo:table-cell border="0.0pt solid black">
																	<fo:block font-size="8px" font-family="Arial">Tax
																		Payer Name : </fo:block>
																</fo:table-cell>
															</fo:table-row>
														</fo:table-body>
													</fo:table>
												</fo:table-cell>
												<fo:table-cell border="0.0pt solid black">
													<fo:table border="0.0pt solid black">
														<fo:table-column />
														<fo:table-body>
															<fo:table-row border="0.0pt solid black"
																height="5mm">
																<fo:table-cell border="0.0pt solid black">
																	<fo:block font-size="8px" font-family="Arial"
																		wrap-option="wrap">
																		<xsl:value-of select="response/taxpayer_name"></xsl:value-of>
																	</fo:block>
																</fo:table-cell>
															</fo:table-row>
														</fo:table-body>
													</fo:table>
												</fo:table-cell>

											</fo:table-row>
										</xsl:if>
										</xsl:if>
										<!-- <fo:table-row border="0.0pt solid black" height="5mm"> <fo:table-cell 
											border="0.0pt solid black"> <fo:table border="0.0pt solid black"> <fo:table-column/> 
											<fo:table-body> <fo:table-row border="0.0pt solid black" height="5mm"> <fo:table-cell 
											border="0.0pt solid black"> <fo:block font-size="8px" font-family="Arial">NPN 
											: </fo:block> </fo:table-cell> </fo:table-row> </fo:table-body> </fo:table> 
											</fo:table-cell> <fo:table-cell border="0.0pt solid black"> <fo:table border="0.0pt 
											solid black"> <fo:table-column/> <fo:table-body> <fo:table-row border="0.0pt 
											solid black" height="5mm"> <fo:table-cell border="0.0pt solid black"> <fo:block 
											font-size="8px" font-family="Arial"><xsl:value-of select="response/npn"></xsl:value-of></fo:block> 
											</fo:table-cell> </fo:table-row> </fo:table-body> </fo:table> </fo:table-cell> 
											</fo:table-row> -->
											
											<xsl:if test="response/registration_type_code='PRAG' or response/registration_type_code='SCAG'">
										<fo:table-row border="0.0pt solid black" height="5mm">
											<fo:table-cell border="0.0pt solid black">
												<fo:table border="0.0pt solid black">
													<fo:table-column />
													<fo:table-body>
														<fo:table-row border="0.0pt solid black"
															height="5mm">
															<fo:table-cell border="0.0pt solid black">
																<fo:block font-size="8px" font-family="Arial">
																	Agency Web Address : </fo:block>
															</fo:table-cell>
														</fo:table-row>
													</fo:table-body>
												</fo:table>
											</fo:table-cell>
											<fo:table-cell border="0.0pt solid black">
												<fo:table border="0.0pt solid black">
													<fo:table-column />
													<fo:table-body>
														<fo:table-row border="0.0pt solid black"
															height="5mm">
															<fo:table-cell border="0.0pt solid black" width="2in">
																<fo:block font-size="8px" font-family="Arial"
																	wrap-option="wrap">
																	<xsl:value-of select="response/aar_webaddress"></xsl:value-of>
																</fo:block>
															</fo:table-cell>
														</fo:table-row>
													</fo:table-body>
												</fo:table>
											</fo:table-cell>

										</fo:table-row>
										</xsl:if>
										
										<!-- <xsl:if test="response/registration_type_code='PRAG' or response/registration_type_code='SCAG'">
										<fo:table-row border="0.0pt solid black" height="5mm">
											<fo:table-cell border="0.0pt solid black">
												<fo:table border="0.0pt solid black">
													<fo:table-column />
													<fo:table-body>
														<fo:table-row border="0.0pt solid black"
															height="5mm">
															<fo:table-cell border="0.0pt solid black">
																<fo:block font-size="8px" font-family="Arial">
																	Date of Origination : </fo:block>
															</fo:table-cell>
														</fo:table-row>
													</fo:table-body>
												</fo:table>
											</fo:table-cell>
											<fo:table-cell border="0.0pt solid black">
												<fo:table border="0.0pt solid black">
													<fo:table-column />
													<fo:table-body>
														<fo:table-row border="0.0pt solid black"
															height="5mm">
															<fo:table-cell border="0.0pt solid black">
																<fo:block font-size="8px" font-family="Arial"
																	wrap-option="wrap">
																	<xsl:value-of select="response/agencyDateOf_origination"></xsl:value-of>
																</fo:block>
															</fo:table-cell>
														</fo:table-row>
													</fo:table-body>
												</fo:table>
											</fo:table-cell>

										</fo:table-row>
										</xsl:if> -->
										
										<xsl:if test="response/registration_type_code='PRAG' or response/registration_type_code='SCAG'">
										<xsl:if test="response/isHideAgencyEstablishedDate='N'">
											<fo:table-row border="0.0pt solid black" height="5mm">
												<fo:table-cell border="0.0pt solid black">
													<fo:table border="0.0pt solid black">
														<fo:table-column />
														<fo:table-body>
															<fo:table-row border="0.0pt solid black"
																height="5mm">
																<fo:table-cell border="0.0pt solid black">
																	<fo:block font-size="8px" font-family="Arial">
																		<xsl:value-of select="response/agencyEstablishedDateLabel"></xsl:value-of>
																		:
																	</fo:block>
																</fo:table-cell>
															</fo:table-row>
														</fo:table-body>
													</fo:table>
												</fo:table-cell>
												<fo:table-cell border="0.0pt solid black">
													<fo:table border="0.0pt solid black">
														<fo:table-column />
														<fo:table-body>
															<fo:table-row border="0.0pt solid black"
																height="5mm">
																<fo:table-cell border="0.0pt solid black">
																	<fo:block font-size="8px" font-family="Arial">
																		<xsl:value-of select="response/agencyestablished_date"></xsl:value-of>
																	</fo:block>
																</fo:table-cell>
															</fo:table-row>
														</fo:table-body>
													</fo:table>
												</fo:table-cell>
											</fo:table-row>
										</xsl:if>
										</xsl:if>
										
										<xsl:if test="response/registration_type_code='PRAG' or response/registration_type_code='SCAG'">
										<xsl:if test="response/isHideYrsInBusiness='N'">
											<fo:table-row border="0.0pt solid black" height="5mm">
												<fo:table-cell border="0.0pt solid black">
													<fo:table border="0.0pt solid black">
														<fo:table-column />
														<fo:table-body>
															<fo:table-row border="0.0pt solid black"
																height="5mm">
																<fo:table-cell border="0.0pt solid black">
																	<fo:block font-size="8px" font-family="Arial">Years in
																		Business :</fo:block>
																</fo:table-cell>
															</fo:table-row>
														</fo:table-body>
													</fo:table>
												</fo:table-cell>
												<fo:table-cell border="0.0pt solid black">
													<fo:table border="0.0pt solid black">
														<fo:table-column />
														<fo:table-body>
															<fo:table-row border="0.0pt solid black"
																height="5mm">
																<fo:table-cell border="0.0pt solid black">
																	<fo:block font-size="8px" font-family="Arial">
																		<xsl:value-of select="response/aar_yrsinbusiness"></xsl:value-of>
																	</fo:block>
																</fo:table-cell>
															</fo:table-row>
														</fo:table-body>
													</fo:table>
												</fo:table-cell>

											</fo:table-row>
										</xsl:if>
										</xsl:if>
										
										<xsl:if test="response/registration_type_code='PRAG' or response/registration_type_code='SCAG'">
										<fo:table-row border="0.0pt solid black" height="5mm">
											<fo:table-cell border="0.0pt solid black">
												<fo:table border="0.0pt solid black">
													<fo:table-column />
													<fo:table-body>
														<fo:table-row border="0.0pt solid black"
															height="5mm">
															<fo:table-cell border="0.0pt solid black">
																<fo:block font-size="8px" font-family="Arial">Years of
																	Current Ownership : </fo:block>
															</fo:table-cell>
														</fo:table-row>
													</fo:table-body>
												</fo:table>
											</fo:table-cell>
											<fo:table-cell border="0.0pt solid black">
												<fo:table border="0.0pt solid black">
													<fo:table-column />
													<fo:table-body>
														<fo:table-row border="0.0pt solid black"
															height="5mm">
															<fo:table-cell border="0.0pt solid black">
																<fo:block font-size="8px" font-family="Arial">
																	<xsl:value-of select="response/aar_expinyears"></xsl:value-of>
																</fo:block>
															</fo:table-cell>
														</fo:table-row>
													</fo:table-body>
												</fo:table>
											</fo:table-cell>

										</fo:table-row>
										</xsl:if>
										
										<!-- <xsl:if test="response/registration_type_code='PRAG' or response/registration_type_code='SCAG'">
										<fo:table-row border="0.0pt solid black" height="5mm">
											<fo:table-cell border="0.0pt solid black">
												<fo:table border="0.0pt solid black">
													<fo:table-column />
													<fo:table-body>
														<fo:table-row border="0.0pt solid black"
															height="5mm">
															<fo:table-cell border="0.0pt solid black">
																<fo:block font-size="8px" font-family="Arial">
																	Agency License Number : </fo:block>
															</fo:table-cell>
														</fo:table-row>
													</fo:table-body>
												</fo:table>
											</fo:table-cell>
											<fo:table-cell border="0.0pt solid black">
												<fo:table border="0.0pt solid black">
													<fo:table-column />
													<fo:table-body>
														<fo:table-row border="0.0pt solid black"
															height="5mm">
															<fo:table-cell border="0.0pt solid black">
																<fo:block font-size="8px" font-family="Arial">
																	<xsl:value-of select="response/aar_agencyLicenseNumber"></xsl:value-of>
																</fo:block>
															</fo:table-cell>
														</fo:table-row>
													</fo:table-body>
												</fo:table>
											</fo:table-cell>

										</fo:table-row>
										</xsl:if> -->
										
										<xsl:if test="response/registration_type_code='PRAG' or response/registration_type_code='SCAG'">
										<fo:table-row border="0.0pt solid black" height="5mm">
											<fo:table-cell border="0.0pt solid black">
												<fo:table border="0.0pt solid black">
													<fo:table-column />
													<fo:table-body>
														<fo:table-row border="0.0pt solid black"
															height="5mm">
															<fo:table-cell border="0.0pt solid black">
																<fo:block font-size="8px" font-family="Arial">
																	Agency Management System : </fo:block>
															</fo:table-cell>
														</fo:table-row>
													</fo:table-body>
												</fo:table>
											</fo:table-cell>
											<fo:table-cell border="0.0pt solid black">
												<fo:table border="0.0pt solid black">
													<fo:table-column />
													<fo:table-body>
														<fo:table-row border="0.0pt solid black"
															height="5mm">
															<fo:table-cell border="0.0pt solid black">
																<fo:block font-size="8px" font-family="Arial">
																	<xsl:value-of select="response/agency_management_system_desc"></xsl:value-of>
																</fo:block>
															</fo:table-cell>
														</fo:table-row>
													</fo:table-body>
												</fo:table>
											</fo:table-cell>

										</fo:table-row>
										</xsl:if>
										
										
										<xsl:if test="response/registration_type_code='PRAG' or response/registration_type_code='SCAG'">
										<fo:table-row border="0.0pt solid black" height="5mm">
											<fo:table-cell border="0.0pt solid black">
												<fo:table border="0.0pt solid black">
													<fo:table-column />
													<fo:table-body>
														<fo:table-row border="0.0pt solid black"
															height="5mm">
															<fo:table-cell border="0.0pt solid black">
																<fo:block font-size="8px" font-family="Arial">
																	Domicile State : </fo:block>
															</fo:table-cell>
														</fo:table-row>
													</fo:table-body>
												</fo:table>
											</fo:table-cell>
											<fo:table-cell border="0.0pt solid black">
												<fo:table border="0.0pt solid black">
													<fo:table-column />
													<fo:table-body>
														<fo:table-row border="0.0pt solid black"
															height="5mm">
															<fo:table-cell border="0.0pt solid black">
																<fo:block font-size="8px" font-family="Arial">
																	<xsl:value-of select="response/state"></xsl:value-of>
																</fo:block>
															</fo:table-cell>
														</fo:table-row>
													</fo:table-body>
												</fo:table>
											</fo:table-cell>

										</fo:table-row>
										</xsl:if>
										
										
										<xsl:if test="response/registration_type_code='PRAG' or response/registration_type_code='SCAG'">
										<xsl:if test="contains(response/agency_management_system_desc, 'Other')">
										<!-- <xsl:if test="response/agency_association_pdf ='Other'"> -->
											<fo:table-row border="0.0pt solid black" height="5mm">
												<fo:table-cell border="0.0pt solid black">
													<fo:table border="0.0pt solid black">
														<fo:table-column />
														<fo:table-body>
															<fo:table-row border="0.0pt solid black"
																height="5mm">
																<fo:table-cell border="0.0pt solid black">
																	<fo:block font-size="8px" font-family="Arial"></fo:block>
																</fo:table-cell>
															</fo:table-row>
														</fo:table-body>
													</fo:table>
												</fo:table-cell>
												<fo:table-cell border="0.0pt solid black">
													<fo:table border="0.0pt solid black">
														<fo:table-column />
														<fo:table-body>
															<fo:table-row border="0.0pt solid black"
																height="5mm">
																<fo:table-cell border="0.0pt solid black" width="2in">
																	<fo:block font-size="8px" font-family="Arial">
																		<xsl:value-of select="response/other_agency_management"></xsl:value-of>
																	</fo:block>
																</fo:table-cell>
															</fo:table-row>
														</fo:table-body>
													</fo:table>
												</fo:table-cell>

											</fo:table-row>
										</xsl:if>
										</xsl:if>
										
										<xsl:if test="response/registration_type_code='PRAG' or response/registration_type_code='SCAG'">
										<fo:table-row border="0.0pt solid black" height="5mm">
											<fo:table-cell border="0.0pt solid black">
												<fo:table border="0.0pt solid black">
													<fo:table-column />
													<fo:table-body>
														<fo:table-row border="0.0pt solid black"
															height="5mm">
															<fo:table-cell border="0.0pt solid black">
																<fo:block font-size="8px" font-family="Arial">Number of
																	Licensed Producers : </fo:block>
															</fo:table-cell>
														</fo:table-row>
													</fo:table-body>
												</fo:table>
											</fo:table-cell>
											<fo:table-cell border="0.0pt solid black">
												<fo:table border="0.0pt solid black">
													<fo:table-column />
													<fo:table-body>
														<fo:table-row border="0.0pt solid black"
															height="5mm">
															<fo:table-cell border="0.0pt solid black">
																<fo:block font-size="8px" font-family="Arial">
																	<xsl:value-of select="response/aar_nooflicproducers"></xsl:value-of>
																</fo:block>
															</fo:table-cell>
														</fo:table-row>
													</fo:table-body>
												</fo:table>
											</fo:table-cell>

										</fo:table-row>
										</xsl:if>
										
										<xsl:if test="response/registration_type_code='PRAG' or response/registration_type_code='SCAG'">
										<xsl:if test="response/isHideNumberofCSR ='N'">
											<fo:table-row border="0.0pt solid black" height="5mm">
												<fo:table-cell border="0.0pt solid black">
													<fo:table border="0.0pt solid black">
														<fo:table-column />
														<fo:table-body>
															<fo:table-row border="0.0pt solid black"
																height="5mm">
																<fo:table-cell border="0.0pt solid black">
																	<fo:block font-size="8px" font-family="Arial">Numbers
																		of CSRs : </fo:block>
																</fo:table-cell>
															</fo:table-row>
														</fo:table-body>
													</fo:table>
												</fo:table-cell>
												<fo:table-cell border="0.0pt solid black">
													<fo:table border="0.0pt solid black">
														<fo:table-column />
														<fo:table-body>
															<fo:table-row border="0.0pt solid black"
																height="5mm">
																<fo:table-cell border="0.0pt solid black">
																	<fo:block font-size="8px" font-family="Arial">
																		<xsl:value-of select="response/aar_noofliccsr"></xsl:value-of>
																	</fo:block>
																</fo:table-cell>
															</fo:table-row>
														</fo:table-body>
													</fo:table>
												</fo:table-cell>

											</fo:table-row>
										</xsl:if>
										</xsl:if>
										
										<xsl:if test="response/registration_type_code='PRAG' or response/registration_type_code='SCAG'">
										<fo:table-row border="0.0pt solid black" height="5mm">
											<fo:table-cell border="0.0pt solid black">
												<fo:table border="0.0pt solid black">
													<fo:table-column />
													<fo:table-body>
														<fo:table-row border="0.0pt solid black"
															height="5mm">
															<fo:table-cell border="0.0pt solid black">
																<fo:block font-size="8px" font-family="Arial">Total
																	Number of Employees : </fo:block>
															</fo:table-cell>
														</fo:table-row>
													</fo:table-body>
												</fo:table>
											</fo:table-cell>
											<fo:table-cell border="0.0pt solid black">
												<fo:table border="0.0pt solid black">
													<fo:table-column />
													<fo:table-body>
														<fo:table-row border="0.0pt solid black"
															height="5mm">
															<fo:table-cell border="0.0pt solid black">
																<fo:block font-size="8px" font-family="Arial"
																	wrap-option="nowrap">
																	<xsl:value-of select="response/no_of_staff"></xsl:value-of>
																</fo:block>
															</fo:table-cell>
														</fo:table-row>
													</fo:table-body>
												</fo:table>
											</fo:table-cell>

										</fo:table-row>
										</xsl:if>
										
										<!-- <xsl:if test="response/registration_type_code='PRAG' or response/registration_type_code='SCAG'">
										<fo:table-row border="0.0pt solid black" height="5mm">
											<fo:table-cell border="0.0pt solid black">
												<fo:table border="0.0pt solid black">
													<fo:table-column />
													<fo:table-body>
														<fo:table-row border="0.0pt solid black"
															height="5mm">
															<fo:table-cell border="0.0pt solid black">
																<fo:block font-size="8px" font-family="Arial">
																	Multi-Rater  : </fo:block>
															</fo:table-cell>
														</fo:table-row>
													</fo:table-body>
												</fo:table>
											</fo:table-cell>
											<fo:table-cell border="0.0pt solid black">
												<fo:table border="0.0pt solid black">
													<fo:table-column />
													<fo:table-body>
														<fo:table-row border="0.0pt solid black"
															height="5mm">
															<fo:table-cell border="0.0pt solid black">
																<fo:block font-size="8px" font-family="Arial"
																	wrap-option="nowrap">
																	<xsl:value-of select="response/agency_comparativerate_pdf"></xsl:value-of>
																</fo:block>
															</fo:table-cell>
														</fo:table-row>
													</fo:table-body>
												</fo:table>
											</fo:table-cell>

										</fo:table-row>
										</xsl:if> -->
										
										<xsl:if test="response/registration_type_code='PRAG' or response/registration_type_code='SCAG'">
										<xsl:if test="contains(response/agency_comparativerate_pdf, 'Other')">
										<!-- <xsl:if test="response/agency_association_pdf ='Other'"> -->
											<fo:table-row border="0.0pt solid black" height="5mm">
												<fo:table-cell border="0.0pt solid black">
													<fo:table border="0.0pt solid black">
														<fo:table-column />
														<fo:table-body>
															<fo:table-row border="0.0pt solid black"
																height="5mm">
																<fo:table-cell border="0.0pt solid black">
																	<fo:block font-size="8px" font-family="Arial"></fo:block>
																</fo:table-cell>
															</fo:table-row>
														</fo:table-body>
													</fo:table>
												</fo:table-cell>
												<fo:table-cell border="0.0pt solid black">
													<fo:table border="0.0pt solid black">
														<fo:table-column />
														<fo:table-body>
															<fo:table-row border="0.0pt solid black"
																height="5mm">
																<fo:table-cell border="0.0pt solid black" width="2in">
																	<fo:block font-size="8px" font-family="Arial">
																		<xsl:value-of select="response/other_agency_comparativerate"></xsl:value-of>
																	</fo:block>
																</fo:table-cell>
															</fo:table-row>
														</fo:table-body>
													</fo:table>
												</fo:table-cell>

											</fo:table-row>
										</xsl:if>
										</xsl:if>
										
										<!-- <xsl:if test="response/registration_type_code='PRAG' or response/registration_type_code='SCAG'">
										<fo:table-row border="0.0pt solid black" height="5mm">
											<fo:table-cell border="0.0pt solid black">
												<fo:table border="0.0pt solid black">
													<fo:table-column />
													<fo:table-body>
														<fo:table-row border="0.0pt solid black"
															height="5mm">
															<fo:table-cell border="0.0pt solid black">
																<fo:block font-size="8px" font-family="Arial">Agency
																	Association : </fo:block>
															</fo:table-cell>
														</fo:table-row>
													</fo:table-body>
												</fo:table>
											</fo:table-cell>
											<fo:table-cell border="0.0pt solid black">
												<fo:table border="0.0pt solid black">
													<fo:table-column />
													<fo:table-body>
														<fo:table-row border="0.0pt solid black"
															height="5mm">
															<fo:table-cell border="0.0pt solid black">
																<fo:block font-size="8px" font-family="Arial">
																	<xsl:value-of select="response/agency_association_pdf"></xsl:value-of>
																</fo:block>
															</fo:table-cell>
														</fo:table-row>
													</fo:table-body>
												</fo:table>
											</fo:table-cell>

										</fo:table-row>
										</xsl:if> -->
										
										
										
										<xsl:if test="response/registration_type_code='PRAG' or response/registration_type_code='SCAG'">
										<fo:table-row border="0.0pt solid black" height="5mm">
											<fo:table-cell border="0.0pt solid black">
												<fo:table border="0.0pt solid black">
													<fo:table-column />
													<fo:table-body>
														<fo:table-row border="0.0pt solid black"
															height="5mm">
															<fo:table-cell border="0.0pt solid black">
																<fo:block font-size="8px" font-family="Arial">Registration Type : </fo:block>
															</fo:table-cell>
														</fo:table-row>
													</fo:table-body>
												</fo:table>
											</fo:table-cell>
											<fo:table-cell border="0.0pt solid black">
												<fo:table border="0.0pt solid black">
													<fo:table-column />
													<fo:table-body>
														<fo:table-row border="0.0pt solid black"
															height="5mm">
															<fo:table-cell border="0.0pt solid black">
																<fo:block font-size="8px" font-family="Arial">
																	Primary Agency
																</fo:block>
															</fo:table-cell>
														</fo:table-row>
													</fo:table-body>
												</fo:table>
											</fo:table-cell>

										</fo:table-row>
										</xsl:if>
										
										<xsl:if test="response/registration_type_code='PRAG' or response/registration_type_code='SCAG'">
										<fo:table-row border="0.0pt solid black" height="5mm">
											<fo:table-cell border="0.0pt solid black">
												<fo:table border="0.0pt solid black">
													<fo:table-column />
													<fo:table-body>
														<fo:table-row border="0.0pt solid black"
															height="5mm">
															<fo:table-cell border="0.0pt solid black">
																<fo:block  font-size="8px" font-family="Arial">Are you a member of an Agency Network? :
  </fo:block>
															</fo:table-cell>
														</fo:table-row>
													</fo:table-body>
												</fo:table>
											</fo:table-cell>
											<fo:table-cell border="0.0pt solid black">
												<fo:table border="0.0pt solid black">
													<fo:table-column />
													<fo:table-body>
														<fo:table-row border="0.0pt solid black"
															height="5mm">
															<fo:table-cell border="0.0pt solid black">
																<fo:block font-size="8px" font-family="Arial" margin-left="1mm">
																	<xsl:if test="response/isMasterAssociatedAgency=0">
																	No
																	
																	</xsl:if>
																</fo:block>
																<fo:block font-size="8px" font-family="Arial">
																	<xsl:if test="response/isMasterAssociatedAgency=1">
																	Yes
																	
																	</xsl:if>
																</fo:block>
															</fo:table-cell>
														</fo:table-row>
													</fo:table-body>
												</fo:table>
											</fo:table-cell>

										</fo:table-row>
										</xsl:if>
										
										
										
										
										
										<xsl:if test="response/registration_type_code='PRAG' or response/registration_type_code='SCAG'">
										<xsl:if test="response/memberOf_list_1/data!=''">
										<xsl:for-each select="response/memberOf_list_1/data">
										<fo:table-row border="0.0pt solid black" height="5mm">
											<fo:table-cell border="0.0pt solid black">
												<fo:table border="0.0pt solid black">
													<fo:table-column />
													<fo:table-body>
														<fo:table-row border="0.0pt solid black"
															height="5mm">
															<fo:table-cell border="0.0pt solid black">
																<fo:block  font-size="8px" font-family="Arial">Member Of :
  </fo:block>
															</fo:table-cell>
														</fo:table-row>
													</fo:table-body>
												</fo:table>
											</fo:table-cell>
											<fo:table-cell border="0.0pt solid black">
												<fo:table border="0.0pt solid black">
													<fo:table-column />
													<fo:table-body>
														<fo:table-row border="0.0pt solid black"
															height="5mm">
															<fo:table-cell border="0.0pt solid black">
																<fo:block font-size="8px" font-family="Arial" margin-left="1mm">
																	<xsl:value-of select="name"></xsl:value-of>
																</fo:block>
																
															</fo:table-cell>
														</fo:table-row>
													</fo:table-body>
												</fo:table>
											</fo:table-cell>

										</fo:table-row>
										</xsl:for-each>
										</xsl:if>
										</xsl:if>
										
										
										<xsl:if test="response/registration_type_code='PRAG' or response/registration_type_code='SCAG'">
										
										<fo:table-row border="0.0pt solid black" height="5mm">


											<fo:table-cell border="0.0pt solid black">
												<fo:table border="0.0pt solid black">
													<fo:table-column />
													<fo:table-body>
														<fo:table-row border="0.0pt solid black"
															height="5mm">
															<fo:table-cell border="0.0pt solid black">
																<fo:block font-size="8px" font-family="Arial">Are you a member of an HBA?
																</fo:block>
															</fo:table-cell>
														</fo:table-row>
													</fo:table-body>
												</fo:table>
											</fo:table-cell>
											<fo:table-cell border="0.0pt solid black">
												<fo:table border="0.0pt solid black">
													<fo:table-column />
													<fo:table-body>
														<fo:table-row border="0.0pt solid black"
															height="5mm">
															<fo:table-cell border="0.0pt solid black">
																<xsl:if test="response/member_of_hba=0">
																<fo:block font-size="8px" font-family="Arial">
																	No
																</fo:block>
																</xsl:if>
																<xsl:if test="response/member_of_hba=1">
																<fo:block font-size="8px" font-family="Arial">
																	Yes
																</fo:block>
																</xsl:if>
															</fo:table-cell>
														</fo:table-row>
													</fo:table-body>
												</fo:table>
											</fo:table-cell>
										</fo:table-row>
										
										</xsl:if>
										
										
										
										
										
										<xsl:if test="response/registration_type_code='PRAG' or response/registration_type_code='SCAG'">
										
										<fo:table-row border="0.0pt solid black" height="5mm">


											<fo:table-cell border="0.0pt solid black">
												<fo:table border="0.0pt solid black">
													<fo:table-column />
													<fo:table-body>
														<fo:table-row border="0.0pt solid black"
															height="5mm">
															<fo:table-cell border="0.0pt solid black">
																<fo:block font-size="8px" font-family="Arial">If Yes, please select the HBA Chapter you are a member of :
																</fo:block>
															</fo:table-cell>
														</fo:table-row>
													</fo:table-body>
												</fo:table>
											</fo:table-cell>
											<fo:table-cell border="0.0pt solid black">
												<fo:table border="0.0pt solid black">
													<fo:table-column />
													<fo:table-body>
														<fo:table-row border="0.0pt solid black"
															height="5mm">
															<fo:table-cell border="0.0pt solid black">
																
																
																<fo:block font-size="8px" font-family="Arial">
																	<xsl:value-of select="response/hba_association_desc"></xsl:value-of>
																</fo:block>
															
															</fo:table-cell>
														</fo:table-row>
													</fo:table-body>
												</fo:table>
											</fo:table-cell>
										</fo:table-row>
										
										</xsl:if>
										
										
										<!-- <fo:table-row border="0.0pt solid black" height="5mm">
											<fo:table-cell border="0.0pt solid black">
												<fo:table border="0.0pt solid black">
													<fo:table-column />
													<fo:table-body>
														<fo:table-row border="0.0pt solid black"
															height="5mm">
															<fo:table-cell border="0.0pt solid black">
																<fo:block font-size="8px" font-family="Arial">Locations
																	of any sub offices : </fo:block>
															</fo:table-cell>
														</fo:table-row>
													</fo:table-body>
												</fo:table>
											</fo:table-cell>
											<fo:table-cell border="0.0pt solid black">
												<fo:table border="0.0pt solid black">
													<fo:table-column />
													<fo:table-body>
														<fo:table-row border="0.0pt solid black"
															height="5mm">
															<fo:table-cell border="0.0pt solid black">
																<fo:block font-size="8px" font-family="Arial">
																	<xsl:value-of select="response/other_office_location"></xsl:value-of>
																</fo:block>
															</fo:table-cell>
														</fo:table-row>
													</fo:table-body>
												</fo:table>
											</fo:table-cell>

										</fo:table-row> -->
										
										<xsl:if test="response/registration_type_code='PRAG' or response/registration_type_code='SCAG'">
										<xsl:if test="contains(response/agency_association_pdf, 'Other')">
										<!-- <xsl:if test="response/agency_association_pdf ='Other'"> -->
											<fo:table-row border="0.0pt solid black" height="5mm">
												<fo:table-cell border="0.0pt solid black">
													<fo:table border="0.0pt solid black">
														<fo:table-column />
														<fo:table-body>
															<fo:table-row border="0.0pt solid black"
																height="5mm">
																<fo:table-cell border="0.0pt solid black">
																	<fo:block font-size="8px" font-family="Arial"></fo:block>
																</fo:table-cell>
															</fo:table-row>
														</fo:table-body>
													</fo:table>
												</fo:table-cell>
												<fo:table-cell border="0.0pt solid black">
													<fo:table border="0.0pt solid black">
														<fo:table-column />
														<fo:table-body>
															<fo:table-row border="0.0pt solid black"
																height="5mm">
																<fo:table-cell border="0.0pt solid black">
																	<fo:block font-size="8px" font-family="Arial">
																		<xsl:value-of select="response/associatedAgencyName"></xsl:value-of>
																	</fo:block>
																</fo:table-cell>
															</fo:table-row>
														</fo:table-body>
													</fo:table>
												</fo:table-cell>

											</fo:table-row>
										</xsl:if>
										</xsl:if>
										
										<xsl:if test="response/isHideLOB='N'">
											<fo:table-row border="0.0pt solid black" height="5mm">
												<fo:table-cell border="0.0pt solid black">
													<fo:table border="0.0pt solid black">
														<fo:table-column />
														<fo:table-body>
															<fo:table-row border="0.0pt solid black"
																height="5mm">
																<fo:table-cell border="0.0pt solid black">
																	<fo:block font-size="8px" font-family="Arial">Lines Of
																		Business : </fo:block>
																</fo:table-cell>
															</fo:table-row>
														</fo:table-body>
													</fo:table>
												</fo:table-cell>
												<fo:table-cell border="0.0pt solid black">
													<fo:table border="0.0pt solid black">
														<fo:table-column />
														<fo:table-body>
															<fo:table-row border="0.0pt solid black"
																height="5mm">
																<fo:table-cell border="0.0pt solid black">
																	<fo:block font-size="8px" font-family="Arial">
																		<xsl:value-of select="response/agencyLob"></xsl:value-of>
																	</fo:block>
																</fo:table-cell>
															</fo:table-row>
														</fo:table-body>
													</fo:table>
												</fo:table-cell>

											</fo:table-row>
										</xsl:if>

										

									</fo:table-body>
								</fo:table>
							</fo:table-cell>


							<fo:table-cell border="0.0pt solid black">
								<fo:table border="0.0pt solid black">
									<fo:table-column column-width="80pt" />
									<fo:table-column column-width="140pt" />
									<fo:table-body>
									<xsl:if test="response/registration_type_code='PRAG' or response/registration_type_code='SCAG'">
										<fo:table-row border="0.0pt solid black" height="5mm">

											<fo:table-cell border="0.0pt solid black">
												<fo:table border="0.0pt solid black">
													<fo:table-column />
													<fo:table-body>
														<fo:table-row border="0.0pt solid black"
															height="5mm">
															<fo:table-cell border="0.0pt solid black">
																<fo:block font-size="8px" font-family="Arial"
																	font-weight="bold" text-decoration="underline">Business Address
																</fo:block>
															</fo:table-cell>
														</fo:table-row>
													</fo:table-body>
												</fo:table>
											</fo:table-cell>
											<fo:table-cell border="0.0pt solid black">
												<fo:table border="0.0pt solid black">
													<fo:table-column />
													<fo:table-body>
														<fo:table-row border="0.0pt solid black"
															height="5mm">
															<fo:table-cell border="0.0pt solid black">
																<fo:block font-size="8px" font-family="Arial"></fo:block>
															</fo:table-cell>
														</fo:table-row>
													</fo:table-body>
												</fo:table>
											</fo:table-cell>
										</fo:table-row>
										</xsl:if>
										<xsl:if test="response/registration_type_code='PRAG' or response/registration_type_code='SCAG'">
										<fo:table-row border="0.0pt solid black" height="5mm">
											<fo:table-cell border="0.0pt solid black">
												<fo:table border="0.0pt solid black">
													<fo:table-column />
													<fo:table-body>
														<fo:table-row border="0.0pt solid black"
															height="5mm">
															<fo:table-cell border="0.0pt solid black">
																<fo:block font-size="8px" font-family="Arial">Country
																	: </fo:block>
															</fo:table-cell>
														</fo:table-row>
													</fo:table-body>
												</fo:table>
											</fo:table-cell>
											<fo:table-cell border="0.0pt solid black">
												<fo:table border="0.0pt solid black">
													<fo:table-column />
													<fo:table-body>
														<fo:table-row border="0.0pt solid black"
															height="5mm">
															<fo:table-cell border="0.0pt solid black">
																<fo:block font-size="8px" font-family="Arial">
																	<xsl:value-of select="response/aar_countryDescription"></xsl:value-of>
																</fo:block>
															</fo:table-cell>
														</fo:table-row>
													</fo:table-body>
												</fo:table>
											</fo:table-cell>
										</fo:table-row>
										</xsl:if>
										<xsl:if test="response/registration_type_code='PRAG' or response/registration_type_code='SCAG'">
										<fo:table-row border="0.0pt solid black" height="5mm">


											<fo:table-cell border="0.0pt solid black">
												<fo:table border="0.0pt solid black">
													<fo:table-column />
													<fo:table-body>
														<fo:table-row border="0.0pt solid black"
															height="5mm">
															<fo:table-cell border="0.0pt solid black">
																<fo:block font-size="8px" font-family="Arial">Street
																	Address #1 : </fo:block>
															</fo:table-cell>
														</fo:table-row>
													</fo:table-body>
												</fo:table>
											</fo:table-cell>
											<fo:table-cell border="0.0pt solid black">
												<fo:table border="0.0pt solid black">
													<fo:table-column />
													<fo:table-body>
														<fo:table-row border="0.0pt solid black"
															height="5mm">
															<fo:table-cell border="0.0pt solid black">
																<fo:block font-size="8px" font-family="Arial">
																	<xsl:value-of select="response/aar_streetaddress1"></xsl:value-of>
																</fo:block>
															</fo:table-cell>
														</fo:table-row>
													</fo:table-body>
												</fo:table>
											</fo:table-cell>
										</fo:table-row>
										</xsl:if>
										
										<xsl:if test="response/registration_type_code='PRAG' or response/registration_type_code='SCAG'">
										<fo:table-row border="0.0pt solid black" height="5mm">


											<fo:table-cell border="0.0pt solid black">
												<fo:table border="0.0pt solid black">
													<fo:table-column />
													<fo:table-body>
														<fo:table-row border="0.0pt solid black"
															height="5mm">
															<fo:table-cell border="0.0pt solid black">
																<fo:block font-size="8px" font-family="Arial">Street
																	Address #2 : </fo:block>
															</fo:table-cell>
														</fo:table-row>
													</fo:table-body>
												</fo:table>
											</fo:table-cell>
											<fo:table-cell border="0.0pt solid black">
												<fo:table border="0.0pt solid black">
													<fo:table-column />
													<fo:table-body>
														<fo:table-row border="0.0pt solid black"
															height="5mm">
															<fo:table-cell border="0.0pt solid black">
																<fo:block font-size="8px" font-family="Arial">
																	<xsl:value-of select="response/aar_streetaddress2"></xsl:value-of>
																</fo:block>
															</fo:table-cell>
														</fo:table-row>
													</fo:table-body>
												</fo:table>
											</fo:table-cell>
										</fo:table-row>
										</xsl:if>
										
										<xsl:if test="response/isHidePOBox='N'">
											<fo:table-row border="0.0pt solid black" height="5mm">
												<fo:table-cell border="0.0pt solid black">
													<fo:table border="0.0pt solid black">
														<fo:table-column />
														<fo:table-body>
															<fo:table-row border="0.0pt solid black"
																height="5mm">
																<fo:table-cell border="0.0pt solid black">
																	<fo:block font-size="8px" font-family="Arial">P.O Box
																		: </fo:block>
																</fo:table-cell>
															</fo:table-row>
														</fo:table-body>
													</fo:table>
												</fo:table-cell>
												<fo:table-cell border="0.0pt solid black">
													<fo:table border="0.0pt solid black">
														<fo:table-column />
														<fo:table-body>
															<fo:table-row border="0.0pt solid black"
																height="5mm">
																<fo:table-cell border="0.0pt solid black">
																	<fo:block font-size="8px" font-family="Arial">
																		<xsl:value-of select="response/aar_poBox"></xsl:value-of>
																	</fo:block>
																</fo:table-cell>
															</fo:table-row>
														</fo:table-body>
													</fo:table>
												</fo:table-cell>
											</fo:table-row>
										</xsl:if>
										
										<xsl:if test="response/registration_type_code='PRAG' or response/registration_type_code='SCAG'">
										<fo:table-row border="0.0pt solid black" height="5mm">
											<fo:table-cell border="0.0pt solid black">
												<fo:table border="0.0pt solid black">
													<fo:table-column />
													<fo:table-body>
														<fo:table-row border="0.0pt solid black"
															height="5mm">
															<fo:table-cell border="0.0pt solid black">
																<fo:block font-size="8px" font-family="Arial">City :
																</fo:block>
															</fo:table-cell>
														</fo:table-row>
													</fo:table-body>
												</fo:table>
											</fo:table-cell>
											<fo:table-cell border="0.0pt solid black">
												<fo:table border="0.0pt solid black">
													<fo:table-column />
													<fo:table-body>
														<fo:table-row border="0.0pt solid black"
															height="5mm">
															<fo:table-cell border="0.0pt solid black">
																<fo:block font-size="8px" font-family="Arial">
																	<xsl:value-of select="response/aar_city"></xsl:value-of>
																</fo:block>
															</fo:table-cell>
														</fo:table-row>
													</fo:table-body>
												</fo:table>
											</fo:table-cell>
										</fo:table-row>
</xsl:if>
										<xsl:if test="response/registration_type_code='PRAG' or response/registration_type_code='SCAG'">
										<xsl:if test="response/legaldescription ='Type Unknown'">
											<fo:table-row border="0.0pt solid black" height="5mm">


												<fo:table-cell border="0.0pt solid black">
													<fo:table border="0.0pt solid black">
														<fo:table-column />
														<fo:table-body>
															<fo:table-row border="0.0pt solid black"
																height="5mm">
																<fo:table-cell border="0.0pt solid black">
																	<fo:block font-size="8px" font-family="Arial"></fo:block>
																</fo:table-cell>
															</fo:table-row>
														</fo:table-body>
													</fo:table>
												</fo:table-cell>
												<fo:table-cell border="0.0pt solid black">
													<fo:table border="0.0pt solid black">
														<fo:table-column />
														<fo:table-body>
															<fo:table-row border="0.0pt solid black"
																height="5mm">
																<fo:table-cell border="0.0pt solid black">
																	<fo:block font-size="8px" font-family="Arial">
																	</fo:block>
																</fo:table-cell>
															</fo:table-row>
														</fo:table-body>
													</fo:table>
												</fo:table-cell>
											</fo:table-row>
										</xsl:if>
											</xsl:if>

										<xsl:if test="response/registration_type_code='PRAG' or response/registration_type_code='SCAG'">
										<fo:table-row border="0.0pt solid black" height="5mm">


											<fo:table-cell border="0.0pt solid black">
												<fo:table border="0.0pt solid black">
													<fo:table-column />
													<fo:table-body>
														<fo:table-row border="0.0pt solid black"
															height="5mm">
															<fo:table-cell border="0.0pt solid black">
																<fo:block font-size="8px" font-family="Arial">State :
																</fo:block>
															</fo:table-cell>
														</fo:table-row>
													</fo:table-body>
												</fo:table>
											</fo:table-cell>
											<fo:table-cell border="0.0pt solid black">
												<fo:table border="0.0pt solid black">
													<fo:table-column />
													<fo:table-body>
														<fo:table-row border="0.0pt solid black"
															height="5mm">
															<fo:table-cell border="0.0pt solid black">
																<fo:block font-size="8px" font-family="Arial">
																	<xsl:value-of select="response/aar_stateDescription"></xsl:value-of>
																</fo:block>
															</fo:table-cell>
														</fo:table-row>
													</fo:table-body>
												</fo:table>
											</fo:table-cell>
										</fo:table-row>
										</xsl:if>
										
										<xsl:if test="response/registration_type_code='PRAG' or response/registration_type_code='SCAG'">
										<fo:table-row border="0.0pt solid black" height="5mm">


											<fo:table-cell border="0.0pt solid black">
												<fo:table border="0.0pt solid black">
													<fo:table-column />
													<fo:table-body>
														<fo:table-row border="0.0pt solid black"
															height="5mm">
															<fo:table-cell border="0.0pt solid black">
																<fo:block font-size="8px" font-family="Arial">County :
																</fo:block>
															</fo:table-cell>
														</fo:table-row>
													</fo:table-body>
												</fo:table>
											</fo:table-cell>
											<fo:table-cell border="0.0pt solid black">
												<fo:table border="0.0pt solid black">
													<fo:table-column />
													<fo:table-body>
														<fo:table-row border="0.0pt solid black"
															height="5mm">
															<fo:table-cell border="0.0pt solid black">
																<fo:block font-size="8px" font-family="Arial">
																	<xsl:value-of select="response/aar_countyDescription"></xsl:value-of>
																</fo:block>
															</fo:table-cell>
														</fo:table-row>
													</fo:table-body>
												</fo:table>
											</fo:table-cell>
										</fo:table-row>
										</xsl:if>
										
										<xsl:if test="response/registration_type_code='PRAG' or response/registration_type_code='SCAG'">
										<fo:table-row border="0.0pt solid black" height="5mm">


											<fo:table-cell border="0.0pt solid black">
												<fo:table border="0.0pt solid black">
													<fo:table-column />
													<fo:table-body>
														<fo:table-row border="0.0pt solid black"
															height="5mm">
															<fo:table-cell border="0.0pt solid black">
																<fo:block font-size="8px" font-family="Arial">Zip Code
																	: </fo:block>
															</fo:table-cell>
														</fo:table-row>
													</fo:table-body>
												</fo:table>
											</fo:table-cell>
											<fo:table-cell border="0.0pt solid black">
												<fo:table border="0.0pt solid black">
													<fo:table-column />
													<fo:table-body>
														<fo:table-row border="0.0pt solid black"
															height="5mm">
															<fo:table-cell border="0.0pt solid black">
																<fo:block font-size="8px" font-family="Arial">
																	<xsl:value-of select="response/aar_zipcode"></xsl:value-of>
																</fo:block>
															</fo:table-cell>
														</fo:table-row>
													</fo:table-body>
												</fo:table>
											</fo:table-cell>
										</fo:table-row>
										</xsl:if>
										
										<xsl:if test="response/registration_type_code='PRAG' or response/registration_type_code='SCAG'">
										<fo:table-row border="0.0pt solid black" height="5mm">


											<fo:table-cell border="0.0pt solid black">
												<fo:table border="0.0pt solid black">
													<fo:table-column />
													<fo:table-body>
														<fo:table-row border="0.0pt solid black"
															height="5mm">
															<fo:table-cell border="0.0pt solid black">
																<fo:block font-size="8px" font-family="Arial">Phone :
																</fo:block>
															</fo:table-cell>
														</fo:table-row>
													</fo:table-body>
												</fo:table>
											</fo:table-cell>
											<fo:table-cell border="0.0pt solid black">
												<fo:table border="0.0pt solid black">
													<fo:table-column />
													<fo:table-column />
													<fo:table-column />
													<fo:table-body>
														<fo:table-row border="0.0pt solid black"
															height="5mm">
															<fo:table-cell border="0.0pt solid black">
																<fo:block font-size="8px" font-family="Arial">
																	<xsl:value-of select="response/aar_phoneno"></xsl:value-of>
																</fo:block>
															</fo:table-cell>
															<fo:table-cell border="0.0pt solid black"
																width="30px">
																<fo:block font-size="8px" font-family="Arial">Extn. :
																</fo:block>
															</fo:table-cell>
															<fo:table-cell border="0.0pt solid black">
																<fo:block font-size="8px" font-family="Arial">
																	<xsl:value-of select="response/aar_extn"></xsl:value-of>
																</fo:block>
															</fo:table-cell>
														</fo:table-row>
													</fo:table-body>
												</fo:table>
											</fo:table-cell>
										</fo:table-row>
										</xsl:if>
										
										
										<xsl:if test="response/isHideAltPhone='N'">
											<fo:table-row border="0.0pt solid black" height="5mm">
												<fo:table-cell border="0.0pt solid black">
													<fo:table border="0.0pt solid black">
														<fo:table-column />
														<fo:table-body>
															<fo:table-row border="0.0pt solid black"
																height="5mm">
																<fo:table-cell border="0.0pt solid black">
																	<fo:block font-size="8px" font-family="Arial">
																		Alt Phone : </fo:block>
																</fo:table-cell>
															</fo:table-row>
														</fo:table-body>
													</fo:table>
												</fo:table-cell>
												<fo:table-cell border="0.0pt solid black">
													<fo:table border="0.0pt solid black">
														<fo:table-column />
														<fo:table-column />
														<fo:table-column />
														<fo:table-body>
															<fo:table-row border="0.0pt solid black"
																height="5mm">
																<fo:table-cell border="0.0pt solid black">
																	<fo:block font-size="8px" font-family="Arial">
																		<xsl:value-of select="response/aar_altPhone"></xsl:value-of>
																	</fo:block>
																</fo:table-cell>
																<fo:table-cell border="0.0pt solid black"
																	width="30px">
																	<fo:block font-size="8px" font-family="Arial">Extn. :
																	</fo:block>
																</fo:table-cell>
																<fo:table-cell border="0.0pt solid black">
																	<fo:block font-size="8px" font-family="Arial">
																		<xsl:value-of select="response/aar_altExtn"></xsl:value-of>
																	</fo:block>
																</fo:table-cell>
															</fo:table-row>
														</fo:table-body>
													</fo:table>
												</fo:table-cell>
											</fo:table-row>
										</xsl:if>
										
										<!-- <xsl:if test="response/registration_type_code='PRAG' or response/registration_type_code='SCAG'">
										<fo:table-row border="0.0pt solid black" height="5mm">


											<fo:table-cell border="0.0pt solid black">
												<fo:table border="0.0pt solid black">
													<fo:table-column />
													<fo:table-body>
														<fo:table-row border="0.0pt solid black"
															height="5mm">
															<fo:table-cell border="0.0pt solid black">
																<fo:block font-size="8px" font-family="Arial">Fax :
																</fo:block>
															</fo:table-cell>
														</fo:table-row>
													</fo:table-body>
												</fo:table>
											</fo:table-cell>
											<fo:table-cell border="0.0pt solid black">
												<fo:table border="0.0pt solid black">
													<fo:table-column />
													<fo:table-body>
														<fo:table-row border="0.0pt solid black"
															height="5mm">
															<fo:table-cell border="0.0pt solid black">
																<fo:block font-size="8px" font-family="Arial">
																	<xsl:value-of select="response/aar_fax"></xsl:value-of>
																</fo:block>
															</fo:table-cell>
														</fo:table-row>
													</fo:table-body>
												</fo:table>
											</fo:table-cell>
										</fo:table-row>
										</xsl:if> -->
										
										<xsl:if test="response/registration_type_code='PRAG' or response/registration_type_code='SCAG'">
										<fo:table-row border="0.0pt solid black" height="5mm">


											<fo:table-cell border="0.0pt solid black">
												<fo:table border="0.0pt solid black">
													<fo:table-column />
													<fo:table-body>
														<fo:table-row border="0.0pt solid black"
															height="5mm">
															<fo:table-cell border="0.0pt solid black">
																<fo:block font-size="8px" font-family="Arial">Email ID :
																</fo:block>
															</fo:table-cell>
														</fo:table-row>
													</fo:table-body>
												</fo:table>
											</fo:table-cell>
											<fo:table-cell border="0.0pt solid black">
												<fo:table border="0.0pt solid black">
													<fo:table-column />
													<fo:table-body>
														<fo:table-row border="0.0pt solid black"
															height="5mm">
															<fo:table-cell border="0.0pt solid black">
																<fo:block font-size="8px" font-family="Arial">
																	<xsl:value-of select="response/aar_email"></xsl:value-of>
																</fo:block>
															</fo:table-cell>
														</fo:table-row>
													</fo:table-body>
												</fo:table>
											</fo:table-cell>
										</fo:table-row>
										</xsl:if>
										
										
										
										
										
										
										
										
										<fo:table-row border="0.0pt solid black" height="5mm">


											<fo:table-cell border="0.0pt solid black">
												<fo:table border="0.0pt solid black">
													<fo:table-column />
													<fo:table-body>
														<fo:table-row border="0.0pt solid black"
															height="5mm">
															<fo:table-cell border="0.0pt solid black">
																<fo:block font-size="8px" font-family="Arial"></fo:block>
															</fo:table-cell>
														</fo:table-row>
													</fo:table-body>
												</fo:table>
											</fo:table-cell>
											<fo:table-cell border="0.0pt solid black">
												<fo:table border="0.0pt solid black">
													<fo:table-column />
													<fo:table-body>
														<fo:table-row border="0.0pt solid black"
															height="5mm">
															<fo:table-cell border="0.0pt solid black">
																<fo:block font-size="8px" font-family="Arial"></fo:block>
															</fo:table-cell>
														</fo:table-row>
													</fo:table-body>
												</fo:table>
											</fo:table-cell>
										</fo:table-row>
										<fo:table-row border="0.0pt solid black" height="5mm">


											<fo:table-cell border="0.0pt solid black">
												<fo:table border="0.0pt solid black">
													<fo:table-column />
													<fo:table-body>
														<fo:table-row border="0.0pt solid black"
															height="5mm">
															<fo:table-cell border="0.0pt solid black">
																<fo:block font-size="8px" font-family="Arial"></fo:block>
															</fo:table-cell>
														</fo:table-row>
													</fo:table-body>
												</fo:table>
											</fo:table-cell>
											<fo:table-cell border="0.0pt solid black">
												<fo:table border="0.0pt solid black">
													<fo:table-column />
													<fo:table-body>
														<fo:table-row border="0.0pt solid black"
															height="5mm">
															<fo:table-cell border="0.0pt solid black">
																<fo:block font-size="8px" font-family="Arial"></fo:block>
															</fo:table-cell>
														</fo:table-row>
													</fo:table-body>
												</fo:table>
											</fo:table-cell>
										</fo:table-row>
										<fo:table-row border="0.0pt solid black" height="5mm">


											<fo:table-cell border="0.0pt solid black">
												<fo:table border="0.0pt solid black">
													<fo:table-column />
													<fo:table-body>
														<fo:table-row border="0.0pt solid black"
															height="5mm">
															<fo:table-cell border="0.0pt solid black">
																<fo:block font-size="8px" font-family="Arial"></fo:block>
															</fo:table-cell>
														</fo:table-row>
													</fo:table-body>
												</fo:table>
											</fo:table-cell>
											<fo:table-cell border="0.0pt solid black">
												<fo:table border="0.0pt solid black">
													<fo:table-column />
													<fo:table-body>
														<fo:table-row border="0.0pt solid black"
															height="5mm">
															<fo:table-cell border="0.0pt solid black">
																<fo:block font-size="8px" font-family="Arial"></fo:block>
															</fo:table-cell>
														</fo:table-row>
													</fo:table-body>
												</fo:table>
											</fo:table-cell>
										</fo:table-row>
										<xsl:if test="response/agency_association_pdf ='Other'">
											<fo:table-row border="0.0pt solid black" height="5mm">


												<fo:table-cell border="0.0pt solid black">
													<fo:table border="0.0pt solid black">
														<fo:table-column />
														<fo:table-body>
															<fo:table-row border="0.0pt solid black"
																height="5mm">
																<fo:table-cell border="0.0pt solid black">
																	<fo:block font-size="8px" font-family="Arial"></fo:block>
																</fo:table-cell>
															</fo:table-row>
														</fo:table-body>
													</fo:table>
												</fo:table-cell>
												<fo:table-cell border="0.0pt solid black">
													<fo:table border="0.0pt solid black">
														<fo:table-column />
														<fo:table-body>
															<fo:table-row border="0.0pt solid black"
																height="5mm">
																<fo:table-cell border="0.0pt solid black">
																	<fo:block font-size="8px" font-family="Arial"></fo:block>
																</fo:table-cell>
															</fo:table-row>
														</fo:table-body>
													</fo:table>
												</fo:table-cell>
											</fo:table-row>
											<fo:table-row border="0.0pt solid black" height="5mm">


												<fo:table-cell border="0.0pt solid black">
													<fo:table border="0.0pt solid black">
														<fo:table-column />
														<fo:table-body>
															<fo:table-row border="0.0pt solid black"
																height="5mm">
																<fo:table-cell border="0.0pt solid black">
																	<fo:block font-size="8px" font-family="Arial"></fo:block>
																</fo:table-cell>
															</fo:table-row>
														</fo:table-body>
													</fo:table>
												</fo:table-cell>
												<fo:table-cell border="0.0pt solid black">
													<fo:table border="0.0pt solid black">
														<fo:table-column />
														<fo:table-body>
															<fo:table-row border="0.0pt solid black"
																height="5mm">
																<fo:table-cell border="0.0pt solid black">
																	<fo:block font-size="8px" font-family="Arial"></fo:block>
																</fo:table-cell>
															</fo:table-row>
														</fo:table-body>
													</fo:table>
												</fo:table-cell>
											</fo:table-row>
																			
										</xsl:if>
										
									</fo:table-body>
								</fo:table>
							</fo:table-cell>








						</fo:table-row>
					</fo:table-body>
				</fo:table>
			</fo:block>

			<fo:block margin-top="5mm">
				<fo:table border="0.0pt solid black">
					<fo:table-column border="0.0pt solid black"
						column-width="270pt" />
					<fo:table-column border="0.0pt solid black"
						column-width="190pt" />

					<fo:table-body>
						<fo:table-row border="0.0pt solid black" height="5mm">



							<fo:table-cell border="0.0pt solid black">
								<fo:table border="0.0pt solid black">
									<fo:table-column border="0.0pt solid black"
										column-width="130pt" />
									<fo:table-column border="0.0pt solid black"
										column-width="220pt" />
									<fo:table-body>
									<xsl:if test="response/registration_type_code='PRAG' or response/registration_type_code='SCAG'">
										<fo:table-row border="0.0pt solid black" height="5mm">

											<fo:table-cell border="0.0pt solid black">
												<fo:table border="0.0pt solid black">
													<fo:table-column />
													<fo:table-body>
														<fo:table-row border="0.0pt solid black"
															height="5mm">
															<fo:table-cell border="0.0pt solid black">
																<fo:block font-size="8px" font-family="Arial"
																	font-weight="bold" text-decoration="underline">Mailing Address
																</fo:block>
															</fo:table-cell>
														</fo:table-row>
													</fo:table-body>
												</fo:table>
											</fo:table-cell>
											<fo:table-cell border="0.0pt solid black">
												<fo:table border="0.0pt solid black">
													<fo:table-column />
													<fo:table-body>
														<fo:table-row border="0.0pt solid black"
															height="5mm">
															<fo:table-cell border="0.0pt solid black">
																<fo:block font-size="8px" font-family="Arial"></fo:block>
															</fo:table-cell>
														</fo:table-row>
													</fo:table-body>
												</fo:table>
											</fo:table-cell>
										</fo:table-row>
										</xsl:if>
										
										<xsl:if test="response/registration_type_code='PRAG' or response/registration_type_code='SCAG'">
										<fo:table-row border="0.0pt solid black" height="5mm">
											<fo:table-cell border="0.0pt solid black">
												<fo:table border="0.0pt solid black">
													<fo:table-column />
													<fo:table-body>
														<fo:table-row border="0.0pt solid black"
															height="5mm">
															<fo:table-cell border="0.0pt solid black">
																<fo:block font-size="8px" font-family="Arial">Country
																	: </fo:block>
															</fo:table-cell>
														</fo:table-row>
													</fo:table-body>
												</fo:table>
											</fo:table-cell>
											<fo:table-cell border="0.0pt solid black">
												<fo:table border="0.0pt solid black">
													<fo:table-column />
													<fo:table-body>
														<fo:table-row border="0.0pt solid black"
															height="5mm">
															<fo:table-cell border="0.0pt solid black">
																<fo:block font-size="8px" font-family="Arial">
																	<xsl:value-of select="response/aar_countryDescription"></xsl:value-of>
																</fo:block>
															</fo:table-cell>
														</fo:table-row>
													</fo:table-body>
												</fo:table>
											</fo:table-cell>
										</fo:table-row>
										</xsl:if>
										
										<xsl:if test="response/registration_type_code='PRAG' or response/registration_type_code='SCAG'">
										<fo:table-row border="0.0pt solid black" height="5mm">


											<fo:table-cell border="0.0pt solid black">
												<fo:table border="0.0pt solid black">
													<fo:table-column />
													<fo:table-body>
														<fo:table-row border="0.0pt solid black"
															height="5mm">
															<fo:table-cell border="0.0pt solid black">
																<fo:block font-size="8px" font-family="Arial">Street
																	Address #1 : </fo:block>
															</fo:table-cell>
														</fo:table-row>
													</fo:table-body>
												</fo:table>
											</fo:table-cell>
											<fo:table-cell border="0.0pt solid black">
												<fo:table border="0.0pt solid black">
													<fo:table-column />
													<fo:table-body>
														<fo:table-row border="0.0pt solid black"
															height="5mm">
															<fo:table-cell border="0.0pt solid black" width ="1.8in">
																<fo:block font-size="8px" font-family="Arial">
																	<xsl:value-of select="response/aar_streetaddress1_ma"></xsl:value-of>
																</fo:block>
															</fo:table-cell>
														</fo:table-row>
													</fo:table-body>
												</fo:table>
											</fo:table-cell>
										</fo:table-row>
										</xsl:if>
										
										<xsl:if test="response/registration_type_code='PRAG' or response/registration_type_code='SCAG'">
										<fo:table-row border="0.0pt solid black" height="5mm">


											<fo:table-cell border="0.0pt solid black">
												<fo:table border="0.0pt solid black">
													<fo:table-column />
													<fo:table-body>
														<fo:table-row border="0.0pt solid black"
															height="5mm">
															<fo:table-cell border="0.0pt solid black">
																<fo:block font-size="8px" font-family="Arial">Street
																	Address #2 : </fo:block>
															</fo:table-cell>
														</fo:table-row>
													</fo:table-body>
												</fo:table>
											</fo:table-cell>
											<fo:table-cell border="0.0pt solid black">
												<fo:table border="0.0pt solid black">
													<fo:table-column />
													<fo:table-body>
														<fo:table-row border="0.0pt solid black"
															height="5mm">
															<fo:table-cell border="0.0pt solid black" width ="1.8in">
																<fo:block font-size="8px" font-family="Arial">
																	<xsl:value-of select="response/aar_streetaddress2_ma"></xsl:value-of>
																</fo:block>
															</fo:table-cell>
														</fo:table-row>
													</fo:table-body>
												</fo:table>
											</fo:table-cell>
										</fo:table-row>
										</xsl:if>
										
										
										<xsl:if test="response/isHidePOBox='N'">
											<fo:table-row border="0.0pt solid black" height="5mm">
												<fo:table-cell border="0.0pt solid black">
													<fo:table border="0.0pt solid black">
														<fo:table-column />
														<fo:table-body>
															<fo:table-row border="0.0pt solid black"
																height="5mm">
																<fo:table-cell border="0.0pt solid black">
																	<fo:block font-size="8px" font-family="Arial">P.O Box
																		: </fo:block>
																</fo:table-cell>
															</fo:table-row>
														</fo:table-body>
													</fo:table>
												</fo:table-cell>
												<fo:table-cell border="0.0pt solid black">
													<fo:table border="0.0pt solid black">
														<fo:table-column />
														<fo:table-body>
															<fo:table-row border="0.0pt solid black"
																height="5mm">
																<fo:table-cell border="0.0pt solid black">
																	<fo:block font-size="8px" font-family="Arial">
																		<xsl:value-of select="response/aar_poBox_ma"></xsl:value-of>
																	</fo:block>
																</fo:table-cell>
															</fo:table-row>
														</fo:table-body>
													</fo:table>
												</fo:table-cell>
											</fo:table-row>
										</xsl:if>
										
										<xsl:if test="response/registration_type_code='PRAG' or response/registration_type_code='SCAG'">
										<fo:table-row border="0.0pt solid black" height="5mm">
											<fo:table-cell border="0.0pt solid black">
												<fo:table border="0.0pt solid black">
													<fo:table-column />
													<fo:table-body>
														<fo:table-row border="0.0pt solid black"
															height="5mm">
															<fo:table-cell border="0.0pt solid black">
																<fo:block font-size="8px" font-family="Arial">City :
																</fo:block>
															</fo:table-cell>
														</fo:table-row>
													</fo:table-body>
												</fo:table>
											</fo:table-cell>
											<fo:table-cell border="0.0pt solid black">
												<fo:table border="0.0pt solid black">
													<fo:table-column />
													<fo:table-body>
														<fo:table-row border="0.0pt solid black"
															height="5mm">
															<fo:table-cell border="0.0pt solid black" width ="1.8in">
																<fo:block font-size="8px" font-family="Arial" >
																	<xsl:value-of select="response/aar_city_ma"></xsl:value-of>
																</fo:block>
															</fo:table-cell>
														</fo:table-row>
													</fo:table-body>
												</fo:table>
											</fo:table-cell>
										</fo:table-row>
										</xsl:if>
										
										<xsl:if test="response/registration_type_code='PRAG' or response/registration_type_code='SCAG'">
										<fo:table-row border="0.0pt solid black" height="5mm">
											<fo:table-cell border="0.0pt solid black">
												<fo:table border="0.0pt solid black">
													<fo:table-column />
													<fo:table-body>
														<fo:table-row border="0.0pt solid black"
															height="5mm">
															<fo:table-cell border="0.0pt solid black">
																<fo:block font-size="8px" font-family="Arial">State :
																</fo:block>
															</fo:table-cell>
														</fo:table-row>
													</fo:table-body>
												</fo:table>
											</fo:table-cell>
											<fo:table-cell border="0.0pt solid black">
												<fo:table border="0.0pt solid black">
													<fo:table-column />
													<fo:table-body>
														<fo:table-row border="0.0pt solid black"
															height="5mm">
															<fo:table-cell border="0.0pt solid black">
																<fo:block font-size="8px" font-family="Arial">
																	<xsl:value-of select="response/aar_stateDescription_ma"></xsl:value-of>
																</fo:block>
															</fo:table-cell>
														</fo:table-row>
													</fo:table-body>
												</fo:table>
											</fo:table-cell>
										</fo:table-row>
										</xsl:if>
										
										<xsl:if test="response/registration_type_code='PRAG' or response/registration_type_code='SCAG'">
										<fo:table-row border="0.0pt solid black" height="5mm">


											<fo:table-cell border="0.0pt solid black">
												<fo:table border="0.0pt solid black">
													<fo:table-column />
													<fo:table-body>
														<fo:table-row border="0.0pt solid black"
															height="5mm">
															<fo:table-cell border="0.0pt solid black">
																<fo:block font-size="8px" font-family="Arial">County :
																</fo:block>
															</fo:table-cell>
														</fo:table-row>
													</fo:table-body>
												</fo:table>
											</fo:table-cell>
											<fo:table-cell border="0.0pt solid black">
												<fo:table border="0.0pt solid black">
													<fo:table-column />
													<fo:table-body>
														<fo:table-row border="0.0pt solid black"
															height="5mm">
															<fo:table-cell border="0.0pt solid black">
																<fo:block font-size="8px" font-family="Arial">
																	<xsl:value-of select="response/aar_countyDescription_ma"></xsl:value-of>
																</fo:block>
															</fo:table-cell>
														</fo:table-row>
													</fo:table-body>
												</fo:table>
											</fo:table-cell>
										</fo:table-row>
										</xsl:if>
										
										<xsl:if test="response/registration_type_code='PRAG' or response/registration_type_code='SCAG'">
										<fo:table-row border="0.0pt solid black" height="5mm">


											<fo:table-cell border="0.0pt solid black">
												<fo:table border="0.0pt solid black">
													<fo:table-column />
													<fo:table-body>
														<fo:table-row border="0.0pt solid black"
															height="5mm">
															<fo:table-cell border="0.0pt solid black">
																<fo:block font-size="8px" font-family="Arial">Zip Code
																	: </fo:block>
															</fo:table-cell>
														</fo:table-row>
													</fo:table-body>
												</fo:table>
											</fo:table-cell>
											<fo:table-cell border="0.0pt solid black">
												<fo:table border="0.0pt solid black">
													<fo:table-column />
													<fo:table-body>
														<fo:table-row border="0.0pt solid black"
															height="5mm">
															<fo:table-cell border="0.0pt solid black">
																<fo:block font-size="8px" font-family="Arial">
																	<xsl:value-of select="response/aar_zipcode_ma"></xsl:value-of>
																</fo:block>
															</fo:table-cell>
														</fo:table-row>
													</fo:table-body>
												</fo:table>
											</fo:table-cell>
										</fo:table-row>
										</xsl:if>
										<xsl:if test="response/registration_type_code='PRAG' or response/registration_type_code='SCAG'">
										<xsl:if test="response/isHideAltPhone='N'">
											<fo:table-row border="0.0pt solid black" height="5mm">
											<fo:table-cell border="0.0pt solid black">
													<fo:table border="0.0pt solid black">
														<fo:table-column />
														<fo:table-body>
															<fo:table-row border="0.0pt solid black"
																height="5mm">
																<fo:table-cell border="0.0pt solid black">
																	<fo:block font-size="8px" font-family="Arial">Phone :
																	</fo:block>
																</fo:table-cell>
															</fo:table-row>
														</fo:table-body>
													</fo:table>
												</fo:table-cell>
												<fo:table-cell border="0.0pt solid black">
													<fo:table border="0.0pt solid black">
														<fo:table-column />
														<fo:table-column />
														<fo:table-column />
														<fo:table-body>
															<fo:table-row border="0.0pt solid black"
																height="5mm">
																<fo:table-cell border="0.0pt solid black">
																	<fo:block font-size="8px" font-family="Arial">
																		<xsl:value-of select="response/aar_phoneno_ma"></xsl:value-of>
																	</fo:block>
																</fo:table-cell>
																<fo:table-cell border="0.0pt solid black"
																	width="30px">
																	<fo:block font-size="8px" font-family="Arial">Extn. :
																	</fo:block>
																</fo:table-cell>
																<fo:table-cell border="0.0pt solid black">
																	<fo:block font-size="8px" font-family="Arial">
																		<xsl:value-of select="response/aar_extn_ma"></xsl:value-of>
																	</fo:block>
																</fo:table-cell>
															</fo:table-row>
														</fo:table-body>
													</fo:table>
												</fo:table-cell>
											</fo:table-row>

											<fo:table-row border="0.0pt solid black" height="5mm">
												<fo:table-cell border="0.0pt solid black">
													<fo:table border="0.0pt solid black">
														<fo:table-column />
														<fo:table-body>
															<fo:table-row border="0.0pt solid black"
																height="5mm">
																<fo:table-cell border="0.0pt solid black">
																	<fo:block font-size="8px" font-family="Arial">
																		Alt Phone : </fo:block>
																</fo:table-cell>
															</fo:table-row>
														</fo:table-body>
													</fo:table>
												</fo:table-cell>
												<fo:table-cell border="0.0pt solid black">
													<fo:table border="0.0pt solid black">
														<fo:table-column />
														<fo:table-column />
														<fo:table-column />
														<fo:table-body>
															<fo:table-row border="0.0pt solid black"
																height="5mm">
																<fo:table-cell border="0.0pt solid black">
																	<fo:block font-size="8px" font-family="Arial">
																		<xsl:value-of select="response/aar_altPhone_ma"></xsl:value-of>
																	</fo:block>
																</fo:table-cell>
																<fo:table-cell border="0.0pt solid black"
																	width="30px">
																	<fo:block font-size="8px" font-family="Arial">Extn. :
																	</fo:block>
																</fo:table-cell>
																<fo:table-cell border="0.0pt solid black">
																	<fo:block font-size="8px" font-family="Arial">
																		<xsl:value-of select="response/aar_altExtn_ma"></xsl:value-of>
																	</fo:block>
																</fo:table-cell>
															</fo:table-row>
														</fo:table-body>
													</fo:table>
												</fo:table-cell>
											</fo:table-row>
											<fo:table-row border="0.0pt solid black" height="5mm">


												<fo:table-cell border="0.0pt solid black">
													<fo:table border="0.0pt solid black">
														<fo:table-column />
														<fo:table-body>
															<fo:table-row border="0.0pt solid black"
																height="5mm">
																<fo:table-cell border="0.0pt solid black">
																	<fo:block font-size="8px" font-family="Arial">Fax :
																	</fo:block>
																</fo:table-cell>
															</fo:table-row>
														</fo:table-body>
													</fo:table>
												</fo:table-cell>
												<fo:table-cell border="0.0pt solid black">
													<fo:table border="0.0pt solid black">
														<fo:table-column />
														<fo:table-body>
															<fo:table-row border="0.0pt solid black"
																height="5mm">
																<fo:table-cell border="0.0pt solid black">
																	<fo:block font-size="8px" font-family="Arial">
																		<xsl:value-of select="response/aar_fax_ma"></xsl:value-of>
																	</fo:block>
																</fo:table-cell>
															</fo:table-row>
														</fo:table-body>
													</fo:table>
												</fo:table-cell>
											</fo:table-row>
											<fo:table-row border="0.0pt solid black" height="5mm">


												<fo:table-cell border="0.0pt solid black">
													<fo:table border="0.0pt solid black">
														<fo:table-column />
														<fo:table-body>
															<fo:table-row border="0.0pt solid black"
																height="5mm">
																<fo:table-cell border="0.0pt solid black">
																	<fo:block font-size="8px" font-family="Arial">Email ID
																		: </fo:block>
																</fo:table-cell>
															</fo:table-row>
														</fo:table-body>
													</fo:table>
												</fo:table-cell>
												<fo:table-cell border="0.0pt solid black">
													<fo:table border="0.0pt solid black">
														<fo:table-column />
														<fo:table-body>
															<fo:table-row border="0.0pt solid black"
																height="5mm">
																<fo:table-cell border="0.0pt solid black">
																	<fo:block font-size="8px" font-family="Arial">
																		<xsl:value-of select="response/aar_email_ma"></xsl:value-of>
																	</fo:block>
																</fo:table-cell>
															</fo:table-row>
														</fo:table-body>
													</fo:table>
												</fo:table-cell>
											</fo:table-row>
										</xsl:if>
										</xsl:if>
										<fo:table-row border="0.0pt solid black" height="5mm">


											<fo:table-cell border="0.0pt solid black">
												<fo:table border="0.0pt solid black">
													<fo:table-column />
													<fo:table-body>
														<fo:table-row border="0.0pt solid black"
															height="5mm">
															<fo:table-cell border="0.0pt solid black">
																<fo:block font-size="8px" font-family="Arial"></fo:block>
															</fo:table-cell>
														</fo:table-row>
													</fo:table-body>
												</fo:table>
											</fo:table-cell>
											<fo:table-cell border="0.0pt solid black">
												<fo:table border="0.0pt solid black">
													<fo:table-column />
													<fo:table-body>
														<fo:table-row border="0.0pt solid black"
															height="5mm">
															<fo:table-cell border="0.0pt solid black">
																<fo:block font-size="8px" font-family="Arial"></fo:block>
															</fo:table-cell>
														</fo:table-row>
													</fo:table-body>
												</fo:table>
											</fo:table-cell>
										</fo:table-row>
										<fo:table-row border="0.0pt solid black" height="5mm">


											<fo:table-cell border="0.0pt solid black">
												<fo:table border="0.0pt solid black">
													<fo:table-column />
													<fo:table-body>
														<fo:table-row border="0.0pt solid black"
															height="5mm">
															<fo:table-cell border="0.0pt solid black">
																<fo:block font-size="8px" font-family="Arial"></fo:block>
															</fo:table-cell>
														</fo:table-row>
													</fo:table-body>
												</fo:table>
											</fo:table-cell>
											<fo:table-cell border="0.0pt solid black">
												<fo:table border="0.0pt solid black">
													<fo:table-column />
													<fo:table-body>
														<fo:table-row border="0.0pt solid black"
															height="5mm">
															<fo:table-cell border="0.0pt solid black">
																<fo:block font-size="8px" font-family="Arial"></fo:block>
															</fo:table-cell>
														</fo:table-row>
													</fo:table-body>
												</fo:table>
											</fo:table-cell>
										</fo:table-row>
										<fo:table-row border="0.0pt solid black" height="5mm">


											<fo:table-cell border="0.0pt solid black">
												<fo:table border="0.0pt solid black">
													<fo:table-column />
													<fo:table-body>
														<fo:table-row border="0.0pt solid black"
															height="5mm">
															<fo:table-cell border="0.0pt solid black">
																<fo:block font-size="8px" font-family="Arial"></fo:block>
															</fo:table-cell>
														</fo:table-row>
													</fo:table-body>
												</fo:table>
											</fo:table-cell>
											<fo:table-cell border="0.0pt solid black">
												<fo:table border="0.0pt solid black">
													<fo:table-column />
													<fo:table-body>
														<fo:table-row border="0.0pt solid black"
															height="5mm">
															<fo:table-cell border="0.0pt solid black">
																<fo:block font-size="8px" font-family="Arial"></fo:block>
															</fo:table-cell>
														</fo:table-row>
													</fo:table-body>
												</fo:table>
											</fo:table-cell>
										</fo:table-row>
										<xsl:if test="response/agency_association_pdf ='Other'">
											<fo:table-row border="0.0pt solid black" height="5mm">


												<fo:table-cell border="0.0pt solid black">
													<fo:table border="0.0pt solid black">
														<fo:table-column />
														<fo:table-body>
															<fo:table-row border="0.0pt solid black"
																height="5mm">
																<fo:table-cell border="0.0pt solid black">
																	<fo:block font-size="8px" font-family="Arial"></fo:block>
																</fo:table-cell>
															</fo:table-row>
														</fo:table-body>
													</fo:table>
												</fo:table-cell>
												<fo:table-cell border="0.0pt solid black">
													<fo:table border="0.0pt solid black">
														<fo:table-column />
														<fo:table-body>
															<fo:table-row border="0.0pt solid black"
																height="5mm">
																<fo:table-cell border="0.0pt solid black">
																	<fo:block font-size="8px" font-family="Arial"></fo:block>
																</fo:table-cell>
															</fo:table-row>
														</fo:table-body>
													</fo:table>
												</fo:table-cell>
											</fo:table-row>
											<fo:table-row border="0.0pt solid black" height="5mm">


												<fo:table-cell border="0.0pt solid black">
													<fo:table border="0.0pt solid black">
														<fo:table-column />
														<fo:table-body>
															<fo:table-row border="0.0pt solid black"
																height="5mm">
																<fo:table-cell border="0.0pt solid black">
																	<fo:block font-size="8px" font-family="Arial"></fo:block>
																</fo:table-cell>
															</fo:table-row>
														</fo:table-body>
													</fo:table>
												</fo:table-cell>
												<fo:table-cell border="0.0pt solid black">
													<fo:table border="0.0pt solid black">
														<fo:table-column />
														<fo:table-body>
															<fo:table-row border="0.0pt solid black"
																height="5mm">
																<fo:table-cell border="0.0pt solid black">
																	<fo:block font-size="8px" font-family="Arial"></fo:block>
																</fo:table-cell>
															</fo:table-row>
														</fo:table-body>
													</fo:table>
												</fo:table-cell>
											</fo:table-row>
										</xsl:if>
									</fo:table-body>
								</fo:table>
							</fo:table-cell>



							<fo:table-cell border="0.0pt solid black">
								<fo:table border="0.0pt solid black">
									<fo:table-column border="0.0pt solid black"
										column-width="80pt" />
									<fo:table-column border="0.0pt solid black"
										column-width="140pt" />
									<fo:table-body>
									<xsl:if test="response/registration_type_code='PRAG' or response/registration_type_code='SCAG'">
										<fo:table-row border="0.0pt solid black" height="5mm">

											<fo:table-cell border="0.0pt solid black">
												<fo:table border="0.0pt solid black">
													<fo:table-column />
													<fo:table-body>
														<fo:table-row border="0.0pt solid black"
															height="5mm">
															<fo:table-cell border="0.0pt solid black">
																<fo:block font-size="8px" font-family="Arial"
																	font-weight="bold" text-decoration="underline">W9 Address
																</fo:block>
															</fo:table-cell>
														</fo:table-row>
													</fo:table-body>
												</fo:table>
											</fo:table-cell>
											<fo:table-cell border="0.0pt solid black">
												<fo:table border="0.0pt solid black">
													<fo:table-column />
													<fo:table-body>
														<fo:table-row border="0.0pt solid black"
															height="5mm">
															<fo:table-cell border="0.0pt solid black">
																<fo:block font-size="8px" font-family="Arial"></fo:block>
															</fo:table-cell>
														</fo:table-row>
													</fo:table-body>
												</fo:table>
											</fo:table-cell>
										</fo:table-row>
										</xsl:if>
										
										<xsl:if test="response/registration_type_code='PRAG' or response/registration_type_code='SCAG'">
										<fo:table-row border="0.0pt solid black" height="5mm">
											<fo:table-cell border="0.0pt solid black">
												<fo:table border="0.0pt solid black">
													<fo:table-column />
													<fo:table-body>
														<fo:table-row border="0.0pt solid black"
															height="5mm">
															<fo:table-cell border="0.0pt solid black">
																<fo:block font-size="8px" font-family="Arial">Country
																	: </fo:block>
															</fo:table-cell>
														</fo:table-row>
													</fo:table-body>
												</fo:table>
											</fo:table-cell>
											<fo:table-cell border="0.0pt solid black">
												<fo:table border="0.0pt solid black">
													<fo:table-column />
													<fo:table-body>
														<fo:table-row border="0.0pt solid black"
															height="5mm">
															<fo:table-cell border="0.0pt solid black">
																<fo:block font-size="8px" font-family="Arial">
																	<xsl:value-of select="response/aar_countryDescription_w9"></xsl:value-of>
																</fo:block>
															</fo:table-cell>
														</fo:table-row>
													</fo:table-body>
												</fo:table>
											</fo:table-cell>
										</fo:table-row>
										</xsl:if>
										
										<xsl:if test="response/registration_type_code='PRAG' or response/registration_type_code='SCAG'">
										<fo:table-row border="0.0pt solid black" height="5mm">


											<fo:table-cell border="0.0pt solid black">
												<fo:table border="0.0pt solid black">
													<fo:table-column />
													<fo:table-body>
														<fo:table-row border="0.0pt solid black"
															height="5mm">
															<fo:table-cell border="0.0pt solid black">
																<fo:block font-size="8px" font-family="Arial">Street
																	Address #1 : </fo:block>
															</fo:table-cell>
														</fo:table-row>
													</fo:table-body>
												</fo:table>
											</fo:table-cell>
											<fo:table-cell border="0.0pt solid black">
												<fo:table border="0.0pt solid black">
													<fo:table-column />
													<fo:table-body>
														<fo:table-row border="0.0pt solid black"
															height="5mm">
															<fo:table-cell border="0.0pt solid black">
																<fo:block font-size="8px" font-family="Arial">
																	<xsl:value-of select="response/aar_streetaddress1_w9"></xsl:value-of>
																</fo:block>
															</fo:table-cell>
														</fo:table-row>
													</fo:table-body>
												</fo:table>
											</fo:table-cell>
										</fo:table-row>
										</xsl:if>
										
										<xsl:if test="response/registration_type_code='PRAG' or response/registration_type_code='SCAG'">
										<fo:table-row border="0.0pt solid black" height="5mm">


											<fo:table-cell border="0.0pt solid black">
												<fo:table border="0.0pt solid black">
													<fo:table-column />
													<fo:table-body>
														<fo:table-row border="0.0pt solid black"
															height="5mm">
															<fo:table-cell border="0.0pt solid black">
																<fo:block font-size="8px" font-family="Arial">Street
																	Address #2 : </fo:block>
															</fo:table-cell>
														</fo:table-row>
													</fo:table-body>
												</fo:table>
											</fo:table-cell>
											<fo:table-cell border="0.0pt solid black">
												<fo:table border="0.0pt solid black">
													<fo:table-column />
													<fo:table-body>
														<fo:table-row border="0.0pt solid black"
															height="5mm">
															<fo:table-cell border="0.0pt solid black">
																<fo:block font-size="8px" font-family="Arial">
																	<xsl:value-of select="response/aar_streetaddress2_w9"></xsl:value-of>
																</fo:block>
															</fo:table-cell>
														</fo:table-row>
													</fo:table-body>
												</fo:table>
											</fo:table-cell>
										</fo:table-row>
										</xsl:if>
										<xsl:if test="response/isHidePOBox='N'">
											<fo:table-row border="0.0pt solid black" height="5mm">
												<fo:table-cell border="0.0pt solid black">
													<fo:table border="0.0pt solid black">
														<fo:table-column />
														<fo:table-body>
															<fo:table-row border="0.0pt solid black"
																height="5mm">
																<fo:table-cell border="0.0pt solid black">
																	<fo:block font-size="8px" font-family="Arial">P.O Box
																		: </fo:block>
																</fo:table-cell>
															</fo:table-row>
														</fo:table-body>
													</fo:table>
												</fo:table-cell>
												<fo:table-cell border="0.0pt solid black">
													<fo:table border="0.0pt solid black">
														<fo:table-column />
														<fo:table-body>
															<fo:table-row border="0.0pt solid black"
																height="5mm">
																<fo:table-cell border="0.0pt solid black">
																	<fo:block font-size="8px" font-family="Arial">
																		<xsl:value-of select="response/aar_poBox_w9"></xsl:value-of>
																	</fo:block>
																</fo:table-cell>
															</fo:table-row>
														</fo:table-body>
													</fo:table>
												</fo:table-cell>
											</fo:table-row>
										</xsl:if>
										
										<xsl:if test="response/registration_type_code='PRAG' or response/registration_type_code='SCAG'">
										<fo:table-row border="0.0pt solid black" height="5mm">
											<fo:table-cell border="0.0pt solid black">
												<fo:table border="0.0pt solid black">
													<fo:table-column />
													<fo:table-body>
														<fo:table-row border="0.0pt solid black"
															height="5mm">
															<fo:table-cell border="0.0pt solid black">
																<fo:block font-size="8px" font-family="Arial">City :
																</fo:block>
															</fo:table-cell>
														</fo:table-row>
													</fo:table-body>
												</fo:table>
											</fo:table-cell>
											<fo:table-cell border="0.0pt solid black">
												<fo:table border="0.0pt solid black">
													<fo:table-column />
													<fo:table-body>
														<fo:table-row border="0.0pt solid black"
															height="5mm">
															<fo:table-cell border="0.0pt solid black">
																<fo:block font-size="8px" font-family="Arial">
																	<xsl:value-of select="response/aar_city_w9"></xsl:value-of>
																</fo:block>
															</fo:table-cell>
														</fo:table-row>
													</fo:table-body>
												</fo:table>
											</fo:table-cell>
										</fo:table-row>
</xsl:if>


										<xsl:if test="response/registration_type_code='PRAG' or response/registration_type_code='SCAG'">
										<fo:table-row border="0.0pt solid black" height="5mm">


											<fo:table-cell border="0.0pt solid black">
												<fo:table border="0.0pt solid black">
													<fo:table-column />
													<fo:table-body>
														<fo:table-row border="0.0pt solid black"
															height="5mm">
															<fo:table-cell border="0.0pt solid black">
																<fo:block font-size="8px" font-family="Arial">State :
																</fo:block>
															</fo:table-cell>
														</fo:table-row>
													</fo:table-body>
												</fo:table>
											</fo:table-cell>
											<fo:table-cell border="0.0pt solid black">
												<fo:table border="0.0pt solid black">
													<fo:table-column />
													<fo:table-body>
														<fo:table-row border="0.0pt solid black"
															height="5mm">
															<fo:table-cell border="0.0pt solid black">
																<fo:block font-size="8px" font-family="Arial">
																	<xsl:value-of select="response/aar_stateDescription_w9"></xsl:value-of>
																</fo:block>
															</fo:table-cell>
														</fo:table-row>
													</fo:table-body>
												</fo:table>
											</fo:table-cell>
										</fo:table-row>
										</xsl:if>
										
										<xsl:if test="response/registration_type_code='PRAG' or response/registration_type_code='SCAG'">
										<fo:table-row border="0.0pt solid black" height="5mm">


											<fo:table-cell border="0.0pt solid black">
												<fo:table border="0.0pt solid black">
													<fo:table-column />
													<fo:table-body>
														<fo:table-row border="0.0pt solid black"
															height="5mm">
															<fo:table-cell border="0.0pt solid black">
																<fo:block font-size="8px" font-family="Arial">County :
																</fo:block>
															</fo:table-cell>
														</fo:table-row>
													</fo:table-body>
												</fo:table>
											</fo:table-cell>
											<fo:table-cell border="0.0pt solid black">
												<fo:table border="0.0pt solid black">
													<fo:table-column />
													<fo:table-body>
														<fo:table-row border="0.0pt solid black"
															height="5mm">
															<fo:table-cell border="0.0pt solid black">
																<fo:block font-size="8px" font-family="Arial">
																	<xsl:value-of select="response/aar_countyDescription_w9"></xsl:value-of>
																</fo:block>
															</fo:table-cell>
														</fo:table-row>
													</fo:table-body>
												</fo:table>
											</fo:table-cell>
										</fo:table-row>
										</xsl:if>
										
										<xsl:if test="response/registration_type_code='PRAG' or response/registration_type_code='SCAG'">
										<fo:table-row border="0.0pt solid black" height="5mm">


											<fo:table-cell border="0.0pt solid black">
												<fo:table border="0.0pt solid black">
													<fo:table-column />
													<fo:table-body>
														<fo:table-row border="0.0pt solid black"
															height="5mm">
															<fo:table-cell border="0.0pt solid black">
																<fo:block font-size="8px" font-family="Arial">Zip Code
																	: </fo:block>
															</fo:table-cell>
														</fo:table-row>
													</fo:table-body>
												</fo:table>
											</fo:table-cell>
											<fo:table-cell border="0.0pt solid black">
												<fo:table border="0.0pt solid black">
													<fo:table-column />
													<fo:table-body>
														<fo:table-row border="0.0pt solid black"
															height="5mm">
															<fo:table-cell border="0.0pt solid black">
																<fo:block font-size="8px" font-family="Arial">
																	<xsl:value-of select="response/aar_zipcode_w9"></xsl:value-of>
																</fo:block>
															</fo:table-cell>
														</fo:table-row>
													</fo:table-body>
												</fo:table>
											</fo:table-cell>
										</fo:table-row>
										</xsl:if>
										
										<!-- <xsl:if test="response/registration_type_code='PRAG' or response/registration_type_code='SCAG'">
										<fo:table-row border="0.0pt solid black" height="5mm">


											<fo:table-cell border="0.0pt solid black">
												<fo:table border="0.0pt solid black">
													<fo:table-column />
													<fo:table-body>
														<fo:table-row border="0.0pt solid black"
															height="5mm">
															<fo:table-cell border="0.0pt solid black">
																<fo:block font-size="8px" font-family="Arial">
																	1099 Type  : </fo:block>
															</fo:table-cell>
														</fo:table-row>
													</fo:table-body>
												</fo:table>
											</fo:table-cell>
											<fo:table-cell border="0.0pt solid black">
												<fo:table border="0.0pt solid black">
													<fo:table-column />
													<fo:table-body>
														<fo:table-row border="0.0pt solid black"
															height="5mm">
															<fo:table-cell border="0.0pt solid black">
																<fo:block font-size="8px" font-family="Arial">
																	<xsl:value-of select="response/type1099_desscription"></xsl:value-of>
																</fo:block>
															</fo:table-cell>
														</fo:table-row>
													</fo:table-body>
												</fo:table>
											</fo:table-cell>
										</fo:table-row>
										</xsl:if> -->
										
										<!-- <xsl:if test="response/registration_type_code='PRAG' or response/registration_type_code='SCAG'">
										<fo:table-row border="0.0pt solid black" height="5mm">


											<fo:table-cell border="0.0pt solid black">
												<fo:table border="0.0pt solid black">
													<fo:table-column />
													<fo:table-body>
														<fo:table-row border="0.0pt solid black"
															height="5mm">
															<fo:table-cell border="0.0pt solid black">
																<fo:block font-size="8px" font-family="Arial">W9 Legal
																	Name : </fo:block>
															</fo:table-cell>
														</fo:table-row>
													</fo:table-body>
												</fo:table>
											</fo:table-cell>
											<fo:table-cell border="0.0pt solid black">
												<fo:table border="0.0pt solid black">
													<fo:table-column />
													<fo:table-body>
														<fo:table-row border="0.0pt solid black"
															height="5mm">
															<fo:table-cell border="0.0pt solid black" width="1.9in">
																<fo:block font-size="8px" font-family="Arial">
																	<xsl:value-of select="response/taxpayer_name"></xsl:value-of>
																</fo:block>
															</fo:table-cell>
														</fo:table-row>
													</fo:table-body>
												</fo:table>
											</fo:table-cell>
										</fo:table-row>
</xsl:if> -->

											<xsl:if test="response/registration_type_code='PRAG' or response/registration_type_code='SCAG'">
											<fo:table-row border="0.0pt solid black" height="5mm">


												<fo:table-cell border="0.0pt solid black">
													<fo:table border="0.0pt solid black">
														<fo:table-column />
														<fo:table-body>
															<fo:table-row border="0.0pt solid black"
																height="5mm">
																<fo:table-cell border="0.0pt solid black">
																	<fo:block font-size="8px" font-family="Arial">Phone :
																	</fo:block>
																</fo:table-cell>
															</fo:table-row>
														</fo:table-body>
													</fo:table>
												</fo:table-cell>
												<fo:table-cell border="0.0pt solid black">
													<fo:table border="0.0pt solid black">
														<fo:table-column />
														<fo:table-column />
														<fo:table-column />
														<fo:table-body>
															<fo:table-row border="0.0pt solid black"
																height="5mm">
																<fo:table-cell border="0.0pt solid black">
																	<fo:block font-size="8px" font-family="Arial">
																		<xsl:value-of select="response/aar_phoneno_w9"></xsl:value-of>
																	</fo:block>
																</fo:table-cell>
																<fo:table-cell border="0.0pt solid black"
																	width="30px">
																	<fo:block font-size="8px" font-family="Arial">Extn. :
																	</fo:block>
																</fo:table-cell>
																<fo:table-cell border="0.0pt solid black">
																	<fo:block font-size="8px" font-family="Arial">
																		<xsl:value-of select="response/aar_extn_w9"></xsl:value-of>
																	</fo:block>
																</fo:table-cell>
															</fo:table-row>
														</fo:table-body>
													</fo:table>
												</fo:table-cell>
											</fo:table-row>
											</xsl:if>
<xsl:if test="response/isHideAltPhone='N'">
											<fo:table-row border="0.0pt solid black" height="5mm">
												<fo:table-cell border="0.0pt solid black">
													<fo:table border="0.0pt solid black">
														<fo:table-column />
														<fo:table-body>
															<fo:table-row border="0.0pt solid black"
																height="5mm">
																<fo:table-cell border="0.0pt solid black">
																	<fo:block font-size="8px" font-family="Arial">
																		Alt Phone : </fo:block>
																</fo:table-cell>
															</fo:table-row>
														</fo:table-body>
													</fo:table>
												</fo:table-cell>
												<fo:table-cell border="0.0pt solid black">
													<fo:table border="0.0pt solid black">
														<fo:table-column />
														<fo:table-column />
														<fo:table-column />
														<fo:table-body>
															<fo:table-row border="0.0pt solid black"
																height="5mm">
																<fo:table-cell border="0.0pt solid black">
																	<fo:block font-size="8px" font-family="Arial">
																		<xsl:value-of select="response/aar_altPhone_w9"></xsl:value-of>
																	</fo:block>
																</fo:table-cell>
																<fo:table-cell border="0.0pt solid black"
																	width="30px">
																	<fo:block font-size="8px" font-family="Arial">Extn. :
																	</fo:block>
																</fo:table-cell>
																<fo:table-cell border="0.0pt solid black">
																	<fo:block font-size="8px" font-family="Arial">
																		<xsl:value-of select="response/aar_altExtn_w9"></xsl:value-of>
																	</fo:block>
																</fo:table-cell>
															</fo:table-row>
														</fo:table-body>
													</fo:table>
												</fo:table-cell>
											</fo:table-row>
											<fo:table-row border="0.0pt solid black" height="5mm">


												<fo:table-cell border="0.0pt solid black">
													<fo:table border="0.0pt solid black">
														<fo:table-column />
														<fo:table-body>
															<fo:table-row border="0.0pt solid black"
																height="5mm">
																<fo:table-cell border="0.0pt solid black">
																	<fo:block font-size="8px" font-family="Arial">Fax :
																	</fo:block>
																</fo:table-cell>
															</fo:table-row>
														</fo:table-body>
													</fo:table>
												</fo:table-cell>
												<fo:table-cell border="0.0pt solid black">
													<fo:table border="0.0pt solid black">
														<fo:table-column />
														<fo:table-body>
															<fo:table-row border="0.0pt solid black"
																height="5mm">
																<fo:table-cell border="0.0pt solid black">
																	<fo:block font-size="8px" font-family="Arial">
																		<xsl:value-of select="response/aar_fax_w9"></xsl:value-of>
																	</fo:block>
																</fo:table-cell>
															</fo:table-row>
														</fo:table-body>
													</fo:table>
												</fo:table-cell>
											</fo:table-row>
											<fo:table-row border="0.0pt solid black" height="5mm">


												<fo:table-cell border="0.0pt solid black">
													<fo:table border="0.0pt solid black">
														<fo:table-column />
														<fo:table-body>
															<fo:table-row border="0.0pt solid black"
																height="5mm">
																<fo:table-cell border="0.0pt solid black">
																	<fo:block font-size="8px" font-family="Arial">Email ID
																		: </fo:block>
																</fo:table-cell>
															</fo:table-row>
														</fo:table-body>
													</fo:table>
												</fo:table-cell>
												<fo:table-cell border="0.0pt solid black">
													<fo:table border="0.0pt solid black">
														<fo:table-column />
														<fo:table-body>
															<fo:table-row border="0.0pt solid black"
																height="5mm">
																<fo:table-cell border="0.0pt solid black">
																	<fo:block font-size="8px" font-family="Arial">
																		<xsl:value-of select="response/aar_email_w9"></xsl:value-of>
																	</fo:block>
																</fo:table-cell>
															</fo:table-row>
														</fo:table-body>
													</fo:table>
												</fo:table-cell>
											</fo:table-row>

										</xsl:if>
										<fo:table-row border="0.0pt solid black" height="5mm">


											<fo:table-cell border="0.0pt solid black">
												<fo:table border="0.0pt solid black">
													<fo:table-column />
													<fo:table-body>
														<fo:table-row border="0.0pt solid black"
															height="5mm">
															<fo:table-cell border="0.0pt solid black">
																<fo:block font-size="8px" font-family="Arial"></fo:block>
															</fo:table-cell>
														</fo:table-row>
													</fo:table-body>
												</fo:table>
											</fo:table-cell>
											<fo:table-cell border="0.0pt solid black">
												<fo:table border="0.0pt solid black">
													<fo:table-column />
													<fo:table-body>
														<fo:table-row border="0.0pt solid black"
															height="5mm">
															<fo:table-cell border="0.0pt solid black">
																<fo:block font-size="8px" font-family="Arial"></fo:block>
															</fo:table-cell>
														</fo:table-row>
													</fo:table-body>
												</fo:table>
											</fo:table-cell>
										</fo:table-row>
										<fo:table-row border="0.0pt solid black" height="5mm">


											<fo:table-cell border="0.0pt solid black">
												<fo:table border="0.0pt solid black">
													<fo:table-column />
													<fo:table-body>
														<fo:table-row border="0.0pt solid black"
															height="5mm">
															<fo:table-cell border="0.0pt solid black">
																<fo:block font-size="8px" font-family="Arial"></fo:block>
															</fo:table-cell>
														</fo:table-row>
													</fo:table-body>
												</fo:table>
											</fo:table-cell>
											<fo:table-cell border="0.0pt solid black">
												<fo:table border="0.0pt solid black">
													<fo:table-column />
													<fo:table-body>
														<fo:table-row border="0.0pt solid black"
															height="5mm">
															<fo:table-cell border="0.0pt solid black">
																<fo:block font-size="8px" font-family="Arial"></fo:block>
															</fo:table-cell>
														</fo:table-row>
													</fo:table-body>
												</fo:table>
											</fo:table-cell>
										</fo:table-row>
										<fo:table-row border="0.0pt solid black" height="5mm">


											<fo:table-cell border="0.0pt solid black">
												<fo:table border="0.0pt solid black">
													<fo:table-column />
													<fo:table-body>
														<fo:table-row border="0.0pt solid black"
															height="5mm">
															<fo:table-cell border="0.0pt solid black">
																<fo:block font-size="8px" font-family="Arial"></fo:block>
															</fo:table-cell>
														</fo:table-row>
													</fo:table-body>
												</fo:table>
											</fo:table-cell>
											<fo:table-cell border="0.0pt solid black">
												<fo:table border="0.0pt solid black">
													<fo:table-column />
													<fo:table-body>
														<fo:table-row border="0.0pt solid black"
															height="5mm">
															<fo:table-cell border="0.0pt solid black">
																<fo:block font-size="8px" font-family="Arial"></fo:block>
															</fo:table-cell>
														</fo:table-row>
													</fo:table-body>
												</fo:table>
											</fo:table-cell>
										</fo:table-row>
										<xsl:if test="response/agency_association_pdf ='Other'">
											<fo:table-row border="0.0pt solid black" height="5mm">


												<fo:table-cell border="0.0pt solid black">
													<fo:table border="0.0pt solid black">
														<fo:table-column />
														<fo:table-body>
															<fo:table-row border="0.0pt solid black"
																height="5mm">
																<fo:table-cell border="0.0pt solid black">
																	<fo:block font-size="8px" font-family="Arial"></fo:block>
																</fo:table-cell>
															</fo:table-row>
														</fo:table-body>
													</fo:table>
												</fo:table-cell>
												<fo:table-cell border="0.0pt solid black">
													<fo:table border="0.0pt solid black">
														<fo:table-column />
														<fo:table-body>
															<fo:table-row border="0.0pt solid black"
																height="5mm">
																<fo:table-cell border="0.0pt solid black">
																	<fo:block font-size="8px" font-family="Arial"></fo:block>
																</fo:table-cell>
															</fo:table-row>
														</fo:table-body>
													</fo:table>
												</fo:table-cell>
											</fo:table-row>
											<fo:table-row border="0.0pt solid black" height="5mm">


												<fo:table-cell border="0.0pt solid black">
													<fo:table border="0.0pt solid black">
														<fo:table-column />
														<fo:table-body>
															<fo:table-row border="0.0pt solid black"
																height="5mm">
																<fo:table-cell border="0.0pt solid black">
																	<fo:block font-size="8px" font-family="Arial"></fo:block>
																</fo:table-cell>
															</fo:table-row>
														</fo:table-body>
													</fo:table>
												</fo:table-cell>
												<fo:table-cell border="0.0pt solid black">
													<fo:table border="0.0pt solid black">
														<fo:table-column />
														<fo:table-body>
															<fo:table-row border="0.0pt solid black"
																height="5mm">
																<fo:table-cell border="0.0pt solid black">
																	<fo:block font-size="8px" font-family="Arial"></fo:block>
																</fo:table-cell>
															</fo:table-row>
														</fo:table-body>
													</fo:table>
												</fo:table-cell>
											</fo:table-row>
										</xsl:if>
										
										
									</fo:table-body>
								</fo:table>
							</fo:table-cell>
						</fo:table-row>
					</fo:table-body>
				</fo:table>
			</fo:block>

			
			
			
			
			
			<xsl:if test="response/registration_type_code='PRAG' or response/registration_type_code='SCAG'">
			<fo:block >
				<fo:table border="0.0pt solid black">
					<fo:table-column  />
					<fo:table-column />
					<fo:table-body>
					
						<fo:table-row >
							<fo:table-cell width="150pt" padding-top="-15mm" >
								<fo:block font-size="8px" font-family="Arial"
									font-weight="bold">
									<fo:inline>Dividend Distribution</fo:inline>
								</fo:block>
								<fo:block  margin-top="1mm" font-size="8px" font-family="Arial" wrap-option="no-wrap"
									>
									<fo:inline>Please select from the available options below:</fo:inline>
								</fo:block>
								<fo:block margin-left="15px" font-size="8px" font-family="Arial" wrap-option="no-wrap" margin-top="1mm"
									>
									<fo:inline>Builders Mutual can mail your policyholders dividend checks to your agency for distribution:&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;</fo:inline>
										<xsl:if test="response/dividend_distribution_id=1">
										<fo:inline >Y</fo:inline>
										</xsl:if>
								</fo:block>
								<fo:block margin-left="15px" font-size="8px" font-family="Arial" wrap-option="no-wrap" margin-top="1mm"
									>
									<fo:inline>Builders Mutual can mail your policyholders dividend checks directly to them:&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;</fo:inline>
										<xsl:if test="response/dividend_distribution_id=2">
										<fo:inline >Y</fo:inline>
										</xsl:if>
								</fo:block>
								
							</fo:table-cell>
							<fo:table-cell>
								<fo:block>
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						
					</fo:table-body>
				</fo:table>
			</fo:block>
			</xsl:if>
			
			
			<xsl:if test="response/registration_type_code='PRAG' or response/registration_type_code='SCAG'">
			<fo:block >
				<fo:table border="0.0pt solid black">
					<fo:table-column  />
					<fo:table-column />
					<fo:table-body>
					
						<fo:table-row >
							<fo:table-cell width="150pt" padding-top="5mm" >
								<fo:block font-size="8px" font-family="Arial"
									font-weight="bold">
									<fo:inline>Policyholder Copies</fo:inline>
								</fo:block>
								<fo:block  margin-top="1mm" font-size="8px" font-family="Arial" wrap-option="no-wrap"
									>
									<fo:inline>Please select one option below:</fo:inline>
									
								</fo:block>
								<fo:block margin-left="15px" font-size="8px" font-family="Arial" wrap-option="no-wrap" margin-top="1mm"
									>
									<fo:inline>We would like to receive our policyholders' new and renewal policies. (Note- Not available for Maryland agents):&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;</fo:inline>
									
										<xsl:if test="response/policyholder_copies_id=1">
										<fo:inline >
											Y
										</fo:inline>
										
										</xsl:if>
									
								</fo:block>
								<fo:block margin-left="15px" font-size="8px" font-family="Arial" wrap-option="no-wrap" margin-top="1mm"
									>
									<fo:inline>We would like to receive our policyholders' new policies only. Builders Mutual will mail renewals directly to our policyholders:&#160;&#160;&#160;&#160;&#160;</fo:inline>
										<xsl:if test="response/policyholder_copies_id=2">
										<fo:inline >
											Y
										</fo:inline>
										
										</xsl:if>
								</fo:block>
								<fo:block margin-left="15px" font-size="8px" font-family="Arial" wrap-option="no-wrap" margin-top="1mm"
									>
									<fo:inline>Please mail all new and renewal policies directly to our policyholders:&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;</fo:inline>
										<xsl:if test="response/policyholder_copies_id=3">
										<fo:inline >
											Y
										</fo:inline>
										
										</xsl:if>
								</fo:block>
								
							</fo:table-cell>
							<fo:table-cell>
								<fo:block>
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						
					</fo:table-body>
				</fo:table>
			</fo:block>
			</xsl:if>
			
			
			
			<xsl:if test="response/registration_type_code='PRAG' or response/registration_type_code='SCAG'">
			<fo:block break-after="page"/>
			<fo:block >
				<fo:table border="0.0pt solid black">
					<fo:table-column  />
					
					<fo:table-body>
					
						<fo:table-row >
							<fo:table-cell  padding-top="5mm" >
								<fo:block font-size="8px" text-align="justify" font-family="Arial" 
									font-weight="bold">
									<fo:inline> Please select the states you are currently licensed. Builders Mutual Insurance states are in bold. You will be appointed in the Builders Mutual states you are licensed.</fo:inline>
								</fo:block>
								<fo:block font-size="8px" font-family="Arial" padding-top="1mm"
									>
									<fo:inline><xsl:value-of select="description"></xsl:value-of></fo:inline>
								</fo:block>
							</fo:table-cell>
							
						</fo:table-row>
						
						<xsl:for-each select="response/agencyListPublicSubmitEdit_list_mom_3/data">
						<fo:table-row >
							<fo:table-cell   >
								<fo:block font-size="8px" font-family="Arial" 
									>
									<fo:inline><xsl:value-of select="description"></xsl:value-of></fo:inline>
								</fo:block>
							</fo:table-cell>
							
						</fo:table-row>
						</xsl:for-each>
					</fo:table-body>
				</fo:table>
			</fo:block>
			</xsl:if>
			
			
			<xsl:if test="response/registration_type_code='PRERG'">
			<fo:block >
				<fo:table border="0.0pt solid black">
					<fo:table-column />
					<fo:table-column />
					<fo:table-body>
						<fo:table-row >
							<fo:table-cell width="150pt" padding-top="-15mm" >
								<fo:block font-size="8px" font-family="Arial"
									font-weight="bold">
									<fo:inline>Agent Background Questions</fo:inline>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell>
								<fo:block></fo:block>
							</fo:table-cell>
						</fo:table-row>
					</fo:table-body>
				</fo:table>
			</fo:block>
			
			<fo:block margin-top="-3mm">
				<fo:table border="1.0pt solid black" margin-top="-3mm">
					<fo:table-column border="1.0pt solid black" />
					<fo:table-column border="1.0pt solid black" />
					<fo:table-body>
					<xsl:if test="response/agentQuestions_list_1 !=''">
						<xsl:for-each select="response/agentQuestions_list_1/data">
							<fo:table-row border="1.0pt solid black" margin-top="-3mm"> 
								<fo:table-cell width="480pt"
									padding-start="5px" padding-top="3mm" padding-bottom="3px">
									<fo:block font-size="8px" font-family="Arial">
										<xsl:value-of select="position()"></xsl:value-of>
										.
										<xsl:value-of select="question" />
									</fo:block>
								</fo:table-cell>
								<fo:table-cell 
									padding-top="3px" padding-bottom="3px">
									<fo:block font-size="8px" font-family="Arial"
										text-align="center">
										<xsl:choose>
											<xsl:when test="response=1">
												Y
											</xsl:when>
											<xsl:when test="response=0">
												N
											</xsl:when>
										</xsl:choose>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							
						<xsl:if test="showComment ='Y'">
							<fo:table-row border="1.0pt solid black" >
								
								<fo:table-cell 
									padding-top="3px" padding-bottom="3px" width="460pt" number-columns-spanned="2" start-indent="14pt">
									<fo:block font-size="8px" font-family="Arial">
										<xsl:value-of select="comment"></xsl:value-of>
										
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
						</xsl:if>
					
						</xsl:for-each>
</xsl:if>

					</fo:table-body>
				</fo:table>
			</fo:block>
			</xsl:if>
			<xsl:if test="response/registration_type_code='PRERG' or response/registration_type_code='PRAG' or response/registration_type_code='SCAG'">
			<fo:block margin-top="5mm">
				<fo:table border="0.0pt solid black">
					<fo:table-column />
					<fo:table-column />
					<fo:table-body>
						<fo:table-row height="5mm">
							<fo:table-cell width="150pt">
								<fo:block font-size="8px" font-family="Arial" wrap-option="no-wrap"
									font-weight="bold">
									<fo:inline>
									Principal/Key Contact/Producer Information
									</fo:inline>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell>
								<fo:block></fo:block>
							</fo:table-cell>
						</fo:table-row>
					</fo:table-body>
				</fo:table>
			</fo:block>
			</xsl:if>
			<xsl:if test="response/registration_type_code='PRERG' or response/registration_type_code='PRAG' or response/registration_type_code='SCAG'">
			<fo:block margin-top="1mm">
				<fo:table border="1.0pt solid black">
					<fo:table-column border="1.0pt solid black" column-width="50pt"/>
					<fo:table-column border="1.0pt solid black" column-width="50pt"/>
					<fo:table-column border="1.0pt solid black" column-width="50pt"/>
					<fo:table-column border="1.0pt solid black" column-width="120pt"/>
					<!-- <fo:table-column border="1.0pt solid black" column-width="50pt"/> -->
					<fo:table-column border="1.0pt solid black" column-width="60pt"/>
					<fo:table-column border="1.0pt solid black" column-width="50pt"/>
					<fo:table-column border="1.0pt solid black" column-width="50pt"/>
					<fo:table-column border="1.0pt solid black" column-width="90pt"/>
					
					<fo:table-body>
						<!-- <xsl:for-each select="response/agencyListPublicSubmitNInvitationEdit_list_1/data"> -->
							<fo:table-row border="1.0pt solid black">
								<fo:table-cell  
									padding-start="5px" padding-top="3px" padding-bottom="3px">
									<fo:block font-size="8px" font-family="Arial">
										Last Name
									</fo:block>
								</fo:table-cell>
								<fo:table-cell 
									padding-top="3px" padding-bottom="3px">
									<fo:block font-size="8px" font-family="Arial"
										text-align="center">
										First Name
									</fo:block>
								</fo:table-cell>
								<fo:table-cell 
									padding-top="3px" padding-bottom="3px">
									<fo:block font-size="8px" font-family="Arial"
										text-align="center">
										Middle Name
									</fo:block>
								</fo:table-cell>
								<fo:table-cell 
									padding-top="3px" padding-bottom="3px" >
									<fo:block font-size="8px" font-family="Arial"
										text-align="center">
										Email Id
									</fo:block>
								</fo:table-cell>
								
								<fo:table-cell 
									padding-top="3px" padding-bottom="3px">
									<fo:block font-size="8px" font-family="Arial"
										text-align="center">
											Phone
									</fo:block>
								</fo:table-cell>
								<fo:table-cell 
									padding-top="3px" padding-bottom="3px">
									<fo:block font-size="8px" font-family="Arial"
										text-align="center">
									SSN
									</fo:block>
								</fo:table-cell>
								<fo:table-cell 
									padding-top="3px" padding-bottom="3px">
									<fo:block font-size="8px" font-family="Arial"
										text-align="center">
										NPN
									</fo:block>
								</fo:table-cell>
								<fo:table-cell 
									padding-top="3px" padding-bottom="3px">
									<fo:block font-size="8px" font-family="Arial"
										text-align="center">
									Contact Type
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<xsl:if test="response/agencyListPublicSubmitNInvitationEdit_list_1/data !='' ">
							<xsl:for-each select="response/agencyListPublicSubmitNInvitationEdit_list_1/data">
							<fo:table-row border="1.0pt solid black">
								<fo:table-cell  
									padding-start="5px" padding-top="3px" padding-bottom="3px">
									<fo:block font-size="8px" font-family="Arial">
										<xsl:value-of select="lastname"></xsl:value-of>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell 
									padding-top="3px" padding-bottom="3px">
									<fo:block font-size="8px" font-family="Arial"
										text-align="center">
										<xsl:value-of select="firstname"></xsl:value-of>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell 
									padding-top="3px" padding-bottom="3px">
									<fo:block font-size="8px" font-family="Arial"
										text-align="center">
										<xsl:value-of select="middlename"></xsl:value-of>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell 
									padding-top="3px" padding-bottom="3px" >
									<fo:block font-size="8px" font-family="Arial"
										text-align="center">
										<xsl:value-of select="e_mail"></xsl:value-of>
									</fo:block>
								</fo:table-cell>
								
								<fo:table-cell 
									padding-top="3px" padding-bottom="3px">
									<fo:block font-size="8px" font-family="Arial"
										text-align="center">
										<xsl:value-of select="phoneno"></xsl:value-of>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell 
									padding-top="3px" padding-bottom="3px">
									<fo:block font-size="8px" font-family="Arial"
										text-align="center">
									XXX-XX-XXXX
									</fo:block>
								</fo:table-cell>
								
								<fo:table-cell 
									padding-top="3px" padding-bottom="3px">
									<fo:block font-size="8px" font-family="Arial"
										text-align="center">
										<xsl:value-of select="npn"></xsl:value-of>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell 
									padding-top="3px" padding-bottom="3px">
									<fo:block font-size="8px" font-family="Arial"
										text-align="center">
									<xsl:value-of select="contacttypedescription"></xsl:value-of>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							</xsl:for-each>
							</xsl:if>
						<!-- </xsl:for-each> -->


					</fo:table-body>
				</fo:table>
			</fo:block>
			</xsl:if>
			
			
			
			<xsl:if test="response/registration_type_code='PRAG' or response/registration_type_code='SCAG'">
			<fo:block break-after="page"/>
			</xsl:if>
			<xsl:if test="response/registration_type_code='PRAG' or response/registration_type_code='SCAG'">
			<fo:block margin-top="5mm">
				<fo:table border="0.0pt solid black">
					<fo:table-column />
					<fo:table-column />
					<fo:table-body>
						<fo:table-row height="5mm">
							<fo:table-cell width="150pt">
								<fo:block font-size="8px" font-family="Arial" wrap-option="no-wrap"
									font-weight="bold">
									<fo:inline>
									Market Information
									</fo:inline>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell>
								<fo:block></fo:block>
							</fo:table-cell>
						</fo:table-row>
					</fo:table-body>
				</fo:table>
			</fo:block>
			</xsl:if>
			<xsl:if test="response/registration_type_code='PRAG' or response/registration_type_code='SCAG'">
			<fo:block margin-top="1mm">
				<fo:table border="0.0pt solid black">
					<fo:table-column />
					<fo:table-column />
					<fo:table-column />
					<fo:table-column />
					
					<fo:table-body>
					 <xsl:for-each select="response/getAgencyCurrentMarketInfoRecord_list_1/data"> 
						<fo:table-row height="5mm" border="1.0pt solid black">
							<fo:table-cell width="150pt">
								<fo:block font-size="8px" font-family="Arial" wrap-option="no-wrap"
									>
									<fo:inline>
									Total Premium for all P &amp; C :
									</fo:inline>
									<fo:inline>
									<xsl:value-of select="total_premium_PC" />
									</fo:inline>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell>
								<fo:block></fo:block>
							</fo:table-cell>
							<fo:table-cell width="150pt">
								<fo:block font-size="8px" font-family="Arial" wrap-option="no-wrap"
									>
									<fo:inline>
									Total Agency Volume :
									</fo:inline>
									<fo:inline>
									<xsl:value-of select="total_annual_revenue" />
									</fo:inline>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell  width="150pt">
								<fo:block font-size="8px" font-family="Arial" 
									>
									<fo:inline>
									Agency's Total P&amp;C Written Premium Previous Year End :	
									</fo:inline>
									<fo:inline>
									$<xsl:value-of select="total_written_premium_previous_year_end" />
									</fo:inline>
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						</xsl:for-each>
						 <!-- <xsl:for-each select="response/getAgencyCurrentMarketInfoRecord_list_1/data">
						<fo:table-row height="5mm">
							<fo:table-cell width="150pt">
								<fo:block font-size="8px" font-family="Arial" 
									>
									<fo:inline>
									Agency's Total P&amp;C Written Premium Previous Year End :	
									</fo:inline>
									<fo:inline>
									<xsl:value-of select="total_written_premium_previous_year_end" />
									</fo:inline>
								</fo:block>
							</fo:table-cell>
						
							
						</fo:table-row>
						</xsl:for-each> -->
					</fo:table-body>
				</fo:table>
			</fo:block>
			</xsl:if>
			<xsl:if test="response/registration_type_code='PRAG' or response/registration_type_code='SCAG'">
			<fo:block margin-top="5mm">
				<fo:table border="0.0pt solid black">
					<fo:table-column />
					<fo:table-column />
					<fo:table-body>
						<fo:table-row height="5mm">
							<fo:table-cell width="150pt">
								<fo:block font-size="8px" font-family="Arial" wrap-option="no-wrap"
									font-weight="bold">
									<fo:inline>
									Mix of Business
									</fo:inline>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell>
								<fo:block></fo:block>
							</fo:table-cell>
						</fo:table-row>
					</fo:table-body>
				</fo:table>
			</fo:block>
			</xsl:if>
			<xsl:if test="response/registration_type_code='PRAG' or response/registration_type_code='SCAG'">
			<xsl:if test="response/getAgencyCurrentMarketInfoRecord_list_1/data!=''">
			<xsl:for-each select="response/getAgencyCurrentMarketInfoRecord_list_1/data">
			<fo:block margin-top="1mm">
				<fo:table border="0.0pt solid black">
					<fo:table-column />
					<fo:table-column />
					<fo:table-column />
					<fo:table-column />
					
					<fo:table-body>
						<fo:table-row height="5mm" border="1.0pt solid black">
							<fo:table-cell width="150pt">
								<fo:block font-size="8px" font-family="Arial" wrap-option="no-wrap"
									>
									<fo:inline>
									Personal :	
									</fo:inline>
									<fo:inline>
									<xsl:value-of select="mix_of_personal_business" />
									</fo:inline>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell>
								<fo:block></fo:block>
							</fo:table-cell>
							<fo:table-cell width="150pt">
								<fo:block font-size="8px" font-family="Arial" wrap-option="no-wrap"
									>
									<fo:inline>
									Commercial :
									</fo:inline>
									<fo:inline>
								<xsl:value-of select="mix_of_commercial_business" />
									</fo:inline>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell>
								<fo:block></fo:block>
							</fo:table-cell>
						</fo:table-row>
						
					</fo:table-body>
				</fo:table>
			</fo:block>
			</xsl:for-each>
			</xsl:if>
			</xsl:if>
			<xsl:if test="response/registration_type_code='PRAG' or response/registration_type_code='SCAG'">
			<fo:block margin-top="5mm">
				<fo:table border="0.0pt solid black">
					<fo:table-column />
					
					<fo:table-body>
					<xsl:for-each select="response/getMarketInfoData_list_1/data">
						<fo:table-row height="5mm">
						
						
							<fo:table-cell>
								<fo:block font-size="8px" font-family="Arial" font-weight="bold"
									>
								Commercial Lines	
								</fo:block>
								<fo:block font-size="8px" font-family="Arial"  padding-top="1mm"
									>
								In terms of premium size, what percent of the agency's accounts are under	
								</fo:block>
							</fo:table-cell>
							
						</fo:table-row>
						
						</xsl:for-each>
						</fo:table-body>
						</fo:table>
						</fo:block>
						</xsl:if>
						
						
						
					<!-- new table -->	
						
						
		<xsl:if test="response/registration_type_code='PRAG' or response/registration_type_code='SCAG'">
			<fo:block margin-top="1mm">
				<fo:table border="1.0pt solid black">
					<fo:table-column border="1.0pt solid black" column-width="50%" />
					<fo:table-column border="1.0pt solid black" column-width="50%"/>
					<fo:table-body>
						
							<fo:table-row border="1.0pt solid black">
								<fo:table-cell  
									padding-start="5px" padding-top="1px" padding-bottom="3px">
									<fo:block font-size="8px" font-family="Arial">
										Premium Size
										
									</fo:block>
								</fo:table-cell>
								<fo:table-cell 
									padding-top="3px" padding-bottom="3px">
									<fo:block font-size="8px" font-family="Arial"
										text-align="center">
										Percentage
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							
							<fo:table-row border="1.0pt solid black">
								<fo:table-cell  
									padding-start="5px" padding-top="3px" padding-bottom="3px">
									<fo:block font-size="8px" font-family="Arial">
										
										
									</fo:block>
								</fo:table-cell>
								<fo:table-cell 
									padding-top="3px" padding-bottom="3px">
									<fo:block font-size="8px" font-family="Arial"
										text-align="center">
										
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
						


					</fo:table-body>
				</fo:table>
			</fo:block>
			</xsl:if>
						
						
						
						
						
						
						
						
						
						
						
						
						
						
						
						
						
						
						<xsl:if test="response/registration_type_code='PRAG' or response/registration_type_code='SCAG'">
			<fo:block margin-top="5mm">
				<fo:table border="0.0pt solid black">
					<fo:table-column />
					
					<fo:table-body>
					<xsl:for-each select="response/getMarketInfoData_list_1/data">
						<fo:table-row height="5mm" border="1.0pt solid black">
						
						
							<fo:table-cell padding-top="2mm">
								<fo:block font-size="8px" font-family="Arial" 
									>
									<fo:inline font-weight="bold">
								Does the agency pay commission to its producers on all premium sized accounts or is there a minimum premium/commission threshold on an account that must be met first?
									</fo:inline>
								</fo:block>
								<fo:block font-size="8px" font-family="Arial" padding-top="1mm"
									>
									<fo:inline>
								<xsl:value-of select="agency_pay_commission_to_producers" />
									</fo:inline>
								</fo:block>
							</fo:table-cell>
							
						</fo:table-row>
						
						
						</xsl:for-each>
					</fo:table-body>
				</fo:table>
			</fo:block>
			</xsl:if>
			
			
			
			
			<xsl:if test="response/registration_type_code='PRAG' or response/registration_type_code='SCAG'">
			<fo:block margin-top="5mm">
				<fo:table border="0.0pt solid black">
					<fo:table-column />
					
					<fo:table-body>
					<xsl:for-each select="response/getMarketInfoData_list_1/data">
						<fo:table-row height="5mm" border="1.0pt solid black">
						
						
							<fo:table-cell padding-top="2mm">
								<fo:block font-size="8px" font-family="Arial" 
									>
									<fo:inline font-weight="bold">
								What is the premium threshold?
									</fo:inline>
								</fo:block>
								<fo:block font-size="8px" font-family="Arial"  padding-top="1mm"
									>
									<fo:inline>
								<xsl:value-of select="premium_threshold" />
									</fo:inline>
								</fo:block>
							</fo:table-cell>
							
						</fo:table-row>
						
						
						</xsl:for-each>
					</fo:table-body>
				</fo:table>
			</fo:block>
			</xsl:if>
			
			<xsl:if test="response/registration_type_code='PRAG' or response/registration_type_code='SCAG'">
			<fo:block margin-top="5mm">
				<fo:table border="0.0pt solid black">
					<fo:table-column />
					
					<fo:table-body>
					<xsl:for-each select="response/getMarketInfoData_list_1/data">
						<fo:table-row height="5mm" border="1.0pt solid black">
						
						
							<fo:table-cell padding-top="2mm">
								<fo:block font-size="8px" font-family="Arial" 
									>
									<fo:inline font-weight="bold">
								What is the industry makeup of the agency's commercial book of business?
									</fo:inline>
								</fo:block>
								<fo:block font-size="8px" font-family="Arial"  padding-top="1mm"
									>
									<fo:inline>
								<xsl:value-of select="industry_makeup_agency_commercial" />
									</fo:inline>
								</fo:block>
							</fo:table-cell>
							
						</fo:table-row>
						
						
						</xsl:for-each>
					</fo:table-body>
				</fo:table>
			</fo:block>
			</xsl:if>
			
			
			<xsl:if test="response/registration_type_code='PRAG' or response/registration_type_code='SCAG'">
			<fo:block margin-top="5mm">
				<fo:table border="0.0pt solid black">
					<fo:table-column />
					
					<fo:table-body>
					<xsl:for-each select="response/getMarketInfoData_list_1/data">
						<fo:table-row height="5mm" border="1.0pt solid black">
						
						
							<fo:table-cell padding-top="2mm">
								<fo:block font-size="8px" font-family="Arial" 
									>
									<fo:inline font-weight="bold">
								What is size of accounts are placed in this service center
									</fo:inline>
								</fo:block>
								<fo:block font-size="8px" font-family="Arial"  padding-top="1mm"
									>
									<fo:inline>
								<xsl:value-of select="accounts_size" />
									</fo:inline>
								</fo:block>
							</fo:table-cell>
							
						</fo:table-row>
						
						
						</xsl:for-each>
					</fo:table-body>
				</fo:table>
			</fo:block>
			</xsl:if>
			
			
			<xsl:if test="response/registration_type_code='PRAG' or response/registration_type_code='SCAG'">
			<fo:block margin-top="5mm">
				<fo:table border="1.0pt solid black">
					<fo:table-column border="1.0pt solid black" />
					<fo:table-column border="1.0pt solid black" />
					<fo:table-body>
						<xsl:for-each select="response/getMarketInfoData_list_1/data">
							<fo:table-row border="1.0pt solid black">
								<fo:table-cell width="480pt" 
									padding-start="5px" padding-top="3px" padding-bottom="3px">
									<fo:block font-size="8px" font-family="Arial">
										Does the agency share contingency/profit sharing dollars with the producers?
									</fo:block>
									
								</fo:table-cell>
								<fo:table-cell 
									padding-top="3px" padding-bottom="3px">
									<fo:block font-size="8px" font-family="Arial"
										text-align="center">
										<xsl:choose>
											<xsl:when test="is_agency_share_contingency=1">
												Y
											</xsl:when>
											<xsl:when test="is_agency_share_contingency=0">
												N
											</xsl:when>
										</xsl:choose>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row border="1.0pt solid black">
								<fo:table-cell width="480pt" 
									padding-start="5px" padding-top="3px" padding-bottom="3px">
									<fo:block font-size="8px" font-family="Arial">
										Does the agency have a small commercial business unit? If yes, what is the premium threshold?		
									</fo:block>
									
								</fo:table-cell>
								<fo:table-cell 
									padding-top="3px" padding-bottom="3px">
									<fo:block font-size="8px" font-family="Arial"
										text-align="center">
										<xsl:choose>
											<xsl:when test="is_agency_commercial_business=1">
												Y
											</xsl:when>
											<xsl:when test="is_agency_commercial_business=0">
												N
											</xsl:when>
										</xsl:choose>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row border="1.0pt solid black">
								<fo:table-cell width="480pt" 
									padding-start="5px" padding-top="3px" padding-bottom="3px">
									<fo:block font-size="8px" font-family="Arial">
										Does the agency use a Service Center for Commercial Lines?
									</fo:block>
									
								</fo:table-cell>
								<fo:table-cell 
									padding-top="3px" padding-bottom="3px">
									<fo:block font-size="8px" font-family="Arial"
										text-align="center">
										<xsl:choose>
											<xsl:when test="is_agencys_service_center=1">
												Y
											</xsl:when>
											<xsl:when test="is_agencys_service_center=0">
												N
											</xsl:when>
										</xsl:choose>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
						<xsl:if test="showComment ='Y'">
							<fo:table-row border="1.0pt solid black" >
								
								<fo:table-cell 
									padding-top="3px" padding-bottom="3px" width="460pt" number-columns-spanned="2" start-indent="14pt">
									<fo:block font-size="8px" font-family="Arial">
										<xsl:value-of select="comment"></xsl:value-of>
										
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
						</xsl:if>
					
						</xsl:for-each>


					</fo:table-body>
				</fo:table>
			</fo:block>
			</xsl:if>
			
			<xsl:if test="response/registration_type_code='PRAG' or response/registration_type_code='SCAG'">
			<fo:block margin-top="5mm">
				<fo:table border="0.0pt solid black">
					<fo:table-column />
					<fo:table-column />
					<fo:table-column />
					<fo:table-body>
					
						<fo:table-row height="5mm">
							<fo:table-cell>
								<fo:block font-size="8px" font-family="Arial" 
									font-weight="bold">
									<fo:inline>
								Production Commitment

									</fo:inline>
								</fo:block>
								<fo:block font-size="8px" font-family="Arial"  wrap-option="no-wrap"
									>
									<fo:inline>
								Total volume commitment with Builders Mutual Insurance Company Used for :


									</fo:inline>
								</fo:block>
							</fo:table-cell>
							
						</fo:table-row>
						<xsl:for-each select="response/getMarketInfoData_list_1/data">
						<fo:table-row height="5mm" margin-top="1mm" border="1.0pt solid black">
							<fo:table-cell >
								<fo:block font-size="8px" font-family="Arial" 
									>
									<fo:inline>
								First Year :	&#160;&#160;

									</fo:inline>
									
									<fo:inline>
									$<xsl:value-of select="production_commitment_first_year" />
									
									</fo:inline>
								</fo:block>
								
							</fo:table-cell>
							<fo:table-cell>
								<fo:block font-size="8px" font-family="Arial" 
									>
									<fo:inline>
									Second Year :	 &#160;&#160;

									</fo:inline>
									<fo:inline>
									$<xsl:value-of select="production_commitment_second_year" />
									
									</fo:inline>
								</fo:block>
								
							</fo:table-cell>
							<fo:table-cell>
								<fo:block font-size="8px" font-family="Arial" 
									>
									<fo:inline>
								Third Year:	 &#160;&#160;

									</fo:inline>
									<fo:inline>
									$<xsl:value-of select="production_commitment_third_year" />
									
									</fo:inline>
								</fo:block>
								
							</fo:table-cell>
						</fo:table-row>
						</xsl:for-each>
					</fo:table-body>
				</fo:table>
			</fo:block>
			
			<xsl:if test="response/registration_type_code='PRAG' or response/registration_type_code='SCAG'">
			<fo:block margin-top="5mm">
				<fo:table border="0.0pt solid black">
					<fo:table-column />
					
					<fo:table-body>
					<xsl:for-each select="response/getMarketInfoData_list_1/data">
						<fo:table-row height="5mm" border="1.0pt solid black">
							<fo:table-cell>
								<fo:block font-size="8px" font-family="Arial" font-weight="bold"
									>
									<fo:inline>
								Agency's Plan to Achieve Volume Commitment:	

									</fo:inline>
								
								</fo:block>
								<fo:block font-size="8px" font-family="Arial" 
									>
									<fo:inline>
								<xsl:value-of select="production_commitment_achieve_volume" />

									</fo:inline>
								
								</fo:block>
							</fo:table-cell>
							
						</fo:table-row>
						</xsl:for-each>
					</fo:table-body>
				</fo:table>
			</fo:block>
			</xsl:if>
			
			<xsl:if test="response/registration_type_code='PRAG' or response/registration_type_code='SCAG'">
			<fo:block margin-top="5mm">
				<fo:table border="0.0pt solid black">
					<fo:table-column  column-width="100%"/>
					
					
					
					<fo:table-body>
					<xsl:for-each select="response/getHearAboutData_list_1/data">
						<fo:table-row height="5mm" >
							<fo:table-cell >
								<fo:block font-size="8px" font-family="Arial" font-weight="bold"
									>
									<fo:inline>
								Final Questions	

									</fo:inline>
								
								</fo:block>
								</fo:table-cell>
								
								</fo:table-row>
							<fo:table-row height="5mm" border="1.0pt solid black">
							<fo:table-cell >
								<fo:block font-size="8px" font-weight="bold" font-family="Arial" 
									>
									<fo:inline>
								How did you hear about Company? :

									</fo:inline>
								
								</fo:block>
								<fo:block font-size="8px" font-family="Arial" 
									>
									<fo:inline>
								<xsl:value-of select="learn_about" />

									</fo:inline>
								
								</fo:block>
								</fo:table-cell>
							
								</fo:table-row>
							
							<fo:table-row height="5mm" border="1.0pt solid black">
								<fo:table-cell >
								<fo:block font-size="8px" font-family="Arial" font-weight="bold"  margin-top="1mm"
									>
									<fo:inline>
								Explain any interest in any other business or occupation outside of this agency :

									</fo:inline>
								
								</fo:block>
								<fo:block font-size="8px" font-family="Arial" 
									>
									<fo:inline>
								<xsl:value-of select="interest_in_other_business" />

									</fo:inline>
								
								</fo:block>
								</fo:table-cell>
								
								</fo:table-row>
						
							<fo:table-row height="5mm" border="1.0pt solid black">
								<fo:table-cell >
								<fo:block font-size="8px" font-family="Arial" font-weight="bold"  margin-top="1mm"
									>
									<fo:inline>
								How will Builders Mutual Insurance Company meet the needs of your agency and how will you meet your minimum production requirement? :

									</fo:inline>
								
								</fo:block>
								<fo:block font-size="8px" font-family="Arial" 
									>
									<fo:inline>
								<xsl:value-of select="interest_for_appointment" />

									</fo:inline>
								
								</fo:block>
								</fo:table-cell>
							
								</fo:table-row>
							
						</xsl:for-each>
					</fo:table-body>
				</fo:table>
			</fo:block>
			</xsl:if>
			
			</xsl:if>
			<xsl:if test="response/registration_type_code='PRAG' or response/registration_type_code='SCAG'">
			<fo:block break-after="page"/>
			</xsl:if>
			<xsl:if test="response/registration_type_code='PRAG' or response/registration_type_code='SCAG'">
			<fo:block margin-top="5mm">
				<fo:table border="0.0pt solid black">
					<fo:table-column />
					<fo:table-column />
					<fo:table-body>
						<fo:table-row height="5mm">
							<fo:table-cell width="150pt">
								<fo:block font-size="8px" font-family="Arial"
									font-weight="bold">
									<fo:inline>Agency Background Questions</fo:inline>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell>
								<fo:block></fo:block>
							</fo:table-cell>
						</fo:table-row>
					</fo:table-body>
				</fo:table>
			</fo:block>
			
			</xsl:if>
			
			
			
			
			
			<xsl:if test="response/registration_type_code='PRAG' or response/registration_type_code='SCAG'">
			<fo:block margin-top="5mm">
				<fo:table border="1.0pt solid black">
					<fo:table-column border="1.0pt solid black" />
					<fo:table-column border="1.0pt solid black" />
					<fo:table-body>
						<xsl:for-each select="response/agencyquestions_list_1/data">
							<fo:table-row border="1.0pt solid black">
								<fo:table-cell width="480pt" 
									padding-start="5px" padding-top="3px" padding-bottom="3px">
									<fo:block font-size="8px" font-family="Arial">
										<xsl:value-of select="position()"></xsl:value-of>
										.
										<xsl:value-of select="question" />
									</fo:block>
								</fo:table-cell>
								<fo:table-cell 
									padding-top="3px" padding-bottom="3px">
									<fo:block font-size="8px" font-family="Arial"
										text-align="center">
										<xsl:choose>
											<xsl:when test="response=1">
												Y
											</xsl:when>
											<xsl:when test="response=0">
												N
											</xsl:when>
										</xsl:choose>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							
						<xsl:if test="showComment ='Y'">
							<fo:table-row border="1.0pt solid black" >
								
								<fo:table-cell 
									padding-top="3px" padding-bottom="3px" width="460pt" number-columns-spanned="2" start-indent="14pt">
									<fo:block font-size="8px" font-family="Arial">
										<xsl:value-of select="comment"></xsl:value-of>
										
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
						</xsl:if>
					
						</xsl:for-each>


					</fo:table-body>
				</fo:table>
			</fo:block>
			</xsl:if>
			
			<xsl:if test="response/registration_type_code='PRAG' or response/registration_type_code='SCAG'">
			<fo:block margin-top="5mm">
			<fo:block font-size="8px" font-family="Arial" font-weight="bold">E&amp;O Declaration Form: </fo:block>
			<fo:table border="1.0pt solid black" margin-top="1mm">
				<fo:table-column border="1.0pt solid black"
					 />
				<fo:table-column border="1.0pt solid black"
					 />
				<fo:table-column border="1.0pt solid black"
					 />
				<fo:table-column border="1.0pt solid black"
					 />
				<fo:table-column border="1.0pt solid black"
					 />
				<fo:table-column border="1.0pt solid black"
					 />

				<fo:table-body>
					<fo:table-row border="1.0pt solid black">
						<fo:table-cell border="0.0pt solid black"
							>
							<fo:block font-size="8px" font-family="Arial">E&amp;O Carrier Name : </fo:block>
							<fo:block font-size="8px" font-family="Arial">Policy
								Limit : </fo:block>
							
						</fo:table-cell>
						<fo:table-cell border="1.0pt solid black"
							>
							<fo:block font-size="8px" font-family="Arial">
								<xsl:value-of select="response/carrier_other"></xsl:value-of>
							</fo:block>
							<fo:block font-size="8px" font-family="Arial">
								<xsl:value-of select="response/policy_limit"></xsl:value-of>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell border="1.0pt solid black"
							>
							<fo:block font-size="8px" font-family="Arial">Coverage Amount : </fo:block>
							<fo:block font-size="8px" font-family="Arial">Policy Number :	 </fo:block>
						</fo:table-cell>
						<fo:table-cell border="1.0pt solid black"
							>
							<fo:block font-size="8px" font-family="Arial">
								$<xsl:value-of select="response/coverage_amount"></xsl:value-of>
							</fo:block>
							<fo:block font-size="8px" font-family="Arial">
								<xsl:value-of select="response/policy_number"></xsl:value-of>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell border="1.0pt solid black"
							>
							<fo:block font-size="8px" font-family="Arial">Effective Date : </fo:block>
							<fo:block font-size="8px" font-family="Arial">Expiration Date : </fo:block>
						</fo:table-cell>
						<fo:table-cell border="1.0pt solid black"
							>
							<fo:block font-size="8px" font-family="Arial">
								<xsl:value-of select="response/effective_date"></xsl:value-of>
							</fo:block>
							
							<fo:block font-size="8px" font-family="Arial">
								<xsl:value-of select="response/expiration_date"></xsl:value-of>
							</fo:block>
						</fo:table-cell>
					</fo:table-row>
					<fo:table-row>
						<fo:table-cell border="1.0pt solid black"
							padding-start="5px" padding-top="3px" padding-bottom="3px"
							number-columns-spanned="5">
							<fo:block font-size="8px" font-family="Arial"> Have any E&amp;O claims been
								made during the past five years against the agency, agency partners,
								officers or any members of the staff?
							</fo:block>
						</fo:table-cell>
						<fo:table-cell text-align="center" padding-start="5px"
							padding-top="3px" padding-bottom="3px" border="1.0pt solid black">
							<fo:block font-size="8px" font-family="Arial">
								<xsl:value-of select="response/eo_claims_pdf"></xsl:value-of>
							</fo:block>
						</fo:table-cell>
					</fo:table-row>
					<xsl:if test="response/eo_claims ='Yes'">
						<fo:table-row>
							<fo:table-cell border="1.0pt solid black"
								padding-start="5px" padding-top="3px" padding-bottom="3px">
								<fo:block font-size="8px" font-family="Arial">Comment:
								</fo:block>
							</fo:table-cell>
							<fo:table-cell border="1.0pt solid black"
								padding-start="5px" padding-top="3px" padding-bottom="3px"
								number-columns-spanned="5" width="500px">
								<fo:block font-size="8px" font-family="Arial">
									<xsl:value-of select="response/eoclaims_comments"></xsl:value-of>
									<!--<xsl:call-template name="intersperse-with-zero-spaces"> <xsl:with-param 
										name="str" select="response/eoclaims_comments"/></xsl:call-template> -->
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
					</xsl:if>
					
				</fo:table-body>
			</fo:table>

		</fo:block>
		
		
		
		<xsl:if test="response/registration_type_code='PRAG' or response/registration_type_code='SCAG'">
			<fo:block >
				<fo:table border="0.0pt solid black">
					<fo:table-column />
					
					<fo:table-body>
					
						<fo:table-row height="5mm">
						
						
							<fo:table-cell>
								<fo:block font-size="8px" font-family="Arial" 
									>
								I understand that I am required to carry at least $1,000,000 of coverage. If I have less than $1,000,000 of coverage, I agree to increase it to $1,000,000 :&#160;	
								<fo:inline>
								Y
								</fo:inline>
								</fo:block>
								
							</fo:table-cell>
							
						</fo:table-row>
						
					</fo:table-body>
				</fo:table>
			</fo:block>
			</xsl:if>
		
		
		</xsl:if>
		
		
		
		<xsl:if test="response/registration_type_code='PRAG' or response/registration_type_code='SCAG'">
			<fo:block margin-top="5mm">
			<fo:block font-size="8px" font-family="Arial" font-weight="bold">Cyber Liability Declaration Form : </fo:block>
			<fo:table border="1.0pt solid black" margin-top="1mm">
				<fo:table-column border="1.0pt solid black"
					 />
				<fo:table-column border="1.0pt solid black"
					 />
				<fo:table-column border="1.0pt solid black"
					 />
				<fo:table-column border="1.0pt solid black"
					 />
				<fo:table-column border="1.0pt solid black"
					 />
				<fo:table-column border="1.0pt solid black"
					 />

				<fo:table-body>
					<fo:table-row border="1.0pt solid black">
						<fo:table-cell border="0.0pt solid black"
							>
							<fo:block font-size="8px" font-family="Arial">Coverage Amount : </fo:block>
							<fo:block font-size="8px" font-family="Arial">Effective Date : </fo:block>
						</fo:table-cell>
						<fo:table-cell border="1.0pt solid black"
							>
							<fo:block font-size="8px" font-family="Arial">
								<xsl:value-of select="response/cyberliability_list_1/data/cyber_liability_coverage_amount"></xsl:value-of>
							</fo:block>
							<fo:block font-size="8px" font-family="Arial">
								<xsl:value-of select="response/cyberliability_list_1/data/cyber_liability_effective_date"></xsl:value-of>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell border="1.0pt solid black"
							>
							<fo:block font-size="8px" font-family="Arial">
								Policy Number : </fo:block>
								<fo:block font-size="8px" font-family="Arial">
								Expiration Date : </fo:block>
						</fo:table-cell>
						<fo:table-cell border="1.0pt solid black"
							>
							<fo:block font-size="8px" font-family="Arial">
								<xsl:value-of select="response/cyberliability_list_1/data/cyber_liability_policy_number"></xsl:value-of>
							</fo:block>
							<fo:block font-size="8px" font-family="Arial">
								<xsl:value-of select="response/cyberliability_list_1/data/cyber_liability_expiration_date"></xsl:value-of>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell border="1.0pt solid black"
							>
							<fo:block font-size="8px" font-family="Arial">Policy Limit : </fo:block>
							
						</fo:table-cell>
						<fo:table-cell border="1.0pt solid black"
							>
							<fo:block font-size="8px" font-family="Arial">
								<xsl:value-of select="response/cyberliability_list_1/data/cyber_liability_policy_limit"></xsl:value-of>
							</fo:block>
							
							
						</fo:table-cell>
					</fo:table-row>
					<fo:table-row>
						<fo:table-cell border="1.0pt solid black"
							padding-start="5px" padding-top="3px" padding-bottom="3px"
							number-columns-spanned="5">
							<fo:block font-size="8px" font-family="Arial"> Have any Cyber Liability claims been made during the past five years against the agency, agency partners, officers, or any members of the staff?
							</fo:block>
						</fo:table-cell>
						<fo:table-cell text-align="center" padding-start="5px"
							padding-top="3px" padding-bottom="3px" border="1.0pt solid black">
							<fo:block font-size="8px" font-family="Arial">
								<xsl:value-of select="response/cyberliability_list_1/data/cyber_liability_claims"></xsl:value-of>
							</fo:block>
						</fo:table-cell>
					</fo:table-row>
					<xsl:if test="response/cyberliability_list_1/data/cyber_liability_claims ='Yes'">
						<fo:table-row>
							<fo:table-cell border="1.0pt solid black"
								padding-start="5px" padding-top="3px" padding-bottom="3px">
								<fo:block font-size="8px" font-family="Arial">Comment:
								</fo:block>
							</fo:table-cell>
							<fo:table-cell border="1.0pt solid black"
								padding-start="5px" padding-top="3px" padding-bottom="3px"
								number-columns-spanned="5" width="500px">
								<fo:block font-size="8px" font-family="Arial">
									<xsl:value-of select="response/cyberliability_list_1/data/cyber_liability_eoclaims_comments"></xsl:value-of>
									<!--<xsl:call-template name="intersperse-with-zero-spaces"> <xsl:with-param 
										name="str" select="response/eoclaims_comments"/></xsl:call-template> -->
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
					</xsl:if>
					
				</fo:table-body>
			</fo:table>

		</fo:block>
		
		
		
		<xsl:if test="response/registration_type_code='PRAG' or response/registration_type_code='SCAG'">
			<fo:block >
				<fo:table border="0.0pt solid black">
					<fo:table-column />
					
					<fo:table-body>
					
						<fo:table-row height="5mm">
						
						
							<fo:table-cell>
								<fo:block font-size="8px" font-family="Arial" 
									>
								I understand that I am required to carry at least $1,000,000 of coverage. If I have less than $1,000,000 of coverage, I agree to increase it to $1,000,000. Please attach a copy of your current

declaration pagein the Additional Documents section at the end of the application.Click the box to agree these terms :
								&#160;	
								<fo:inline>
								Y
								</fo:inline>
								</fo:block>
								
							</fo:table-cell>
							
						</fo:table-row>
						
					</fo:table-body>
				</fo:table>
			</fo:block>
			</xsl:if>
		
		
		</xsl:if>
		
		
		
		<xsl:if test="response/agencyAppointmentstep1_CyberLiability_section_security ='N'">
					<fo:block margin-top="5mm">
			<fo:block font-size="8px" font-family="Arial" font-weight="bold">Cyber Liability Declaration Form: </fo:block>
			<fo:table border="1.0pt solid black" margin-top="1mm">
				<fo:table-column border="1.0pt solid black"
					 />
				<fo:table-column border="1.0pt solid black"
					 />
				<fo:table-column border="1.0pt solid black"
					 />
				<fo:table-column border="1.0pt solid black"
					 />
				<fo:table-column border="1.0pt solid black"
					 />
				<fo:table-column border="1.0pt solid black"
					 />

				<fo:table-body>
					<fo:table-row border="1.0pt solid black">
						<fo:table-cell border="0.0pt solid black"
							>
							<fo:block font-size="8px" font-family="Arial">Cyber Liability Carrier Name : </fo:block>
						</fo:table-cell>
						<fo:table-cell border="1.0pt solid black"
							>
							<fo:block font-size="8px" font-family="Arial">
								<xsl:value-of select="response/cyber_liability_carrier_other"></xsl:value-of>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell border="1.0pt solid black"
							>
							<fo:block font-size="8px" font-family="Arial">Policy
								Limit : </fo:block>
						</fo:table-cell>
						<fo:table-cell border="1.0pt solid black"
							>
							<fo:block font-size="8px" font-family="Arial">
								<xsl:value-of select="response/cyber_liability_policy_limit"></xsl:value-of>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell border="1.0pt solid black"
							>
							<fo:block font-size="8px" font-family="Arial">Effective Date : </fo:block>
							<fo:block font-size="8px" font-family="Arial">Expiration Date : </fo:block>
						</fo:table-cell>
						<fo:table-cell border="1.0pt solid black"
							>
							<fo:block font-size="8px" font-family="Arial">
								<xsl:value-of select="response/cyber_liability_effective_date"></xsl:value-of>
							</fo:block>
							
							<fo:block font-size="8px" font-family="Arial">
								<xsl:value-of select="response/cyber_liability_expiration_date"></xsl:value-of>
							</fo:block>
						</fo:table-cell>
					</fo:table-row>
					<fo:table-row>
						<fo:table-cell border="1.0pt solid black"
							padding-start="5px" padding-top="3px" padding-bottom="3px"
							number-columns-spanned="5">
							<fo:block font-size="8px" font-family="Arial"> Have any Cyber Liability claims been
								made during the past five years against the agency, agency partners,
								officers or any members of the staff?
							</fo:block>
						</fo:table-cell>
						<fo:table-cell text-align="center" padding-start="5px"
							padding-top="3px" padding-bottom="3px" border="1.0pt solid black">
							<fo:block font-size="8px" font-family="Arial">
								<xsl:value-of select="response/cyber_liability_claims"></xsl:value-of>
							</fo:block>
						</fo:table-cell>
					</fo:table-row>
					<xsl:if test="response/cyber_liability_claims ='Yes'">
						<fo:table-row>
							<fo:table-cell border="1.0pt solid black"
								padding-start="5px" padding-top="3px" padding-bottom="3px">
								<fo:block font-size="8px" font-family="Arial">Comment:
								</fo:block>
							</fo:table-cell>
							<fo:table-cell border="1.0pt solid black"
								padding-start="5px" padding-top="3px" padding-bottom="3px"
								number-columns-spanned="5" width="500px">
								<fo:block font-size="8px" font-family="Arial">
									<xsl:value-of select="response/cyber_liability_claims_comments"></xsl:value-of>
									<!--<xsl:call-template name="intersperse-with-zero-spaces"> <xsl:with-param 
										name="str" select="response/eoclaims_comments"/></xsl:call-template> -->
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
					</xsl:if>
				</fo:table-body>
			</fo:table>

		</fo:block>
		</xsl:if>
		
				<xsl:if test="response/adminBrokerageDetailsStep1_social_media_site_security ='Y'">
				<fo:block margin-top="5mm">
				<fo:table>
					<fo:table-column border="0.0pt solid black" />
					<fo:table-column border="0.0pt solid black" />
					<fo:table-column border="0.0pt solid black" />
					<fo:table-column border="0.0pt solid black" />
					<fo:table-body>
						<fo:table-row height="5mm">
							<fo:table-cell width="130pt">
								<fo:block font-size="8px" font-family="Arial"
									font-weight="bold" text-decoration="underline">Social Media Info :</fo:block>
							</fo:table-cell>
							<fo:table-cell number-columns-spanned="3">
								<fo:block></fo:block>
							</fo:table-cell>
						</fo:table-row>

						<fo:table-row border="0.0pt solid black" height="5mm">
							<fo:table-cell border="0.0pt solid black">
								<fo:table border="1.0pt solid black">
									<fo:table-column />
									<fo:table-column />
									<fo:table-column />
									<fo:table-column />
									<fo:table-column />
									<fo:table-column />
									<fo:table-body>
										<fo:table-row border="1.0pt solid black">
										<fo:table-cell width="248pt" border="1.0pt solid black"
												padding-start="2px" padding-top="3px" padding-bottom="3px">
												<fo:block font-size="8px" font-family="Arial"
													font-weight="bold">Socail Media Site</fo:block>
											</fo:table-cell>
											<fo:table-cell width="248pt" border="1.0pt solid black"
												padding-start="2px" padding-top="3px" padding-bottom="3px">
												<fo:block font-size="8px" font-family="Arial"
													font-weight="bold">Social Media User ID</fo:block>
											</fo:table-cell>
											
										</fo:table-row>
										<xsl:for-each select="response/social_media_list_FOR_PDF/data">
											<fo:table-row border="1.0pt solid black">
											<fo:table-cell width="248pt" border="1.0pt solid black"
													padding-start="2px" padding-top="3px" padding-bottom="3px">
													<fo:block font-size="8px" font-family="Arial">
														<xsl:value-of select="social_media_site_desc" />
													</fo:block>
												</fo:table-cell>
												<fo:table-cell width="248pt" border="1.0pt solid black"
													padding-start="2px" padding-top="3px" padding-bottom="3px">
													<fo:block font-size="8px" font-family="Arial">
														<xsl:value-of select="social_media_userid" />
													</fo:block>
												</fo:table-cell>
												
											</fo:table-row>
											
										</xsl:for-each>
									</fo:table-body>
								</fo:table>
							</fo:table-cell>
							<fo:table-cell number-columns-spanned="3">
								<fo:block></fo:block>
							</fo:table-cell>
						</fo:table-row>
					</fo:table-body>
				</fo:table>
			</fo:block>		
			</xsl:if>
			
			<xsl:if test="response/registration_type_code='PRAG' or response/registration_type_code='SCAG'">
			
			<fo:block break-after="page" />
			</xsl:if>
			
			<xsl:if test="response/registration_type_code='PRAG' or response/registration_type_code='SCAG'">
			
			<fo:block margin-top="5mm">
				<fo:table>
					<fo:table-column border="0.0pt solid black" />
					<fo:table-column border="0.0pt solid black" />
					<fo:table-column border="0.0pt solid black" />
					<fo:table-column border="0.0pt solid black" />
					
					<fo:table-body>
					<xsl:if test="response/registration_type_code='PRAG' or response/registration_type_code='SCAG'">
						<fo:table-row height="5mm">
						
							<fo:table-cell width="130pt">
								<fo:block font-size="8px" font-family="Arial"
									font-weight="bold" text-decoration="underline">Bank Reference</fo:block>
							</fo:table-cell>
							<fo:table-cell number-columns-spanned="3">
								<fo:block></fo:block>
							</fo:table-cell>
						</fo:table-row>
</xsl:if>


						<fo:table-row border="0.0pt solid black" height="5mm">
							<fo:table-cell border="0.0pt solid black">
								<fo:table border="1.0pt solid black">
									<fo:table-column />
									<fo:table-column />
									<fo:table-column />
									<fo:table-column />
									<fo:table-column />
									<fo:table-column />
									<fo:table-body>
									<xsl:if test="response/registration_type_code='PRAG' or response/registration_type_code='SCAG'">
									
										<fo:table-row border="1.0pt solid black">
											<fo:table-cell width="143pt" border="1.0pt solid black"
												padding-start="2px" padding-top="3px" padding-bottom="3px">
												<fo:block font-size="8px" font-family="Arial"
													font-weight="bold">Bank Name</fo:block>
											</fo:table-cell>
											<fo:table-cell width="120pt" border="1.0pt solid black"
												padding-start="2px" padding-top="3px" padding-bottom="3px">
												<fo:block font-size="8px" font-family="Arial"
													font-weight="bold">Bank Account Number (Last 4 digits)</fo:block>
											</fo:table-cell>
											<fo:table-cell width="113pt" border="1.0pt solid black"
												padding-start="2px" padding-top="3px" padding-bottom="3px">
												<fo:block font-size="8px" font-family="Arial"
													font-weight="bold">Account Type</fo:block>
											</fo:table-cell>
											 <fo:table-cell width="122pt" border="1.0pt solid black"
												padding-start="2px" padding-top="3px" padding-bottom="3px">
												<fo:block font-size="8px" font-family="Arial"
													font-weight="bold">Payment Type</fo:block>
											</fo:table-cell> 
										</fo:table-row>
										</xsl:if>
										
										<xsl:if test="response/registration_type_code='PRAG' or response/registration_type_code='SCAG'">
										<xsl:for-each select="response/agencybankinformation_list_1/data">
										
											<fo:table-row >
											
												<fo:table-cell width="90pt" border="1.0pt solid black"
													padding-start="2px" padding-top="3px" padding-bottom="3px">
													
													<fo:block font-size="8px" font-family="Arial">
														<xsl:value-of select="bank_name" />
													</fo:block>
													
												</fo:table-cell>
												
												
												<fo:table-cell width="100pt" border="1.0pt solid black"
													padding-start="2px" padding-top="3px" padding-bottom="3px">
													<fo:block font-size="8px" font-family="Arial">
														<xsl:value-of select="bank_account_last_four_digits" />
													</fo:block>
												</fo:table-cell>
												
												
												<fo:table-cell width="60pt" border="1.0pt solid black"
													padding-start="2px" padding-top="3px" padding-bottom="3px">
													<fo:block font-size="8px" font-family="Arial">
														<xsl:value-of select="bank_account_type_desc" />
													</fo:block>
												</fo:table-cell>
												
											
												<fo:table-cell width="60pt" border="1.0pt solid black"
													padding-start="2px" padding-top="3px" padding-bottom="3px">
														<xsl:if test="payment_type=3">
													<fo:block font-size="8px" font-family="Arial">
														Direct Deposit
													</fo:block>
													</xsl:if>
												</fo:table-cell>
												
												<fo:table-cell width="60pt" 
													padding-start="2px" padding-top="3px" padding-bottom="3px">
													<fo:block font-size="8px" font-family="Arial">
														
													</fo:block>
												</fo:table-cell>
											</fo:table-row>
												
											<xsl:if test="bank_comments! = null or bank_comments!='' ">
												<fo:table-row>
													<fo:table-cell border="0.0pt solid black"
														padding-start="5px" padding-top="3px" padding-bottom="3px">
														<fo:block font-size="8px" font-family="Arial">Comment:
														</fo:block>
													</fo:table-cell>
													<fo:table-cell border="0.0pt solid black"
														padding-start="5px" padding-top="3px" padding-bottom="3px"
														number-columns-spanned="5" width="500px">
														<fo:block font-size="8px" font-family="Arial">
															<xsl:value-of select="bank_comments" />
															<!--<xsl:call-template name="intersperse-with-zero-spaces"> 
																<xsl:with-param name="str" select="bank_comments"/></xsl:call-template> -->
														</fo:block>
													</fo:table-cell>
												</fo:table-row>
											</xsl:if>
										</xsl:for-each>
									</xsl:if>
									</fo:table-body>
								</fo:table>
							</fo:table-cell>
							<fo:table-cell number-columns-spanned="3">
								<fo:block></fo:block>
							</fo:table-cell>
						</fo:table-row>
						
					</fo:table-body>
				</fo:table>
			</fo:block>
</xsl:if>
	
		</fo:block>


		<xsl:for-each select="response/agent_list_1/data">
		<xsl:if test="response/registration_type_code='PRAG' or response/registration_type_code='SCAG'">
		
			<fo:block break-after="page" />
			</xsl:if>
			<xsl:if test="response/registration_type_code='PRAG' or response/registration_type_code='SCAG'">
			
			<fo:block>
				<fo:table>
					<fo:table-column />
					<fo:table-body>
						<fo:table-row>
							<fo:table-cell>
								<fo:block font-size="12px" font-family="Arial"
									font-weight="bold" text-align="center">AGENCY/BROKERAGE PRINCIPAL/KEY
									CONTACT/PRODUCER INFORMATION</fo:block>
							</fo:table-cell>
						</fo:table-row>
					</fo:table-body>
				</fo:table>
			</fo:block>
</xsl:if>
<xsl:if test="response/registration_type_code='PRAG' or response/registration_type_code='SCAG'">

			<fo:block margin-top="5mm">
				<fo:table border="0.0pt solid black">
					<fo:table-column border="0.0pt solid black"
						column-width="270pt" />
					<fo:table-column border="0.0pt solid black"
						column-width="190pt" />

					<fo:table-body>
						<fo:table-row border="0.0pt solid black" height="5mm">
							<fo:table-cell border="0.0pt solid black">
								<fo:table border="0.0pt solid black">
									<fo:table-column column-width="100pt" />
									<fo:table-column column-width="170pt" />
									<fo:table-body>
										<fo:table-row border="0.0pt solid black" height="5mm">
											<fo:table-cell border="0.0pt solid black">
												<fo:table border="0.0pt solid black">
													<fo:table-column />
													<fo:table-body>
														<fo:table-row border="0.0pt solid black"
															height="5mm">
															<fo:table-cell border="0.0pt solid black">
																<fo:block font-size="8px" font-family="Arial"
																	font-weight="bold" text-decoration="underline">Contact Details
																</fo:block>
															</fo:table-cell>
														</fo:table-row>
													</fo:table-body>
												</fo:table>
											</fo:table-cell>
											<fo:table-cell border="0.0pt solid black">
												<fo:table border="0.0pt solid black">
													<fo:table-column />
													<fo:table-body>
														<fo:table-row border="0.0pt solid black"
															height="5mm">
															<fo:table-cell border="0.0pt solid black">
																<fo:block font-size="8px" font-family="Arial"></fo:block>
															</fo:table-cell>
														</fo:table-row>
													</fo:table-body>
												</fo:table>
											</fo:table-cell>
										</fo:table-row>
										<fo:table-row border="0.0pt solid black" height="5mm">
											<fo:table-cell border="0.0pt solid black">
												<fo:table border="0.0pt solid black">
													<fo:table-column />
													<fo:table-body>
														<fo:table-row border="0.0pt solid black"
															height="5mm">
															<fo:table-cell border="0.0pt solid black">
																<fo:block font-size="8px" font-family="Arial">
																	Contact Type :</fo:block>
															</fo:table-cell>
														</fo:table-row>
													</fo:table-body>
												</fo:table>
											</fo:table-cell>
											<fo:table-cell border="0.0pt solid black">
												<fo:table border="0.0pt solid black">
													<fo:table-column />
													<fo:table-body>
														<fo:table-row border="0.0pt solid black"
															height="5mm">
															<fo:table-cell border="0.0pt solid black">
																<fo:block font-size="8px" font-family="Arial">
																	<xsl:value-of select="contacttypedescription"></xsl:value-of>
																</fo:block>
															</fo:table-cell>
														</fo:table-row>
													</fo:table-body>
												</fo:table>
											</fo:table-cell>
										</fo:table-row>
										<!-- <fo:table-row border="0.0pt solid black" height="5mm">
											<fo:table-cell border="0.0pt solid black">
												<fo:table border="0.0pt solid black">
													<fo:table-column />
													<fo:table-body>
														<fo:table-row border="0.0pt solid black"
															height="5mm">
															<fo:table-cell border="0.0pt solid black">
																<fo:block font-size="8px" font-family="Arial">Salutation
																	:</fo:block>
															</fo:table-cell>
														</fo:table-row>
													</fo:table-body>
												</fo:table>
											</fo:table-cell>
											<fo:table-cell border="0.0pt solid black">
												<fo:table border="0.0pt solid black">
													<fo:table-column />
													<fo:table-body>
														<fo:table-row border="0.0pt solid black"
															height="5mm">
															<fo:table-cell border="0.0pt solid black">
																<fo:block font-size="8px" font-family="Arial">
																	<xsl:value-of select="prefixdescription"></xsl:value-of>
																</fo:block>
															</fo:table-cell>
														</fo:table-row>
													</fo:table-body>
												</fo:table>
											</fo:table-cell>
										</fo:table-row> -->

										<fo:table-row border="0.0pt solid black" height="5mm">
											<fo:table-cell border="0.0pt solid black">
												<fo:table border="0.0pt solid black">
													<fo:table-column />
													<fo:table-body>
														<fo:table-row border="0.0pt solid black"
															height="5mm">
															<fo:table-cell border="0.0pt solid black">
																<fo:block font-size="8px" font-family="Arial">First
																	Name: </fo:block>
															</fo:table-cell>
														</fo:table-row>
													</fo:table-body>
												</fo:table>
											</fo:table-cell>
											<fo:table-cell border="0.0pt solid black">
												<fo:table border="0.0pt solid black">
													<fo:table-column />
													<fo:table-body>
														<fo:table-row border="0.0pt solid black"
															height="5mm">
															<fo:table-cell border="0.0pt solid black">
																<fo:block font-size="8px" font-family="Arial" width= "2in">
																	<xsl:value-of select="firstname"></xsl:value-of>
																</fo:block>
															</fo:table-cell>
														</fo:table-row>
													</fo:table-body>
												</fo:table>
											</fo:table-cell>
										</fo:table-row>
										<fo:table-row border="0.0pt solid black" height="5mm">
											<fo:table-cell border="0.0pt solid black">
												<fo:table border="0.0pt solid black">
													<fo:table-column />
													<fo:table-body>
														<fo:table-row border="0.0pt solid black"
															height="5mm">
															<fo:table-cell border="0.0pt solid black">
																<fo:block font-size="8px" font-family="Arial">Middle Name
																	: </fo:block>
															</fo:table-cell>
														</fo:table-row>
													</fo:table-body>
												</fo:table>
											</fo:table-cell>
											<fo:table-cell border="0.0pt solid black">
												<fo:table border="0.0pt solid black">
													<fo:table-column />
													<fo:table-body>
														<fo:table-row border="0.0pt solid black"
															height="5mm">
															<fo:table-cell border="0.0pt solid black" width= "2in">
																<fo:block font-size="8px" font-family="Arial">
																	<xsl:value-of select="middlename"></xsl:value-of>
																</fo:block>
															</fo:table-cell>
														</fo:table-row>
													</fo:table-body>
												</fo:table>
											</fo:table-cell>
										</fo:table-row>

										<fo:table-row border="0.0pt solid black" height="5mm">
											<fo:table-cell border="0.0pt solid black">
												<fo:table border="0.0pt solid black">
													<fo:table-column />
													<fo:table-body>
														<fo:table-row border="0.0pt solid black"
															height="5mm">
															<fo:table-cell border="0.0pt solid black">
																<fo:block font-size="8px" font-family="Arial">Last Name
																	: </fo:block>
															</fo:table-cell>
														</fo:table-row>
													</fo:table-body>
												</fo:table>
											</fo:table-cell>
											<fo:table-cell border="0.0pt solid black">
												<fo:table border="0.0pt solid black">
													<fo:table-column />
													<fo:table-body>
														<fo:table-row border="0.0pt solid black"
															height="5mm">
															<fo:table-cell border="0.0pt solid black" width= "2in">
																<fo:block font-size="8px" font-family="Arial">
																	<xsl:value-of select="lastname"></xsl:value-of>
																</fo:block>
															</fo:table-cell>
														</fo:table-row>
													</fo:table-body>
												</fo:table>
											</fo:table-cell>
										</fo:table-row>
										
										
										

										<fo:table-row border="0.0pt solid black" height="5mm">
											<fo:table-cell border="0.0pt solid black">
												<fo:table border="0.0pt solid black">
													<fo:table-column />
													<fo:table-body>
														<fo:table-row border="0.0pt solid black"
															height="5mm">
															<fo:table-cell border="0.0pt solid black">
																<fo:block font-size="8px" font-family="Arial">Suffix :
																</fo:block>
															</fo:table-cell>
														</fo:table-row>
													</fo:table-body>
												</fo:table>
											</fo:table-cell>
											<fo:table-cell border="0.0pt solid black">
												<fo:table border="0.0pt solid black">
													<fo:table-column />
													<fo:table-body>
														<fo:table-row border="0.0pt solid black"
															height="5mm">
															<fo:table-cell border="0.0pt solid black" width= "2in">
																<fo:block font-size="8px" font-family="Arial">
																	<xsl:value-of select="suffix"></xsl:value-of>
																</fo:block>
															</fo:table-cell>
														</fo:table-row>
													</fo:table-body>
												</fo:table>
											</fo:table-cell>
										</fo:table-row>
									<xsl:if test="principal_contacttype != 'P' ">
										<fo:table-row border="0.0pt solid black" height="5mm">
												<fo:table-cell border="0.0pt solid black">
													<fo:table border="0.0pt solid black">
														<fo:table-column />
														<fo:table-body>
															<fo:table-row border="0.0pt solid black"
																height="5mm">
																<fo:table-cell border="0.0pt solid black">
																	<fo:block font-size="8px" font-family="Arial">Phone :
																	</fo:block>
																</fo:table-cell>
															</fo:table-row>
														</fo:table-body>
													</fo:table>
												</fo:table-cell>
												<fo:table-cell border="0.0pt solid black">
													<fo:table border="0.0pt solid black">
														<fo:table-column />
														<fo:table-column />
														<fo:table-column />
														<fo:table-body>
															<fo:table-row border="0.0pt solid black"
																height="5mm">
																<fo:table-cell border="0.0pt solid black">
																	<fo:block font-size="8px" font-family="Arial">
																		<xsl:value-of select="phoneno"></xsl:value-of>
																	</fo:block>
																</fo:table-cell>
																<fo:table-cell border="0.0pt solid black"
																	width="30px">
																	<fo:block font-size="8px" font-family="Arial">Extn. :
																	</fo:block>
																</fo:table-cell>
																<fo:table-cell border="0.0pt solid black">
																	<fo:block font-size="8px" font-family="Arial">
																		<xsl:value-of select="extn"></xsl:value-of>
																	</fo:block>
																</fo:table-cell>
															</fo:table-row>
														</fo:table-body>
													</fo:table>
												</fo:table-cell>
											</fo:table-row>
											<fo:table-row border="0.0pt solid black" height="5mm">
												<fo:table-cell border="0.0pt solid black">
													<fo:table border="0.0pt solid black">
														<fo:table-column />
														<fo:table-body>
															<fo:table-row border="0.0pt solid black"
																height="5mm">
																<fo:table-cell border="0.0pt solid black">
																	<fo:block font-size="8px" font-family="Arial">Fax :
																	</fo:block>
																</fo:table-cell>
															</fo:table-row>
														</fo:table-body>
													</fo:table>
												</fo:table-cell>
												<fo:table-cell border="0.0pt solid black">
													<fo:table border="0.0pt solid black">
														<fo:table-column />
														<fo:table-body>
															<fo:table-row border="0.0pt solid black"
																height="5mm">
																<fo:table-cell border="0.0pt solid black">
																	<fo:block font-size="8px" font-family="Arial">
																		<xsl:value-of select="fax"></xsl:value-of>
																	</fo:block>
																</fo:table-cell>
															</fo:table-row>
														</fo:table-body>
													</fo:table>
												</fo:table-cell>
											</fo:table-row>
											<fo:table-row border="0.0pt solid black" height="5mm">
												<fo:table-cell border="0.0pt solid black">
													<fo:table border="0.0pt solid black">
														<fo:table-column />
														<fo:table-body>
															<fo:table-row border="0.0pt solid black"
																height="5mm">
																<fo:table-cell border="0.0pt solid black">
																	<fo:block font-size="8px" font-family="Arial">Mobile :
																	</fo:block>
																</fo:table-cell>
															</fo:table-row>
														</fo:table-body>
													</fo:table>
												</fo:table-cell>
												<fo:table-cell border="0.0pt solid black">
													<fo:table border="0.0pt solid black">
														<fo:table-column />
														<fo:table-body>
															<fo:table-row border="0.0pt solid black"
																height="5mm">
																<fo:table-cell border="0.0pt solid black">
																	<fo:block font-size="8px" font-family="Arial">
																		<xsl:value-of select="mobile"></xsl:value-of>
																	</fo:block>
																</fo:table-cell>
															</fo:table-row>
														</fo:table-body>
													</fo:table>
												</fo:table-cell>
											</fo:table-row>
										</xsl:if>

										<!-- <fo:table-row border="0.0pt solid black" height="5mm" > <fo:table-cell 
											border="0.0pt solid black"> <fo:table border="0.0pt solid black"> <fo:table-column/> 
											<fo:table-body> <fo:table-row border="0.0pt solid black" height="5mm"> <fo:table-cell 
											border="0.0pt solid black"> <fo:block font-size="8px" font-family="Arial"><xsl:value-of 
											select="nickNameLabel"></xsl:value-of> : </fo:block> </fo:table-cell> </fo:table-row> 
											</fo:table-body> </fo:table> </fo:table-cell> <fo:table-cell border="0.0pt 
											solid black"> <fo:table border="0.0pt solid black"> <fo:table-column/> <fo:table-body> 
											<fo:table-row border="0.0pt solid black" height="5mm"> <fo:table-cell border="0.0pt 
											solid black"> <fo:block font-size="8px" font-family="Arial"><xsl:value-of 
											select="maiden_name"></xsl:value-of></fo:block> </fo:table-cell> </fo:table-row> 
											</fo:table-body> </fo:table> </fo:table-cell> </fo:table-row> -->
									<xsl:if test="principal_contacttype='P'">
										<fo:table-row border="0.0pt solid black" height="5mm">
											<fo:table-cell border="0.0pt solid black">
												<fo:table border="0.0pt solid black">
													<fo:table-column />
													<fo:table-body>
														<fo:table-row border="0.0pt solid black"
															height="5mm">
															<fo:table-cell border="0.0pt solid black">
																<fo:block font-size="8px" font-family="Arial">Position/Title
																	: </fo:block>
															</fo:table-cell>
														</fo:table-row>
													</fo:table-body>
												</fo:table>
											</fo:table-cell>
											<fo:table-cell border="0.0pt solid black">
												<fo:table border="0.0pt solid black">
													<fo:table-column />
													<fo:table-body>
														<fo:table-row border="0.0pt solid black"
															height="5mm">
															<fo:table-cell border="0.0pt solid black">
																<fo:block font-size="8px" font-family="Arial">
																	<xsl:value-of select="position"></xsl:value-of>
																</fo:block>
															</fo:table-cell>
														</fo:table-row>
													</fo:table-body>
												</fo:table>
											</fo:table-cell>
										</fo:table-row>
									</xsl:if>
									<xsl:if test="principal_contacttype='LC' or principal_contacttype='P' ">
										<fo:table-row border="0.0pt solid black" height="5mm">
											<fo:table-cell border="0.0pt solid black">
												<fo:table border="0.0pt solid black">
													<fo:table-column />
													<fo:table-body>
														<fo:table-row border="0.0pt solid black"
															height="5mm">
															<fo:table-cell border="0.0pt solid black">
																<fo:block font-size="8px" font-family="Arial">Producer
																	Type : </fo:block>
															</fo:table-cell>
														</fo:table-row>
													</fo:table-body>
												</fo:table>
											</fo:table-cell>
											<fo:table-cell border="0.0pt solid black">
												<fo:table border="0.0pt solid black">
													<fo:table-column />
													<fo:table-body>
														<fo:table-row border="0.0pt solid black"
															height="5mm">
															<fo:table-cell border="0.0pt solid black">
																<fo:block font-size="8px" font-family="Arial">
																	<xsl:value-of select="producertype"></xsl:value-of>
																</fo:block>
															</fo:table-cell>
														</fo:table-row>
													</fo:table-body>
												</fo:table>
											</fo:table-cell>
										</fo:table-row>
										
										 
											<fo:table-row border="0.0pt solid black" height="5mm">
												<fo:table-cell border="0.0pt solid black">
													<fo:table border="0.0pt solid black">
														<fo:table-column />
														<fo:table-body>
															<fo:table-row border="0.0pt solid black"
																height="5mm">
																<fo:table-cell border="0.0pt solid black">
																	<fo:block font-size="8px" font-family="Arial">National
																		Producer Number : </fo:block>
																</fo:table-cell>
															</fo:table-row>
														</fo:table-body>
													</fo:table>
												</fo:table-cell>
												<fo:table-cell border="0.0pt solid black">
													<fo:table border="0.0pt solid black">
														<fo:table-column />
														<fo:table-body>
															<fo:table-row border="0.0pt solid black"
																height="5mm">
																<fo:table-cell border="0.0pt solid black" >
																	<fo:block font-size="8px" font-family="Arial">
																		<xsl:value-of select="npn"></xsl:value-of>
																	</fo:block>
																</fo:table-cell>
															</fo:table-row>
														</fo:table-body>
													</fo:table>
												</fo:table-cell>
											</fo:table-row>

											<fo:table-row border="0.0pt solid black" height="5mm">
												<fo:table-cell border="0.0pt solid black">
													<fo:table border="0.0pt solid black">
														<fo:table-column />
														<fo:table-body>
															<fo:table-row border="0.0pt solid black"
																height="5mm">
																<fo:table-cell border="0.0pt solid black">
																	<fo:block font-size="8px" font-family="Arial">Social
																		Security Number :</fo:block>
																</fo:table-cell>
															</fo:table-row>
														</fo:table-body>
													</fo:table>
												</fo:table-cell>
												<fo:table-cell border="0.0pt solid black">
													<fo:table border="0.0pt solid black">
														<fo:table-column />
														<fo:table-body>
															<fo:table-row border="0.0pt solid black"
																height="5mm">
																<fo:table-cell border="0.0pt solid black">
																	<fo:block font-size="8px" font-family="Arial">
																		<xsl:value-of select="ssn_num"></xsl:value-of>
																	</fo:block>
																</fo:table-cell>
															</fo:table-row>
														</fo:table-body>
													</fo:table>
												</fo:table-cell>
											</fo:table-row>
											<fo:table-row border="0.0pt solid black" height="5mm">
												<fo:table-cell border="0.0pt solid black">
													<fo:table border="0.0pt solid black">
														<fo:table-column />
														<fo:table-body>
															<fo:table-row border="0.0pt solid black"
																height="5mm">
																<fo:table-cell border="0.0pt solid black">
																	<fo:block font-size="8px" font-family="Arial">
																		License Number :</fo:block>
																</fo:table-cell>
															</fo:table-row>
														</fo:table-body>
													</fo:table>
												</fo:table-cell>
												<fo:table-cell border="0.0pt solid black">
													<fo:table border="0.0pt solid black">
														<fo:table-column />
														<fo:table-body>
															<fo:table-row border="0.0pt solid black"
																height="5mm">
																<fo:table-cell border="0.0pt solid black">
																	<fo:block font-size="8px" font-family="Arial">
																		<xsl:value-of select="license_number"></xsl:value-of>
																	</fo:block>
																</fo:table-cell>
															</fo:table-row>
														</fo:table-body>
													</fo:table>
												</fo:table-cell>
											</fo:table-row>
											
											
										

										<fo:table-row border="0.0pt solid black" height="5mm">
											<fo:table-cell border="0.0pt solid black">
												<fo:table border="0.0pt solid black">
													<fo:table-column />
													<fo:table-body>
														<fo:table-row border="0.0pt solid black"
															height="5mm">
															<fo:table-cell border="0.0pt solid black">
																<fo:block font-size="8px" font-family="Arial">Date of
																	Birth : </fo:block>
															</fo:table-cell>
														</fo:table-row>
													</fo:table-body>
												</fo:table>
											</fo:table-cell>
											<fo:table-cell border="0.0pt solid black">
												<fo:table border="0.0pt solid black">
													<fo:table-column />
													<fo:table-body>
														<fo:table-row border="0.0pt solid black"
															height="5mm">
															<fo:table-cell border="0.0pt solid black">
																<fo:block font-size="8px" font-family="Arial"
																	wrap-option="wrap">
																	<xsl:value-of select="dob"></xsl:value-of>
																	
																</fo:block>
															</fo:table-cell>
														</fo:table-row>
													</fo:table-body>
												</fo:table>
											</fo:table-cell>
										</fo:table-row>
									</xsl:if>
									<xsl:if test="principal_contacttype='P'">
										<fo:table-row border="0.0pt solid black" height="5mm">
											<fo:table-cell border="0.0pt solid black">
												<fo:table border="0.0pt solid black">
													<fo:table-column />
													<fo:table-body>
														<fo:table-row border="0.0pt solid black"
															height="5mm">
															<fo:table-cell border="0.0pt solid black">
																<fo:block font-size="8px" font-family="Arial">Ownership
																	: </fo:block>
															</fo:table-cell>
														</fo:table-row>
													</fo:table-body>
												</fo:table>
											</fo:table-cell>
											<fo:table-cell border="0.0pt solid black">
												<fo:table border="0.0pt solid black">
													<fo:table-column />
													<fo:table-body>
														<fo:table-row border="0.0pt solid black"
															height="5mm">
															<fo:table-cell border="0.0pt solid black">
																<fo:block font-size="8px" font-family="Arial">
																	<xsl:value-of select="ownership" />
																	<xsl:if test="ownership!=null or ownership!='' ">
																		%
																	</xsl:if>
																</fo:block>
															</fo:table-cell>
														</fo:table-row>
													</fo:table-body>
												</fo:table>
											</fo:table-cell>
										</fo:table-row>
									</xsl:if>
										<fo:table-row border="0.0pt solid black" height="5mm">
											<fo:table-cell border="0.0pt solid black">
												<fo:table border="0.0pt solid black">
													<fo:table-column />
													<fo:table-body>
														<fo:table-row border="0.0pt solid black"
															height="5mm">
															<fo:table-cell border="0.0pt solid black">
																<fo:block font-size="8px" font-family="Arial">Email
																	ID : </fo:block>
															</fo:table-cell>
														</fo:table-row>
													</fo:table-body>
												</fo:table>
											</fo:table-cell>
											<fo:table-cell border="0.0pt solid black">
												<fo:table border="0.0pt solid black">
													<fo:table-column />
													<fo:table-column />
													<fo:table-column />
													<fo:table-body>
														<fo:table-row border="0.0pt solid black"
															height="5mm">
															<fo:table-cell border="0.0pt solid black">
																<fo:block font-size="8px" font-family="Arial">
																	<xsl:value-of select="e_mail"></xsl:value-of>
																</fo:block>
															</fo:table-cell>
														</fo:table-row>
													</fo:table-body>
												</fo:table>
											</fo:table-cell>
										</fo:table-row>


									</fo:table-body>
								</fo:table>
							</fo:table-cell>

							<xsl:if test="principal_contacttype='P'">
								<fo:table-cell border="0.0pt solid black">
									<fo:table border="0.0pt solid black">
										<fo:table-column border="0.0pt solid black"
											column-width="100pt" />
										<fo:table-column border="0.0pt solid black"
											column-width="160pt" />
										<fo:table-body>


											<fo:table-row border="0.0pt solid black" height="5mm">

												<fo:table-cell border="0.0pt solid black">
													<fo:table border="0.0pt solid black">
														<fo:table-column />
														<fo:table-body>
															<fo:table-row border="0.0pt solid black"
																height="5mm">
																<fo:table-cell border="0.0pt solid black">
																	<fo:block font-size="8px" font-family="Arial"
																		font-weight="bold" text-decoration="underline">Residence Address </fo:block>
																</fo:table-cell>
															</fo:table-row>
														</fo:table-body>
													</fo:table>
												</fo:table-cell>
												<fo:table-cell border="0.0pt solid black">
													<fo:table border="0.0pt solid black">
														<fo:table-column />
														<fo:table-body>
															<fo:table-row border="0.0pt solid black"
																height="5mm">
																<fo:table-cell border="0.0pt solid black">
																	<fo:block font-size="8px" font-family="Arial"></fo:block>
																</fo:table-cell>
															</fo:table-row>
														</fo:table-body>
													</fo:table>
												</fo:table-cell>
											</fo:table-row>

											<fo:table-row border="0.0pt solid black" height="5mm">
												<fo:table-cell border="0.0pt solid black">
													<fo:table border="0.0pt solid black">
														<fo:table-column />
														<fo:table-body>
															<fo:table-row border="0.0pt solid black"
																height="5mm">
																<fo:table-cell border="0.0pt solid black">
																	<fo:block font-size="8px" font-family="Arial">
																		Country : </fo:block>
																</fo:table-cell>
															</fo:table-row>
														</fo:table-body>
													</fo:table>
												</fo:table-cell>
												<fo:table-cell border="0.0pt solid black">
													<fo:table border="0.0pt solid black">
														<fo:table-column />
														<fo:table-body>
															<fo:table-row border="0.0pt solid black"
																height="5mm">
																<fo:table-cell border="0.0pt solid black" width= "2in">
																	<fo:block font-size="8px" font-family="Arial" >
																		<xsl:value-of select="countrydescription"></xsl:value-of>
																	</fo:block>
																</fo:table-cell>
															</fo:table-row>
														</fo:table-body>
													</fo:table>
												</fo:table-cell>
											</fo:table-row>

											<fo:table-row border="0.0pt solid black" height="5mm">
												<fo:table-cell border="0.0pt solid black">
													<fo:table border="0.0pt solid black">
														<fo:table-column />
														<fo:table-body>
															<fo:table-row border="0.0pt solid black"
																height="5mm">
																<fo:table-cell border="0.0pt solid black" >
																	<fo:block font-size="8px" font-family="Arial">Street
																		Address #1 : </fo:block>
																</fo:table-cell>
															</fo:table-row>
														</fo:table-body>
													</fo:table>
												</fo:table-cell>
												<fo:table-cell border="0.0pt solid black">
													<fo:table border="0.0pt solid black">
														<fo:table-column />
														<fo:table-body>
															<fo:table-row border="0.0pt solid black"
																height="5mm">
																<fo:table-cell border="0.0pt solid black" width= "2in">
																	<fo:block font-size="8px" font-family="Arial">
																		<xsl:value-of select="addressline1"></xsl:value-of>
																	</fo:block>
																</fo:table-cell>
															</fo:table-row>
														</fo:table-body>
													</fo:table>
												</fo:table-cell>
											</fo:table-row>

											<fo:table-row border="0.0pt solid black" height="5mm">
												<fo:table-cell border="0.0pt solid black">
													<fo:table border="0.0pt solid black">
														<fo:table-column />
														<fo:table-body>
															<fo:table-row border="0.0pt solid black"
																height="5mm">
																<fo:table-cell border="0.0pt solid black">
																	<fo:block font-size="8px" font-family="Arial">Street
																		Address #2 : </fo:block>
																</fo:table-cell>
															</fo:table-row>
														</fo:table-body>
													</fo:table>
												</fo:table-cell>
												<fo:table-cell border="0.0pt solid black">
													<fo:table border="0.0pt solid black">
														<fo:table-column />
														<fo:table-body>
															<fo:table-row border="0.0pt solid black"
																height="5mm">
																<fo:table-cell border="0.0pt solid black" width= "2in">
																	<fo:block font-size="8px" font-family="Arial">
																		<xsl:value-of select="addressline2"></xsl:value-of>
																	</fo:block>
																</fo:table-cell>
															</fo:table-row>
														</fo:table-body>
													</fo:table>
												</fo:table-cell>
											</fo:table-row>

											<fo:table-row border="0.0pt solid black" height="5mm">
												<fo:table-cell border="0.0pt solid black">
													<fo:table border="0.0pt solid black">
														<fo:table-column />
														<fo:table-body>
															<fo:table-row border="0.0pt solid black"
																height="5mm">
																<fo:table-cell border="0.0pt solid black">
																	<fo:block font-size="8px" font-family="Arial">City :
																	</fo:block>
																</fo:table-cell>
															</fo:table-row>
														</fo:table-body>
													</fo:table>
												</fo:table-cell>
												<fo:table-cell border="0.0pt solid black">
													<fo:table border="0.0pt solid black">
														<fo:table-column />
														<fo:table-body>
															<fo:table-row border="0.0pt solid black"
																height="5mm">
																<fo:table-cell border="0.0pt solid black" width= "2in">
																	<fo:block font-size="8px" font-family="Arial">
																		<xsl:value-of select="city"></xsl:value-of>
																	</fo:block>
																</fo:table-cell>
															</fo:table-row>
														</fo:table-body>
													</fo:table>
												</fo:table-cell>
											</fo:table-row>

											<fo:table-row border="0.0pt solid black" height="5mm">
												<fo:table-cell border="0.0pt solid black">
													<fo:table border="0.0pt solid black">
														<fo:table-column />
														<fo:table-body>
															<fo:table-row border="0.0pt solid black"
																height="5mm">
																<fo:table-cell border="0.0pt solid black">
																	<fo:block font-size="8px" font-family="Arial">State :
																	</fo:block>
																</fo:table-cell>
															</fo:table-row>
														</fo:table-body>
													</fo:table>
												</fo:table-cell>
												<fo:table-cell border="0.0pt solid black">
													<fo:table border="0.0pt solid black">
														<fo:table-column />
														<fo:table-body>
															<fo:table-row border="0.0pt solid black"
																height="5mm">
																<fo:table-cell border="0.0pt solid black">
																	<fo:block font-size="8px" font-family="Arial">
																		<xsl:value-of select="statedescription"></xsl:value-of>
																	</fo:block>
																</fo:table-cell>
															</fo:table-row>
														</fo:table-body>
													</fo:table>
												</fo:table-cell>
											</fo:table-row>



											<fo:table-row border="0.0pt solid black" height="5mm">
												<fo:table-cell border="0.0pt solid black">
													<fo:table border="0.0pt solid black">
														<fo:table-column />
														<fo:table-body>
															<fo:table-row border="0.0pt solid black"
																height="5mm">
																<fo:table-cell border="0.0pt solid black">
																	<fo:block font-size="8px" font-family="Arial">County :
																	</fo:block>
																</fo:table-cell>
															</fo:table-row>
														</fo:table-body>
													</fo:table>
												</fo:table-cell>
												<fo:table-cell border="0.0pt solid black">
													<fo:table border="0.0pt solid black">
														<fo:table-column />
														<fo:table-body>
															<fo:table-row border="0.0pt solid black"
																height="5mm">
																<fo:table-cell border="0.0pt solid black">
																	<fo:block font-size="8px" font-family="Arial">
																		<xsl:value-of select="countydescription"></xsl:value-of>
																	</fo:block>
																</fo:table-cell>
															</fo:table-row>
														</fo:table-body>
													</fo:table>
												</fo:table-cell>
											</fo:table-row>



											<fo:table-row border="0.0pt solid black" height="5mm">
												<fo:table-cell border="0.0pt solid black">
													<fo:table border="0.0pt solid black">
														<fo:table-column />
														<fo:table-body>
															<fo:table-row border="0.0pt solid black"
																height="5mm">
																<fo:table-cell border="0.0pt solid black">
																	<fo:block font-size="8px" font-family="Arial">Zip Code
																		: </fo:block>
																</fo:table-cell>
															</fo:table-row>
														</fo:table-body>
													</fo:table>
												</fo:table-cell>
												<fo:table-cell border="0.0pt solid black">
													<fo:table border="0.0pt solid black">
														<fo:table-column />
														<fo:table-body>
															<fo:table-row border="0.0pt solid black"
																height="5mm">
																<fo:table-cell border="0.0pt solid black">
																	<fo:block font-size="8px" font-family="Arial">
																		<xsl:value-of select="zipcode"></xsl:value-of>
																	</fo:block>
																</fo:table-cell>
															</fo:table-row>
														</fo:table-body>
													</fo:table>
												</fo:table-cell>
											</fo:table-row>

											<fo:table-row border="0.0pt solid black" height="5mm">
												<fo:table-cell border="0.0pt solid black">
													<fo:table border="0.0pt solid black">
														<fo:table-column />
														<fo:table-body>
															<fo:table-row border="0.0pt solid black"
																height="5mm">
																<fo:table-cell border="0.0pt solid black">
																	<fo:block font-size="8px" font-family="Arial">Phone :
																	</fo:block>
																</fo:table-cell>
															</fo:table-row>
														</fo:table-body>
													</fo:table>
												</fo:table-cell>
												<fo:table-cell border="0.0pt solid black">
													<fo:table border="0.0pt solid black">
														<fo:table-column />
														<fo:table-column />
														<fo:table-column />
														<fo:table-body>
															<fo:table-row border="0.0pt solid black"
																height="5mm">
																<fo:table-cell border="0.0pt solid black">
																	<fo:block font-size="8px" font-family="Arial">
																		<xsl:value-of select="phoneno"></xsl:value-of>
																	</fo:block>
																</fo:table-cell>
																<fo:table-cell border="0.0pt solid black"
																	width="30px">
																	<fo:block font-size="8px" font-family="Arial">Extn. :
																	</fo:block>
																</fo:table-cell>
																<fo:table-cell border="0.0pt solid black">
																	<fo:block font-size="8px" font-family="Arial">
																		<xsl:value-of select="extn"></xsl:value-of>
																	</fo:block>
																</fo:table-cell>
															</fo:table-row>
														</fo:table-body>
													</fo:table>
												</fo:table-cell>
											</fo:table-row>

											<fo:table-row border="0.0pt solid black" height="5mm">
												<fo:table-cell border="0.0pt solid black">
													<fo:table border="0.0pt solid black">
														<fo:table-column />
														<fo:table-body>
															<fo:table-row border="0.0pt solid black"
																height="5mm">
																<fo:table-cell border="0.0pt solid black">
																	<fo:block font-size="8px" font-family="Arial">Fax :
																	</fo:block>
																</fo:table-cell>
															</fo:table-row>
														</fo:table-body>
													</fo:table>
												</fo:table-cell>
												<fo:table-cell border="0.0pt solid black">
													<fo:table border="0.0pt solid black">
														<fo:table-column />
														<fo:table-body>
															<fo:table-row border="0.0pt solid black"
																height="5mm">
																<fo:table-cell border="0.0pt solid black">
																	<fo:block font-size="8px" font-family="Arial">
																		<xsl:value-of select="fax"></xsl:value-of>
																	</fo:block>
																</fo:table-cell>
															</fo:table-row>
														</fo:table-body>
													</fo:table>
												</fo:table-cell>
											</fo:table-row>

										</fo:table-body>
									</fo:table>
								</fo:table-cell>
							</xsl:if>
						</fo:table-row>
					</fo:table-body>
				</fo:table>
			</fo:block>
</xsl:if>
			<xsl:if test="principal_contacttype='P'">

<xsl:if test="response/registration_type_code='PRAG' or response/registration_type_code='SCAG'">

			<fo:block margin-top="5mm">
				<fo:table border="0.0pt solid black">
					<fo:table-column />
					<fo:table-column />
					<fo:table-body>
						<fo:table-row height="5mm">
							<fo:table-cell width="150pt">
								<fo:block font-size="8px" font-family="Arial"
									font-weight="bold">
									<fo:inline>Agent Background Questions</fo:inline>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell>
								<fo:block></fo:block>
							</fo:table-cell>
						</fo:table-row>
					</fo:table-body>
				</fo:table>
			</fo:block>
</xsl:if>
<xsl:if test="response/registration_type_code='PRAG' or response/registration_type_code='SCAG'">

			<fo:block margin-top="5mm">
				<fo:table border="1.0pt solid black">
					<fo:table-column />
					<fo:table-column />
					<fo:table-body>
					<xsl:if test="agentquestions_list_1/data!='' ">
						<xsl:for-each select="agentquestions_list_1/data">
							<fo:table-row border="1.0pt solid black">
								<fo:table-cell width="480pt" border="1.0pt solid black"
									padding-start="5px" padding-top="3px" padding-bottom="3px">
									<fo:block font-size="8px" font-family="Arial">
										<xsl:value-of select="position()"></xsl:value-of>
										.
										<xsl:value-of select="question" />
									</fo:block>
								</fo:table-cell>
								<fo:table-cell border="1.0pt solid black"
									padding-top="3px" padding-bottom="3px">
									<fo:block font-size="8px" font-family="Arial"
										text-align="center">
										<xsl:choose>
											<xsl:when test="response=1">
												Y
											</xsl:when>
											<xsl:when test="response=0">
												N
											</xsl:when>
										</xsl:choose>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<xsl:if test="response=1">
								<fo:table-row border="1.0pt solid black">
									<fo:table-cell border="1.0pt solid black" width="300pt"
										padding-start="5px" padding-top="3px" padding-bottom="3px"
										number-columns-spanned="2">
										<fo:block font-size="8px" font-family="Arial">
											Comments :
											<xsl:value-of select="comment" />
											<xsl:call-template name="intersperse-with-zero-spaces"> <xsl:with-param 
												name="str" select="comment"/></xsl:call-template>
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
							</xsl:if>
						</xsl:for-each>
						</xsl:if>
					</fo:table-body>
				</fo:table>
			</fo:block>
			</xsl:if>
		</xsl:if>
		
			<xsl:if test="response/registration_type_code='PRAG' or response/registration_type_code='SCAG'">
			
			<fo:block margin-top="5mm">
				<fo:table>
					<fo:table-column border="0.0pt solid black" />
					<fo:table-column border="0.0pt solid black" />
					<fo:table-column border="0.0pt solid black" />
					<fo:table-column border="0.0pt solid black" />
					<fo:table-body>
						<fo:table-row height="5mm">
							<fo:table-cell width="130pt">
								<fo:block font-size="8px" font-family="Arial"
									font-weight="bold" text-decoration="underline">Beneficiary Details</fo:block>
							</fo:table-cell>
							<fo:table-cell number-columns-spanned="3">
								<fo:block></fo:block>
							</fo:table-cell>
						</fo:table-row>

						<fo:table-row border="0.0pt solid black" height="5mm">
							<fo:table-cell border="0.0pt solid black">
								<fo:table border="1.0pt solid black">
									<fo:table-column />
									<fo:table-column />
									<fo:table-column />
									<fo:table-column />
									<fo:table-column />
									<fo:table-column />
									<fo:table-body>
										<fo:table-row border="1.0pt solid black">
										<fo:table-cell width="83pt" border="1.0pt solid black"
												padding-start="2px" padding-top="3px" padding-bottom="3px">
												<fo:block font-size="8px" font-family="Arial"
													font-weight="bold">Beneficiary Type</fo:block>
											</fo:table-cell>
											<fo:table-cell width="100pt" border="1.0pt solid black"
												padding-start="2px" padding-top="3px" padding-bottom="3px">
												<fo:block font-size="8px" font-family="Arial"
													font-weight="bold">First Name</fo:block>
											</fo:table-cell>
											<fo:table-cell width="100pt" border="1.0pt solid black"
												padding-start="2px" padding-top="3px" padding-bottom="3px">
												<fo:block font-size="8px" font-family="Arial"
													font-weight="bold">Middle Name</fo:block>
											</fo:table-cell>
											<fo:table-cell width="93pt" border="1.0pt solid black"
												padding-start="2px" padding-top="3px" padding-bottom="3px">
												<fo:block font-size="8px" font-family="Arial"
													font-weight="bold">Last Name</fo:block>
											</fo:table-cell>
											<fo:table-cell width="80pt" border="1.0pt solid black"
												padding-start="2px" padding-top="3px" padding-bottom="3px">
												<fo:block font-size="8px" font-family="Arial"
													font-weight="bold">Date of Birth</fo:block>
											</fo:table-cell>
											<fo:table-cell width="40pt" border="1.0pt solid black"
												padding-start="2px" padding-top="3px" padding-bottom="3px">
												<fo:block font-size="8px" font-family="Arial"
													font-weight="bold">Gender</fo:block>
											</fo:table-cell>
										</fo:table-row>
										<xsl:for-each select="beneficiary_list_xsl/data">
											<fo:table-row border="1.0pt solid black">
											<fo:table-cell width="90pt" border="1.0pt solid black"
													padding-start="2px" padding-top="3px" padding-bottom="3px">
													<fo:block font-size="8px" font-family="Arial">
														<xsl:value-of select="beneficiary_type_desc" />
													</fo:block>
												</fo:table-cell>
												<fo:table-cell width="90pt" border="1.0pt solid black"
													padding-start="2px" padding-top="3px" padding-bottom="3px">
													<fo:block font-size="8px" font-family="Arial">
														<xsl:value-of select="beneficiary_first_name" />
													</fo:block>
												</fo:table-cell>
												<fo:table-cell width="100pt" border="1.0pt solid black"
													padding-start="2px" padding-top="3px" padding-bottom="3px">
													<fo:block font-size="8px" font-family="Arial">
														<xsl:value-of select="beneficiary_middle_name" />
													</fo:block>
												</fo:table-cell>
												<fo:table-cell width="60pt" border="1.0pt solid black"
													padding-start="2px" padding-top="3px" padding-bottom="3px">
													<fo:block font-size="8px" font-family="Arial">
														<xsl:value-of select="beneficiary_last_name" />
													</fo:block>
												</fo:table-cell>
												<fo:table-cell width="70pt" border="1.0pt solid black"
													padding-start="2px" padding-top="3px" padding-bottom="3px">
													<fo:block font-size="8px" font-family="Arial">
														<xsl:value-of select="beneficiary_dob" />
													</fo:block>
												</fo:table-cell>
												<fo:table-cell width="50pt" border="1.0pt solid black"
													padding-start="2px" padding-top="3px" padding-bottom="3px">
													<fo:block font-size="8px" font-family="Arial">
														<xsl:value-of select="beneficiary_gender_desc" />
													</fo:block>
												</fo:table-cell>
											</fo:table-row>
											
										</xsl:for-each>
									</fo:table-body>
								</fo:table>
							</fo:table-cell>
							<fo:table-cell number-columns-spanned="3">
								<fo:block></fo:block>
							</fo:table-cell>
						</fo:table-row>
					</fo:table-body>
				</fo:table>
			</fo:block>		
			</xsl:if>
		</xsl:for-each>
		
		
		
		<xsl:if test="response/isHideAdminBrokerageDetailsStep7= 'N' ">
			<fo:block break-after="page"></fo:block>
			<fo:block margin-top="5mm" font-size="12px" font-family="Arial"
				font-weight="bold" text-align="center"> AGENCY CURRENT OPERATIONS</fo:block>
			<fo:block margin-top="5mm">
				<fo:table border="0.0pt solid black">
					<fo:table-column border="0.0pt solid black"
						column-width="130pt" />
					<fo:table-column border="0.0pt solid black"
						column-width="150pt" />
					<fo:table-column border="0.0pt solid black"
						column-width="80pt" />
					<fo:table-column border="0.0pt solid black" />
					<fo:table-body>

						<fo:table-row border="0.0pt solid black" height="5mm">
							<fo:table-cell border="0.0pt solid black">
								<fo:table border="0.0pt solid black">
									<fo:table-column />
									<fo:table-body>
										<fo:table-row border="0.0pt solid black" height="5mm">
											<fo:table-cell border="0.0pt solid black">
												<fo:block font-size="8px" font-family="Arial">
													Number of Locations : </fo:block>
											</fo:table-cell>
										</fo:table-row>
									</fo:table-body>
								</fo:table>
							</fo:table-cell>
							<fo:table-cell border="0.0pt solid black">
								<fo:table border="0.0pt solid black">
									<fo:table-column />
									<fo:table-body>
										<fo:table-row border="0.0pt solid black" height="5mm">
											<fo:table-cell border="0.0pt solid black">
												<fo:block font-size="8px" font-family="Arial">
													<xsl:value-of select="response/market_num_locations"></xsl:value-of>
												</fo:block>
											</fo:table-cell>
										</fo:table-row>
									</fo:table-body>
								</fo:table>
							</fo:table-cell>
							<fo:table-cell border="0.0pt solid black">
								<fo:table border="0.0pt solid black">
									<fo:table-column />
									<fo:table-body>
										<fo:table-row border="0.0pt solid black" height="5mm">
											<fo:table-cell border="0.0pt solid black"
												width="200px">
												<fo:block font-size="8px" font-family="Arial">Total
													Written Premium : </fo:block>
											</fo:table-cell>
										</fo:table-row>
									</fo:table-body>
								</fo:table>
							</fo:table-cell>
							<fo:table-cell border="0.0pt solid black">
								<fo:table border="0.0pt solid black">
									<fo:table-column />
									<fo:table-body>
										<fo:table-row border="0.0pt solid black" height="5mm">
											<fo:table-cell border="0.0pt solid black"
												width="60px" padding-start="10px">
												<fo:block font-size="8px" font-family="Arial">
													<xsl:value-of select="response/total_writtenpremium"></xsl:value-of>
												</fo:block>
											</fo:table-cell>
										</fo:table-row>
									</fo:table-body>
								</fo:table>
							</fo:table-cell>
						</fo:table-row>
						<fo:table-row border="0.0pt solid black" height="5mm">
							<fo:table-cell border="0.0pt solid black">
								<fo:table border="0.0pt solid black">
									<fo:table-column />
									<fo:table-body>
										<fo:table-row border="0.0pt solid black" height="5mm">
											<fo:table-cell border="0.0pt solid black"
												width="200px">
												<fo:block font-size="8px" font-family="Arial"> Total
													premium for all P &amp; C : </fo:block>
											</fo:table-cell>
										</fo:table-row>
									</fo:table-body>
								</fo:table>
							</fo:table-cell>
							<fo:table-cell border="0.0pt solid black">
								<fo:table border="0.0pt solid black">
									<fo:table-column />
									<fo:table-body>
										<fo:table-row border="0.0pt solid black" height="5mm">
											<fo:table-cell border="0.0pt solid black">
												<fo:block font-size="8px" font-family="Arial">
													<xsl:value-of select="response/total_premium_PC"></xsl:value-of>
												</fo:block>
											</fo:table-cell>
										</fo:table-row>
									</fo:table-body>
								</fo:table>
							</fo:table-cell>
							<fo:table-cell border="0.0pt solid black">
								<fo:table border="0.0pt solid black">
									<fo:table-column />
									<fo:table-body>
										<fo:table-row border="0.0pt solid black" height="5mm">
											<fo:table-cell border="0.0pt solid black"
												width="100px">
												<fo:block font-size="8px" font-family="Arial"
													width="100px">Total premium for all workers compensation :
												</fo:block>
											</fo:table-cell>
										</fo:table-row>
									</fo:table-body>
								</fo:table>
							</fo:table-cell>
							<fo:table-cell border="0.0pt solid black">
								<fo:table border="0.0pt solid black">
									<fo:table-column />
									<fo:table-body>
										<fo:table-row border="0.0pt solid black" height="5mm">
											<fo:table-cell border="0.0pt solid black"
												padding-start="10px">
												<fo:block font-size="8px" font-family="Arial">
													<xsl:value-of select="response/total_premium_compensation"></xsl:value-of>
												</fo:block>
											</fo:table-cell>
										</fo:table-row>
									</fo:table-body>
								</fo:table>
							</fo:table-cell>
						</fo:table-row>
						<fo:table-row border="0.0pt solid black" height="5mm">
							<fo:table-cell border="0.0pt solid black">
								<fo:table border="0.0pt solid black">
									<fo:table-column />
									<fo:table-body>
										<fo:table-row border="0.0pt solid black" height="5mm">
											<fo:table-cell border="0.0pt solid black">
												<fo:block font-size="8px" font-family="Arial"
													width="150px">Number of workers compensation policies in force :
												</fo:block>
											</fo:table-cell>
										</fo:table-row>
									</fo:table-body>
								</fo:table>
							</fo:table-cell>
							<fo:table-cell border="0.0pt solid black">
								<fo:table border="0.0pt solid black">
									<fo:table-column />
									<fo:table-body>
										<fo:table-row border="0.0pt solid black" height="5mm">
											<fo:table-cell border="0.0pt solid black">
												<fo:block font-size="8px" font-family="Arial">
													<xsl:value-of select="response/no_workers_policies"></xsl:value-of>
												</fo:block>
											</fo:table-cell>
										</fo:table-row>
									</fo:table-body>
								</fo:table>
							</fo:table-cell>
							<fo:table-cell border="0.0pt solid black">
								<fo:table border="0.0pt solid black">
									<fo:table-column />
									<fo:table-body>
										<fo:table-row border="0.0pt solid black" height="5mm">
											<fo:table-cell border="0.0pt solid black">
												<fo:block font-size="8px" font-family="Arial"></fo:block>
											</fo:table-cell>
										</fo:table-row>
									</fo:table-body>
								</fo:table>
							</fo:table-cell>
							<fo:table-cell border="0.0pt solid black">
								<fo:table border="0.0pt solid black">
									<fo:table-column />
									<fo:table-body>
										<fo:table-row border="0.0pt solid black" height="5mm">
											<fo:table-cell border="0.0pt solid black">
												<fo:block font-size="8px" font-family="Arial">
												</fo:block>
											</fo:table-cell>
										</fo:table-row>
									</fo:table-body>
								</fo:table>
							</fo:table-cell>
						</fo:table-row>
						<fo:table-row border="0.0pt solid black">
							<fo:table-cell width="100pt" border="0.0pt solid black"
								padding-start="5px" padding-top="3px" padding-bottom="3px">
								<fo:block font-size="8px" font-family="Arial"></fo:block>
							</fo:table-cell>
						</fo:table-row>
						<fo:table-row height="5mm" margin-top="10mm">
							<fo:table-cell border="0.0pt solid black">
								<fo:table border="0.0pt solid black">
									<fo:table-column />
									<fo:table-body>
										<fo:table-row border="0.0pt solid black" height="5mm">
											<fo:table-cell border="0.0pt solid black">
												<fo:block font-size="8px" font-family="Arial"
													width="100px">Line of Business Distribution :  </fo:block>
											</fo:table-cell>
										</fo:table-row>
										<fo:table-row border="0.0pt solid black" height="5mm">
											<fo:table-cell border="0.0pt solid black">
												<fo:table border="0.1pt solid black">
													<fo:table-column />
													<fo:table-column />
													<fo:table-column />
													<fo:table-column />
													<fo:table-column />
													<fo:table-column />
													<fo:table-body>
														<xsl:for-each
															select="response/agencyBusinessDistributionStep7_list_mom_1/data">
															<fo:table-row border="0.1pt solid black">
																<fo:table-cell width="100pt" border="0.1pt solid black"
																	padding-start="5px" padding-top="3px" padding-bottom="3px">
																	<fo:block font-size="8px" font-family="Arial">
																		<xsl:value-of select="lob_description1" />
																	</fo:block>
																</fo:table-cell>
																<fo:table-cell width="80pt" border="0.1pt solid black"
																	padding-start="5px" padding-top="3px" padding-bottom="3px">
																	<fo:block font-size="8px" font-family="Arial">
																		<xsl:value-of select="premium_percentage1" />
																	</fo:block>
																</fo:table-cell>
																<fo:table-cell width="90pt" border="0.1pt solid black"
																	padding-start="5px" padding-top="3px" padding-bottom="3px">
																	<fo:block font-size="8px" font-family="Arial">
																		<xsl:value-of select="lob_description2" />
																	</fo:block>
																</fo:table-cell>
																<fo:table-cell width="80pt" border="0.1pt solid black"
																	padding-start="5px" padding-top="3px" padding-bottom="3px">
																	<fo:block font-size="8px" font-family="Arial">
																		<xsl:value-of select="premium_percentage2" />
																	</fo:block>
																</fo:table-cell>
																<fo:table-cell width="90pt" border="0.1pt solid black"
																	padding-start="5px" padding-top="3px" padding-bottom="3px">
																	<fo:block font-size="8px" font-family="Arial">
																		<xsl:value-of select="lob_description3" />
																	</fo:block>
																</fo:table-cell>
																<fo:table-cell width="80pt" border="0.1pt solid black"
																	padding-start="5px" padding-top="3px" padding-bottom="3px">
																	<fo:block font-size="8px" font-family="Arial">
																		<xsl:value-of select="premium_percentage3" />
																	</fo:block>
																</fo:table-cell>
															</fo:table-row>
														</xsl:for-each>
													</fo:table-body>
												</fo:table>
											</fo:table-cell>
										</fo:table-row>
									</fo:table-body>
								</fo:table>
							</fo:table-cell>
						</fo:table-row>
						<fo:table-row border="0.0pt solid black">
							<fo:table-cell width="100pt" border="0.0pt solid black"
								padding-start="5px" padding-top="3px" padding-bottom="3px">
								<fo:block font-size="8px" font-family="Arial"></fo:block>
							</fo:table-cell>
						</fo:table-row>
						<fo:table-row height="5mm" margin-top="10mm">
							<fo:table-cell border="0.0pt solid black">
								<fo:table border="0.0pt solid black">
									<fo:table-column />
									<fo:table-body>
										<fo:table-row border="0.0pt solid black" height="5mm">
											<fo:table-cell border="0.0pt solid black"
												width="400px">
												<fo:block font-size="8px" font-family="Arial">Types
													of account by premium volume : </fo:block>
											</fo:table-cell>
										</fo:table-row>
										<fo:table-row border="0.0pt solid black" height="5mm">
											<fo:table-cell border="0.0pt solid black">
												<fo:table border="0.1pt solid black">
													<fo:table-column />
													<fo:table-column />
													<fo:table-column />
													<fo:table-column />
													<fo:table-column />
													<fo:table-column />
													<fo:table-body>
														<xsl:for-each
															select="response/agencyPremiumVolumeStep7_list_mom_1/data">
															<fo:table-row border="0.1pt solid black">
																<fo:table-cell width="100pt" border="0.1pt solid black"
																	padding-start="5px" padding-top="3px" padding-bottom="3px">
																	<fo:block font-size="8px" font-family="Arial">
																		<xsl:value-of select="description1" />
																	</fo:block>
																</fo:table-cell>
																<fo:table-cell width="80pt" border="0.1pt solid black"
																	padding-start="5px" padding-top="3px" padding-bottom="3px">
																	<fo:block font-size="8px" font-family="Arial">
																		<xsl:value-of select="percentage1" />
																	</fo:block>
																</fo:table-cell>
																<fo:table-cell width="90pt" border="0.1pt solid black"
																	padding-start="5px" padding-top="3px" padding-bottom="3px">
																	<fo:block font-size="8px" font-family="Arial">
																		<xsl:value-of select="description2" />
																	</fo:block>
																</fo:table-cell>
																<fo:table-cell width="80pt" border="0.1pt solid black"
																	padding-start="5px" padding-top="3px" padding-bottom="3px">
																	<fo:block font-size="8px" font-family="Arial">
																		<xsl:value-of select="percentage2" />
																	</fo:block>
																</fo:table-cell>
																<fo:table-cell width="90pt" border="0.1pt solid black"
																	padding-start="5px" padding-top="3px" padding-bottom="3px">
																	<fo:block font-size="8px" font-family="Arial">
																		<xsl:value-of select="description3" />
																	</fo:block>
																</fo:table-cell>
																<fo:table-cell width="80pt" border="0.1pt solid black"
																	padding-start="5px" padding-top="3px" padding-bottom="3px">
																	<fo:block font-size="8px" font-family="Arial">
																		<xsl:value-of select="percentage3" />
																	</fo:block>
																</fo:table-cell>
															</fo:table-row>
														</xsl:for-each>
													</fo:table-body>
												</fo:table>
											</fo:table-cell>
										</fo:table-row>
									</fo:table-body>
								</fo:table>
							</fo:table-cell>
						</fo:table-row>
						<fo:table-row border="0.0pt solid black">
							<fo:table-cell width="100pt" border="0.0pt solid black"
								padding-start="5px" padding-top="3px" padding-bottom="3px">
								<fo:block font-size="8px" font-family="Arial"></fo:block>
							</fo:table-cell>
						</fo:table-row>
						<fo:table-row height="5mm" margin-top="50mm">
							<fo:table-cell border="0.0pt solid black">
								<fo:table border="0.0pt solid black">
									<fo:table-column />
									<fo:table-body>
										<fo:table-row border="0.0pt solid black" height="5mm">
											<fo:table-cell border="0.0pt solid black"
												width="400px">
												<fo:block font-size="8px" font-family="Arial">Current
													Business Plan. Please mark the
													types of business which you feel your agency is most interested
													in :
												</fo:block>
											</fo:table-cell>
										</fo:table-row>
										<fo:table-row border="0.0pt solid black" height="5mm">
											<fo:table-cell border="0.0pt solid black">
												<fo:table border="0.1pt solid black">
													<fo:table-column />
													<fo:table-column />
													<fo:table-column />
													<fo:table-column />
													<fo:table-column />
													<fo:table-column />
													<fo:table-column />
													<fo:table-column />
													<fo:table-body>
														<xsl:for-each
															select="response/agencyBusinessPlanStep7_list_mom_1/data">
															<fo:table-row border="0.1pt solid black">
																<fo:table-cell width="90pt" border="0.1pt solid black"
																	padding-start="5px" padding-top="3px" padding-bottom="3px">
																	<fo:block font-size="8px" font-family="Arial">
																		<xsl:value-of select="business_description1" />
																	</fo:block>
																</fo:table-cell>
																<fo:table-cell width="40pt" border="0.1pt solid black"
																	padding-start="5px" padding-top="3px" padding-bottom="3px">
																	<fo:block font-size="8px" font-family="Arial">
																		<xsl:value-of select="businessplan_id11" />
																	</fo:block>
																</fo:table-cell>
																<fo:table-cell width="90pt" border="0.1pt solid black"
																	padding-start="5px" padding-top="3px" padding-bottom="3px">
																	<fo:block font-size="8px" font-family="Arial">
																		<xsl:value-of select="business_description2" />
																	</fo:block>
																</fo:table-cell>
																<fo:table-cell width="40pt" border="0.1pt solid black"
																	padding-start="5px" padding-top="3px" padding-bottom="3px">
																	<fo:block font-size="8px" font-family="Arial">
																		<xsl:value-of select="businessplan_id12" />
																	</fo:block>
																</fo:table-cell>
																<fo:table-cell width="90pt" border="0.1pt solid black"
																	padding-start="5px" padding-top="3px" padding-bottom="3px">
																	<fo:block font-size="8px" font-family="Arial">
																		<xsl:value-of select="business_description3" />
																	</fo:block>
																</fo:table-cell>
																<fo:table-cell width="40pt" border="0.1pt solid black"
																	padding-start="5px" padding-top="3px" padding-bottom="3px">
																	<fo:block font-size="8px" font-family="Arial">
																		<xsl:value-of select="businessplan_id13" />
																	</fo:block>
																</fo:table-cell>
																<fo:table-cell width="90pt" border="0.1pt solid black"
																	padding-start="5px" padding-top="3px" padding-bottom="3px">
																	<fo:block font-size="8px" font-family="Arial">
																		<xsl:value-of select="business_description4" />
																	</fo:block>
																</fo:table-cell>
																<fo:table-cell width="40pt" border="0.1pt solid black"
																	padding-start="5px" padding-top="3px" padding-bottom="3px">
																	<fo:block font-size="8px" font-family="Arial">
																		<xsl:value-of select="businessplan_id14" />
																	</fo:block>
																</fo:table-cell>
															</fo:table-row>
														</xsl:for-each>
													</fo:table-body>
												</fo:table>
											</fo:table-cell>
										</fo:table-row>
									</fo:table-body>
								</fo:table>
							</fo:table-cell>
						</fo:table-row>
					</fo:table-body>
				</fo:table>
			</fo:block>
		</xsl:if>


<xsl:if test="response/registration_type_code='PRAG' or response/registration_type_code='SCAG'">

		<fo:block break-after="page" />
		</xsl:if>
		<xsl:if test="response/registration_type_code='PRAG' or response/registration_type_code='SCAG'">
		
		<fo:block margin-top="5mm" font-size="12px" font-family="Arial"
			font-weight="bold" text-align="center">AGENCY OTHER INFORMATION</fo:block>
			</xsl:if>

		<!-- <fo:block margin-top="5mm"> <fo:table border="0.0pt solid black"> 
			<fo:table-column border="0.0pt solid black" column-width="130pt"/> <fo:table-column 
			border="0.0pt solid black" column-width="150pt"/> <fo:table-column border="0.0pt 
			solid black" column-width="80pt"/> <fo:table-column border="0.0pt solid black"/> 
			<fo:table-body> <fo:table-row border="0.0pt solid black"> <fo:table-cell 
			border="0.0pt solid black" width="400px"> <fo:block font-size="8px" font-family="Arial" 
			font-weight="bold">MARKET INFORMATION</fo:block> </fo:table-cell> </fo:table-row> 
			<fo:table-row border="0.0pt solid black"> <fo:table-cell border="0.0pt solid 
			black" width="400px"> <fo:block font-size="8px" font-family="Arial"></fo:block> 
			</fo:table-cell> </fo:table-row> <fo:table-row border="0.0pt solid black" 
			height="5mm"> <fo:table-cell border="0.0pt solid black"> <fo:table border="0.1pt 
			solid black"> <fo:table-column/> <fo:table-column/> <fo:table-column/> <fo:table-column/> 
			<fo:table-column/> <fo:table-column/> <fo:table-body> <fo:table-row border="0.1pt 
			solid black"> <fo:table-cell width="120pt" border="0.1pt solid black" padding-start="5px" 
			padding-top="3px" padding-bottom="3px"> <fo:block font-size="8px" font-family="Arial" 
			font-weight="bold">Carrier</fo:block> </fo:table-cell> <fo:table-cell width="100pt" 
			border="0.1pt solid black" padding-start="5px" padding-top="3px" padding-bottom="3px"> 
			<fo:block font-size="8px" font-family="Arial" font-weight="bold">LOB</fo:block> 
			</fo:table-cell> <fo:table-cell width="80pt" border="0.1pt solid black" padding-start="5px" 
			padding-top="3px" padding-bottom="3px"> <fo:block font-size="8px" font-family="Arial" 
			font-weight="bold">Commission rate</fo:block> </fo:table-cell> <fo:table-cell 
			width="80pt" border="0.1pt solid black" padding-start="5px" padding-top="3px" 
			padding-bottom="3px"> <fo:block font-size="8px" font-family="Arial" font-weight="bold">Written 
			Premium</fo:block> </fo:table-cell> <fo:table-cell width="60pt" border="0.1pt 
			solid black" padding-start="5px" padding-top="3px" padding-bottom="3px"> 
			<fo:block font-size="8px" font-family="Arial" font-weight="bold">Loss Ratio</fo:block> 
			</fo:table-cell> <fo:table-cell width="80pt" border="0.1pt solid black" padding-start="5px" 
			padding-top="3px" padding-bottom="3px"> <fo:block font-size="8px" font-family="Arial" 
			font-weight="bold">Retention Rate </fo:block> </fo:table-cell> </fo:table-row> 
			<xsl:for-each select="response/agencyMarketInformation_list_listfreeform_1/data"> 
			<fo:table-row border="0.1pt solid black"> <fo:table-cell width="160pt" border="0.1pt 
			solid black" padding-start="5px" padding-top="3px" padding-bottom="3px"> 
			<fo:block font-size="8px" font-family="Arial"><xsl:value-of select="aar_carrierid_desc"/></fo:block> 
			</fo:table-cell> <fo:table-cell width="160pt" border="0.1pt solid black" 
			padding-start="5px" padding-top="3px" padding-bottom="3px"> <fo:block font-size="8px" 
			font-family="Arial"><xsl:value-of select="aar_lobid_desc"/></fo:block> </fo:table-cell> 
			<fo:table-cell width="160pt" border="0.1pt solid black" padding-start="5px" 
			padding-top="3px" padding-bottom="3px"> <fo:block font-size="8px" font-family="Arial"><xsl:value-of 
			select="commissionrate"/></fo:block> </fo:table-cell> <fo:table-cell width="160pt" 
			border="0.1pt solid black" padding-start="5px" padding-top="3px" padding-bottom="3px"> 
			<fo:block font-size="8px" font-family="Arial"><xsl:value-of select="writtenpremium"/></fo:block> 
			</fo:table-cell> <fo:table-cell width="160pt" border="0.1pt solid black" 
			padding-start="5px" padding-top="3px" padding-bottom="3px"> <fo:block font-size="8px" 
			font-family="Arial"><xsl:value-of select="loss_ratio"/></fo:block> </fo:table-cell> 
			<fo:table-cell width="160pt" border="0.1pt solid black" padding-start="5px" 
			padding-top="3px" padding-bottom="3px"> <fo:block font-size="8px" font-family="Arial"><xsl:value-of 
			select="retentionrate"/></fo:block> </fo:table-cell> </fo:table-row> </xsl:for-each> 
			</fo:table-body> </fo:table> </fo:table-cell> <fo:table-cell number-columns-spanned="3"><fo:block></fo:block></fo:table-cell> 
			</fo:table-row> </fo:table-body> </fo:table> </fo:block> -->

<xsl:if test="response/registration_type_code='PRAG' or response/registration_type_code='SCAG'">

		<fo:block margin-top="5mm">
			<fo:table border="0.0pt solid black">
				<fo:table-column />
				<fo:table-column />
				<fo:table-column />
				<fo:table-column />

				<fo:table-column border="0.0pt solid black" />
				<fo:table-body>
					<fo:table-row height="5mm">
						<fo:table-cell width="200pt">
							<fo:block font-size="8px" font-family="Arial"
								font-weight="bold" text-decoration="underline">Premium Volume and Production
								Information
							</fo:block>
							
						</fo:table-cell>
						<fo:table-cell number-columns-spanned="3">
							<fo:block></fo:block>
						</fo:table-cell>
					</fo:table-row>

					<fo:table-row border="0.0pt solid black" height="5mm">
						<fo:table-cell border="0.0pt solid black">
							<fo:table border="1.0pt solid black">
								<fo:table-column />
								<fo:table-column />
								<fo:table-column />
								<fo:table-column />
								<fo:table-column />
								<fo:table-column />
								<fo:table-column />
								<fo:table-body>
									<fo:table-row border="1.0pt solid black">
										<fo:table-cell width="110pt" border="1.0pt solid black"
											padding-start="5px" padding-top="3px" padding-bottom="3px">
											<fo:block font-size="8px" font-family="Arial"
												font-weight="bold">Line of Business</fo:block>
										</fo:table-cell>
										<fo:table-cell width="90pt" border="1.0pt solid black"
											padding-start="5px" padding-top="3px" padding-bottom="3px">
											<fo:block font-size="8px" font-family="Arial"
												font-weight="bold">Current Monthly Applications</fo:block>
										</fo:table-cell>
										<fo:table-cell width="90pt" border="1.0pt solid black"
											padding-start="5px" padding-top="3px" padding-bottom="3px">
											<fo:block font-size="8px" font-family="Arial"
												font-weight="bold">Annual Premium Volume</fo:block>
										</fo:table-cell>
                                      <fo:table-cell width="50pt" border="1.0pt solid black"
											padding-start="5px" padding-top="3px" padding-bottom="3px">
											<fo:block font-size="8px" font-family="Arial"
												font-weight="bold">Year 3</fo:block>
										</fo:table-cell>
										
                                        <fo:table-cell width="90pt" border="1.0pt solid black"
											padding-start="5px" padding-top="3px" padding-bottom="3px">
											<fo:block font-size="8px" font-family="Arial"
												font-weight="bold">Monthly Application Written</fo:block>
										</fo:table-cell>
										<fo:table-cell width="90pt" border="1.0pt solid black"
											padding-start="5px" padding-top="3px" padding-bottom="3px">
											<fo:block font-size="8px" font-family="Arial"
												font-weight="bold">Annual Application Written</fo:block>
										</fo:table-cell>
									</fo:table-row>
									<xsl:for-each
										select="response/agencyPremiumVolumeByLOBStep6_list_mom_1/data">
										<fo:table-row border="1.0pt solid black">
											<fo:table-cell width="110pt" border="1.0pt solid black"
												padding-start="5px" padding-top="3px" padding-bottom="3px">
												<fo:block font-size="8px" font-family="Arial">
													<xsl:value-of select="lob_description" />
												</fo:block>
											</fo:table-cell>
											<fo:table-cell width="90pt" border="1.0pt solid black"
												padding-start="5px" padding-top="3px" padding-bottom="3px">
												<fo:block font-size="8px" font-family="Arial">
													<xsl:value-of select="monthly_premium" />
												</fo:block>
											</fo:table-cell>
											<fo:table-cell width="90pt" border="1.0pt solid black"
												padding-start="5px" padding-top="3px" padding-bottom="3px">
												<fo:block font-size="8px" font-family="Arial">
													<xsl:value-of select="yearly_premium" />
												</fo:block>
											</fo:table-cell>
                                           <fo:table-cell width="50pt" border="1.0pt solid black"
												padding-start="5px" padding-top="3px" padding-bottom="3px">
												<fo:block font-size="8px" font-family="Arial">
													<xsl:value-of select="next3year_premium" />
												</fo:block>
											</fo:table-cell>
											<fo:table-cell width="90pt" border="1.0pt solid black"
												padding-start="5px" padding-top="3px" padding-bottom="3px">
												<fo:block font-size="8px" font-family="Arial">
													<xsl:value-of select="monthly_application_written" />
												</fo:block>
											</fo:table-cell>
											<fo:table-cell width="90pt" border="1.0pt solid black"
												padding-start="5px" padding-top="3px" padding-bottom="3px">
												<fo:block font-size="8px" font-family="Arial">
													<xsl:value-of select="annual_application_written" />
												</fo:block>
											</fo:table-cell>
										</fo:table-row>
									</xsl:for-each>
								</fo:table-body>
							</fo:table>
						</fo:table-cell>
						<fo:table-cell number-columns-spanned="3">
							<fo:block></fo:block>
						</fo:table-cell>
					</fo:table-row>
				</fo:table-body>
			</fo:table>
		</fo:block>
</xsl:if>		
<!-- <xsl:if test="response/registration_type_code='PRAG' or response/registration_type_code='SCAG'">

		<fo:block margin-top="5mm">
			<fo:table border="0.0pt solid black">
				<fo:table-column />
				<fo:table-column />
				<fo:table-column />
				<fo:table-column />
				<fo:table-body>
					<fo:table-row height="5mm">
						<fo:table-cell number-columns-spanned="2" width="200pt">
							<fo:block font-size="8px" font-family="Arial"
								font-weight="bold" text-decoration="underline">Top Three Companies Appointed
							</fo:block>
						</fo:table-cell>
						<fo:table-cell number-columns-spanned="2">
							<fo:block></fo:block>
						</fo:table-cell>
					</fo:table-row>
					<fo:table-row height="5mm"> <fo:table-cell number-columns-spanned="4" 
						width="200pt"> <fo:block font-size="8px" font-family="Arial" font-weight="bold">Total 
						number of monthly applications written over last 3 months :</fo:block> </fo:table-cell> 
						</fo:table-row>
					<fo:table-row border="0.0pt solid black" height="5mm">
						<fo:table-cell border="0.0pt solid black">
							<fo:table border="1.0pt solid black">
								<fo:table-column />
								<fo:table-column />
								<fo:table-column />
								<fo:table-column />
								<fo:table-column />
								<fo:table-column />
								<fo:table-body>
									<fo:table-row border="1.0pt solid black">
										<fo:table-cell width="100pt" border="1.0pt solid black"
											padding-start="5px" padding-top="3px" padding-bottom="3px">
											<fo:block font-size="8px" font-family="Arial"
												font-weight="bold">Company Name</fo:block>
										</fo:table-cell>
										<fo:table-cell width="80pt" border="1.0pt solid black"
											padding-start="5px" padding-top="3px" padding-bottom="3px">
											<fo:block font-size="8px" font-family="Arial"
												font-weight="bold">
												Prior Written Premium
											</fo:block>
										</fo:table-cell>
										<fo:table-cell width="100pt" border="1.0pt solid black"
											padding-start="5px" padding-top="3px" padding-bottom="3px">
											<fo:block font-size="8px" font-family="Arial"
												font-weight="bold">
												Written Premium Volume
											</fo:block>
										</fo:table-cell>
										<fo:table-cell width="70pt" border="1.0pt solid black"
											padding-start="5px" padding-top="3px" padding-bottom="3px">
											<fo:block font-size="8px" font-family="Arial"
												font-weight="bold">
												Loss Ratio
											</fo:block>
										</fo:table-cell>
										<fo:table-cell width="80pt" border="1.0pt solid black"
											padding-start="5px" padding-top="3px" padding-bottom="3px">
											<fo:block font-size="8px" font-family="Arial"
												font-weight="bold">
												Date of Appointment
											</fo:block>
										</fo:table-cell>
										<fo:table-cell width="80pt" border="1.0pt solid black"
											padding-start="5px" padding-top="3px" padding-bottom="3px">
											<fo:block font-size="8px" font-family="Arial"
												font-weight="bold">
												Year of Appointment
											</fo:block>
										</fo:table-cell>
									</fo:table-row>
									<xsl:for-each
										select="response/agencyMarketInformation_list_listfreeform_1/data">
										<fo:table-row border="1.0pt solid black">
											<fo:table-cell width="100pt" border="1.0pt solid black"
												padding-start="5px" padding-top="3px" padding-bottom="3px">
												<fo:block font-size="8px" font-family="Arial">
													<xsl:value-of select="aar_carrierid_desc" />
												</fo:block>
											</fo:table-cell>
											<fo:table-cell width="80pt" border="1.0pt solid black"
												padding-start="5px" padding-top="3px" padding-bottom="3px">
												<fo:block font-size="8px" font-family="Arial">
													<xsl:value-of select="PY_written_premium" />
												</fo:block>
											</fo:table-cell>
											<fo:table-cell width="100pt" border="1.0pt solid black"
												padding-start="5px" padding-top="3px" padding-bottom="3px">
												<fo:block font-size="8px" font-family="Arial">
													<xsl:value-of select="class1volume" />
												</fo:block>
											</fo:table-cell>
											<fo:table-cell width="70pt" border="1.0pt solid black"
												padding-start="5px" padding-top="3px" padding-bottom="3px">
												<fo:block font-size="8px" font-family="Arial">
													<xsl:value-of select="loss_ratio" />
													<xsl:if test="loss_ratio!=null or loss_ratio!='' ">
														%
													</xsl:if>
												</fo:block>
											</fo:table-cell>
											<fo:table-cell width="80pt" border="1.0pt solid black"
												padding-start="5px" padding-top="3px" padding-bottom="3px">
												<fo:block font-size="8px" font-family="Arial">
													<xsl:value-of select="dateofappointment" />
												</fo:block>
											</fo:table-cell>dateofappointment
											<fo:table-cell width="80pt" border="1.0pt solid black"
												padding-start="5px" padding-top="3px" padding-bottom="3px">
												<fo:block font-size="8px" font-family="Arial">
													<xsl:value-of select="yearofappointment" />
												</fo:block>
											</fo:table-cell>
										</fo:table-row>
									</xsl:for-each>
								</fo:table-body>
							</fo:table>
						</fo:table-cell>
						<fo:table-cell number-columns-spanned="3">
							<fo:block></fo:block>
						</fo:table-cell>
					</fo:table-row>
				</fo:table-body>
			</fo:table>
		</fo:block>
</xsl:if> -->





<xsl:if test="response/registration_type_code='PRAG' or response/registration_type_code='SCAG'">

		<fo:block margin-top="5mm">
			<fo:table border="0.0pt solid black">
				<fo:table-column />
				<fo:table-column />
				<fo:table-column />
				<fo:table-column />
				<fo:table-body>
					<fo:table-row height="5mm">
						<fo:table-cell number-columns-spanned="2" width="200pt">
							<fo:block font-size="8px" font-family="Arial"
								font-weight="bold" text-decoration="underline">Top Three Companies Appointed
							</fo:block>
						</fo:table-cell>
						<fo:table-cell number-columns-spanned="2">
							<fo:block></fo:block>
						</fo:table-cell>
					</fo:table-row>
					<!-- <fo:table-row height="5mm"> <fo:table-cell number-columns-spanned="4" 
						width="200pt"> <fo:block font-size="8px" font-family="Arial" font-weight="bold">Total 
						number of monthly applications written over last 3 months :</fo:block> </fo:table-cell> 
						</fo:table-row> -->
					<fo:table-row border="0.0pt solid black" height="5mm">
						<fo:table-cell border="0.0pt solid black">
							<fo:table border="1.0pt solid black">
								<fo:table-column />
								<fo:table-column />
								<fo:table-column />
								<fo:table-column />
								<fo:table-column />
								<fo:table-column />
								<fo:table-body>
									<fo:table-row border="1.0pt solid black">
										<fo:table-cell width="100pt" border="1.0pt solid black"
											padding-start="5px" padding-top="3px" padding-bottom="3px">
											<fo:block font-size="8px" font-family="Arial"
												font-weight="bold">Company Name</fo:block>
										</fo:table-cell>
										<fo:table-cell width="80pt" border="1.0pt solid black"
											padding-start="5px" padding-top="3px" padding-bottom="3px">
											<fo:block font-size="8px" font-family="Arial"
												font-weight="bold">
												Prior Written Premium
											</fo:block>
										</fo:table-cell>
										<fo:table-cell width="100pt" border="1.0pt solid black"
											padding-start="5px" padding-top="3px" padding-bottom="3px">
											<fo:block font-size="8px" font-family="Arial"
												font-weight="bold">
												Written Premium Volume
											</fo:block>
										</fo:table-cell>
										<fo:table-cell width="70pt" border="1.0pt solid black"
											padding-start="5px" padding-top="3px" padding-bottom="3px">
											<fo:block font-size="8px" font-family="Arial"
												font-weight="bold">
												Loss Ratio
											</fo:block>
										</fo:table-cell>
										<fo:table-cell width="80pt" border="1.0pt solid black"
											padding-start="5px" padding-top="3px" padding-bottom="3px">
											<fo:block font-size="8px" font-family="Arial"
												font-weight="bold">
												Date of Appointment
											</fo:block>
										</fo:table-cell>
										<fo:table-cell width="80pt" border="1.0pt solid black"
											padding-start="5px" padding-top="3px" padding-bottom="3px">
											<fo:block font-size="8px" font-family="Arial"
												font-weight="bold">
												Year of Appointment
											</fo:block>
										</fo:table-cell>
									</fo:table-row>
									<xsl:for-each
										select="response/agencyMarketInformation_list_listfreeform_1/data">
										<fo:table-row border="1.0pt solid black">
											<fo:table-cell width="100pt" border="1.0pt solid black"
												padding-start="5px" padding-top="3px" padding-bottom="3px">
												<fo:block font-size="8px" font-family="Arial">
													<xsl:value-of select="aar_carrierid_desc" />
												</fo:block>
											</fo:table-cell>
											<fo:table-cell width="80pt" border="1.0pt solid black"
												padding-start="5px" padding-top="3px" padding-bottom="3px">
												<fo:block font-size="8px" font-family="Arial">
													<xsl:value-of select="PY_written_premium" />
												</fo:block>
											</fo:table-cell>
											<fo:table-cell width="100pt" border="1.0pt solid black"
												padding-start="5px" padding-top="3px" padding-bottom="3px">
												<fo:block font-size="8px" font-family="Arial">
													<xsl:value-of select="class1volume" />
												</fo:block>
											</fo:table-cell>
											<fo:table-cell width="70pt" border="1.0pt solid black"
												padding-start="5px" padding-top="3px" padding-bottom="3px">
												<fo:block font-size="8px" font-family="Arial">
													<xsl:value-of select="loss_ratio" />
													<xsl:if test="loss_ratio!=null or loss_ratio!='' ">
														%
													</xsl:if>
												</fo:block>
											</fo:table-cell>
											<fo:table-cell width="80pt" border="1.0pt solid black"
												padding-start="5px" padding-top="3px" padding-bottom="3px">
												<fo:block font-size="8px" font-family="Arial">
													<xsl:value-of select="dateofappointment" />
												</fo:block>
											</fo:table-cell>dateofappointment
											<fo:table-cell width="80pt" border="1.0pt solid black"
												padding-start="5px" padding-top="3px" padding-bottom="3px">
												<fo:block font-size="8px" font-family="Arial">
													<xsl:value-of select="yearofappointment" />
												</fo:block>
											</fo:table-cell>
										</fo:table-row>
									</xsl:for-each>
								</fo:table-body>
							</fo:table>
						</fo:table-cell>
						<fo:table-cell number-columns-spanned="3">
							<fo:block></fo:block>
						</fo:table-cell>
					</fo:table-row>
				</fo:table-body>
			</fo:table>
		</fo:block>
</xsl:if>

<xsl:if test="response/registration_type_code='PRAG' or response/registration_type_code='SCAG'">

		<fo:block margin-top="5mm">
			<fo:table border="0.0pt solid black">
				<fo:table-column border="0.0pt solid black"
					column-width="130pt" />
				<fo:table-column border="0.0pt solid black"
					column-width="150pt" />
				<fo:table-column border="0.0pt solid black"
					column-width="80pt" />
				<fo:table-column border="0.0pt solid black" />
				<fo:table-body>
					<fo:table-row height="5mm">
						<fo:table-cell number-columns-spanned="2" width="200pt">
							<fo:block font-size="8px" font-family="Arial"
								font-weight="bold" text-decoration="underline">Source to Generate New
								Business</fo:block>
						</fo:table-cell>
						<fo:table-cell number-columns-spanned="2">
							<fo:block></fo:block>
						</fo:table-cell>
					</fo:table-row>

					<fo:table-row border="0.0pt solid black" height="5mm">
						<fo:table-cell border="0.0pt solid black">
							<fo:table border="1.0pt solid black">
								<fo:table-column />
								<fo:table-column />
								<fo:table-column />
								<fo:table-column />
								<fo:table-column />
								<fo:table-column />
								<fo:table-body>
									<xsl:for-each select="response/agencyBusinessSource_list_1/data">
										<fo:table-row border="1.0pt solid black">
											<fo:table-cell width="120pt" border="1.0pt solid black"
												padding-start="5px" padding-top="3px" padding-bottom="3px">
												<fo:block font-size="8px" font-family="Arial">
													<xsl:value-of select="business_source_description1" />
												</fo:block>
											</fo:table-cell>
											<fo:table-cell width="60pt" border="1.0pt solid black"
												padding-start="5px" padding-top="3px" padding-bottom="3px">
												<fo:block font-size="8px" font-family="Arial">
													<xsl:value-of select="percentage1" />
												</fo:block>
											</fo:table-cell>
											<fo:table-cell width="110pt" border="1.0pt solid black"
												padding-start="5px" padding-top="3px" padding-bottom="3px">
												<fo:block font-size="8px" font-family="Arial">
													<xsl:value-of select="business_source_description2" />
												</fo:block>
											</fo:table-cell>
											<fo:table-cell width="60pt" border="1.0pt solid black"
												padding-start="5px" padding-top="3px" padding-bottom="3px">
												<fo:block font-size="8px" font-family="Arial">
													<xsl:value-of select="percentage2" />
												</fo:block>
											</fo:table-cell>
											<fo:table-cell width="110pt" border="1.0pt solid black"
												padding-start="5px" padding-top="3px" padding-bottom="3px">
												<fo:block font-size="8px" font-family="Arial">
													<xsl:value-of select="business_source_description3" />
												</fo:block>
											</fo:table-cell>
											<fo:table-cell width="60pt" border="1.0pt solid black"
												padding-start="5px" padding-top="3px" padding-bottom="3px">
												<fo:block font-size="8px" font-family="Arial">
													<xsl:value-of select="percentage3" />
												</fo:block>
											</fo:table-cell>
										</fo:table-row>
									</xsl:for-each>
								</fo:table-body>
							</fo:table>
						</fo:table-cell>
						<fo:table-cell number-columns-spanned="3">
							<fo:block></fo:block>
						</fo:table-cell>
					</fo:table-row>
				</fo:table-body>
			</fo:table>
		</fo:block>
		</xsl:if>
		
		<xsl:if test="response/registration_type_code='PRAG' or response/registration_type_code='SCAG'">
		
		<fo:block margin-top="5mm">
			<fo:table border="0.0pt solid black">
				<fo:table-column border="0.0pt solid black"
					column-width="130pt" />
				<fo:table-column border="0.0pt solid black"
					column-width="150pt" />
				<fo:table-column border="0.0pt solid black"
					column-width="80pt" />
				<fo:table-column border="0.0pt solid black" />
				<fo:table-body>
					<fo:table-row height="5mm">
						<fo:table-cell number-columns-spanned="4" width="200pt">
							<fo:block font-size="8px" font-family="Arial"
								font-weight="bold">Companies Terminated, Suspended, Restricted writings
								imposed in last 5 years</fo:block>
						</fo:table-cell>
					</fo:table-row>
					<fo:table-row border="0.0pt solid black" height="5mm">
						<fo:table-cell border="0.0pt solid black">
							<fo:table border="1.0pt solid black">
								<fo:table-column />
								<fo:table-column />
								<fo:table-column />
								<fo:table-column />
								<fo:table-body>
									<fo:table-row border="1.0pt solid black">
										<fo:table-cell width="200pt" border="1.0pt solid black"
											padding-start="5px" padding-top="3px" padding-bottom="3px">
											<fo:block font-size="8px" font-family="Arial"
												font-weight="bold">Company Name</fo:block>
										</fo:table-cell>
										<fo:table-cell width="120pt" border="1.0pt solid black"
											padding-start="5px" padding-top="3px" padding-bottom="3px">
											<fo:block font-size="8px" font-family="Arial"
												font-weight="bold">Annual Premium Volume</fo:block>
										</fo:table-cell>
										<fo:table-cell width="90pt" border="1.0pt solid black"
											padding-start="5px" padding-top="3px" padding-bottom="3px">
											<fo:block font-size="8px" font-family="Arial"
												font-weight="bold">Date Closed</fo:block>
										</fo:table-cell>
										<fo:table-cell width="110pt" border="1.0pt solid black"
											padding-start="5px" padding-top="3px" padding-bottom="3px">
											<fo:block font-size="8px" font-family="Arial"
												font-weight="bold">Reason for Action Taken</fo:block>
										</fo:table-cell>
									</fo:table-row>
									<xsl:for-each select="response/agencyterminated_list_1/data">
										<fo:table-row border="1.0pt solid black">
											<fo:table-cell width="120pt" border="1.0pt solid black"
												padding-start="5px" padding-top="3px" padding-bottom="3px">
												<fo:block font-size="8px" font-family="Arial">
													<xsl:value-of select="company_name" />
												</fo:block>
											</fo:table-cell>
											<fo:table-cell width="120pt" border="1.0pt solid black"
												padding-start="5px" padding-top="3px" padding-bottom="3px">
												<fo:block font-size="8px" font-family="Arial">
													<xsl:value-of select="annual_premium_volume" />
												</fo:block>
											</fo:table-cell>
											<fo:table-cell width="120pt" border="1.0pt solid black"
												padding-start="5px" padding-top="3px" padding-bottom="3px">
												<fo:block font-size="8px" font-family="Arial">
													<xsl:value-of select="date_closed" />
												</fo:block>
											</fo:table-cell>
											<fo:table-cell width="120pt" border="1.0pt solid black"
												padding-start="5px" padding-top="3px" padding-bottom="3px">
												<fo:block font-size="8px" font-family="Arial">
													<xsl:value-of select="reason_for_action_taken_desc" />
												</fo:block>
											</fo:table-cell>
										</fo:table-row>
									</xsl:for-each>
								</fo:table-body>
							</fo:table>
						</fo:table-cell>
						<fo:table-cell number-columns-spanned="3">
							<fo:block></fo:block>
						</fo:table-cell>
					</fo:table-row>
				</fo:table-body>
			</fo:table>
		</fo:block>
		</xsl:if>
		
		<!-- <xsl:if test="response/registration_type_code='PRAG' or response/registration_type_code='SCAG'">
		<fo:block margin-top="5mm">
			<fo:table border="0.0pt solid black">
				<fo:table-column border="0.0pt solid black"
					column-width="130pt" />
				<fo:table-column border="0.0pt solid black"
					column-width="150pt" />
				<fo:table-column border="0.0pt solid black"
					column-width="80pt" />
				<fo:table-column border="0.0pt solid black" />
				<fo:table-body>
					<fo:table-row height="5mm">
						<fo:table-cell number-columns-spanned="4" width="200pt">
							<fo:block font-size="8px" font-family="Arial"
								font-weight="bold">Personal References</fo:block>
						</fo:table-cell>
					</fo:table-row>
					<fo:table-row border="0.0pt solid black" height="5mm">
						<fo:table-cell border="0.0pt solid black">
							<fo:table border="1.0pt solid black">
								<fo:table-column />
								<fo:table-column />
								<fo:table-column />
								<fo:table-column />
								<fo:table-column />
								<fo:table-body>
									<fo:table-row border="1.0pt solid black">
										<fo:table-cell width="116pt" border="1.0pt solid black"
											padding-start="5px" padding-top="3px" padding-bottom="3px">
											<fo:block font-size="8px" font-family="Arial"
												font-weight="bold">Name</fo:block>
										</fo:table-cell>
										<fo:table-cell width="96pt" border="1.0pt solid black"
											padding-start="5px" padding-top="3px" padding-bottom="3px">
											<fo:block font-size="8px" font-family="Arial"
												font-weight="bold">Company and Position</fo:block>
										</fo:table-cell>
										<fo:table-cell width="116pt" border="1.0pt solid black"
											padding-start="5px" padding-top="3px" padding-bottom="3px">
											<fo:block font-size="8px" font-family="Arial"
												font-weight="bold">Address</fo:block>
										</fo:table-cell>
										<fo:table-cell width="96pt" border="1.0pt solid black"
											padding-start="5px" padding-top="3px" padding-bottom="3px">
											<fo:block font-size="8px" font-family="Arial"
												font-weight="bold">Phone</fo:block>
										</fo:table-cell>
										<fo:table-cell width="96pt" border="1.0pt solid black"
											padding-start="5px" padding-top="3px" padding-bottom="3px">
											<fo:block font-size="8px" font-family="Arial"
												font-weight="bold">Relationship</fo:block>
										</fo:table-cell>
									</fo:table-row>
									<xsl:for-each select="response/personalinformation_list_1/data">
										<fo:table-row border="1.0pt solid black">
											<fo:table-cell width="96pt" border="1.0pt solid black"
												padding-start="5px" padding-top="3px" padding-bottom="3px">
												<fo:block font-size="8px" font-family="Arial">
													<xsl:value-of select="name" />
												</fo:block>
											</fo:table-cell>
											<fo:table-cell width="96pt" border="1.0pt solid black"
												padding-start="5px" padding-top="3px" padding-bottom="3px">
												<fo:block font-size="8px" font-family="Arial">
													<xsl:value-of select="company" />
												</fo:block>
											</fo:table-cell>
											<fo:table-cell width="96pt" border="1.0pt solid black"
												padding-start="5px" padding-top="3px" padding-bottom="3px">
												<fo:block font-size="8px" font-family="Arial">
													<xsl:value-of select="address" />
												</fo:block>
											</fo:table-cell>
											<fo:table-cell width="96pt" border="1.0pt solid black"
												padding-start="5px" padding-top="3px" padding-bottom="3px">
												<fo:block font-size="8px" font-family="Arial">
													<xsl:value-of select="phone" />
												</fo:block>
											</fo:table-cell>
											<fo:table-cell width="96pt" border="1.0pt solid black"
												padding-start="5px" padding-top="3px" padding-bottom="3px">
												<fo:block font-size="8px" font-family="Arial">
													<xsl:value-of select="relationship" />
												</fo:block>
											</fo:table-cell>
										</fo:table-row>
									</xsl:for-each>
								</fo:table-body>
							</fo:table>
						</fo:table-cell>
						<fo:table-cell number-columns-spanned="3">
							<fo:block></fo:block>
						</fo:table-cell>
					</fo:table-row>
				</fo:table-body>
			</fo:table>
		</fo:block>
		</xsl:if> -->
		
		<xsl:if test="response/registration_type_code='PRAG' or response/registration_type_code='SCAG'">
		
		<fo:block margin-top="5mm">
			<fo:table border="0.0pt solid black">
				<fo:table-column />
				<fo:table-column />
				<fo:table-column />
				<fo:table-column />
				<fo:table-body>
					<fo:table-row height="5mm">
						<fo:table-cell number-columns-spanned="4" width="200pt">
							<fo:block font-size="8px" font-family="Arial"
								font-weight="bold">List of previous entities, mergers and acquisitions
							</fo:block>
						</fo:table-cell>
					</fo:table-row>
					<fo:table-row border="0.0pt solid black" height="5mm">
						<fo:table-cell border="0.0pt solid black">
							<fo:table border="1.0pt solid black">
								<fo:table-column />
								<fo:table-column />
								<fo:table-column />
								<fo:table-body>
									<fo:table-row border="1.0pt solid black">
										<fo:table-cell width="280pt" border="1.0pt solid black"
											padding-start="5px" padding-top="3px" padding-bottom="3px">
											<fo:block font-size="8px" font-family="Arial"
												font-weight="bold">Name</fo:block>
										</fo:table-cell>
										<fo:table-cell width="120pt" border="1.0pt solid black"
											padding-start="5px" padding-top="3px" padding-bottom="3px">
											<fo:block font-size="8px" font-family="Arial"
												font-weight="bold">Date Acquired</fo:block>
										</fo:table-cell>
										<fo:table-cell width="120pt" border="1.0pt solid black"
											padding-start="5px" padding-top="3px" padding-bottom="3px">
											<fo:block font-size="8px" font-family="Arial"
												font-weight="bold">Volume</fo:block>
										</fo:table-cell>
									</fo:table-row>
									<xsl:for-each select="response/agencymergers_list_1/data">
										<fo:table-row border="1.0pt solid black">
											<fo:table-cell width="160pt" border="1.0pt solid black"
												padding-start="5px" padding-top="3px" padding-bottom="3px">
												<fo:block font-size="8px" font-family="Arial">
													<xsl:value-of select="agencymerger_name" />
												</fo:block>
											</fo:table-cell>
											<fo:table-cell width="160pt" border="1.0pt solid black"
												padding-start="5px" padding-top="3px" padding-bottom="3px">
												<fo:block font-size="8px" font-family="Arial">
													<xsl:value-of select="date_acquired" />
												</fo:block>
											</fo:table-cell>
											<fo:table-cell width="160pt" border="1.0pt solid black"
												padding-start="5px" padding-top="3px" padding-bottom="3px">
												<fo:block font-size="8px" font-family="Arial">
													<xsl:value-of select="volume" />
												</fo:block>
											</fo:table-cell>
										</fo:table-row>
									</xsl:for-each>
								</fo:table-body>
							</fo:table>
						</fo:table-cell>
						<fo:table-cell number-columns-spanned="3">
							<fo:block></fo:block>
						</fo:table-cell>
					</fo:table-row>
				</fo:table-body>
			</fo:table>
		</fo:block>
		</xsl:if>
		
		<xsl:if test="response/registration_type_code='PRAG' or response/registration_type_code='SCAG'">
		
		<fo:block margin-top="5mm">
			<fo:table border="0.0pt solid black">
				<fo:table-column border="0.0pt solid black"
					column-width="480pt" />
				<fo:table-body>
					<fo:table-row height="5mm">
						<fo:table-cell width="520pt">
							<fo:block font-size="8px" font-family="Arial"
								font-weight="bold">Brief profile of the agency, trade area, and any
								additional comments or remarks :</fo:block>
						</fo:table-cell>
					</fo:table-row>
					<fo:table-row height="15mm" border="1.0pt solid black">
						<fo:table-cell width="520pt">
							<fo:block font-size="8px" font-family="Arial"
								margin-left="2mm" margin-top="1mm">
								<xsl:value-of select="response/agency_brief_profile" />
								<!--<xsl:call-template name="intersperse-with-zero-spaces"> <xsl:with-param 
									name="str" select="response/comments"/></xsl:call-template> -->
							</fo:block>
						</fo:table-cell>
					</fo:table-row>
				</fo:table-body>
			</fo:table>
		</fo:block>
</xsl:if>

<xsl:if test="response/registration_type_code='PRAG' or response/registration_type_code='SCAG'">

		<fo:block break-after="page"></fo:block>
		</xsl:if>
		<fo:block margin-top="5mm">
			<fo:table border="0.0pt solid black">
				<fo:table-column border="0.0pt solid black"
					column-width="130pt" />
				<fo:table-column border="0.0pt solid black"
					column-width="150pt" />
				<fo:table-column border="0.0pt solid black"
					column-width="80pt" />
				<fo:table-column border="0.0pt solid black" />
				<fo:table-body>
					<fo:table-row height="5mm">
						<fo:table-cell number-columns-spanned="4" width="200pt">
							<fo:block font-size="8px" font-family="Arial"
								font-weight="bold">Documents</fo:block>
						</fo:table-cell>
					</fo:table-row>
					<fo:table-row border="0.0pt solid black" height="5mm">
						<fo:table-cell border="0.0pt solid black">
							<fo:table border="1.0pt solid black">
								<fo:table-column column-width="20%"/>
								<fo:table-column column-width="20%"/>
								<fo:table-column column-width="40%"/>
								<fo:table-body>
									<fo:table-row border="1.0pt solid black">
										<fo:table-cell width="180pt" border="1.0pt solid black"
											padding-start="5px" padding-top="3px" padding-bottom="3px">
											<fo:block font-size="8px" font-family="Arial"
												font-weight="bold">Document Name</fo:block>
										</fo:table-cell>
										<fo:table-cell width="160pt" border="1.0pt solid black"
											padding-start="5px" padding-top="3px" padding-bottom="3px">
											<fo:block font-size="8px" font-family="Arial"
												font-weight="bold">Document Type</fo:block>
										</fo:table-cell>
										<fo:table-cell width="180pt" border="1.0pt solid black"
											padding-start="5px" padding-top="3px" padding-bottom="3px">
											<fo:block font-size="8px" font-family="Arial"
												font-weight="bold">File Name</fo:block>
										</fo:table-cell>
									</fo:table-row>
									<xsl:for-each
										select="response/agencyListPublicSubmitNInvitationEdit_list_4/data">
										<fo:table-row border="1.0pt solid black">
											<fo:table-cell width="160pt" border="1.0pt solid black"
												padding-start="5px" padding-top="3px" padding-bottom="3px">
												<fo:block font-size="8px" font-family="Arial">
													<xsl:call-template name="intersperse-with-zero-spaces">
														<xsl:with-param name="str" select="document_name" />
													</xsl:call-template>
												</fo:block>
											</fo:table-cell>
											<fo:table-cell width="160pt" border="1.0pt solid black"
												padding-start="5px" padding-top="3px" padding-bottom="3px">
												<fo:block font-size="8px" font-family="Arial">
													<xsl:value-of select="document_type" />
												</fo:block>
											</fo:table-cell>
											<fo:table-cell width="160pt" border="1.0pt solid black"
												padding-start="5px" padding-top="3px" padding-bottom="3px">
												<fo:block font-size="8px" font-family="Arial" wrap-option="wrap">
													<xsl:call-template name="intersperse-with-zero-spaces">
														<xsl:with-param name="str" select="file_name" />
													</xsl:call-template>
												</fo:block>
											</fo:table-cell>
										</fo:table-row>
									</xsl:for-each>
								</fo:table-body>
							</fo:table>
						</fo:table-cell>
						<fo:table-cell number-columns-spanned="3">
							<fo:block></fo:block>
						</fo:table-cell>
					</fo:table-row>
				</fo:table-body>
			</fo:table>
		</fo:block>

		<xsl:if test="response/signature_acceptance_security='Y'">
			<fo:block margin-top="19mm">
				<fo:table border="0.0pt solid black">
					<fo:table-column />
					<fo:table-column />
					<fo:table-column />
					<fo:table-body>
						<fo:table-row>
							<fo:table-cell>
								<fo:block >
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						<fo:table-row>
							<fo:table-cell width="520pt" number-columns-spanned="3"
								padding-top="6px" padding-bottom="3px">
								<fo:block font-size="10px" >
								Please review and sign below:
								</fo:block>
								<fo:block font-size="10px" padding-top="3mm">
									I certify that the information contained in the Producer
									Application along with the requested attachments is true to the
									best of my knowledge.
									I understand that my appointment with
									Builders Mutual Insurance Company
									Insurance Group is based upon the accuracy of this information
									and the results of a background report.
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
					</fo:table-body>
				</fo:table>
			</fo:block>
			<fo:block margin-top="7mm">
				<fo:table border="0.0pt solid black">
					<fo:table-column />
					<fo:table-column />
					<fo:table-column />
					<fo:table-column />
					<fo:table-body>
						<fo:table-row>
							<fo:table-cell width="80pt">
								<fo:block font-size="10px">Name:</fo:block>
							</fo:table-cell>
							<fo:table-cell width="180pt">
								<fo:block font-size="10px">
									<fo:block>
										<xsl:value-of select="response/printname" />
									</fo:block>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell number-columns-spanned="2">
								<fo:block font-size="10px">
									Title:&#160;&#160;&#160;
									<xsl:value-of select="response/title" />
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						<fo:table-row>
							<fo:table-cell number-columns-spanned="4">
								<fo:block font-size="10px" margin-top="2mm">
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						<fo:table-row>
							<fo:table-cell>
								<fo:block font-size="10px"> Signature:</fo:block>
							</fo:table-cell>
							<fo:table-cell>
								<fo:block>
									<fo:inline text-decoration="underline" font-weight="bold"
										font-size="10px">
										<fo:inline color="white">
											<fo:block>
												<xsl:value-of select="response/AGENT_SIGNER_IDENTIFIER" />
											</fo:block>
										</fo:inline>
									</fo:inline>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell number-columns-spanned="2">
								<fo:block font-size="10px"> Date:
									 <xsl:value-of select="response/date" />
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
					</fo:table-body>
				</fo:table>
			</fo:block>
		</xsl:if>	
	</xsl:template>
	<xsl:template match="*" name="intersperse-with-zero-spaces">
		<xsl:param name="str" />
		<xsl:variable name="spacechars"></xsl:variable>
		<xsl:if test="string-length($str) > 0">
			<xsl:variable name="c1" select="substring($str, 1, 1)" />
			<xsl:variable name="c2" select="substring($str, 2, 1)" />

			<xsl:value-of select="$c1" />
			<xsl:if
				test="$c2 != '' and
 not(contains($spacechars, $c1) or
 contains($spacechars, $c2))">
				<xsl:text></xsl:text>
			</xsl:if>

			<xsl:call-template name="intersperse-with-zero-spaces">
				<xsl:with-param name="str" select="substring($str, 2)" />
			</xsl:call-template>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>	

