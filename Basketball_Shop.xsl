<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:template match="/Basketball_Shop">
		<html>
			<head>
				<style>
					table,th,td {border: 1px solid black; padding: 15px;margin: 0px;}
					table{opacity: 0.9;margin-left:auto;margin-right:auto;border-spacing: 0;border-collapse: collapse;text-align:center;background-color: white;}
					th{background-color: black; color: white;}
					body{
					background: rgb(255,255,255);
					background: linear-gradient(60deg, rgba(255,255,255,1) 0%,
					rgba(186,172,131,1) 35%, rgba(0,212,255,1) 100%);}
					#menu{
					display: table;
					margin: auto;
					text-align: center;
					background-color: white;
					width: 400px;
					border: 1px solid black;
					padding: 10px;}
				</style>
				
			</head>
			<body>
				<table id="prodTable">
					<xsl:apply-templates select="Products"/>
				</table>
				<br/>
				<div id="menu">
					<h3><b>MENU</b></h3><br/>
					<form>
						<label for="search">Search by Name</label><br/>
						<input type="text" id="search" name="search" value="5" oninput="mySearch();"/><br/>
					</form><br/>
					<div id="searchResult" style="display: none;">
						<table>
							<tr>
								<th>Product id</th>
								<th>Name</th>
								<th>Price</th>
								<th>Description</th>
							</tr>
							<tr>
								<td id="scell_1"></td>
								<td id="scell_2"></td>
								<td id="scell_3"></td>
								<td id="scell_4"></td>
							</tr>
						</table>
					</div>
				</div>
				<br/>
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
				<table>
					<xsl:apply-templates select="Adresses"/>
				</table>
				<script type="text/javascript" lang="javascript" src="Script.js"></script>
			</body>
		</html>
	</xsl:template>
	
	
	<xsl:template match="Products">
		<tr>
			<th>Product id</th>
			<th>Name</th>
			<th>Price</th>
			<th>Description</th>
		</tr>
		<xsl:for-each select="Product">
		<tr>
			<td><xsl:value-of select="@prod_id"/></td>
			<td><xsl:value-of select="Name"/></td>
			<td><xsl:value-of select="Price"/> zł</td>
			<td><xsl:value-of select="Description"/></td>
		</tr>
		</xsl:for-each>
	</xsl:template>

	<xsl:template match="Adresses">
		<tr>
			<th>
				Adress id
			</th>
			<th>
				Customer id
			</th>
			<th>
				Country
			</th>
		</tr>
		<xsl:for-each select="Adress">
			<xsl:choose>
				<xsl:when test="Country='Poland'">
					<tr style="background-color:  #ff4d4d;">
						<xsl:variable name="adr" select="@adr_id"/>
						<td>
							<xsl:value-of select="$adr"/>
						</td>
						<td>
							<xsl:value-of select="../../Customers/Customer[@adr_id=$adr]/@cust_id"/>
						</td>
						<td>
							<xsl:value-of select="Country"/>
						</td>
					</tr>
				</xsl:when>
				<xsl:otherwise>
					<tr style="background-color:  #ccffcc;">
						<xsl:variable name="adr" select="@adr_id"/>
						<td>
							<xsl:value-of select="$adr"/>
						</td>
						<td>
							<xsl:value-of select="../../Customers/Customer[@adr_id=$adr]/@cust_id"/>
						</td>
						<td>
							<xsl:value-of select="Country"/>
						</td>
					</tr>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:for-each>
	</xsl:template>
	
</xsl:stylesheet>