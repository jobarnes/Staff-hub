<?xml version="1.0" encoding="UTF-8" ?>

<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns:date="http://exslt.org/dates-and-times"
extension-element-prefixes="date">
 
  <xsl:output media-type="text/html" indent="yes" encoding="utf-8" method="html"/>

  <xsl:template match="/">
    <ul class="event-list">
      <xsl:apply-templates select="//api-v1-entities-event-item[1]" />
      <xsl:apply-templates select="//api-v1-entities-event-item[2]" />
      <xsl:apply-templates select="//api-v1-entities-event-item[3]" />
    </ul>
  </xsl:template>

 
  <xsl:template match="api-v1-entities-event-item">
    <li class="event-list-item row event media">
<div class="date"><xsl:apply-templates select="start-time" /></div>
<div class="event-details inner">
<xsl:element name="a">
<xsl:attribute name="href"><xsl:value-of select="link"/></xsl:attribute>
<h3 class="title"><xsl:value-of select="title" /></h3>
</xsl:element>

<p class="summary"><xsl:value-of select="substring(description, 0, 200)"/>
<xsl:text disable-output-escaping="yes">...</xsl:text></p>
<p>
<xsl:element name="a">
<xsl:attribute name="class">more</xsl:attribute>
<xsl:attribute name="href"><xsl:value-of select="link"/></xsl:attribute><xsl:text>read more</xsl:text>
<xsl:attribute name="aria-labelledby"><xsl:value-of select="title"/></xsl:attribute>
<span class="accessiblity hide"><xsl:text> about </xsl:text><xsl:value-of select="title"/></span><xsl:text> </xsl:text> <i class="fa fa-caret-right"></i>
</xsl:element>
</p>
</div>
    </li>
  </xsl:template>
 
  <xsl:template match="start-time|end-time">
    <xsl:param name="date" select="date:date(.)" />
    <xsl:param name="time" select="date:time(.)" />
    <xsl:element name="time">
      <xsl:attribute name="datetime"><xsl:value-of select="." /></xsl:attribute>
      <span class="day"><xsl:value-of select="date:day-in-month($date)" /></span>
      <xsl:text> </xsl:text>
      <span class="month"><xsl:value-of select="date:month-abbreviation($date)" /></span>
      <xsl:text> </xsl:text>
      <span class="year"><xsl:value-of select="date:year($date)" /></span>
    </xsl:element>
  </xsl:template>
 
  <xsl:template name="FormatTime">
    <xsl:param name="hour">0</xsl:param>
    <xsl:param name="minute">0</xsl:param>
    <xsl:variable name="paddedMinute">
      <xsl:if test="string-length($minute) = 1">
        <xsl:text>0</xsl:text>
      </xsl:if>
      <xsl:value-of select="$minute" />
    </xsl:variable>
    <xsl:value-of select="$hour" />:<xsl:value-of select="$paddedMinute" />
  </xsl:template>
 
</xsl:stylesheet>