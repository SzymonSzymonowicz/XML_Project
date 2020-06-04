//var t=document.getElementById('prodTable');

//console.log(t.rows[0].cells[0].innerHTML);

//sortowanie/szukanie/dodawanie/edytowanie/usuwanie.

function mySearch(){
	var tab = document.getElementById('prodTable');
	var look = document.getElementById('search').value;
	
	var resT = document.getElementById('searchResult');
	
	var i;
	
	var searchOpt = document.querySelector('#searchOpt').value;
	//console.log(searchOpt.value);
	
	for(i=1;i<tab.rows.length;i++)
	{
		if(look == tab.rows[i].cells[searchOpt].innerHTML)
		{
			resT.style.display = "block";
			document.getElementById('scell_1').innerHTML=tab.rows[i].cells[0].innerHTML;
			document.getElementById('scell_2').innerHTML=tab.rows[i].cells[1].innerHTML;
			document.getElementById('scell_3').innerHTML=tab.rows[i].cells[2].innerHTML;
			document.getElementById('scell_4').innerHTML=tab.rows[i].cells[3].innerHTML;
			break;
		}
	}
	if(i==tab.rows.length){
		resT.style.display = "none";
	}
	
}

function mySort(n){
	var tab, rows, switching, doSwap, i, x, y;
	
	tab = document.getElementById('prodTable');
	switching = true;
	
	while(switching){
		switching = false;
		rows = tab.rows;
		
		for(i = 1; i < (rows.length-1); i++){
			doSwap = false;
			
			// get elements to compare
			x = rows[i].getElementsByTagName("TD")[n].innerHTML;
			y = rows[i+1].getElementsByTagName("TD")[n].innerHTML;
			
			// comparing
			if(n != 2 && x.toLowerCase() > y.toLowerCase()){
				doSwap = true;
				break;
			}
			if(n == 2 && parseFloat(x) > parseFloat(y)){
				doSwap = true;
				break;
			}
		}
		if(doSwap){
			rows[i].parentNode.insertBefore(rows[i+1],rows[i]);
			switching = true; // continue to switch over table
		}
	}
}

function myAdd(){
	var tab = document.getElementById('prodTable');
	
	var newId, newName, newPrice, newDesc;
	
	newId = document.getElementById('idAdd').value;
	newName = document.getElementById('nameAdd').value;
	newPrice = document.getElementById('priceAdd').value;
	newDesc = document.getElementById('descAdd').value;
	
	var row = tab.insertRow(-1);
	
	var x, y, z, q;
	
	x = row.insertCell(0);
	y = row.insertCell(1);
	z = row.insertCell(2);
	q = row.insertCell(3);
	
	x.innerHTML = newId;
	y.innerHTML = newName;
	z.innerHTML = newPrice;
	q.innerHTML = newDesc;

		
	
}

