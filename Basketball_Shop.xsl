<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:template match="/">
		<html>
			<head>
				<style>
					table,th,td {border: 1px solid black; padding: 15px;margin: 0px;}
					table{border-spacing: 0;border-collapse: collapse;}
					th{background-color: black; color: white;}
					<!--th, td { padding: 15px; border: 1px solid black;}-->
				
				
				</style>	
			</head>
			<body>
				<table>
				<tr><th>prod_id</th><th>Name</th><th>Price</th><th>Description</th></tr>
				<xsl:for-each select="Basketball_Shop/Products/Product">
					<xsl:apply-templates select="."/>
				</xsl:for-each>
				</table>
			</body>
		</html>
	</xsl:template>
	
	
	<xsl:template match="/Basketball_Shop/Products/Product">
		<tr>
			<td><xsl:value-of select="@prod_id"/></td>
			<td><xsl:value-of select="Name"/></td>
			<td><xsl:value-of select="Price"/></td>
			<td><xsl:value-of select="Description"/></td>
		</tr>
	</xsl:template>

</xsl:stylesheet>