var t=document.getElementById('prodTable');

console.log(t.rows[0].cells[0].innerHTML);

function mySearch(){
	var t=document.getElementById('prodTable');
	var look=document.getElementById('search').value;
	
	var resT = document.getElementById('searchResult');
	
	var i;
	
	for(i=1;i<t.rows.length;i++)
	{
		if(look == t.rows[i].cells[1].innerHTML)
		{
			resT.style.display = "block";
			document.getElementById('scell_1').innerHTML=t.rows[i].cells[0].innerHTML;
			document.getElementById('scell_2').innerHTML=t.rows[i].cells[1].innerHTML;
			document.getElementById('scell_3').innerHTML=t.rows[i].cells[2].innerHTML;
			document.getElementById('scell_4').innerHTML=t.rows[i].cells[3].innerHTML;
			break;
		}
	}
	if(i==t.rows.length){
		resT.style.display = "none";
	}
	
}