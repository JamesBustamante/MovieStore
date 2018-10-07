<?xml version="1.0" encoding="UTF-8"?>

<!--
    Document   : orderHistory.xsl
    Created on : 3 October 2018, 6:07 PM
    Author     : Ciaran
    Description:
        Purpose of transformation follows.
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0" 
xmlns="http://www.w3schools.com/WSDassignment">
    <xsl:output method="html"/>

    <!-- TODO customize transformation rules 
         syntax recommendation http://www.w3.org/TR/xslt 
    -->
    <xsl:template match="/">
        <html>
            <head>
                <title>orderHistory.xsl</title>
            </head>
            <body>
                <h2 align="center">Order History</h2>
                <xsl:apply-templates select="history"/>
            </body>
        </html>
    </xsl:template>
    
    <xsl:template match="history">
        <table align="center" class="content p table">
            <thead>
                <tr>
                    <th></th>
                    <th>OrderID</th>
                    <th>Order Status</th>
                    <th>Title</th>
                    <th>Genre</th>
                    <th>Release Date</th>
                    <th>Price</th>
                    <th>No. of Copies</th>
                </tr>
            </thead>
            <tbody>
                <xsl:apply-templates select="order"/>
            </tbody>
        </table>
    </xsl:template>
    
    <xsl:template match="order">
        <tr>  
            <td>
                <xsl:if test="orderStatus='Submitted'">
                <form action="cancel.jsp" method="get">
                     <input type="hidden" name="id" value="{orderID}"/>
                    <input type="submit" value="Cancel Order" name="cancel"/>
                </form>
                </xsl:if>
            </td>            
            <td>
                <xsl:value-of select="orderID"/>
            </td>
            <td>
                <xsl:value-of select="orderStatus"/>
              
            </td>                       
            <xsl:apply-templates select="purchases"/>
            <!--Need to write xsl somewhere to display the movie purchases in each order.-->
                               
            <!--
            <td>
                <xsl:value-of select="email"/>
            </td>
            <td>
                <xsl:value-of select="fullName"/>
            </td>
            <td>
                <xsl:value-of select="paymentMethod"/>
            </td>
            <td>
                <xsl:value-of select="salesTotal"/>
            </td> 
-->                                                
        </tr>
    </xsl:template>
    
    <xsl:template match="purchases">
        <xsl:apply-templates select="moviePurchase"/>
    </xsl:template>
    
    <xsl:template match="moviePurchase">
        <tr>
            <td></td>
            <td></td>
            <td></td>
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
