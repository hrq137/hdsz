


	//汇总一弹框JS
	function hz1_tbzq(a,b,c){
		alert(a)
		var y=a;
		var x=b;
		var ds=c;
		var tjDate=document.getElementById("tjDate").value;
		var startDate=document.getElementById("startDate").value;
		var endDate=document.getElementById("endDate").value;
	    var col=document.getElementById("col").value;

		if (ds=='')
		{
			$("#mainframe").attr("src","/exportExcel.jsp?raq=/ganBuTongJi/ganBuTongJi_xq/hz1_xq.raq&tjDate="+tjDate+"&startDate="+startDate+"&endDate="+endDate+"&x="+x+"&y="+y+"&ds="+ds+"&col="+col);
			//window.open //("showReport1.jsp?raq=/ganBuTongJi/ganBuTongJi_xq/hz1_xq.raq&tjDate="+tjDate+"&startDate="+startDate+"&endDate="+endDate+"&x="+x+"&y="+y+"&ds="+ds+"&co//l="+col, 'newwindow', 'height=300, width=800, top=200, left=100, toolbar=no, menubar=no, scrollbars=no, resizable=no,location=n o, status=no'); 
	
		}
		else if (ds=='2' || ds=='3')
		{
			$("#mainframe").attr("src","/report/reportJsp/exportExcel.jsp?raq=/ganBuTongJi/ganBuTongJi_xq/hz1_dw_xq.raq&tjDate="+tjDate+"&startDate="+startDate+"&endDate="+endDate+"&x="+x+"&y="+y+"&ds="+ds+"&col="+col);
			//window.open //("showReport1.jsp?raq=/ganBuTongJi/ganBuTongJi_xq/hz1_dw_xq.raq&tjDate="+tjDate+"&startDate="+startDate+"&endDate="+endDate+"&x="+x+"&y="+y+"&ds="+ds+"//&col="+col, 'newwindow', 'height=300, width=800, top=200, left=100, toolbar=no, menubar=no, scrollbars=no, resizable=no,location=n o, status=no'); 
	
		}

		
	}

   	
	//汇总二弹框JS
	function hz2_tbzq(a,b,c){
		var y=a;
		var x=b;
		var ds=c;
		var tjDate=document.getElementById("tjDate").value;
		var startDate=document.getElementById("startDate").value;
		var endDate=document.getElementById("endDate").value;
	    var col=document.getElementById("col").value;
		var opCod=document.getElementById("opCod").value;
		window.open ("showReport1.jsp?raq=/ganBuTongJi/ganBuTongJi_xq/hz2_xq.raq&tjDate="+tjDate+"&startDate="+startDate+"&endDate="+endDate+"&x="+x+"&y="+y+"&ds="+ds+"&col="+col+"&opCod="+opCod, 'newwindow', 'height=300, width=800, top=200, left=100, toolbar=no, menubar=no, scrollbars=no, resizable=no,location=n o, status=no'); 
	
	}

//汇总三弹框JS
	function hz3_tbzq(a,b,c){
		var y=a;
		var x=b;
		var ds=c;
		var tjDate=document.getElementById("tjDate").value;
		var startDate=document.getElementById("startDate").value;
		var endDate=document.getElementById("endDate").value;
	    var col=document.getElementById("col").value;
		var opCod=document.getElementById("opCod").value;
		window.open ("showReport1.jsp?raq=/ganBuTongJi/ganBuTongJi_xq/hz3_xq.raq&tjDate="+tjDate+"&startDate="+startDate+"&endDate="+endDate+"&x="+x+"&y="+y+"&ds="+ds+"&col="+col+"&opCod="+opCod, 'newwindow', 'scrollbars=yes,height=300, width=800, top=200, left=100, toolbar=no, menubar=no, scrollbars=no, resizable=no,location=n o, status=no'); 
	
	}

