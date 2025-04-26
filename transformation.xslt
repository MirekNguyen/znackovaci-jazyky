<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="3.0" 
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xs="http://www.w3.org/2001/XMLSchema">
  
  <xsl:output method="text" encoding="UTF-8" indent="no"/>
  
  <!-- Main template -->
  <xsl:template match="/">
    <xsl:text>{
  "healthcareData": {
    "clinics": [</xsl:text>
    <xsl:apply-templates select="HealthcareData/Clinics/Clinic"/>
    <xsl:text>
    ]
  }
}</xsl:text>
  </xsl:template>
  
  <!-- Template for Clinic elements -->
  <xsl:template match="Clinic">
    <xsl:text>
      {
        "id": "</xsl:text><xsl:value-of select="@id"/><xsl:text>",
        "name": "</xsl:text><xsl:value-of select="Name"/><xsl:text>",
        "address": {
          "street": "</xsl:text><xsl:value-of select="Address/Street"/><xsl:text>",
          "city": "</xsl:text><xsl:value-of select="Address/City"/><xsl:text>",
          "postalCode": "</xsl:text><xsl:value-of select="Address/PostalCode"/><xsl:text>"
        },
        "contacts": {
          "phone": "</xsl:text><xsl:value-of select="Contacts/Phone"/><xsl:text>",
          "email": "</xsl:text><xsl:value-of select="Contacts/Email"/><xsl:text>"
        },
        "openingHours": [</xsl:text>
        <xsl:apply-templates select="OpeningHours/Day"/>
        <xsl:text>
        ],
        "services": {
          "currency": "</xsl:text><xsl:value-of select="Services/@currency"/><xsl:text>",
          "items": [</xsl:text>
          <xsl:apply-templates select="Services/Service"/>
          <xsl:text>
          ]
        }
      }</xsl:text>
    <xsl:if test="position() != last()">
      <xsl:text>,</xsl:text>
    </xsl:if>
  </xsl:template>
  
  <!-- Template for Day elements -->
  <xsl:template match="Day">
    <xsl:text>
          {
            "name": "</xsl:text><xsl:value-of select="@Name"/><xsl:text>",
            "open": "</xsl:text><xsl:value-of select="@Open"/><xsl:text>",
            "close": "</xsl:text><xsl:value-of select="@Close"/><xsl:text>"
          }</xsl:text>
    <xsl:if test="position() != last()">
      <xsl:text>,</xsl:text>
    </xsl:if>
  </xsl:template>
  
  <!-- Template for Service elements -->
  <xsl:template match="Service">
    <xsl:text>
            {
              "name": "</xsl:text><xsl:value-of select="."/><xsl:text>",
              "price": </xsl:text><xsl:value-of select="@Price"/><xsl:text>
            }</xsl:text>
    <xsl:if test="position() != last()">
      <xsl:text>,</xsl:text>
    </xsl:if>
  </xsl:template>
  
</xsl:stylesheet>
