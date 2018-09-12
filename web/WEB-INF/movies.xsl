<?xml version="1.0" encoding="UTF-8"?>

<!--
    Document   : movie.xsl
    Created on : 12 September 2018, 12:43 PM
    Author     : james
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
                <title>movie.xsl</title>
            </head>
            <body>
                <h1>HQ's Collection</h1>
                <xsl:value-of select="movies"/>  
            </body>
        </html>
    </xsl:template>

</xsl:stylesheet>
