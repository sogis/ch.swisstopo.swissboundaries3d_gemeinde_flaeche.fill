<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0" xmlns:gmd="http://www.isotc211.org/2005/gmd" xmlns:gco="http://www.isotc211.org/2005/gco" xmlns:gmx="http://www.isotc211.org/2005/gmx" xmlns:srv="http://www.isotc211.org/2005/srv" xmlns:gml="http://www.opengis.net/gml" xmlns:gts="http://www.isotc211.org/2005/gts" xmlns:che="http://www.geocat.ch/2008/che" xmlns:geonet="http://www.fao.org/geonetwork" xmlns:exslt="http://exslt.org/common" xmlns:xlink="http://www.w3.org/1999/xlink">
<xsl:output omit-xml-declaration="yes"/>
<xsl:strip-space elements="*"/>
<xsl:template match="/che:CHE_MD_Metadata">
schema_version:
name:
model: 'http://models.geo.admin.ch/Swisstopo/swissBOUNDARIES3D_ili2_LV95_V1_3.ili'
title: '<xsl:value-of select="gmd:identificationInfo/che:CHE_MD_DataIdentification/gmd:citation/gmd:CI_Citation/gmd:title/gmd:PT_FreeText/gmd:textGroup/gmd:LocalisedCharacterString[@locale='#DE']"/>'
description: '<xsl:value-of select="gmd:identificationInfo/che:CHE_MD_DataIdentification/gmd:abstract/gmd:PT_FreeText/gmd:textGroup/gmd:LocalisedCharacterString[@locale='#DE']"/>'
short_description_usage: 
methodology: 
purpose: 
geo_base_data:
  - '<xsl:value-of select='format-number(number(gmd:identificationInfo/che:CHE_MD_DataIdentification/gmd:citation/gmd:CI_Citation/gmd:identifier/gmd:MD_Identifier/gmd:code/gco:CharacterString), "#")'/>'
geo_categories:
<xsl:for-each select="gmd:identificationInfo/che:CHE_MD_DataIdentification/gmd:topicCategory">
  - '<xsl:value-of select = "gmd:MD_TopicCategoryCode"/>'
</xsl:for-each>
# set in xslt stylesheet
horizontal_srs: 'EPSG:2056'
# set in xslt stylesheet
vertical_srs:
maintenance_frequence_code: '<xsl:value-of select="gmd:identificationInfo/che:CHE_MD_DataIdentification/gmd:resourceMaintenance/che:CHE_MD_MaintenanceInformation/gmd:maintenanceAndUpdateFrequency/gmd:MD_MaintenanceFrequencyCode/@codeListValue"/>'
# set in xslt stylesheet
progress_code: 'onGoing'
# this info comes from integration_external.yml
archive:
# no legal bases are defined on gecat for this dataset, here we fill up with info from integration_external.yml
legal_bases: []
<xsl:for-each select="/che:CHE_MD_Metadata/gmd:contact">
<xsl:if test="che:CHE_CI_ResponsibleParty/gmd:role/gmd:CI_RoleCode/@codeListValue = 'pointOfContact'">
owner:
  name: '<xsl:value-of select="che:CHE_CI_ResponsibleParty/gmd:organisationName/gmd:PT_FreeText/gmd:textGroup/gmd:LocalisedCharacterString[@locale='#DE']"/>'
  abbreviation: '<xsl:value-of select="che:CHE_CI_ResponsibleParty/che:organisationAcronym/gmd:PT_FreeText/gmd:textGroup/gmd:LocalisedCharacterString[@locale='#DE']"/>'
  street: "<xsl:value-of select="che:CHE_CI_ResponsibleParty/gmd:contactInfo/gmd:CI_Contact/gmd:address/che:CHE_CI_Address/che:streetName/gco:CharacterString"/>"
  number: '<xsl:value-of select="che:CHE_CI_ResponsibleParty/gmd:contactInfo/gmd:CI_Contact/gmd:address/che:CHE_CI_Address/che:streetNumber/gco:CharacterString"/>'
  zip-code: '<xsl:value-of select="che:CHE_CI_ResponsibleParty/gmd:contactInfo/gmd:CI_Contact/gmd:address/che:CHE_CI_Address/gmd:postalCode/gco:CharacterString"/>'
  city: '<xsl:value-of select="che:CHE_CI_ResponsibleParty/gmd:contactInfo/gmd:CI_Contact/gmd:address/che:CHE_CI_Address/gmd:city/gco:CharacterString"/>'
  # set in xslt stylesheet
  country: 'Schweiz'
  address:
  first_name:
  last_name:
  phone: '<xsl:value-of select="che:CHE_CI_ResponsibleParty/gmd:contactInfo/gmd:CI_Contact/gmd:phone/che:CHE_CI_Telephone/gmd:voice/gco:CharacterString"/>'
  email: '<xsl:value-of select="che:CHE_CI_ResponsibleParty/gmd:contactInfo/gmd:CI_Contact/gmd:address/che:CHE_CI_Address/gmd:electronicMailAddress/gco:CharacterString"/>'
  url: '<xsl:value-of select="che:CHE_CI_ResponsibleParty/gmd:contactInfo/gmd:CI_Contact/gmd:onlineResource/gmd:CI_OnlineResource/gmd:linkage/che:PT_FreeURL/che:URLGroup/che:LocalisedURL[@locale='#DE']"/>'
  hours_of_service: '<xsl:value-of select="che:CHE_CI_ResponsibleParty/gmd:contactInfo/gmd:CI_Contact/gmd:hoursOfService/gco:CharacterString"/>'
