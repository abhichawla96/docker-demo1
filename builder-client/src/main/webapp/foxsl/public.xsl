<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.1"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format"
	exclude-result-prefixes="fo" xmlns:fn="http://www.w3.org/2005/02/xpath-functions"
	xmlns:java="java">
	<xsl:include href="applicationFormPath" />
	<xsl:include href="backgroundCheckFormPath" />
	<xsl:include href="backgroundCheckFormMultiplePath" />
	<xsl:include href="agencySweepFormPath" />
	<xsl:template match="/">
		<fo:root>
			<fo:layout-master-set>
				<fo:simple-page-master master-name="Letter-Portrait"
					page-width="8.5in" page-height="11in" margin-top="0.1in"
					margin-bottom="0.8in" margin-left="0.8in" margin-right="0.8in">
					<fo:region-body margin-top="0.8in" />
					<fo:region-before extent="1.0in" />
					<fo:region-after />
				</fo:simple-page-master>
			</fo:layout-master-set>
			<fo:page-sequence master-reference="Letter-Portrait">
				<fo:static-content flow-name="xsl-region-before">
					<fo:block text-align="left" color="grey">
						<fo:external-graphic src="images/p1Logo.png"
							content-height="50px" content-width="360px" />
					</fo:block>
				</fo:static-content>
				<fo:static-content text-align="center"  flow-name="xsl-region-after" font-size="9pt" font-family="Helvetica">
                      <fo:block text-align="center" white-space-collapse="false" font-size="9pt" font-weight="bold"
						color="black">
						<fo:page-number />
					</fo:block>
               </fo:static-content>
				<fo:flow flow-name="xsl-region-body">
					<fo:block margin-top="5mm">
						<xsl:if test="response/applicationFormFlag  ='Y'">
							<xsl:call-template name="applicationForm"></xsl:call-template>
						</xsl:if>
						<xsl:if test="response/applicationFormFlag ='Y'">
							<xsl:if test="response/backgroundCheckFormFlag ='Y'">
								<fo:block break-after="page" />
							</xsl:if>
						</xsl:if>
						<xsl:if test="response/applicationFormFlag ='Y'">
							<xsl:if test="response/backgroundCheckFormMultipleFlag ='Y'">
								<fo:block break-after="page" />
							</xsl:if>
						</xsl:if>
						<xsl:if test="response/applicationFormFlag ='Y'">
							<xsl:if test="response/agencySweepFormFlag ='Y'">
								<fo:block break-after="page" />
							</xsl:if>
						</xsl:if>
						<xsl:if test="response/backgroundCheckFormFlag ='Y'">
							<xsl:call-template name="backgroundCheckForm"></xsl:call-template>
						</xsl:if>
						<xsl:if test="response/backgroundCheckFormMultipleFlag ='Y'">
							<xsl:call-template name="backgroundCheckFormMultiple"></xsl:call-template>
						</xsl:if>
						<xsl:if test="response/agencySweepFormFlag  ='Y'">
							<xsl:call-template name="agencySweepForm"></xsl:call-template>
						</xsl:if>
						<!-- <fo:block font-family="Arial" font-size="10px" text-align="center" 
							margin-top="10mm"> ProducerOne. All Rights Reserved. </fo:block> -->
					</fo:block>


				</fo:flow>
			</fo:page-sequence>
		</fo:root>
	</xsl:template>
</xsl:stylesheet>	