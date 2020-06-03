<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:template match="/Basketball_Shop">
		<html>
			<head>
				<style>
					table,th,td {border: 1px solid black; padding: 15px;margin: 0px;}
					table{border-spacing: 0;border-collapse: collapse;text-align:center;}
					th{background-color: black; color: white;}
					<!--th, td { padding: 15px; border: 1px solid black;}-->
				
				
				</style>	
			</head>
			<body>
				<table>
					<xsl:apply-templates select="Products"/>
				</table>
				<br/><br/>
				<table>
					<tr>
						<th colspan="2">Number of</th>
					</tr>
					<tr>
						<td>Products</td>
						<td>
							<xsl:value-of select="count(Products/Product)"/>
						</td>
					</tr>
					<tr>
						<td>Categories</td>
						<td>
							<xsl:value-of select="count(Categories/Category)"/>
						</td>
					</tr>
					<tr>
						<td>Customers</td>
						<td>
							<xsl:value-of select="count(Customers/Customer)"/>
						</td>
					</tr>
					<tr>
						<td>Orders</td>
						<td>
							<xsl:value-of select="count(Orders/Order)"/>
						</td>
					</tr>
					<tr>
						<td>Delivery Companies</td>
						<td>
							<xsl:value-of select="count(DeliveryCompanies/DelivComp)"/>
						</td>
					</tr>
					<tr>
						<td>Suppliers</td>
						<td>
							<xsl:value-of select="count(Suppliers/Supplier)"/>
						</td>
					</tr>
					<tr>
						<td>Adresses</td>
						<td>
							<xsl:value-of select="count(Adresses/Adress)"/>
						</td>
					</tr>
					<tr>
						<td>Producers</td>
						<td>
							<xsl:value-of select="count(Producers/Producer)"/>
						</td>
					</tr>
				</table>
				<br/>
			</body>
		</html>
	</xsl:template>
	
	
	<xsl:template match="Products">
		<tr>
			<th>prod_id</th>
			<th>Name</th>
			<th>Price</th>
			<th>Description</th>
		</tr>
		<xsl:for-each select="Product">
		<tr>
			<td><xsl:value-of select="@prod_id"/></td>
			<td><xsl:value-of select="Name"/></td>
			<td><xsl:value-of select="Price"/></td>
			<td><xsl:value-of select="Description"/></td>
		</tr>
		</xsl:for-each>
	</xsl:template>

</xsl:stylesheet>