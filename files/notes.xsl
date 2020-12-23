<?xml version="1.0" encoding="UTF-8"?>
 
<xsl:stylesheet version="1.1" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:fo="http://www.w3.org/1999/XSL/Format" exclude-result-prefixes="fo">
 
    <xsl:output method="xml" version="1.0" omit-xml-declaration="no" indent="yes"/>
    <xsl:param name="version" select="'1.0'"/>
    
    <xsl:template match="notes">
        <fo:root xmlns:fo="http://www.w3.org/1999/XSL/Format">
        
           <fo:layout-master-set>
            <fo:simple-page-master master-name="simpleA4"
                                       page-height="29.7cm" page-width="21cm" margin-top="2cm" margin-bottom="2cm"
                                       margin-left="2cm" margin-right="2cm">
                    <fo:region-body margin-top="0.5cm"/>
            </fo:simple-page-master>
           
            <fo:simple-page-master master-name="a4" page-height="29.7cm" page-width="21cm" 
                margin-top="1.54cm" 
                margin-bottom="1.54cm" 
                margin-left="2.54cm" 
                margin-right="2.54cm">
                <fo:region-body margin-top="2cm" margin-bottom="2cm" />
                <fo:region-before extent="1.5cm" />
                <fo:region-after extent="1cm" />
            </fo:simple-page-master>

            <fo:simple-page-master master-name="A4_landscape" page-height="21cm" page-width="29.7cm" font-family="sans-serif"
                    margin-top="2.54cm" 
                    margin-bottom="2.54cm" 
                    margin-left="1.54cm" 
                    margin-right="1.54cm">
                        <fo:region-body margin-top="2cm" margin-bottom="2cm" column-count="3"/>
                        <fo:region-before extent="1cm" />
                        <fo:region-after extent="1.5cm" />
                    </fo:simple-page-master>
        </fo:layout-master-set> 
           
           <fo:page-sequence master-reference="a4" force-page-count="no-force" >
                <fo:flow flow-name="xsl-region-body" font-size="18" text-align="center">
                    <fo:block >
                        Petrozavodsk State University
                        Institute of Mathematics and Information Technology
                    </fo:block>  
                    <fo:block text-decoration="underline">
                        Department of Informatics and Mathematical Support
                    </fo:block> 
                    <fo:block margin-top="1in">
                        Web-information presentation and processing technologies  
                    </fo:block>  
                    <fo:block text-align="right" margin-top="1in" font-size="14">
                        Creator:
                    </fo:block> 
                    <fo:block text-align="right" font-size="14">
                        4th year student of group 22407
                    </fo:block> 
                    <fo:block text-align="right" font-size="14">
                        Motina Veronika Sergeevna
                    </fo:block>
            

                    <fo:block>
                    <fo:footnote><fo:inline color="white">1</fo:inline>
                        <fo:footnote-body>
                                <fo:block text-align="center" font-size="12">
                                    Petrozavodsk, 2020
                                </fo:block>
                        </fo:footnote-body>
                    </fo:footnote>
                    </fo:block>
                </fo:flow>
            </fo:page-sequence>
        
            <fo:page-sequence master-reference="simpleA4">
                <fo:flow flow-name="xsl-region-body">
 
                    <fo:block font-size="10pt">
                        <fo:table table-layout="fixed" width="90%" border-collapse="separate">
                            <fo:table-column column-width="2cm"/>
                            <fo:table-column column-width="4cm"/>
                            <fo:table-column column-width="5cm"/>
                            <fo:table-column column-width="3cm"/>
                            <fo:table-header>
                                <fo:table-row>
                                    <fo:table-cell border="solid black 1px" padding="2px" font-weight="bold"
                                                   text-align="center">
                                        <fo:block>Name</fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="solid black 1px" padding="2px" font-weight="bold"
                                                   text-align="center">
                                        <fo:block>Path</fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="solid black 1px" padding="2px" font-weight="bold"
                                                   text-align="center">
                                        <fo:block>Date</fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="solid black 1px" padding="2px" font-weight="bold"
                                                   text-align="center">
                                        <fo:block>Comment</fo:block>
                                    </fo:table-cell>
                                </fo:table-row>
                            </fo:table-header>
 
                            <fo:table-body>
                                <xsl:apply-templates select="note"/>
                            </fo:table-body>
                        </fo:table>
                    </fo:block>
 
                </fo:flow>
            </fo:page-sequence>
        </fo:root>
    </xsl:template>
 
 
    <xsl:template match="note">
        <fo:table-row>
            <fo:table-cell>
                <fo:block>
                    <xsl:value-of select="name"/>
                </fo:block>
            </fo:table-cell>
            <fo:table-cell>
                <fo:block>
                    <xsl:value-of select="path"/>
                </fo:block>
            </fo:table-cell>
            <fo:table-cell>
                <fo:block>
                    <xsl:value-of select="date"/>
                </fo:block>
            </fo:table-cell>
            <fo:table-cell>
                <fo:block>
                    <xsl:value-of select="comment"/>
                </fo:block>
            </fo:table-cell>
        </fo:table-row>
    </xsl:template>
</xsl:stylesheet> 
