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
	
	<xsl:template match="/gestionParque">
		<html lang="es">
			
			<head>
				<link href="../css/estilo.css" rel="stylesheet" type="text/css" />
				<meta name="description" content="Página principal" />
				<title>Gastrobar</title>
			</head>
			
			<body>
				<header>
					<img src= "../img/logotipo.png" alt= "Reservas" />
					<a href="gastrobar.xml">Gastrobar</a>
					<a href="atracciones.xml">Atracciones</a>
					<a href="eventos.xml">Eventos</a>
				</header>
				
				<main id="gastrobar">
					<h1>ENTRANTES</h1>
					<!-- llama la plantilla de platos -->
					<xsl:apply-templates select="gastrobar/platos/plato"/>
				</main>
				
				<footer>
					<address>&#169; Desarrollado por info@birt.eus</address>
				</footer>
			</body>
		</html>
	</xsl:template>
	
	<!-- Plantilla para cada plato -->
	<xsl:template match="plato">
		
		<!-- variable para enlace de fotos -->
		<xsl:variable name="foto" select="foto"/>
		
		<xsl:if test="@categoria='Entrante'">
			<article class="articulo">
				<!-- Imagen del plato -->
				<img src="../img/{$foto}" class="imagen"/>    
				
				<!-- new si el código empieza con A -->
				<xsl:if test="starts-with(@codigo,'A')">
					<img src="../img/icono-novedad.png" class="novedad-icono"/>         
				</xsl:if>
				
				<!-- nombre y precio de los platos -->
				<h2><xsl:value-of select="nom_plato"/></h2>
				<h3><xsl:value-of select="precio"/>€</h3>
			</article>
		</xsl:if>
	</xsl:template>
	
</xsl:stylesheet>