contact:
  name: '<xsl:value-of select="che:CHE_CI_ResponsibleParty/gmd:organisationName/gmd:PT_FreeText/gmd:textGroup/gmd:LocalisedCharacterString[@locale='#DE']"/>'
  abbreviation: '<xsl:value-of select="che:CHE_CI_ResponsibleParty/che:organisationAcronym/gmd:PT_FreeText/gmd:textGroup/gmd:LocalisedCharacterString[@locale='#DE']"/>'
  street: "<xsl:value-of select="che:CHE_CI_ResponsibleParty/gmd:contactInfo/gmd:CI_Contact/gmd:address/che:CHE_CI_Address/che:streetName/gco:CharacterString"/>"
  number: '<xsl:value-of select="che:CHE_CI_ResponsibleParty/gmd:contactInfo/gmd:CI_Contact/gmd:address/che:CHE_CI_Address/che:streetNumber/gco:CharacterString"/>'
  zip-code: '<xsl:value-of select="che:CHE_CI_ResponsibleParty/gmd:contactInfo/gmd:CI_Contact/gmd:address/che:CHE_CI_Address/gmd:postalCode/gco:CharacterString"/>'
  city: '<xsl:value-of select="che:CHE_CI_ResponsibleParty/gmd:contactInfo/gmd:CI_Contact/gmd:address/che:CHE_CI_Address/gmd:city/gco:CharacterString"/>'
  # set in xslt stylesheet
  country: 'Schweiz'
  address:
  first_name:
  last_name:
  phone: '<xsl:value-of select="che:CHE_CI_ResponsibleParty/gmd:contactInfo/gmd:CI_Contact/gmd:phone/che:CHE_CI_Telephone/gmd:voice/gco:CharacterString"/>'
  email: '<xsl:value-of select="che:CHE_CI_ResponsibleParty/gmd:contactInfo/gmd:CI_Contact/gmd:address/che:CHE_CI_Address/gmd:electronicMailAddress/gco:CharacterString"/>'
  url: '<xsl:value-of select="che:CHE_CI_ResponsibleParty/gmd:contactInfo/gmd:CI_Contact/gmd:onlineResource/gmd:CI_OnlineResource/gmd:linkage/che:PT_FreeURL/che:URLGroup/che:LocalisedURL[@locale='#DE']"/>'
  hours_of_service: '<xsl:value-of select="che:CHE_CI_ResponsibleParty/gmd:contactInfo/gmd:CI_Contact/gmd:hoursOfService/gco:CharacterString"/>'
