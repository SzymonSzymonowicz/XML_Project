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
					form{display: table;margin: auto; margin-bottom: 20px; margin-top: 10px;}
					p>label{display: table-cell; text-align: right; padding-right: 10px;}
					p.L>label{display: table-cell; text-align: left;} 
					p>input{display: table-cell;}
					form>p{display: table-row;}
					button{margin-bottom: 20px;}
				</style>
				
			</head>
			<body>
				<table id="prodTable">
					<xsl:apply-templates select="Products"/>
				</table>
				<br/>
				<div id="menu">
					<h2><b>MENU</b></h2><br/>
					
					<b>Add a product</b>
					<form>
						<p>
							<label for="idAdd">Product id:</label>
							<input type="text" id="idAdd"/>
						</p><p>
							<label for="nameAdd">Name:</label>
							<input type="text" id="nameAdd"/>
						</p><p>
							<label for="priceAdd">Price:</label>
							<input type="text" id="priceAdd"/>
						</p><p>
							<label for="descAdd">Description:</label>
							<input type="text" id="descAdd"/>
						</p>
					</form>
					<button type="button" onclick="myAdd()">ADD</button><br/>
					
					
					<b>Sort Products by:</b>
					<form>
						<p class="L">
							<input type="radio" id="id_rad" name="sort" onclick="mySort(0)"/>
							<label for="id_rad">Product id</label>
						</p><p class="L">
							<input type="radio" id="n_rad" name="sort" onclick="mySort(1)"/>
							<label for="n_rad">Name</label>
						</p><p class="L">
							<input type="radio" id="pr_rad" name="sort" onclick="mySort(2)"/>
							<label for="pr_rad">Price</label>
						</p><p class="L">
							<input type="radio" id="d_rad" name="sort" onclick="mySort(3)"/>
							<label for="d_rad">Description</label>
						</p>
					</form>
					<form>
						<label for="searchOpt"><b>Search by:</b></label>
						<select name="searchOpt" id="searchOpt" float="left">
							<option value="0">Product id</option>
							<option value="1">Name</option>
							<option value="2">Price</option>
							<option value="3">Description</option>
						</select><br/>
						<input type="text" id="search" name="search" oninput="mySearch();"/><br/>
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
					<b>Delete a product on id:</b>
					<form>
						<input type="text" id="idToDel"/><br/>
					</form>
					<button type="button" onclick="myDelete()">DELETE</button><br/>
					
					<b>Edit a product on id:</b>
					<form>
						<input col-span="2" type="text" id="idToEd" oninput="loadVals();"/>
					</form>
					<form>
						<p>
							<label for="idEd">Product id:</label>
							<input type="text" id="idEd"/>
						</p><p>
							<label for="nameEd">Name:</label>
							<input type="text" id="nameEd"/>
						</p><p>
							<label for="priceEd">Price:</label>
							<input type="text" id="priceEd"/>
						</p><p>
							<label for="descEd">Description:</label>
							<input type="text" id="descEd"/>
						</p>
					</form>
					<button type="button" onclick="myEdit()">SUBMIT</button><br/>
					
					
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