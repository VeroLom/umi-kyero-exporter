<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:php="http://php.net/xsl"
                extension-element-prefixes="php"
                exclude-result-prefixes="xsl php">

    <xsl:output method="xml" encoding="utf-8"/>


    <xsl:template match="umidump[@version='2.0']">
        <root>
            <kyero>
                <feed_version>3</feed_version>
            </kyero>
            <xsl:apply-templates select="pages/page" />
        </root>
    </xsl:template>

    <xsl:template match="page">
        <xsl:variable name="time" select="php:functionString('time')" />

        <property>
            <id><xsl:value-of select="@id" /></id>
            <date><xsl:value-of select="php:functionString('strftime', '%Y-%m-%d %H:%M:%S', $time)" /></date>
            <ref><xsl:value-of select="properties//property[@name = 'object_id']/value" /></ref>
            <price><xsl:value-of select="properties//property[@name = 'price']/value" /></price>
            <currency>USD</currency>
            <price_freq>sale</price_freq>
            <part_ownership>1</part_ownership>
            <leasehold>0</leasehold>
            <new_build>0</new_build>
            <type><xsl:value-of select="properties//property[@name = 'type']/value/item/@name" /></type>
            <town><xsl:value-of select="properties//property[@name = 'town']/value/item/@name" /></town>
            <province><xsl:value-of select="properties//property[@name = 'province']/value/item/@name" /></province>
            <country>Spain</country>
            <location>
                <latitude><xsl:value-of select="properties//property[@name = 'latitude']/value" /></latitude>
                <longitude><xsl:value-of select="properties//property[@name = 'longitude']/value" /></longitude>
            </location>
            <location_detail><xsl:value-of select="properties//property[@name = 'type']/value/item/@name" /></location_detail>
            <beds><xsl:value-of select="properties//property[@name = 'bedrooms']/value/item/@name" /></beds>
            <baths><xsl:value-of select="properties//property[@name = 'bathrooms']/value/item/@name" /></baths>
            <url>
                <en>http://esregulproperties.com/en/catalog/view<xsl:value-of select="@link" /></en>
                <es>http://esregulproperties.com/es/catalog/view<xsl:value-of select="@link" /></es>
                <de>http://esregulproperties.com/de/catalog/view<xsl:value-of select="@link" /></de>
                <fr>http://esregulproperties.com/fr/catalog/view<xsl:value-of select="@link" /></fr>
                <ru>http://esregulproperties.com/ru/catalog/view<xsl:value-of select="@link" /></ru>
            </url>
            <desc>
                <en><xsl:value-of select="properties//property[@name = 'descr_en']/value" /></en>
                <es><xsl:value-of select="properties//property[@name = 'descr_es']/value" /></es>
                <de><xsl:value-of select="properties//property[@name = 'descr_de']/value" /></de>
                <fr><xsl:value-of select="properties//property[@name = 'descr_fr']/value" /></fr>
                <ru><xsl:value-of select="properties//property[@name = 'descr_ru']/value" /></ru>
            </desc>
            <xsl:apply-templates select="properties//property[@name = 'photos']/value" mode="photos" />
            <!--
            <pool>0</pool>
            <surface_area>
                <built>200</built>
                <plot>3000</plot>
            </surface_area>
            <energy_rating>
                <consumption>A</consumption>
                <emissions>A</emissions>
            </energy_rating>
            -->
            <!--
            <features>
                <feature>terrace</feature>
                <feature>air conditioning</feature>
                <feature>double glazing</feature>
            </features>
            <notes>free text</notes>
            -->
        </property>
    </xsl:template>

    <xsl:template match="value" mode="photos">
        <image id="{position()}">
            <url>http://esregulproperties.com<xsl:value-of select="." /></url>
        </image>
    </xsl:template>

</xsl:stylesheet>
