<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.1"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format"
	exclude-result-prefixes="fo" xmlns:fn="http://www.w3.org/2005/02/xpath-functions"
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
						<fo:external-graphic src="images/bmicLogo2.jpg"
							content-height="80px" content-width="380px" />
					</fo:block>
				</fo:static-content>


				<fo:static-content flow-name="xsl-region-after">
					<fo:block margin-top="-0.5in" text-align="center"
						font-size="10px" font-family="Arial, 'Helvetica Neue', Helvetica, sans-serif;"
						color="red">

						PO BOX 150005 Raleigh, NC 27624-0005
						<fo:inline font-size="11px" font-weight="bold"
							padding-left="10.8mm">
							customer contact center
						</fo:inline>
						800-809-4859
						<fo:inline font-size="11px" font-weight="bold"
							padding-left="10.8mm">
							buildersmutual.com
						</fo:inline>
					</fo:block>

				</fo:static-content>

				<fo:flow flow-name="xsl-region-body">
					<fo:block margin-top="0.5in">
						<fo:table>
							<fo:table-column />
							<fo:table-body>
								<fo:table-row>
									<fo:table-cell>
										<fo:block font-size="10px"
											font-family="Arial, 'Helvetica Neue', Helvetica, sans-serif;">
											<fo:inline padding-left="15mm">
												<xsl:value-of select="response/curr_date1" />
											</fo:inline>
										</fo:block>
									</fo:table-cell>
								</fo:table-row>


								<!--<fo:table-row> <fo:table-cell> <fo:block font-size="10px"><xsl:value-of 
									select="response/Agent_Name"/></fo:block> </fo:table-cell> </fo:table-row> -->
								<fo:table-row>
									<fo:table-cell>
										<fo:block margin-top="5mm" font-size="10px"
											font-family="Arial, 'Helvetica Neue', Helvetica, sans-serif;">
											<fo:inline padding-left="15mm">
												<xsl:value-of
													select="concat(normalize-space(response/Entity_Name), ',',' ', '#', normalize-space(response/agency_code))" />
											</fo:inline>
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
								<fo:table-row>
									<fo:table-cell>
										<fo:block font-size="10px"
											font-family="Arial, 'Helvetica Neue', Helvetica, sans-serif;">
											<fo:inline padding-left="15mm">
												Attn:
												<xsl:value-of select="response/hrp_fullname" />
											</fo:inline>
										</fo:block>
									</fo:table-cell>
								</fo:table-row>

								<fo:table-row>
									<fo:table-cell>
										<fo:block font-size="11px"
											font-family="Arial, 'Helvetica Neue', Helvetica, sans-serif;">
											<fo:inline padding-left="15mm">
												<xsl:if test="response/Agent_Address2 !='null' ">
													<xsl:value-of
														select="concat(normalize-space(response/Agent_Address1), ',',' ',normalize-space(response/Agent_Address2))" />
												</xsl:if>
												<xsl:if test="response/Agent_Address2 ='null' ">
													<xsl:value-of select="response/Agent_Address1" />
												</xsl:if>
											</fo:inline>
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
								<!-- <fo:table-row> <fo:table-cell> <fo:block font-size="10px" font-family="Arial, 
									'Helvetica Neue', Helvetica, sans-serif;"> <fo:inline padding-left="15mm"><xsl:value-of 
									select="response/Agent_Address1"/> </fo:inline> </fo:block> </fo:table-cell> 
									</fo:table-row> -->
								<!-- <fo:table-row> <fo:table-cell> <fo:block font-size="10px" font-family="Arial, 
									'Helvetica Neue', Helvetica, sans-serif;"> <fo:inline padding-left="15mm"><xsl:value-of 
									select="response/Agent_Address2"/> </fo:inline> </fo:block> </fo:table-cell> 
									</fo:table-row> -->
								<fo:table-row>
									<fo:table-cell>
										<fo:block font-size="10px"
											font-family="Arial, 'Helvetica Neue', Helvetica, sans-serif;">
											<fo:inline padding-left="15mm">
												<xsl:value-of
													select="concat(normalize-space(response/Agent_City), ',', ' ', normalize-space(response/state_code), ' ', normalize-space(response/Agent_Zip))" />
											</fo:inline>
										</fo:block>
									</fo:table-cell>
								</fo:table-row>

							</fo:table-body>

						</fo:table>

					</fo:block>

					<fo:block margin-top="25px">
						<fo:table>
							<fo:table-column />
							<fo:table-body>
								<fo:table-row>
									<fo:table-cell>
										<fo:block font-size="10px"
											font-family="Arial, 'Helvetica Neue', Helvetica, sans-serif;">
											<fo:inline padding-left="15mm">
												Agency Appointment Date:
												<xsl:value-of select="response/curr_date" />
											</fo:inline>
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
							</fo:table-body>
						</fo:table>
					</fo:block>

					<fo:block>
						<fo:table>
							<fo:table-column />
							<fo:table-body>
								<fo:table-row>
									<fo:table-cell>
										<fo:block font-size="10px"
											font-family="Arial, 'Helvetica Neue', Helvetica, sans-serif;">
											<fo:inline padding-left="15mm">
												License#:
												<xsl:value-of select="response/license_num" />
											</fo:inline>
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
							</fo:table-body>
						</fo:table>
					</fo:block>

					<fo:block margin-top="10px">
						<fo:table>
							<fo:table-column />
							<fo:table-body>
								<fo:table-row>
									<fo:table-cell>
										<fo:block font-size="10px"
											font-family="Arial, 'Helvetica Neue', Helvetica, sans-serif;">
											<fo:inline padding-left="15mm">
												Dear
												<fo:inline>
													<xsl:value-of select="response/hrp_fname" />
												</fo:inline>
											</fo:inline>
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
							</fo:table-body>
						</fo:table>
					</fo:block>

					<fo:block margin-top="15px">
						<fo:table>
							<fo:table-column />
							<fo:table-body>
								<fo:table-row>
									<fo:table-cell padding-left="15mm">
										<fo:block font-size="10px"
											font-family="Arial, 'Helvetica Neue', Helvetica, sans-serif;">
											Welcome to Builders Mutual. We provide insurance coverage
											exclusively to the construction industry. It’s not just our
											specialty – it’s all that we do. Headquartered in North
											Carolina, our market now includes the Mid-Atlantic and
											Southeast. We have a history with the North Carolina Home
											Builders Association, and maintain strong partnerships with
											various industry associations. A.M. Best consistently awards
											Builders Mutual with an “A” (Excellent) rating, so you can be
											assured that you are partnering with the best.
										</fo:block>
									</fo:table-cell>
								</fo:table-row>

							</fo:table-body>
						</fo:table>
					</fo:block>

					<fo:block margin-top="13px">
						<fo:table>
							<fo:table-column />
							<fo:table-body>
								<fo:table-row>
									<fo:table-cell padding-left="15mm">
										<fo:block font-size="10px"
											font-family="Arial, 'Helvetica Neue', Helvetica, sans-serif;">
											We have enclosed your Agency Agreement for appointment of
											<xsl:value-of
												select="concat(normalize-space(response/Entity_Name), '.')" />

											Your agency number is
											<fo:inline font-weight="bold">
												<xsl:value-of select="response/agency_code" />
											</fo:inline>
											and should be included on any correspondence to the company.


										</fo:block>
									</fo:table-cell>
								</fo:table-row>

							</fo:table-body>
						</fo:table>
					</fo:block>

					<fo:block margin-top="13px">
						<fo:table>
							<fo:table-column />
							<fo:table-body>
								<fo:table-row>
									<fo:table-cell padding-left="15mm">
										<fo:block font-size="10px"
											font-family="Arial, 'Helvetica Neue', Helvetica, sans-serif;">
											Now that you are appointed with Builders Mutual, please
											encourage the licensed producers in your agency to visit
											buildersmutual.com and register for access to the agent
											section. Once you’ve gained access to
											<fo:inline font-weight="bold">Builders Online Business,
											</fo:inline>
											you can rate, quote, and issue policies online as well as
											process electronic payments for all lines of business and
											view policy documents. You can also service your accounts
											easily by accessing policy, billing and claims information. A
											variety of reports are available including an Agency Snapshot
											to review your Builders Mutual portfolio and a Claims
											Snapshot to review your agency’s claims history.

										</fo:block>
									</fo:table-cell>
								</fo:table-row>

							</fo:table-body>
						</fo:table>
					</fo:block>

					<fo:block margin-top="13px">
						<fo:table>
							<fo:table-column />
							<fo:table-body>
								<fo:table-row>
									<fo:table-cell padding-left="15mm">
										<fo:block font-size="10px"
											font-family="Arial, 'Helvetica Neue', Helvetica, sans-serif;">
											I look forward to the partnership that we will build
											together. Your Territory Manager,
											<fo:inline>
												<xsl:value-of
													select="concat(normalize-space(response/t_manager), ',')" />
											</fo:inline>

											is the primary point of contact for all of your agency needs.
											If you have any questions or need any assistance in the
											future, please feel free to contact me at 919-227-0363 or
											bmoock@bmico.com.

										</fo:block>
									</fo:table-cell>
								</fo:table-row>

							</fo:table-body>
						</fo:table>
					</fo:block>


					<!-- <fo:block > <fo:table> <fo:table-column/> <fo:table-body > <fo:table-row> 
						<fo:table-cell margin-top="10mm" padding-left="15mm"> <fo:block font-size="10px">or 
						e-mail at <fo:inline font-weight="bold"><xsl:value-of select="response/adminSupportMail"/></fo:inline>.</fo:block> 
						<fo:block font-size="10px" font-family="Arial, 'Helvetica Neue', Helvetica, 
						sans-serif;">Nothing in this email shall commit BMIC to any purchase, sale, 
						contract or other course of action.</fo:block> </fo:table-cell> </fo:table-row> 
						</fo:table-body> </fo:table> </fo:block> -->

					<!-- <fo:block margin-top="15px" > <fo:table> <fo:table-column/> <fo:table-body 
						> <fo:table-row> <fo:table-cell margin-top="10mm" padding-left="15mm"> <fo:block 
						font-size="10px">or e-mail at <fo:inline font-weight="bold"><xsl:value-of 
						select="response/adminSupportMail"/></fo:inline>.</fo:block> <fo:block font-size="10px" 
						font-style="italic">This document shall be retained while your appointment 
						is in effect and for at least 5 years after the termination of your appointment.</fo:block> 
						</fo:table-cell> </fo:table-row> </fo:table-body> </fo:table> </fo:block> -->
					<fo:block>
						<fo:table>
							<fo:table-column />
							<fo:table-body>
								<fo:table-row>
									<fo:table-cell padding-left="15mm">
										<!-- <fo:block font-size="10px">or e-mail at <fo:inline font-weight="bold"><xsl:value-of 
											select="response/adminSupportMail"/></fo:inline>.</fo:block> -->
										<fo:block margin-top="8mm" font-size="10px"
											font-family="Arial, 'Helvetica Neue', Helvetica, sans-serif;">Sincerely, </fo:block>

										<fo:block>
											<fo:external-graphic src="images/AVP_Sign.png"
												content-height="150px" content-width="150px" />
										</fo:block>
										<fo:block margin-top="5mm" font-size="10px"
											font-family="Arial, 'Helvetica Neue', Helvetica, sans-serif;">Brad Moock </fo:block>

										<fo:block font-size="10px"
											font-family="Arial, 'Helvetica Neue', Helvetica, sans-serif;">VP of Business Development, CPCU, CLU, CBIA
										</fo:block>

										<fo:block margin-top="13mm" font-size="10px"
											font-family="Arial, 'Helvetica Neue', Helvetica, sans-serif;">Enclosure</fo:block>

									</fo:table-cell>
								</fo:table-row>
							</fo:table-body>
						</fo:table>
					</fo:block>


					<!-- <fo:block > <fo:table> <fo:table-column/> <fo:table-body > <fo:table-row> 
						<fo:table-cell margin-top="10mm" padding-left="15mm"> <fo:block font-size="10px">or 
						e-mail at <fo:inline font-weight="bold"><xsl:value-of select="response/adminSupportMail"/></fo:inline>.</fo:block> 
						<fo:block font-size="10px" font-family="Arial, 'Helvetica Neue', Helvetica, 
						sans-serif;">Nothing in this email shall commit BMIC to any purchase, sale, 
						contract or other course of action.</fo:block> </fo:table-cell> </fo:table-row> 
						</fo:table-body> </fo:table> </fo:block> -->

					<!--<fo:block margin-top="35px"> <fo:table> <fo:table-column/> <fo:table-body> 
						<fo:table-row> <fo:table-cell> <fo:block font-size="10px">Sincerely,</fo:block> 
						</fo:table-cell> </fo:table-row> </fo:table-body> </fo:table> </fo:block> 
						<fo:block margin-top="20px"> <fo:table> <fo:table-column/> <fo:table-body> 
						<fo:table-row> <fo:table-cell> <fo:block font-size="10px"><xsl:value-of select="response/user_name"/></fo:block> 
						</fo:table-cell> </fo:table-row> </fo:table-body> </fo:table> </fo:block> --><!--<fo:block margin-top="15px"> <fo:table> <fo:table-column></fo:table-column> 
						<fo:table-column></fo:table-column> <fo:table-body> <fo:table-row> <fo:table-cell 
						width="15px"><fo:block font-size="10px" font-family="Arial, 'Helvetica Neue', 
						Helvetica, sans-serif;">cc : </fo:block></fo:table-cell> <fo:table-cell> 
						<fo:block> <fo:table> <fo:table-column/> <fo:table-body> <fo:table-row> <fo:table-cell> 
						<fo:block font-size="10px"><xsl:value-of select="response/agentname"/></fo:block> 
						</fo:table-cell> </fo:table-row> <fo:table-row> <fo:table-cell> <fo:block 
						font-size="10px"><xsl:value-of select="response/agencyname"/></fo:block> 
						</fo:table-cell> </fo:table-row> <fo:table-row> <fo:table-cell> <fo:block 
						font-size="10px"><xsl:value-of select="response/addressMap/data/addressline1"/></fo:block> 
						</fo:table-cell> </fo:table-row> <fo:table-row> <fo:table-cell> <fo:block 
						font-size="10px"><xsl:value-of select="response/addressMap/data/addressline2"/></fo:block> 
						</fo:table-cell> </fo:table-row> <fo:table-row> <fo:table-cell> <fo:block 
						font-size="10px"><xsl:value-of select="response/addressMap/data/city"/>&#160;</fo:block> 
						</fo:table-cell> </fo:table-row> <fo:table-row> <fo:table-cell> <fo:block 
						font-size="10px"><xsl:value-of select="response/addressMap/data/description"></xsl:value-of>&#160;<xsl:value-of 
						select="response/addressMap/data/zip"/></fo:block> </fo:table-cell> </fo:table-row> 
						</fo:table-body> </fo:table> </fo:block> </fo:table-cell> </fo:table-row> 
						</fo:table-body> </fo:table> </fo:block> -->
				</fo:flow>


			</fo:page-sequence>
		</fo:root>
	</xsl:template>

</xsl:stylesheet>	