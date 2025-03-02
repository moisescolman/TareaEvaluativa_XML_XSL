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
		<title>Eventos</title>
	</head>

	<body>
		<header>
			<img src= "../img/logotipo.png" alt= "Reservas" />
			<a href="gastrobar.xml">Gastrobar</a>
			<a href="atracciones.xml">Atracciones</a>
			<a href="eventos.xml">Eventos</a>
		</header>
		
		<main>
			<h1>Eventos del 2024</h1>  
            <!-- llamado a la plantilla de eventos -->
            <xsl:apply-templates select="eventos/evento">
                <xsl:sort select="fechaHora" order="descending"/>
            </xsl:apply-templates>
		</main>

		<footer>
			<address>&#169; Desarrollado por info@birt.eus</address>
		</footer>
	</body>
</html>
</xsl:template>


<!-- Plantilla para mostrar las informaciones de eventos -->
<xsl:template match="evento">

<!-- variable para cambiar el año -->
<xsl:variable name="year" select="2024"/>

<!-- condicional para eventos del 2024 -->
<xsl:if test="substring(fechaHora,1,4)>=$year">
    <article class="eventos">

        <!-- h4 incluye nombre y contador de comentarios -->
		<h4><xsl:value-of select="descripcion"/> - <xsl:value-of select="count(comentarios/comentario)"/> Comentarios</h4>
		<ul>
            <!-- for-each para mostrar todos los comentarios -->
            <xsl:for-each select="comentarios/comentario">
                <li>
                    <xsl:value-of select="."/> 
                </li>
            </xsl:for-each>
		</ul>
	</article>
</xsl:if>

</xsl:template>

</xsl:stylesheet>