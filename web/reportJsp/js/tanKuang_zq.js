


	//����һ����JS
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

   	
	//���ܶ�����JS
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

//����������JS
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

//����һ����JS
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



	//��һ����JS
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


	//�ڶ�����JS
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


	//��������JS
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

	//���ı���JS
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



	//�������JS
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

		//��������JS
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


		//���߱���JS
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


	
		//�ڰ˱���JS
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

	//��ʮ����JS
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


	//��ʮһ����JS
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


	//��ʮ������JS
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



	//��ʮ������JS
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



	//��ʮ�ı���JS
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



	//��ʮ�����JS
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




		//��PM01����JS
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


		//��PM02����JS
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


		//��PM03����JS
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



		//��PM04����JS
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



		//��PM05����JS
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


		//��PM06����JS
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


		//��PM07����JS
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


		//����ʮ������JS
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


		//����ʮ�ı���JS
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


		//����ʮ�����JS
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


		//����ʮ������JS
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
	
	//��һ����JS
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
	//�¶�����JS
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
	//���ı���JS
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
	//�������JS
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
	//��������JS
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
	//���߱���JS
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
	//�°˱���JS
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
	//�¾ű���JS
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
	//��ʮ����JS
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
	//��ʮһ����JS
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
	//��ʮ������JS
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
	//��ʮ������JS
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
	
	}//��ʮ�ı���JS
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
	//��ʮ�����JS
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
	//��ʮ������JS
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
	//��ʮ�߱���JS
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
	//��ʮ�˱���JS
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
	//��ʮ�ű���JS
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
	//�¶�ʮ����JS
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
	
	//PS01����JS
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
	//PS02����JS
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
	//PS03����JS
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
	//PS04����JS
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
	//PS05����JS
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
	//PS06����JS
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
	//PS07����JS
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
	//PS08����JS
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
	//PS09����JS
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
	//PS10����JS
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
	//PS11����JS
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
	