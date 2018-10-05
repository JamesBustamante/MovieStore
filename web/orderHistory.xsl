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
        <table align="center">
            <thead>
                <tr>
                    <th>OrderID</th>
                    <th>ID</th>
                    <th>Email</th>
                    <th>Full Name</th>
                    <th>Payment Method</th>
                    <th>Sales Total</th>
                    <th>Order Status</th>
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
                <xsl:value-of select="orderID"/>
            </td>
            
            <!--Need to write xsl somewhere to display the movie purchases in each order.-->
            
            <td>
                <xsl:value-of select="ID"/>
            </td>
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
            <td>
                <xsl:value-of select="orderStatus"/>
            </td>                                                  
        </tr>
    </xsl:template>

</xsl:stylesheet>
