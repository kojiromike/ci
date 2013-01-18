<?xml version="1.0" ?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:m="http://www.w3.org/2005/07/css-validator">
	<xsl:output method="xml" version="1.0" encoding="utf-8" omit-xml-declaration="yes" indent="no"/>
	<xsl:template match="/">
		<xsl:apply-templates select="//m:errorlist"/>
	</xsl:template>
	<xsl:template match="m:errorlist">
		<lint>
			<file name="{m:uri}">
				<xsl:apply-templates select="./m:error"/>
			</file>
		</lint>
	</xsl:template>
	<xsl:template match="m:error">
		<issue line="{m:line}" char="1" severity="error">
			<xsl:attribute name="evidence">
				<xsl:value-of select="normalize-space(m:errorsubtype)"/>
			</xsl:attribute>
			<xsl:attribute name="reason">
				<xsl:value-of select="normalize-space(m:errortype)"/>
				<xsl:value-of select="normalize-space(m:message)"/>
			</xsl:attribute>
		</issue>
	</xsl:template>
</xsl:stylesheet>
