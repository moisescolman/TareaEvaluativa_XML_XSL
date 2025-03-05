<?xml version="1.0" encoding="UTF-8"?>
<!--
* Autor: Moisés Augusto Colmán Piñanez
* Fecha: 01/03/2025 
* Modulo: Lenguaje de Marcas y Sistemas de Gestión de la Información
* UD01 
* Tarea:LMSGI04 Tarea evaluativa 2. XSLT. (60%)
* Autoevaluación: Dentro del fichero .zip
* Descripción: Sitio web obteniendo los datos visualizados de un documento XML utilizando el lenguaje XPath y el estandar XSLT.
-->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <xsl:output method="html" doctype-system="about:legacy-compat" />
    
    <!-- Plantilla principal -->
    <xsl:template match="/gestionParque">
        <html lang="es">
            
            <head>
                <link href="../css/estilo.css" rel="stylesheet" type="text/css" />
                <meta name="description" content="Página principal" />
                <title>Atracciones</title>
            </head>
            
            <body>
                <header>
                    <img src= "../img/logotipo.png" alt= "Reservas" />
                    <a href="gastrobar.xml">Gastrobar</a>
                    <a href="atracciones.xml">Atracciones</a>
                    <a href="eventos.xml">Eventos</a>
                </header>
                
                <main>
                    <h1>ATRACCIONES</h1>
                    <table>
                        <tr>
                            <th>ATRACCION</th>
                            <th>EDAD MINIMA</th>
                            <th>PESO MAXIMO</th>
                        </tr>
                        
                        <!-- llamado a plantilla de atraccion -->
                        <xsl:apply-templates select="atracciones/atraccion"/>
                        
                    </table>			
                </main>
                <footer>
                    <address>&#169; Desarrollado por info@birt.eus</address>
                </footer>
            </body>
        </html> 
    </xsl:template>
    
    <!-- plantilla para atraccion -->
    <xsl:template match="atraccion" >
        
        <!-- variable para el nombre transformado de la atraccion -->
        <!-- para cambiar el enlace en el href -->
        <xsl:variable name="nombre" select="translate(nombre,' ', '_')"/>
        <tr>
            <td><a href="https://es.wikipedia.org/wiki/{$nombre}" target="_blank"><xsl:value-of select="nombre"/></a></td>
            <td><xsl:value-of select="restricciones/edadMinima"/></td>
            <td><xsl:value-of select="restricciones/pesoMaximo"/></td>
        </tr>
    </xsl:template>
    
    
</xsl:stylesheet>