<?xml version="1.0" encoding="UTF-8"?>

<!--
    Document   : selectedMovie.xsl
    Created on : 24 September 2018, 10:48 PM
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
                <title>selectedMovie.xsl</title>
            </head>
            <body>
                <h1 style = "text-align: center;">HQ's Collection</h1>
                <div style = "text-align: center;">
                <xsl:apply-templates select="movies"/>  
                </div>
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
                    <th>Description</th>
                    <th>Available Copies1</th>
                    <th>Remove</th>
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
                <xsl:value-of select="description"/>
            </td>
            <td>
                <xsl:value-of select="availableCopies"/>
            </td>
            <td>
                <form action="removeMovieAction.jsp" method="get">   <!--Creates the button to remove the selected movie.-->
                    <input type="hidden" name="id" value="{title}"/>
                    <input type="submit" value="X" name="removeMovie"/>
                </form>
            </td>
        </tr>        
    </xsl:template>
</xsl:stylesheet>