responsible:
  name: '<xsl:value-of select="che:CHE_CI_ResponsibleParty/gmd:organisationName/gmd:PT_FreeText/gmd:textGroup/gmd:LocalisedCharacterString[@locale='#DE']"/>'
  abbreviation: '<xsl:value-of select="che:CHE_CI_ResponsibleParty/che:organisationAcronym/gmd:PT_FreeText/gmd:textGroup/gmd:LocalisedCharacterString[@locale='#DE']"/>'
  street: "<xsl:value-of select="che:CHE_CI_ResponsibleParty/gmd:contactInfo/gmd:CI_Contact/gmd:address/che:CHE_CI_Address/che:streetName/gco:CharacterString"/>"
  number: '<xsl:value-of select="che:CHE_CI_ResponsibleParty/gmd:contactInfo/gmd:CI_Contact/gmd:address/che:CHE_CI_Address/che:streetNumber/gco:CharacterString"/>'
  zip-code: '<xsl:value-of select="che:CHE_CI_ResponsibleParty/gmd:contactInfo/gmd:CI_Contact/gmd:address/che:CHE_CI_Address/gmd:postalCode/gco:CharacterString"/>'
  city: '<xsl:value-of select="che:CHE_CI_ResponsibleParty/gmd:contactInfo/gmd:CI_Contact/gmd:address/che:CHE_CI_Address/gmd:city/gco:CharacterString"/>'
  # set in xslt stylesheet
  country: 'Schweiz'
  address:
  first_name:
  last_name:
  phone: '<xsl:value-of select="che:CHE_CI_ResponsibleParty/gmd:contactInfo/gmd:CI_Contact/gmd:phone/che:CHE_CI_Telephone/gmd:voice/gco:CharacterString"/>'
  email: '<xsl:value-of select="che:CHE_CI_ResponsibleParty/gmd:contactInfo/gmd:CI_Contact/gmd:address/che:CHE_CI_Address/gmd:electronicMailAddress/gco:CharacterString"/>'
  url: '<xsl:value-of select="che:CHE_CI_ResponsibleParty/gmd:contactInfo/gmd:CI_Contact/gmd:onlineResource/gmd:CI_OnlineResource/gmd:linkage/che:PT_FreeURL/che:URLGroup/che:LocalisedURL[@locale='#DE']"/>'
  hours_of_service: '<xsl:value-of select="che:CHE_CI_ResponsibleParty/gmd:contactInfo/gmd:CI_Contact/gmd:hoursOfService/gco:CharacterString"/>'
producer:
  name: '<xsl:value-of select="che:CHE_CI_ResponsibleParty/gmd:organisationName/gmd:PT_FreeText/gmd:textGroup/gmd:LocalisedCharacterString[@locale='#DE']"/>'
  abbreviation: '<xsl:value-of select="che:CHE_CI_ResponsibleParty/che:organisationAcronym/gmd:PT_FreeText/gmd:textGroup/gmd:LocalisedCharacterString[@locale='#DE']"/>'
  street: "<xsl:value-of select="che:CHE_CI_ResponsibleParty/gmd:contactInfo/gmd:CI_Contact/gmd:address/che:CHE_CI_Address/che:streetName/gco:CharacterString"/>"
  number: '<xsl:value-of select="che:CHE_CI_ResponsibleParty/gmd:contactInfo/gmd:CI_Contact/gmd:address/che:CHE_CI_Address/che:streetNumber/gco:CharacterString"/>'
  zip-code: '<xsl:value-of select="che:CHE_CI_ResponsibleParty/gmd:contactInfo/gmd:CI_Contact/gmd:address/che:CHE_CI_Address/gmd:postalCode/gco:CharacterString"/>'
  city: '<xsl:value-of select="che:CHE_CI_ResponsibleParty/gmd:contactInfo/gmd:CI_Contact/gmd:address/che:CHE_CI_Address/gmd:city/gco:CharacterString"/>'
  # set in xslt stylesheet
  country: 'Schweiz'
  address:
  first_name:
  last_name:
  phone: '<xsl:value-of select="che:CHE_CI_ResponsibleParty/gmd:contactInfo/gmd:CI_Contact/gmd:phone/che:CHE_CI_Telephone/gmd:voice/gco:CharacterString"/>'
  email: '<xsl:value-of select="che:CHE_CI_ResponsibleParty/gmd:contactInfo/gmd:CI_Contact/gmd:address/che:CHE_CI_Address/gmd:electronicMailAddress/gco:CharacterString"/>'
  url: '<xsl:value-of select="che:CHE_CI_ResponsibleParty/gmd:contactInfo/gmd:CI_Contact/gmd:onlineResource/gmd:CI_OnlineResource/gmd:linkage/che:PT_FreeURL/che:URLGroup/che:LocalisedURL[@locale='#DE']"/>'
  hours_of_service: '<xsl:value-of select="che:CHE_CI_ResponsibleParty/gmd:contactInfo/gmd:CI_Contact/gmd:hoursOfService/gco:CharacterString"/>'
</xsl:if>
</xsl:for-each>
keywords:
<xsl:for-each select="gmd:identificationInfo/che:CHE_MD_DataIdentification/gmd:descriptiveKeywords">
<xsl:for-each select="gmd:MD_Keywords/gmd:keyword">
  - '<xsl:value-of select="gmd:PT_FreeText/gmd:textGroup/gmd:LocalisedCharacterString[@locale='#DE']"/>'
</xsl:for-each>
</xsl:for-each>
# set in xslt stylesheet
published_as:
</xsl:template>
</xsl:stylesheet>
