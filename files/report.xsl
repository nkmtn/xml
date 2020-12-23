<?xml version="1.0" encoding="UTF-8"?>

 <xsl:stylesheet version="1.0" xmlns:fo="http://www.w3.org/1999/XSL/Format" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:template match="/test">
    <fo:root xmlns:fo="http://www.w3.org/1999/XSL/Format" font-family="Liberation Serif">

    <fo:layout-master-set>
        <fo:simple-page-master master-name="a4" page-height="29.7cm" page-width="21cm" 
            margin-top="1.54cm" 
            margin-bottom="1.54cm" 
            margin-left="2.54cm" 
            margin-right="2.54cm">
            <fo:region-body margin-top="2cm" margin-bottom="2cm" />
            <fo:region-before extent="1.5cm" />
            <fo:region-after extent="1cm" />
        </fo:simple-page-master>
    </fo:layout-master-set>

<!-- Титульный лист -->
    <fo:page-sequence master-reference="a4" force-page-count="no-force" >
        <fo:flow flow-name="xsl-region-body" font-size="18" text-align="center">
            <fo:block >
                Петрозаводский государственный университет 
                Институт математики и информационных технологий
            </fo:block>  
            <fo:block text-decoration="underline">
                Кафедра информатики и математического обеспечения
            </fo:block> 
            <fo:block margin-top="1in">
                Web-технологии представления и обработки информации  
            </fo:block> 
            <fo:block text-align="right" margin-top="1in" font-size="14">
                Создатель:
            </fo:block> 
            <fo:block text-align="right" font-size="14">
                студентка 4 курса группы 22407
            </fo:block> 
            <fo:block text-align="right" font-size="14">
                Мотина Вероника Сергеевна
            </fo:block>
            
            <fo:block>
               <fo:footnote><fo:inline color="white">1</fo:inline>
                   <fo:footnote-body>
                       <fo:block text-align="center">
                            <fo:external-graphic src="url(file:/home/nkmtn/repos/xml/files/iozh.jpg)" display-align="after" content-height="scale-to-fit" height="2in"  content-width="2in" scaling="non-uniform"/>
                        </fo:block>
                        <fo:block text-align="center" font-size="12">
                             Петрозаводск, 2020
                        </fo:block>
                   </fo:footnote-body>
               </fo:footnote>
            </fo:block>
        </fo:flow>
    </fo:page-sequence>

<!-- Содержание -->
    <fo:page-sequence master-reference="a4" initial-page-number="1">
        <fo:static-content flow-name="xsl-region-before">
            <fo:block text-align="end" font-size="12">
                Содержание
            </fo:block>
         </fo:static-content>
         <fo:static-content flow-name="xsl-region-after">
          <fo:block text-align="end">
                Страница <fo:page-number/> из <fo:page-number-citation ref-id="theEnd"/>    
          </fo:block>
      </fo:static-content>
        <fo:flow flow-name="xsl-region-body">
            <fo:block font-size="20pt" line-height="30pt" margin-top="0.5in">
                Содержание
            </fo:block>
            <fo:block font-size="16" margin-top="0.2in">
                1. Вопросы
            </fo:block>
            <fo:block font-size="16" margin-top="0.2in">
                2. Ответы
            </fo:block>
             
        </fo:flow>
    </fo:page-sequence>

<!-- Вопросы и ответы -->
    <fo:page-sequence master-reference="a4">
        <fo:static-content flow-name="xsl-region-before">
            <fo:block  text-align="end" font-size="12">
                Лабораторная работа №6
            </fo:block>
        </fo:static-content>
        <fo:static-content flow-name="xsl-region-after">
            <fo:block text-align="end">
                Страница <fo:page-number/> из <fo:page-number-citation ref-id="theEnd"/>
            </fo:block>
        </fo:static-content>
        <fo:flow flow-name="xsl-region-body">
            <fo:block font-size="20" text-align="center">
                Вопросы
            </fo:block>
            <fo:block>
                <xsl:for-each select = "topics/topic">
                    <fo:block margin-top="0.2in" font-size="18" font-weight="bold">
                    <xsl:value-of select="position()"/>. Категория <xsl:value-of select="title"/>
                        <xsl:for-each select = "tasks/task">
                            <fo:block font-weight="normal" margin-top="0.15in" font-size="14" margin-left="0.1in">
                            <xsl:value-of select="position()"/>. <xsl:value-of select="title"/>
                            <xsl:for-each select = "answers/answer">
                                <fo:block margin-top="0.1in" font-size="12" margin-left="0.2in">
                                <xsl:value-of select="position()"/>. <xsl:apply-templates/>
                                </fo:block>
                            </xsl:for-each>
                            </fo:block>
                        </xsl:for-each>
                    </fo:block>
                </xsl:for-each>
            </fo:block>
            <fo:block font-size="20" text-align="center" >
                Ответы
            </fo:block>
            <fo:block>
                <xsl:for-each select = "topics/topic">
                    <fo:block  margin-top="0.2in" font-size="18" font-weight="bold">
                    <xsl:value-of select="position()"/>. Категория <xsl:value-of select="title"/>
                        <xsl:for-each select = "tasks/task">
                            <fo:block font-weight="normal" margin-top="0.15in" font-size="14" margin-left="0.1in" text-align="left">
                                <xsl:value-of select="position()"/>. <xsl:value-of select="title"/>
                                <fo:block margin-top="0.1in" font-size="12" margin-left="0.2in" text-align="left">
                                    Ответ:
                                    <xsl:for-each select = "answers/answer">
                                        <xsl:if test="@correct = 'yes'">
                                            <xsl:apply-templates/>
                                        </xsl:if>
                                    </xsl:for-each>
                                </fo:block>
                            </fo:block>
                        </xsl:for-each>
                    </fo:block>
                </xsl:for-each>
            </fo:block>
            <fo:block id="theEnd"/>
        </fo:flow>
    </fo:page-sequence>
    </fo:root>
</xsl:template>
</xsl:stylesheet> 
