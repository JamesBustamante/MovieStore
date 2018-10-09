<?xml version="1.0" encoding="UTF-8"?>

<!--
    Document   : user.xsl
    Created on : 9 October 2018, 7:24 PM
    Author     : MatthewHellmich
    Description:
        Purpose of transformation follows.
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html"/>

    <!-- TODO customize transformation rules 
         syntax recommendation http://www.w3.org/TR/xslt 
    -->
    <xsl:template match="/">
        <html>
            <head>
                <title>user.xsl</title>
            </head>
            <body>
                <xsl:apply-templetes/>
            </body>
        </html>
    </xsl:template>
    
    <xsl:template match="user">
        <h1>Account Details</h1>
        <xsl:apply-templates select="user"/>      
    </xsl:template>
    
    <xsl:template match="track">
        <tr>
            <td>
                <xsl:value-of select="ID"/>
            </td>
            <td>
                <xsl:value-of select="email"/>
            </td>
            <td>
                <xsl:value-of select="password"/>
            </td>
            <td>
                <xsl:value-of select="FullName"/>
            </td>
            <td>
                <xsl:value-of select="phone"/>
            </td>
            <td>
                <xsl:value-of select="gender"/>
            </td>
            <td>
                <xsl:value-of select="address"/>
            </td>
        </tr>
    </xsl:template>

</xsl:stylesheet>
