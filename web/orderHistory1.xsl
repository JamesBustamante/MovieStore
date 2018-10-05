<?xml version="1.0" encoding="UTF-8"?>

<!--
    Document   : orderHistory1.xsl
    Created on : 5 October 2018, 5:39 PM
    Author     : Ciaran
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
                <title>orderHistory1.xsl</title>
            </head>
            <body>
                <xsl:apply-templates/>
            </body>
        </html>
    </xsl:template>
    
    <xsl:template match="purchases">
        <table>
            <thead>
                <tr>
                    <th>Title</th>
                    <th>Genre</th>
                    <th>Release Date</th>
                    <th>Price</th>
                    <th>No Copies</th>
                </tr>
            </thead>
            <tbody>
                <xsl:apply-templates/>
            </tbody>
        </table>
        <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="moviePurchase">
        <tr>
            <td>
                <xsl:value-of select="title"/>
            </td>
            <td>
                <xsl:value-of select="genre"/>
            </td>
            <td>
                <xsl:value-of select="releaseDate"/>
            </td>
            <td>
                <xsl:value-of select="price"/>
            </td>
            <td>
                <xsl:value-of select="NoCopies"/>
            </td>                        
        </tr>
    </xsl:template>

</xsl:stylesheet>
