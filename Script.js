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
	
	if(newId == "" || newName == "" || newPrice == "" || newDesc == ""){
		alert('Can\'t add ! There is at least one given value, which is empty !!!');
		return;
	}
	if(!(/_3\d{3}/.test(newId))){
		alert('Can\'t add ! Product id doesn\'t match regex:  [_3\\d{3}]  !!!');
		return;
	}
	if(!(/\d+\.\d{2} zł/.test(newPrice))){
		alert('Can\'t add ! Product price doesn\'t match regex:  [\\d+\\.\\d{2} zł]  !!!');
		return;
	}
	
	
	
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

function myEdit(){
	var look = document.getElementById('idToEd').value;
	var tab = document.getElementById('prodTable');
	
	var idEd, nameEd, priceEd, descEd;
	
	idEd = document.getElementById('idEd').value;
	nameEd = document.getElementById('nameEd').value;
	priceEd = document.getElementById('priceEd').value;
	descEd = document.getElementById('descEd').value;
	
	if(idEd == "" || nameEd == "" || priceEd == "" || descEd == ""){
		alert('Can\'t edit ! There is at least one given value, which is empty !!!');
		return;
	}
	if(!(/_3\d{3}/.test(idEd))){
		alert('Can\'t edit ! Product id doesn\'t match regex:  [_3\\d{3}]  !!!');
		return;
	}
	if(!(/\d+\.\d{2} zł/.test(priceEd))){
		alert('Can\'t edit ! Product price doesn\'t match regex:  [\\d+\\.\\d{2} zł]  !!!');
		return;
	}
	
	
	for(i=1;i<tab.rows.length;i++)
	{
		if(look == tab.rows[i].cells[0].innerHTML)
		{
			tab.rows[i].cells[0].innerHTML = idEd;
			tab.rows[i].cells[1].innerHTML = nameEd;
			tab.rows[i].cells[2].innerHTML = priceEd;
			tab.rows[i].cells[3].innerHTML = descEd;
			break;
		}
	}
}

function loadVals(){
	var look = document.getElementById('idToEd').value;
	var tab = document.getElementById('prodTable');
	
	for(i=1;i<tab.rows.length;i++)
	{
		if(look == tab.rows[i].cells[0].innerHTML)
		{
			document.getElementById('idEd').value=tab.rows[i].cells[0].innerHTML;
			document.getElementById('nameEd').value=tab.rows[i].cells[1].innerHTML;
			document.getElementById('priceEd').value=tab.rows[i].cells[2].innerHTML;
			document.getElementById('descEd').value=tab.rows[i].cells[3].innerHTML;
			break;
		}
	}
}

function myDelete(){
	var tab = document.getElementById('prodTable');
	var look = document.getElementById('idToDel').value;
	
	for(i=1;i<tab.rows.length;i++)
	{
		if(look == tab.rows[i].cells[0].innerHTML)
		{
			tab.deleteRow(i);
			break; // with break deletes the first occurence of given id, without deletes every occurence
		}
	}
}


