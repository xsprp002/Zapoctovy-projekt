<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/deklarace">
        <html>
            <body>
                <!-- cyklus -->
                <table border="1">
                    <h1>Výpis zemí jednotlivých položek</h1>
                    <tr>
                        <th>Sekvence</th>
                        <th>Země původu</th>
                        <th>Země dodání</th>
                    </tr>
                    <xsl:for-each select="zbozi/polozka">
                        <tr>
                            <td>
                                <xsl:value-of select="sekvence" />
                            </td>
                            <td>
                                <xsl:value-of select="zemePuvod" />
                            </td>
                            <td>
                                <xsl:value-of select="zemeCil" />
                            </td>
                        </tr>
                    </xsl:for-each>
                </table>
                <!-- if -->
                <table border="1">
                    <br />
                    <h1>Položky vážící alespoň 100 kg</h1>
                    <tr>
                        <th>Sekvence</th>
                        <th>Váha</th>
                        <th>Označení přepravního zařízení</th>
                    </tr>
                    <xsl:for-each select="zbozi/polozka">
                        <xsl:if test="vaha >= 100">
                            <tr>
                                <td>
                                    <xsl:value-of select="sekvence" />
                                </td>
                                <td>
                                    <xsl:value-of select="vaha" />
                                </td>
                                <td>
                                    <xsl:value-of select="prepravniZarizeni/oznaceni" />
                                </td>
                            </tr>
                        </xsl:if>
                    </xsl:for-each>
                </table>
                <!-- when -->
                <br />
                <h1>Stav kontroly</h1>
                <xsl:choose>
                    <xsl:when test="zabezpeceni = 1">Je zapotřebí visuální kontrola</xsl:when>
                    <xsl:when test="zabezpeceni = 2">Je zapotřebí rentgenová kontrola</xsl:when>
                    <xsl:when test="zabezpeceni = 3">Je zapotřebí kompletní kontrola</xsl:when>
                    <xsl:otherwise>Kontrola není zapotřebí</xsl:otherwise>
                </xsl:choose>
                <!-- třídění -->
                <table border="1">
                    <br />
                    <h1>Položky sezařené dle váhy</h1>
                    <tr>
                        <th>Váha</th>
                        <th>Sekvence</th>
                    </tr>
                    <xsl:for-each select="zbozi/polozka">
                        <xsl:sort select="vaha" data-type="number" order="ascending" />
                        <tr>
                            <td>
                                <xsl:value-of select="vaha" />
                            </td>
                            <td>
                                <xsl:value-of select="sekvence" />
                            </td>
                        </tr>
                    </xsl:for-each>
                </table>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>