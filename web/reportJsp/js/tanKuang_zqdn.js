


	//第一表弹框JS
	function d1b_tbzq(a,b,c){
		var y=a;
		var x=b;
		var ds=c;
		var tjDate=document.getElementById("tjDate").value;
		var startDate=document.getElementById("startDate").value;
		var endDate=document.getElementById("endDate").value;
	   
		
		window.open ("showReport2.jsp?raq=/dangNeiTongJi/dangNeiTongJi_xq/d1b_xq.raq&tjDate="+tjDate+"&startDate="+startDate+"&endDate="+endDate+"&x="+x+"&y="+y+"&ds="+ds, 'newwindow', 'height=300, width=800, top=200, left=100, toolbar=no, menubar=no, scrollbars=no, resizable=no,location=n o, status=no'); 
	
	}


	//第二表弹框JS
	function d2b_tbzq(a,b,c){
		var y=a;
		var x=b;
		var ds=c;
		var tjDate=document.getElementById("tjDate").value;
		var startDate=document.getElementById("startDate").value;
		var endDate=document.getElementById("endDate").value;
	    var col=document.getElementById("col").value;
		//alert("rybm");
		window.open ("showReport2.jsp?raq=/dangNeiTongJi/dangNeiTongJi_xq/d2b_xq.raq&tjDate="+tjDate+"&startDate="+startDate+"&endDate="+endDate+"&x="+x+"&y="+y+"&ds="+ds+"&col="+col, 'newwindow', 'height=300, width=900, top=200, left=100, toolbar=no, menubar=no, scrollbars=no, resizable=no,location=n o, status=no'); 
	
	}

