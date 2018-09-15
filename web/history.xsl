<?xml version="1.0" encoding="UTF-8"?>

<!--
    Document   : history.xsl
    Created on : 16 September 2018, 1:06 AM
    Author     : WILL
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
                <title>history.xsl</title>
            </head>
            <body>
                <h1>Checkout</h1>
                <div style = "text-align: center;">
                <xsl:apply-templates select="history"/>
            </body>
        </html>
    </xsl:template>
    
    <xsl:template match="movies">
        <table align="center">
            <thead>
                <tr>
                    <th>Title</th>
                    <th>Genre</th>
                    <th>Release Date</th>
                    <th>Price</th>
                    <th>Available Copies</th>
                    <th>Selection</th>
                </tr>
            </thead>
            <tbody>
                <xsl:apply-templates select="movie"/>
            </tbody>
        </table>
    </xsl:template>
    
    <xsl:template match="movie">
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
                $<xsl:value-of select="price"/>
            </td>
            <td>
                <xsl:value-of select="availableCopies"/>
            </td>
            <td>
                <form action="checkout.jsp" method="get"> <!--Creates the button to remove the movie.-->
                        <input type="hidden" name="id" value="{title}"/>
                        <input type="submit" value="Remove" name="remove"/>
                </form>
            </td>
        </tr>
    </xsl:template>

</xsl:stylesheet>
