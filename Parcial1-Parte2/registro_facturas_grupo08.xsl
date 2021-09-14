<?xml version="1.0" encoding = "UTF-8"?>
<xsl:stylesheet version = "1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/">
        <html>
            <title>Registro de Facturas</title>
            <head>
                <link rel = "stylesheet" href = "style.css" />
            </head>
            <body>
                <h1>Registro de Facturas</h1>

                <xsl:for-each select = "registro/factura" >
                    <table class = "table__prueba">
                        <tr>
                            <th colspan = "1">
                                Factura No. 
                                <span class = "th__subrayado"><xsl:value-of select = "num" /></span>
                            </th>
                            <th colspan = "4">
                                Tipo Consumidor: <span class = "text__bold"><xsl:value-of select = "@tipo"/></span>
                            </th>
                        </tr>
                        <tr>
                            <th colspan = "5">Cliente</th>
                        </tr>
                        <tr>
                            <th colspan = "1"> 
                                Nombre: <span class = "text__bold"><xsl:value-of select = "cliente/nombre" /></span>
                            </th>
                            <th colspan = "4">
                                Documento
                                <xsl:if test = "cliente/documento[count(dui)>0]" >
                                    <span class = "text__bold">Dui: <xsl:value-of select = "cliente/documento/dui" /></span>
                                </xsl:if>
                                <xsl:if test = "cliente/documento[count(pasaporte)>0]" >
                                    <span class = "text__bold">Pasaporte: <xsl:value-of select = "cliente/documento/pasaporte" /></span>
                                </xsl:if>
                            </th>
                        </tr>
                        <tr>
                            <th colspan = "1">
                                Telefono: <span class = "text__bold"><xsl:value-of select = "cliente/telefono" /></span>
                            </th>
                            <th colspan = "4">
                                Email: <span class = "text__bold"><xsl:value-of select = "cliente/email"/></span>
                            </th>
                        </tr>
                        <xsl:for-each select ="lineafactura">
                            <tr>
                                <th class = "th__tbody">Codigo</th>
                                <th class = "th__tbody">Detalle</th>
                                <th class = "th__tbody">Cantidad</th>
                                <th class = "th__tbody">Precio</th>
                                <th class = "th__tbody">Subtotal</th>
                            </tr>
                            <tr>
                                <td class = "td__tbody"><xsl:value-of select = "codigo"/></td>
                                <td class = "td__tbody"><xsl:value-of select = "detalle"/></td>
                                <td class = "td__tbody"><xsl:value-of select = "cantidad"/></td>
                                <td class = "td__tbody"><xsl:value-of select = "precio/valor" /></td>
                                <td class = "td__tbody"><xsl:value-of select = "subtotal/valor"/></td>
                            </tr>
                        </xsl:for-each>
                        <tr>
                            <td class = "td__tbody" colspan = "4" style = "text-align:right; font-weight:700">
                                TOTAL
                            </td>
                            <td>
                                <xsl:value-of select = "total/valor" />
                            </td>
                        </tr>
                    </table>
                </xsl:for-each>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