//机关一弹框JS
	function jg1_tbzq(a,b,c){
		var y=a;
		var x=b;
		var ds=c;
		var tjDate=document.getElementById("tjDate").value;
		var startDate=document.getElementById("startDate").value;
		var endDate=document.getElementById("endDate").value;
	    var col=document.getElementById("col").value;
		var opCod=document.getElementById("opCod").value;
		window.open ("showReport1.jsp?raq=/ganBuTongJi/ganBuTongJi_xq/jg1_xq.raq&tjDate="+tjDate+"&startDate="+startDate+"&endDate="+endDate+"&x="+x+"&y="+y+"&ds="+ds+"&col="+col+"&opCod="+opCod, 'newwindow', 'height=300, width=800, top=200, left=100, toolbar=no, menubar=no, scrollbars=no, resizable=no,location=n o, status=no'); 
	
	}



	//第一表弹框JS
	function d1b_tbzq(a,b,c){
		var y=a;
		var x=b;
		var ds=c;
		var tjDate=document.getElementById("tjDate").value;
		var startDate=document.getElementById("startDate").value;
		var endDate=document.getElementById("endDate").value;
	    var col=document.getElementById("col").value;
		var opCod=document.getElementById("opCod").value;
		window.open ("showReport1.jsp?raq=/ganBuTongJi/ganBuTongJi_xq/d1b_xq.raq&tjDate="+tjDate+"&startDate="+startDate+"&endDate="+endDate+"&x="+x+"&y="+y+"&ds="+ds+"&col="+col+"&opCod="+opCod, 'newwindow', ' scrollbars=yes,height=300, width=800, top=200, left=100, toolbar=no, menubar=no, scrollbars=no, resizable=no,location=n o, status=no'); 
	
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
		var opCod=document.getElementById("opCod").value;
		window.open ("showReport1.jsp?raq=/ganBuTongJi/ganBuTongJi_xq/d2b_xq.raq&tjDate="+tjDate+"&startDate="+startDate+"&endDate="+endDate+"&x="+x+"&y="+y+"&ds="+ds+"&col="+col+"&opCod="+opCod, 'newwindow', 'height=300, width=800, top=200, left=100, toolbar=no, menubar=no, scrollbars=no, resizable=no,location=n o, status=no'); 
	
	}


	//第三表弹框JS
	function d3b_tbzq(a,b,c){
		var y=a;
		var x=b;
		var ds=c;
		var tjDate=document.getElementById("tjDate").value;
		var startDate=document.getElementById("startDate").value;
		var endDate=document.getElementById("endDate").value;
	    var col=document.getElementById("col").value;
		var opCod=document.getElementById("opCod").value;
		window.open ("showReport1.jsp?raq=/ganBuTongJi/ganBuTongJi_xq/d3b_xq.raq&tjDate="+tjDate+"&startDate="+startDate+"&endDate="+endDate+"&x="+x+"&y="+y+"&ds="+ds+"&col="+col+"&opCod="+opCod, 'newwindow', 'height=300, width=800, top=200, left=100, toolbar=no, menubar=no, scrollbars=no, resizable=no,location=n o, status=no'); 
	
	}

	//第四表弹框JS
	function d4b_tbzq(a,b,c){
		var y=a;
		var x=b;
		var ds=c;
		var tjDate=document.getElementById("tjDate").value;
		var startDate=document.getElementById("startDate").value;
		var endDate=document.getElementById("endDate").value;
	    var col=document.getElementById("col").value;
		var opCod=document.getElementById("opCod").value;
		window.open ("showReport1.jsp?raq=/ganBuTongJi/ganBuTongJi_xq/d4b_xq.raq&tjDate="+tjDate+"&startDate="+startDate+"&endDate="+endDate+"&x="+x+"&y="+y+"&ds="+ds+"&col="+col+"&opCod="+opCod, 'newwindow', 'height=300, width=800, top=200, left=100, toolbar=no, menubar=no, scrollbars=no, resizable=no,location=n o, status=no'); 
	
	}



	//第五表弹框JS
	function d5b_tbzq(a,b,c){
		var y=a;
		var x=b;
		var ds=c;
		var tjDate=document.getElementById("tjDate").value;
		var startDate=document.getElementById("startDate").value;
		var endDate=document.getElementById("endDate").value;
	    var col=document.getElementById("col").value;
		var opCod=document.getElementById("opCod").value;
		window.open ("showReport1.jsp?raq=/ganBuTongJi/ganBuTongJi_xq/d5b_xq.raq&tjDate="+tjDate+"&startDate="+startDate+"&endDate="+endDate+"&x="+x+"&y="+y+"&ds="+ds+"&col="+col+"&opCod="+opCod, 'newwindow', 'height=300, width=800, top=200, left=100, toolbar=no, menubar=no, scrollbars=no, resizable=no,location=n o, status=no'); 
	
	}

		//第六表弹框JS
	function d6b_tbzq(a,b,c){
		var y=a;
		var x=b;
		var ds=c;
		var tjDate=document.getElementById("tjDate").value;
		var startDate=document.getElementById("startDate").value;
		var endDate=document.getElementById("endDate").value;
	    var col=document.getElementById("col").value;
		var opCod=document.getElementById("opCod").value;
		window.open ("showReport1.jsp?raq=/ganBuTongJi/ganBuTongJi_xq/d6b_xq.raq&tjDate="+tjDate+"&startDate="+startDate+"&endDate="+endDate+"&x="+x+"&y="+y+"&ds="+ds+"&col="+col+"&opCod="+opCod, 'newwindow', 'height=300, width=800, top=200, left=100, toolbar=no, menubar=no, scrollbars=no, resizable=no,location=n o, status=no'); 
	
	}


		//第七表弹框JS
	function d7b_tbzq(a,b,c){
		var y=a;
		var x=b;
		var ds=c;
		var tjDate=document.getElementById("tjDate").value;
		var startDate=document.getElementById("startDate").value;
		var endDate=document.getElementById("endDate").value;
	    var col=document.getElementById("col").value;
        var opCod=document.getElementById("opCod").value;
	   if (ds=='')
	   {
          window.open ("showReport1.jsp?raq=/ganBuTongJi/ganBuTongJi_xq/d7b_xq.raq&tjDate="+tjDate+"&startDate="+startDate+"&endDate="+endDate+"&x="+x+"&y="+y+"&ds="+ds+"&col="+col+"&opCod="+opCod, 'newwindow', 'height=300, width=800, top=200, left=100, toolbar=no, menubar=no, scrollbars=no, resizable=no,location=n o, status=no'); 
	
	   }
	   else if (ds=='2' || ds=='3')
	   {
		   window.open ("showReport1.jsp?raq=/ganBuTongJi/ganBuTongJi_xq/d7b_bd_xq.raq&tjDate="+tjDate+"&startDate="+startDate+"&endDate="+endDate+"&x="+x+"&y="+y+"&ds="+ds+"&col="+col+"&opCod="+opCod, 'newwindow', 'height=300, width=800, top=200, left=100, toolbar=no, menubar=no, scrollbars=no, resizable=no,location=n o, status=no'); 
	
	   }
		
		
	}


	
		//第八表弹框JS
	function d8b_tbzq(a,b,c){
		var y=a;
		var x=b;
		var ds=c;
		var tjDate=document.getElementById("tjDate").value;
		var startDate=document.getElementById("startDate").value;
		var endDate=document.getElementById("endDate").value;
	    var col=document.getElementById("col").value;
		var opCod=document.getElementById("opCod").value;
		window.open ("showReport1.jsp?raq=/ganBuTongJi/ganBuTongJi_xq/d8b_xq.raq&tjDate="+tjDate+"&startDate="+startDate+"&endDate="+endDate+"&x="+x+"&y="+y+"&ds="+ds+"&col="+col+"&opCod="+opCod, 'newwindow', 'height=300, width=800, top=200, left=100, toolbar=no, menubar=no, scrollbars=no, resizable=no,location=n o, status=no'); 
	
	}

	//第十表弹框JS
	function d10b_tbzq(a,b,c){
		var y=a;
		var x=b;
		var ds=c;
		var tjDate=document.getElementById("tjDate").value;
		var startDate=document.getElementById("startDate").value;
		var endDate=document.getElementById("endDate").value;
	    var col=document.getElementById("col").value;
		var opCod=document.getElementById("opCod").value;
	   if (ds==''|| ds=='4')
	   {
		   window.open ("showReport1.jsp?raq=/ganBuTongJi/ganBuTongJi_xq/d10b_xq.raq&tjDate="+tjDate+"&startDate="+startDate+"&endDate="+endDate+"&x="+x+"&y="+y+"&ds="+ds+"&col="+col+"&opCod="+opCod, 'newwindow', 'height=300, width=800, top=200, left=100, toolbar=no, menubar=no, scrollbars=no, resizable=no,location=n o, status=no'); 
	
	   }
	   else if (ds=='2')
	   {
		   window.open ("showReport1.jsp?raq=/ganBuTongJi/ganBuTongJi_xq/d10b_dw_xq.raq&tjDate="+tjDate+"&startDate="+startDate+"&endDate="+endDate+"&x="+x+"&y="+y+"&ds="+ds+"&col="+col+"&opCod="+opCod, 'newwindow', 'height=300, width=800, top=200, left=100, toolbar=no, menubar=no, scrollbars=no, resizable=no,location=n o, status=no'); 
	
	   }
		
		
	}


	//第十一表弹框JS
	function d11b_tbzq(a,b,c){
		var y=a;
		var x=b;
		var ds=c;
		var tjDate=document.getElementById("tjDate").value;
		var startDate=document.getElementById("startDate").value;
		var endDate=document.getElementById("endDate").value;
	    var col=document.getElementById("col").value;
		var opCod=document.getElementById("opCod").value;
		window.open ("showReport1.jsp?raq=/ganBuTongJi/ganBuTongJi_xq/d11b_xq.raq&tjDate="+tjDate+"&startDate="+startDate+"&endDate="+endDate+"&x="+x+"&y="+y+"&ds="+ds+"&col="+col+"&opCod="+opCod, 'newwindow', 'height=300, width=800, top=200, left=100, toolbar=no, menubar=no, scrollbars=no, resizable=no,location=n o, status=no'); 
	
	}


	//第十二表弹框JS
	function d12b_tbzq(a,b,c){
		var y=a;
		var x=b;
		var ds=c;
		var tjDate=document.getElementById("tjDate").value;
		var startDate=document.getElementById("startDate").value;
		var endDate=document.getElementById("endDate").value;
	    var col=document.getElementById("col").value;
		var opCod=document.getElementById("opCod").value;
		window.open ("showReport1.jsp?raq=/ganBuTongJi/ganBuTongJi_xq/d12b_xq.raq&tjDate="+tjDate+"&startDate="+startDate+"&endDate="+endDate+"&x="+x+"&y="+y+"&ds="+ds+"&col="+col+"&opCod="+opCod, 'newwindow', 'height=300, width=800, top=200, left=100, toolbar=no, menubar=no, scrollbars=no, resizable=no,location=n o, status=no'); 
	
	}



	//第十三表弹框JS
	function d13b_tbzq(a,b,c){
		var y=a;
		var x=b;
		var ds=c;
		var tjDate=document.getElementById("tjDate").value;
		var startDate=document.getElementById("startDate").value;
		var endDate=document.getElementById("endDate").value;
	    var col=document.getElementById("col").value;
		var opCod=document.getElementById("opCod").value;
		window.open ("showReport1.jsp?raq=/ganBuTongJi/ganBuTongJi_xq/d13b_xq.raq&tjDate="+tjDate+"&startDate="+startDate+"&endDate="+endDate+"&x="+x+"&y="+y+"&ds="+ds+"&col="+col+"&opCod="+opCod, 'newwindow', 'height=300, width=800, top=200, left=100, toolbar=no, menubar=no, scrollbars=no, resizable=no,location=n o, status=no'); 
	
	}



	//第十四表弹框JS
	function d14b_tbzq(a,b,c){
		var y=a;
		var x=b;
		var ds=c;
		var tjDate=document.getElementById("tjDate").value;
		var startDate=document.getElementById("startDate").value;
		var endDate=document.getElementById("endDate").value;
	    var col=document.getElementById("col").value;
		var opCod=document.getElementById("opCod").value;
		window.open ("showReport1.jsp?raq=/ganBuTongJi/ganBuTongJi_xq/d14b_xq.raq&tjDate="+tjDate+"&startDate="+startDate+"&endDate="+endDate+"&x="+x+"&y="+y+"&ds="+ds+"&col="+col+"&opCod="+opCod, 'newwindow', 'height=300, width=800, top=200, left=100, toolbar=no, menubar=no, scrollbars=no, resizable=no,location=n o, status=no'); 
	
	}



	//第十五表弹框JS
	function d15b_tbzq(a,b,c){
		var y=a;
		var x=b;
		var ds=c;
		var tjDate=document.getElementById("tjDate").value;
		var startDate=document.getElementById("startDate").value;
		var endDate=document.getElementById("endDate").value;
	    var col=document.getElementById("col").value;
        var opCod=document.getElementById("opCod").value;
	   if (ds=='')
	   {
		   window.open ("showReport1.jsp?raq=/ganBuTongJi/ganBuTongJi_xq/d15b_xq.raq&tjDate="+tjDate+"&startDate="+startDate+"&endDate="+endDate+"&x="+x+"&y="+y+"&ds="+ds+"&col="+col+"&opCod="+opCod, 'newwindow', 'height=300, width=800, top=200, left=100, toolbar=no, menubar=no, scrollbars=no, resizable=no,location=n o, status=no'); 
	
	   }
		else if (ds=='2')
		{
			window.open ("showReport1.jsp?raq=/ganBuTongJi/ganBuTongJi_xq/d15b_dw_xq.raq&tjDate="+tjDate+"&startDate="+startDate+"&endDate="+endDate+"&x="+x+"&y="+y+"&ds="+ds+"&col="+col+"&opCod="+opCod, 'newwindow', 'height=300, width=800, top=200, left=100, toolbar=no, menubar=no, scrollbars=no, resizable=no,location=n o, status=no'); 
	
		}
		
	}




		//第PM01表弹框JS
	function PM01_tbzq(a,b,c){
		var y=a;
		var x=b;
		var ds=c;
		var tjDate=document.getElementById("tjDate").value;
		var startDate=document.getElementById("startDate").value;
		var endDate=document.getElementById("endDate").value;
	    var col=document.getElementById("col").value;
        var opCod=document.getElementById("opCod").value;

	      if (ds=='')
	   {
          window.open ("showReport1.jsp?raq=/ganBuTongJi/ganBuTongJi_xq/PM01_bd_xq.raq&tjDate="+tjDate+"&startDate="+startDate+"&endDate="+endDate+"&x="+x+"&y="+y+"&ds="+ds+"&col="+col+"&opCod="+opCod, 'newwindow', 'height=300, width=800, top=200, left=100, toolbar=no, menubar=no, scrollbars=no, resizable=no,location=n o, status=no'); 
	
	   }
	   else if (ds=='2' )
	   {
		  window.open ("showReport1.jsp?raq=/ganBuTongJi/ganBuTongJi_xq/PM01_xq.raq&tjDate="+tjDate+"&startDate="+startDate+"&endDate="+endDate+"&x="+x+"&y="+y+"&ds="+ds+"&col="+col+"&opCod="+opCod, 'newwindow', 'height=300, width=800, top=200, left=100, toolbar=no, menubar=no, scrollbars=no, resizable=no,location=n o, status=no'); 
	
	   }
		
		
		
	}


		//第PM02表弹框JS
	function PM02_tbzq(a,b,c){
		var y=a;
		var x=b;
		var ds=c;
		var tjDate=document.getElementById("tjDate").value;
		var startDate=document.getElementById("startDate").value;
		var endDate=document.getElementById("endDate").value;
	    var col=document.getElementById("col").value;
		var opCod=document.getElementById("opCod").value;
		window.open ("showReport1.jsp?raq=/ganBuTongJi/ganBuTongJi_xq/PM02_xq.raq&tjDate="+tjDate+"&startDate="+startDate+"&endDate="+endDate+"&x="+x+"&y="+y+"&ds="+ds+"&col="+col+"&opCod="+opCod, 'newwindow', 'height=300, width=800, top=200, left=100, toolbar=no, menubar=no, scrollbars=no, resizable=no,location=n o, status=no'); 
	
	}


		//第PM03表弹框JS
	function PM03_tbzq(a,b,c){
		var y=a;
		var x=b;
		var ds=c;
		var tjDate=document.getElementById("tjDate").value;
		var startDate=document.getElementById("startDate").value;
		var endDate=document.getElementById("endDate").value;
	    var col=document.getElementById("col").value;
		var opCod=document.getElementById("opCod").value;
		window.open ("showReport1.jsp?raq=/ganBuTongJi/ganBuTongJi_xq/PM03_xq.raq&tjDate="+tjDate+"&startDate="+startDate+"&endDate="+endDate+"&x="+x+"&y="+y+"&ds="+ds+"&col="+col+"&opCod="+opCod, 'newwindow', 'height=300, width=800, top=200, left=100, toolbar=no, menubar=no, scrollbars=no, resizable=no,location=n o, status=no'); 
	
	}



		//第PM04表弹框JS
	function PM04_tbzq(a,b,c){
		var y=a;
		var x=b;
		var ds=c;
		var tjDate=document.getElementById("tjDate").value;
		var startDate=document.getElementById("startDate").value;
		var endDate=document.getElementById("endDate").value;
	    var col=document.getElementById("col").value;
		var opCod=document.getElementById("opCod").value;
		window.open ("showReport1.jsp?raq=/ganBuTongJi/ganBuTongJi_xq/PM04_xq.raq&tjDate="+tjDate+"&startDate="+startDate+"&endDate="+endDate+"&x="+x+"&y="+y+"&ds="+ds+"&col="+col+"&opCod="+opCod, 'newwindow', 'height=300, width=800, top=200, left=100, toolbar=no, menubar=no, scrollbars=no, resizable=no,location=n o, status=no'); 
	
	}



		//第PM05表弹框JS
	function PM05_tbzq(a,b,c){
		var y=a;
		var x=b;
		var ds=c;
		var tjDate=document.getElementById("tjDate").value;
		var startDate=document.getElementById("startDate").value;
		var endDate=document.getElementById("endDate").value;
	    var col=document.getElementById("col").value;
		var opCod=document.getElementById("opCod").value;
		window.open ("showReport1.jsp?raq=/ganBuTongJi/ganBuTongJi_xq/PM05_xq.raq&tjDate="+tjDate+"&startDate="+startDate+"&endDate="+endDate+"&x="+x+"&y="+y+"&ds="+ds+"&col="+col+"&opCod="+opCod, 'newwindow', 'height=300, width=800, top=200, left=100, toolbar=no, menubar=no, scrollbars=no, resizable=no,location=n o, status=no'); 
	
	}


		//第PM06表弹框JS
	function PM06_tbzq(a,b,c){
		var y=a;
		var x=b;
		var ds=c;
		var tjDate=document.getElementById("tjDate").value;
		var startDate=document.getElementById("startDate").value;
		var endDate=document.getElementById("endDate").value;
	    var col=document.getElementById("col").value;
		var opCod=document.getElementById("opCod").value;
		window.open ("showReport1.jsp?raq=/ganBuTongJi/ganBuTongJi_xq/PM06_xq.raq&tjDate="+tjDate+"&startDate="+startDate+"&endDate="+endDate+"&x="+x+"&y="+y+"&ds="+ds+"&col="+col+"&opCod="+opCod, 'newwindow', 'height=300, width=800, top=200, left=100, toolbar=no, menubar=no, scrollbars=no, resizable=no,location=n o, status=no'); 
	
	}


		//第PM07表弹框JS
	function PM07_tbzq(a,b,c){
		var y=a;
		var x=b;
		var ds=c;
		var tjDate=document.getElementById("tjDate").value;
		var startDate=document.getElementById("startDate").value;
		var endDate=document.getElementById("endDate").value;
	    var col=document.getElementById("col").value;
		var opCod=document.getElementById("opCod").value;
		window.open ("showReport1.jsp?raq=/ganBuTongJi/ganBuTongJi_xq/PM07_xq.raq&tjDate="+tjDate+"&startDate="+startDate+"&endDate="+endDate+"&x="+x+"&y="+y+"&ds="+ds+"&col="+col+"&opCod="+opCod, 'newwindow', 'height=300, width=800, top=200, left=100, toolbar=no, menubar=no, scrollbars=no, resizable=no,location=n o, status=no'); 
	
	}


		//第三十三表弹框JS
	function d33b_tbzq(a,b,c){
		var y=a;
		var x=b;
		var ds=c;
		var tjDate=document.getElementById("tjDate").value;
		var startDate=document.getElementById("startDate").value;
		var endDate=document.getElementById("endDate").value;
	    var col=document.getElementById("col").value;
		var opCod=document.getElementById("opCod").value;
		window.open ("showReport1.jsp?raq=/ganBuTongJi/ganBuTongJi_xq/d33b_xq.raq&tjDate="+tjDate+"&startDate="+startDate+"&endDate="+endDate+"&x="+x+"&y="+y+"&ds="+ds+"&col="+col+"&opCod="+opCod, 'newwindow', 'height=300, width=800, top=200, left=100, toolbar=no, menubar=no, scrollbars=no, resizable=no,location=n o, status=no'); 
	
	}


		//第三十四表弹框JS
	function d34b_tbzq(a,b,c){
		var y=a;
		var x=b;
		var ds=c;
		var tjDate=document.getElementById("tjDate").value;
		var startDate=document.getElementById("startDate").value;
		var endDate=document.getElementById("endDate").value;
	    var col=document.getElementById("col").value;
		var opCod=document.getElementById("opCod").value;
		window.open ("showReport1.jsp?raq=/ganBuTongJi/ganBuTongJi_xq/d34b_xq.raq&tjDate="+tjDate+"&startDate="+startDate+"&endDate="+endDate+"&x="+x+"&y="+y+"&ds="+ds+"&col="+col+"&opCod="+opCod, 'newwindow', 'height=300, width=800, top=200, left=100, toolbar=no, menubar=no, scrollbars=no, resizable=no,location=n o, status=no'); 
	
	}


		//第三十五表弹框JS
	function d35b_tbzq(a,b,c){
		var y=a;
		var x=b;
		var ds=c;
		var tjDate=document.getElementById("tjDate").value;
		var startDate=document.getElementById("startDate").value;
		var endDate=document.getElementById("endDate").value;
	    var col=document.getElementById("col").value;
        var opCod=document.getElementById("opCod").value;
	   if (ds=='')
	   {
		   window.open ("showReport1.jsp?raq=/ganBuTongJi/ganBuTongJi_xq/d35b_bd_xq.raq&tjDate="+tjDate+"&startDate="+startDate+"&endDate="+endDate+"&x="+x+"&y="+y+"&ds="+ds+"&col="+col+"&opCod="+opCod, 'newwindow', 'height=300, width=800, top=200, left=100, toolbar=no, menubar=no, scrollbars=no, resizable=no,location=n o, status=no'); 
	
	   }
	   else if (ds=='2')
	   {
		   window.open ("showReport1.jsp?raq=/ganBuTongJi/ganBuTongJi_xq/d35b_xq.raq&tjDate="+tjDate+"&startDate="+startDate+"&endDate="+endDate+"&x="+x+"&y="+y+"&ds="+ds+"&col="+col+"&opCod="+opCod, 'newwindow', 'height=300, width=800, top=200, left=100, toolbar=no, menubar=no, scrollbars=no, resizable=no,location=n o, status=no'); 
	
	   }
		
		
	}


		//第三十六表弹框JS
	function d36b_tbzq(a,b,c){
		var y=a;
		var x=b;
		var ds=c;
		var tjDate=document.getElementById("tjDate").value;
		var startDate=document.getElementById("startDate").value;
		var endDate=document.getElementById("endDate").value;
	    var col=document.getElementById("col").value;
		var opCod=document.getElementById("opCod").value;
		window.open ("showReport1.jsp?raq=/ganBuTongJi/ganBuTongJi_xq/d36b_xq.raq&tjDate="+tjDate+"&startDate="+startDate+"&endDate="+endDate+"&x="+x+"&y="+y+"&ds="+ds+"&col="+col+"&opCod="+opCod, 'newwindow', 'height=300, width=800, top=200, left=100, toolbar=no, menubar=no, scrollbars=no, resizable=no,location=n o, status=no'); 
	
	}
	
	//新一表弹框JS
	function x1b_tbzq(a,b,c){
		var y=a;
		var x=b;
		var ds=c;
		var tjDate=document.getElementById("tjDate").value;
		var startDate=document.getElementById("startDate").value;
		var endDate=document.getElementById("endDate").value;
	    var col=document.getElementById("col").value;
		var opCod=document.getElementById("opCod").value;
		window.open ("showReport1.jsp?raq=/ganBuTongJi/ganBuTongJi_xq/x1b_xq.raq&tjDate="+tjDate+"&startDate="+startDate+"&endDate="+endDate+"&x="+x+"&y="+y+"&ds="+ds+"&col="+col+"&opCod="+opCod, 'newwindow', 'height=300, width=800, top=200, left=100, toolbar=no, menubar=no, scrollbars=no, resizable=no,location=n o, status=no'); 
	
	}
	//新二表弹框JS
	function x2b_tbzq(a,b,c){
		var y=a;
		var x=b;
		var ds=c;
		var tjDate=document.getElementById("tjDate").value;
		var startDate=document.getElementById("startDate").value;
		var endDate=document.getElementById("endDate").value;
	    var col=document.getElementById("col").value;
		var opCod=document.getElementById("opCod").value;
		window.open ("showReport1.jsp?raq=/ganBuTongJi/ganBuTongJi_xq/x2b_xq.raq&tjDate="+tjDate+"&startDate="+startDate+"&endDate="+endDate+"&x="+x+"&y="+y+"&ds="+ds+"&col="+col+"&opCod="+opCod, 'newwindow', 'height=300, width=800, top=200, left=100, toolbar=no, menubar=no, scrollbars=no, resizable=no,location=n o, status=no'); 
	
	}
	//新四表弹框JS
	function x4b_tbzq(a,b,c){
		var y=a;
		var x=b;
		var ds=c;
		var tjDate=document.getElementById("tjDate").value;
		var startDate=document.getElementById("startDate").value;
		var endDate=document.getElementById("endDate").value;
	    var col=document.getElementById("col").value;
		var opCod=document.getElementById("opCod").value;
		window.open ("showReport1.jsp?raq=/ganBuTongJi/ganBuTongJi_xq/x4b_xq.raq&tjDate="+tjDate+"&startDate="+startDate+"&endDate="+endDate+"&x="+x+"&y="+y+"&ds="+ds+"&col="+col+"&opCod="+opCod, 'newwindow', 'height=300, width=800, top=200, left=100, toolbar=no, menubar=no, scrollbars=no, resizable=no,location=n o, status=no'); 
	
	}
	//新五表弹框JS
	function x5b_tbzq(a,b,c){
		var y=a;
		var x=b;
		var ds=c;
		var tjDate=document.getElementById("tjDate").value;
		var startDate=document.getElementById("startDate").value;
		var endDate=document.getElementById("endDate").value;
	    var col=document.getElementById("col").value;
		var opCod=document.getElementById("opCod").value;
		window.open ("showReport1.jsp?raq=/ganBuTongJi/ganBuTongJi_xq/x5b_xq.raq&tjDate="+tjDate+"&startDate="+startDate+"&endDate="+endDate+"&x="+x+"&y="+y+"&ds="+ds+"&col="+col+"&opCod="+opCod, 'newwindow', 'height=300, width=800, top=200, left=100, toolbar=no, menubar=no, scrollbars=no, resizable=no,location=n o, status=no'); 
	
	}
	//新六表弹框JS
	function x6b_tbzq(a,b,c){
		var y=a;
		var x=b;
		var ds=c;
		var tjDate=document.getElementById("tjDate").value;
		var startDate=document.getElementById("startDate").value;
		var endDate=document.getElementById("endDate").value;
	    var col=document.getElementById("col").value;
		var opCod=document.getElementById("opCod").value;
		window.open ("showReport1.jsp?raq=/ganBuTongJi/ganBuTongJi_xq/x6b_xq.raq&tjDate="+tjDate+"&startDate="+startDate+"&endDate="+endDate+"&x="+x+"&y="+y+"&ds="+ds+"&col="+col+"&opCod="+opCod, 'newwindow', 'height=300, width=800, top=200, left=100, toolbar=no, menubar=no, scrollbars=no, resizable=no,location=n o, status=no'); 
	
	}
	//新七表弹框JS
	function x7b_tbzq(a,b,c){
		var y=a;
		var x=b;
		var ds=c;
		var tjDate=document.getElementById("tjDate").value;
		var startDate=document.getElementById("startDate").value;
		var endDate=document.getElementById("endDate").value;
	    var col=document.getElementById("col").value;
		var opCod=document.getElementById("opCod").value;
		window.open ("showReport1.jsp?raq=/ganBuTongJi/ganBuTongJi_xq/x7b_xq.raq&tjDate="+tjDate+"&startDate="+startDate+"&endDate="+endDate+"&x="+x+"&y="+y+"&ds="+ds+"&col="+col+"&opCod="+opCod, 'newwindow', 'height=300, width=800, top=200, left=100, toolbar=no, menubar=no, scrollbars=no, resizable=no,location=n o, status=no'); 
	
	}
	//新八表弹框JS
	function x8b_tbzq(a,b,c){
		var y=a;
		var x=b;
		var ds=c;
		var tjDate=document.getElementById("tjDate").value;
		var startDate=document.getElementById("startDate").value;
		var endDate=document.getElementById("endDate").value;
	    var col=document.getElementById("col").value;
		var opCod=document.getElementById("opCod").value;
		window.open ("showReport1.jsp?raq=/ganBuTongJi/ganBuTongJi_xq/x8b_xq.raq&tjDate="+tjDate+"&startDate="+startDate+"&endDate="+endDate+"&x="+x+"&y="+y+"&ds="+ds+"&col="+col+"&opCod="+opCod, 'newwindow', 'height=300, width=800, top=200, left=100, toolbar=no, menubar=no, scrollbars=no, resizable=no,location=n o, status=no'); 
	
	}
	//新九表弹框JS
	function x9b_tbzq(a,b,c){
		var y=a;
		var x=b;
		var ds=c;
		var tjDate=document.getElementById("tjDate").value;
		var startDate=document.getElementById("startDate").value;
		var endDate=document.getElementById("endDate").value;
	    var col=document.getElementById("col").value;
		var opCod=document.getElementById("opCod").value;
		window.open ("showReport1.jsp?raq=/ganBuTongJi/ganBuTongJi_xq/x9b_xq.raq&tjDate="+tjDate+"&startDate="+startDate+"&endDate="+endDate+"&x="+x+"&y="+y+"&ds="+ds+"&col="+col+"&opCod="+opCod, 'newwindow', 'height=300, width=800, top=200, left=100, toolbar=no, menubar=no, scrollbars=no, resizable=no,location=n o, status=no'); 
	
	}
	//新十表弹框JS
	function x10b_tbzq(a,b,c){
		var y=a;
		var x=b;
		var ds=c;
		var tjDate=document.getElementById("tjDate").value;
		var startDate=document.getElementById("startDate").value;
		var endDate=document.getElementById("endDate").value;
	    var col=document.getElementById("col").value;
		var opCod=document.getElementById("opCod").value;
		window.open ("showReport1.jsp?raq=/ganBuTongJi/ganBuTongJi_xq/x10b_xq.raq&tjDate="+tjDate+"&startDate="+startDate+"&endDate="+endDate+"&x="+x+"&y="+y+"&ds="+ds+"&col="+col+"&opCod="+opCod, 'newwindow', 'height=300, width=800, top=200, left=100, toolbar=no, menubar=no, scrollbars=no, resizable=no,location=n o, status=no'); 
	
	}
	//新十一表弹框JS
	function x11b_tbzq(a,b,c){
		var y=a;
		var x=b;
		var ds=c;
		var tjDate=document.getElementById("tjDate").value;
		var startDate=document.getElementById("startDate").value;
		var endDate=document.getElementById("endDate").value;
	    var col=document.getElementById("col").value;
		var opCod=document.getElementById("opCod").value;
		window.open ("showReport1.jsp?raq=/ganBuTongJi/ganBuTongJi_xq/x11b_xq.raq&tjDate="+tjDate+"&startDate="+startDate+"&endDate="+endDate+"&x="+x+"&y="+y+"&ds="+ds+"&col="+col+"&opCod="+opCod, 'newwindow', 'height=300, width=800, top=200, left=100, toolbar=no, menubar=no, scrollbars=no, resizable=no,location=n o, status=no'); 
	
	}
	//新十二表弹框JS
	function x12b_tbzq(a,b,c){
		var y=a;
		var x=b;
		var ds=c;
		var tjDate=document.getElementById("tjDate").value;
		var startDate=document.getElementById("startDate").value;
		var endDate=document.getElementById("endDate").value;
	    var col=document.getElementById("col").value;
		var opCod=document.getElementById("opCod").value;
		window.open ("showReport1.jsp?raq=/ganBuTongJi/ganBuTongJi_xq/x12b_xq.raq&tjDate="+tjDate+"&startDate="+startDate+"&endDate="+endDate+"&x="+x+"&y="+y+"&ds="+ds+"&col="+col+"&opCod="+opCod, 'newwindow', 'height=300, width=800, top=200, left=100, toolbar=no, menubar=no, scrollbars=no, resizable=no,location=n o, status=no'); 
	
	}
	//新十三表弹框JS
	function x13b_tbzq(a,b,c){
		var y=a;
		var x=b;
		var ds=c;
		var tjDate=document.getElementById("tjDate").value;
		var startDate=document.getElementById("startDate").value;
		var endDate=document.getElementById("endDate").value;
	    var col=document.getElementById("col").value;
		var opCod=document.getElementById("opCod").value;
		window.open ("showReport1.jsp?raq=/ganBuTongJi/ganBuTongJi_xq/x13b_xq.raq&tjDate="+tjDate+"&startDate="+startDate+"&endDate="+endDate+"&x="+x+"&y="+y+"&ds="+ds+"&col="+col+"&opCod="+opCod, 'newwindow', 'height=300, width=800, top=200, left=100, toolbar=no, menubar=no, scrollbars=no, resizable=no,location=n o, status=no'); 
	
	}//新十四表弹框JS
	function x14b_tbzq(a,b,c){
		var y=a;
		var x=b;
		var ds=c;
		var tjDate=document.getElementById("tjDate").value;
		var startDate=document.getElementById("startDate").value;
		var endDate=document.getElementById("endDate").value;
	    var col=document.getElementById("col").value;
		var opCod=document.getElementById("opCod").value;
		window.open ("showReport1.jsp?raq=/ganBuTongJi/ganBuTongJi_xq/x14b_xq.raq&tjDate="+tjDate+"&startDate="+startDate+"&endDate="+endDate+"&x="+x+"&y="+y+"&ds="+ds+"&col="+col+"&opCod="+opCod, 'newwindow', 'height=300, width=800, top=200, left=100, toolbar=no, menubar=no, scrollbars=no, resizable=no,location=n o, status=no'); 
	
	}
	//新十五表弹框JS
	function x15b_tbzq(a,b,c){
		var y=a;
		var x=b;
		var ds=c;
		var tjDate=document.getElementById("tjDate").value;
		var startDate=document.getElementById("startDate").value;
		var endDate=document.getElementById("endDate").value;
	    var col=document.getElementById("col").value;
		var opCod=document.getElementById("opCod").value;
		window.open ("showReport1.jsp?raq=/ganBuTongJi/ganBuTongJi_xq/x15b_xq.raq&tjDate="+tjDate+"&startDate="+startDate+"&endDate="+endDate+"&x="+x+"&y="+y+"&ds="+ds+"&col="+col+"&opCod="+opCod, 'newwindow', 'height=300, width=800, top=200, left=100, toolbar=no, menubar=no, scrollbars=no, resizable=no,location=n o, status=no'); 
	
	}
	//新十六表弹框JS
	function x16b_tbzq(a,b,c){
		var y=a;
		var x=b;
		var ds=c;
		var tjDate=document.getElementById("tjDate").value;
		var startDate=document.getElementById("startDate").value;
		var endDate=document.getElementById("endDate").value;
	    var col=document.getElementById("col").value;
		var opCod=document.getElementById("opCod").value;
		window.open ("showReport1.jsp?raq=/ganBuTongJi/ganBuTongJi_xq/x16b_xq.raq&tjDate="+tjDate+"&startDate="+startDate+"&endDate="+endDate+"&x="+x+"&y="+y+"&ds="+ds+"&col="+col+"&opCod="+opCod, 'newwindow', 'height=300, width=800, top=200, left=100, toolbar=no, menubar=no, scrollbars=no, resizable=no,location=n o, status=no'); 
	
	}
	//新十七表弹框JS
	function x17b_tbzq(a,b,c){
		var y=a;
		var x=b;
		var ds=c;
		var tjDate=document.getElementById("tjDate").value;
		var startDate=document.getElementById("startDate").value;
		var endDate=document.getElementById("endDate").value;
	    var col=document.getElementById("col").value;
		var opCod=document.getElementById("opCod").value;
		window.open ("showReport1.jsp?raq=/ganBuTongJi/ganBuTongJi_xq/x17b_xq.raq&tjDate="+tjDate+"&startDate="+startDate+"&endDate="+endDate+"&x="+x+"&y="+y+"&ds="+ds+"&col="+col+"&opCod="+opCod, 'newwindow', 'height=300, width=800, top=200, left=100, toolbar=no, menubar=no, scrollbars=no, resizable=no,location=n o, status=no'); 
	
	}
	//新十八表弹框JS
	function x18b_tbzq(a,b,c){
		var y=a;
		var x=b;
		var ds=c;
		var tjDate=document.getElementById("tjDate").value;
		var startDate=document.getElementById("startDate").value;
		var endDate=document.getElementById("endDate").value;
	    var col=document.getElementById("col").value;
		var opCod=document.getElementById("opCod").value;
		window.open ("showReport1.jsp?raq=/ganBuTongJi/ganBuTongJi_xq/x18b_xq.raq&tjDate="+tjDate+"&startDate="+startDate+"&endDate="+endDate+"&x="+x+"&y="+y+"&ds="+ds+"&col="+col+"&opCod="+opCod, 'newwindow', 'height=300, width=800, top=200, left=100, toolbar=no, menubar=no, scrollbars=no, resizable=no,location=n o, status=no'); 
	
	}
	//新十九表弹框JS
	function x19b_tbzq(a,b,c){
		var y=a;
		var x=b;
		var ds=c;
		var tjDate=document.getElementById("tjDate").value;
		var startDate=document.getElementById("startDate").value;
		var endDate=document.getElementById("endDate").value;
	    var col=document.getElementById("col").value;
		var opCod=document.getElementById("opCod").value;
		window.open ("showReport1.jsp?raq=/ganBuTongJi/ganBuTongJi_xq/x19b_xq.raq&tjDate="+tjDate+"&startDate="+startDate+"&endDate="+endDate+"&x="+x+"&y="+y+"&ds="+ds+"&col="+col+"&opCod="+opCod, 'newwindow', 'height=300, width=800, top=200, left=100, toolbar=no, menubar=no, scrollbars=no, resizable=no,location=n o, status=no'); 
	
	}
	//新二十表弹框JS
	function x20b_tbzq(a,b,c){
		var y=a;
		var x=b;
		var ds=c;
		var tjDate=document.getElementById("tjDate").value;
		var startDate=document.getElementById("startDate").value;
		var endDate=document.getElementById("endDate").value;
	    var col=document.getElementById("col").value;
		var opCod=document.getElementById("opCod").value;
		window.open ("showReport1.jsp?raq=/ganBuTongJi/ganBuTongJi_xq/x20b_xq.raq&tjDate="+tjDate+"&startDate="+startDate+"&endDate="+endDate+"&x="+x+"&y="+y+"&ds="+ds+"&col="+col+"&opCod="+opCod, 'newwindow', 'height=300, width=800, top=200, left=100, toolbar=no, menubar=no, scrollbars=no, resizable=no,location=n o, status=no'); 
	
	}
	
	//PS01表弹框JS
	function PS01_tbzq(a,b,c){
		var y=a;
		var x=b;
		var ds=c;
		var tjDate=document.getElementById("tjDate").value;
		var startDate=document.getElementById("startDate").value;
		var endDate=document.getElementById("endDate").value;
	    var col=document.getElementById("col").value;
		var opCod=document.getElementById("opCod").value;
		window.open ("showReport1.jsp?raq=/ganBuTongJi/ganBuTongJi_xq/PS01_xq.raq&tjDate="+tjDate+"&startDate="+startDate+"&endDate="+endDate+"&x="+x+"&y="+y+"&ds="+ds+"&col="+col+"&opCod="+opCod, 'newwindow', 'height=300, width=800, top=200, left=100, toolbar=no, menubar=no, scrollbars=no, resizable=no,location=n o, status=no'); 
	
	}
	//PS02表弹框JS
	function PS02_tbzq(a,b,c){
		var y=a;
		var x=b;
		var ds=c;
		var tjDate=document.getElementById("tjDate").value;
		var startDate=document.getElementById("startDate").value;
		var endDate=document.getElementById("endDate").value;
	    var col=document.getElementById("col").value;
		var opCod=document.getElementById("opCod").value;
		window.open ("showReport1.jsp?raq=/ganBuTongJi/ganBuTongJi_xq/PS02_xq.raq&tjDate="+tjDate+"&startDate="+startDate+"&endDate="+endDate+"&x="+x+"&y="+y+"&ds="+ds+"&col="+col+"&opCod="+opCod, 'newwindow', 'height=300, width=800, top=200, left=100, toolbar=no, menubar=no, scrollbars=no, resizable=no,location=n o, status=no'); 
	
	}
	//PS03表弹框JS
	function PS03_tbzq(a,b,c){
		var y=a;
		var x=b;
		var ds=c;
		var tjDate=document.getElementById("tjDate").value;
		var startDate=document.getElementById("startDate").value;
		var endDate=document.getElementById("endDate").value;
	    var col=document.getElementById("col").value;
		var opCod=document.getElementById("opCod").value;
		window.open ("showReport1.jsp?raq=/ganBuTongJi/ganBuTongJi_xq/PS03_xq.raq&tjDate="+tjDate+"&startDate="+startDate+"&endDate="+endDate+"&x="+x+"&y="+y+"&ds="+ds+"&col="+col+"&opCod="+opCod, 'newwindow', 'height=300, width=800, top=200, left=100, toolbar=no, menubar=no, scrollbars=no, resizable=no,location=n o, status=no'); 
	
	}
	//PS04表弹框JS
	function PS04_tbzq(a,b,c){
		var y=a;
		var x=b;
		var ds=c;
		var tjDate=document.getElementById("tjDate").value;
		var startDate=document.getElementById("startDate").value;
		var endDate=document.getElementById("endDate").value;
	    var col=document.getElementById("col").value;
		var opCod=document.getElementById("opCod").value;
		window.open ("showReport1.jsp?raq=/ganBuTongJi/ganBuTongJi_xq/PS04_xq.raq&tjDate="+tjDate+"&startDate="+startDate+"&endDate="+endDate+"&x="+x+"&y="+y+"&ds="+ds+"&col="+col+"&opCod="+opCod, 'newwindow', 'height=300, width=800, top=200, left=100, toolbar=no, menubar=no, scrollbars=no, resizable=no,location=n o, status=no'); 
	
	}
	//PS05表弹框JS
	function PS05_tbzq(a,b,c){
		var y=a;
		var x=b;
		var ds=c;
		var tjDate=document.getElementById("tjDate").value;
		var startDate=document.getElementById("startDate").value;
		var endDate=document.getElementById("endDate").value;
	    var col=document.getElementById("col").value;
		var opCod=document.getElementById("opCod").value;
		window.open ("showReport1.jsp?raq=/ganBuTongJi/ganBuTongJi_xq/PS05_xq.raq&tjDate="+tjDate+"&startDate="+startDate+"&endDate="+endDate+"&x="+x+"&y="+y+"&ds="+ds+"&col="+col+"&opCod="+opCod, 'newwindow', 'height=300, width=800, top=200, left=100, toolbar=no, menubar=no, scrollbars=no, resizable=no,location=n o, status=no'); 
	
	}
	//PS06表弹框JS
	function PS06_tbzq(a,b,c){
		var y=a;
		var x=b;
		var ds=c;
		var tjDate=document.getElementById("tjDate").value;
		var startDate=document.getElementById("startDate").value;
		var endDate=document.getElementById("endDate").value;
	    var col=document.getElementById("col").value;
		var opCod=document.getElementById("opCod").value;
		window.open ("showReport1.jsp?raq=/ganBuTongJi/ganBuTongJi_xq/PS06_xq.raq&tjDate="+tjDate+"&startDate="+startDate+"&endDate="+endDate+"&x="+x+"&y="+y+"&ds="+ds+"&col="+col+"&opCod="+opCod, 'newwindow', 'height=300, width=800, top=200, left=100, toolbar=no, menubar=no, scrollbars=no, resizable=no,location=n o, status=no'); 
	
	}
	//PS07表弹框JS
	function PS07_tbzq(a,b,c){
		var y=a;
		var x=b;
		var ds=c;
		var tjDate=document.getElementById("tjDate").value;
		var startDate=document.getElementById("startDate").value;
		var endDate=document.getElementById("endDate").value;
	    var col=document.getElementById("col").value;
		var opCod=document.getElementById("opCod").value;
		window.open ("showReport1.jsp?raq=/ganBuTongJi/ganBuTongJi_xq/PS07_xq.raq&tjDate="+tjDate+"&startDate="+startDate+"&endDate="+endDate+"&x="+x+"&y="+y+"&ds="+ds+"&col="+col+"&opCod="+opCod, 'newwindow', 'height=300, width=800, top=200, left=100, toolbar=no, menubar=no, scrollbars=no, resizable=no,location=n o, status=no'); 
	
	}
	//PS08表弹框JS
	function PS08_tbzq(a,b,c){
		var y=a;
		var x=b;
		var ds=c;
		var tjDate=document.getElementById("tjDate").value;
		var startDate=document.getElementById("startDate").value;
		var endDate=document.getElementById("endDate").value;
	    var col=document.getElementById("col").value;
		var opCod=document.getElementById("opCod").value;
		window.open ("showReport1.jsp?raq=/ganBuTongJi/ganBuTongJi_xq/PS08_xq.raq&tjDate="+tjDate+"&startDate="+startDate+"&endDate="+endDate+"&x="+x+"&y="+y+"&ds="+ds+"&col="+col+"&opCod="+opCod, 'newwindow', 'height=300, width=800, top=200, left=100, toolbar=no, menubar=no, scrollbars=no, resizable=no,location=n o, status=no'); 
	
	}
	//PS09表弹框JS
	function PS09_tbzq(a,b,c){
		var y=a;
		var x=b;
		var ds=c;
		var tjDate=document.getElementById("tjDate").value;
		var startDate=document.getElementById("startDate").value;
		var endDate=document.getElementById("endDate").value;
	    var col=document.getElementById("col").value;
		var opCod=document.getElementById("opCod").value;
		window.open ("showReport1.jsp?raq=/ganBuTongJi/ganBuTongJi_xq/PS09_xq.raq&tjDate="+tjDate+"&startDate="+startDate+"&endDate="+endDate+"&x="+x+"&y="+y+"&ds="+ds+"&col="+col+"&opCod="+opCod, 'newwindow', 'height=300, width=800, top=200, left=100, toolbar=no, menubar=no, scrollbars=no, resizable=no,location=n o, status=no'); 
	
	}
	//PS10表弹框JS
	function PS10_tbzq(a,b,c){
		var y=a;
		var x=b;
		var ds=c;
		var tjDate=document.getElementById("tjDate").value;
		var startDate=document.getElementById("startDate").value;
		var endDate=document.getElementById("endDate").value;
	    var col=document.getElementById("col").value;
		var opCod=document.getElementById("opCod").value;
		window.open ("showReport1.jsp?raq=/ganBuTongJi/ganBuTongJi_xq/PS10_xq.raq&tjDate="+tjDate+"&startDate="+startDate+"&endDate="+endDate+"&x="+x+"&y="+y+"&ds="+ds+"&col="+col+"&opCod="+opCod, 'newwindow', 'height=300, width=800, top=200, left=100, toolbar=no, menubar=no, scrollbars=no, resizable=no,location=n o, status=no'); 
	
	}
	//PS11表弹框JS
	function PS11_tbzq(a,b,c){
		var y=a;
		var x=b;
		var ds=c;
		var tjDate=document.getElementById("tjDate").value;
		var startDate=document.getElementById("startDate").value;
		var endDate=document.getElementById("endDate").value;
	    var col=document.getElementById("col").value;
		var opCod=document.getElementById("opCod").value;
		window.open ("showReport1.jsp?raq=/ganBuTongJi/ganBuTongJi_xq/PS11_xq.raq&tjDate="+tjDate+"&startDate="+startDate+"&endDate="+endDate+"&x="+x+"&y="+y+"&ds="+ds+"&col="+col+"&opCod="+opCod, 'newwindow', 'height=300, width=800, top=200, left=100, toolbar=no, menubar=no, scrollbars=no, resizable=no,location=n o, status=no'); 
	
	}
	