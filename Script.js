//var t=document.getElementById('prodTable');

//console.log(t.rows[0].cells[0].innerHTML);

function mySearch(){
	var tab = document.getElementById('prodTable');
	var look = document.getElementById('search').value;
	
	var resT = document.getElementById('searchResult');
	
	var i;
	
	for(i=1;i<tab.rows.length;i++)
	{
		if(look == tab.rows[i].cells[1].innerHTML)
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
			x = rows[i].getElementsByTagName("TD")[n];
			y = rows[i+1].getElementsByTagName("TD")[n];
			
			// comparing
			if(x.innerHTML.toLowerCase() > y.innerHTML.toLowerCase()){
				doSwap = true;
				break;
			}		
		}
		if(doSwap){
			rows[i].parentNode.insertBefore(rows[i+1],rows[i]);
			switching = true; // continue to switch ovet table
		}
	}
}
