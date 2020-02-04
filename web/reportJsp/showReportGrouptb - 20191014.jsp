<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/WEB-INF/runqianReport4.tld" prefix="report" %>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>
<%@ page import="com.runqian.report4.usermodel.Context"%>
<%@ page import="com.runqian.report4.util.ReportUtils"%>
<%@ page import="com.runqian.report4.model.ReportDefine"%>
<%@ page import="com.runqian.report4.usermodel.ReportGroup"%>
<%@ page import="com.runqian.report4.usermodel.SubReportConfig"%>

<%@ page import="com.runqian.report4.usermodel.ReportGroupItem"%> 

<html>

<link type="text/css" href="css/style.css" rel="stylesheet"/>
<script type="text/javascript" src="js/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="js/layer-v2.1/layer/layer.js"></script>


<script type="text/javascript">
	//����JS
	function tanKuang(){
	
		//alert("����");
		window.open ('showReport1.jsp?raq=/ganBuTongJi/ganBuTongJi_tbzq/detailTable.raq', 'newwindow', 'height=300, width=800, top=200, left=100, toolbar=no, menubar=no, scrollbars=no, resizable=no,location=n o, status=no'); 
	
	};
</script>


<body topmargin=0 leftmargin=0 rightmargin=0 bottomMargin=0 height=100% >
<%
	request.setCharacterEncoding( "GBK" );
    String report = request.getParameter( "rpg" );
	String endDate = request.getParameter("endDate");
	String startDate = request.getParameter("startDate");
	//String tableName = request.getParameter("tableName");
	String tjDate = request.getParameter("tjDate");
	String userID = request.getParameter("userID");
	String col = request.getParameter("col"); 
	String tab = request.getParameter("tab");  //�¼�һ��tab����

	   //�޸ĵ�һ��

	String reportFileHome=Context.getInitCtx().getMainDir();
	StringBuffer param=new StringBuffer();                                                                     //�޸ĵڶ���
	//String url1 = "reportJsp/showReportGrouptb.jsp?rpg=/ganBuTongJi/ganBuTongJi_zx/zxGroup.rpg&tjDate="+tjDate+"&userID="+userID;
    String url1 = "reportJsp/showReportGrouptb.jsp?rpg=/ganBuTongJi/ganBuTongJi_zx/zxGroup.rpg&tjDate="+tjDate+"&startDate="+startDate+"&endDate="+endDate+"&userID="+userID+"&col="+col+"&tab="+tab;

	
    //����
	
	String [] str = tab.split(",");
	String rp1= request.getRealPath("/reportFiles/"+report);
	ReportGroup rg1 = ReportUtils.readReportGroup(rp1);
	List<Integer> list1 = new ArrayList();
	List<Integer> list2 = new ArrayList();
	List<Integer> list3 = new ArrayList();
	int count11 = rg1.getItemCount();
	for(int i =0; i<count11; i++){
		list1.add(i);
	}
	for(int j=0;j<str.length;j++){
		for(int i =0; i<count11; i++){
				ReportGroupItem rgItem =rg1.getItem(i);
				if(rgItem.getHtmlId().equals(str[j])){
					list2.add(i);
				}
				System.out.println("lixintong:"+rgItem.getName());
		}
	}
	HashSet h1 = new HashSet(list1);
	HashSet h2 = new HashSet(list2);
	h1.removeAll(h2);
	list3.addAll(h1);
	Collections.sort(list3);
	for(int i=0;i<list3.size();i++){
		System.out.println("i1:"+i);
		System.out.println("i2:"+list3.get(i));
		rg1.removeItem(list3.get(i)-i);	
	}
	request.setAttribute("reportDefine",rg1);
	
	//����
	


	
	//��֤�������Ƶ�������
	int iTmp = 0;
	if( (iTmp = report.lastIndexOf(".rpg")) <= 0 ){
		report = report + ".rpg";
		iTmp = 0;
	}
	//�ж��Ƿ���Ҫ�
	String isinput="";
	String reportPath = request.getRealPath("/reportFiles/"+report);
	ReportGroup rg=null;
			rg = ReportUtils.readReportGroup(reportPath);
			ReportDefine rd =(ReportDefine) rg.getReportMetaData().getSubReportConfig(0).getSubReportDefine();
			byte urltype=rg.getReportMetaData().getSubReportConfig(0).getURLType();
			if(rd==null){
			   if(urltype== SubReportConfig.TYPE_ABSOLUTE){
				   String url = rg.getReportMetaData().getSubReportConfig(0).getURL();
				   ReportDefine rd2 = (ReportDefine)ReportUtils.read(url);
				   System.out.println(rd2);
				   if(rd2.getInput()==ReportDefine.INPUT_NORMAL){
						isinput="yes";
						System.out.print(isinput);
					}else{
						isinput="no";
						System.out.print(isinput);
					}
				  
			   }else{
				  String url =   application.getRealPath("/reportFiles/"+rg.getReportMetaData().getSubReportConfig(0).getURL()) ;
                   ReportDefine rd2 = (ReportDefine)ReportUtils.read(url);
				   System.out.println(rd2);
				   if(rd2.getInput()==ReportDefine.INPUT_NORMAL){
						isinput="yes";
						System.out.print(isinput);
					}else{
						isinput="no";
						System.out.print(isinput);
					}
			   }
			}else{
				if(rd.getInput()==ReportDefine.INPUT_NORMAL){
					isinput="yes";
					System.out.print(isinput);
				}else{
					isinput="no";
					System.out.print(isinput);
				}
			}

	Enumeration paramNames = request.getParameterNames();
	if(paramNames!=null){
		while(paramNames.hasMoreElements()){
			//String paramName = (String) paramNames.nextElement();
			//String paramValue=request.getParameter(paramName);
			String paramName  = new String(((String) paramNames.nextElement()).getBytes("iso-8859-1"), "GBK"); 
            String paramValue = new String(request.getParameter(paramName).getBytes("iso-8859-1"), "GBK"); 
			if(paramValue!=null){
				//�Ѳ���ƴ��name=value;name2=value2;.....����ʽ
				param.append(paramName).append("=").append(paramValue).append(";");
			}
		}
	}

	//���´����Ǽ����������Ƿ�����Ӧ�Ĳ���ģ��
	String paramFile = report.substring(0,iTmp)+"_arg.raq";
	File f=new File(application.getRealPath(reportFileHome+ File.separator +paramFile));

%>


 
<td><button onclick="save()" class="tbBtn">����</button></td>
<td><button onclick="save1()" class="tbBtn">��ȡ</button></td>
<td><button onclick="save2()" class="tbBtn">�ϱ�</button></td>

<td><button  onclick="group_saveAsExcel();return false;" class="tbBtn">����Excel</button></td> 
<!--<td><button onclick="window.history.back()"id="Btn">����</button></td>-->

<div id=mengban style="background-color:white;position:absolute;margin-left:16%;z-index:999;width:100%;height:100% ;display:none">
	<table width=100% height=100%>
		<tr><td width=100% style="text-align:center;vertical-align:middle">�����ύ�У����Ժ�......</td></tr>
	</table>
  </div>

  <div id=chouqu style="background-color:white;position:absolute;margin-left:16%;z-index:999;width:100%;height:100% ;display:none">
	<table width=100% height=100%>
		<tr><td width=100% style="text-align:center;vertical-align:middle">���ݼ����У����Ժ�......</td></tr>
	</table>
  </div>

<td> <p id="s1"   style="color:red;font-size:17px;font-weight:400"> </p> </td>
<td> <p id="s2"   style="color:red;font-size:17px;font-weight:400"> </p> </td>
<td> <p id="s3"   style="color:#00ff00;font-size:17px;font-weight:400"> </p> </td>
<!--�޸ĵ�һ��-->


<table id=rpt align=center><tr><td>
<%	//�������ģ����ڣ�����ʾ����ģ��
	if( f.exists() ) {
	%>
	<table id=param_tbl><tr><td>
		<report:param name="form1" paramFileName="<%=paramFile%>"
			needSubmit="no"
			params="<%=param.toString()%>"
			
		/>
	</td>
	<td><a href="javascript:_submit( form1 )"><img src="../images/query.jpg" border=no style="vertical-align:middle"></a></td>

	</tr></table>
	<% }
%>
<table align=center width=40% height=80% overflow=hidden >
	<tr><td valign=top>
		<report:group groupFileName="<%=report%>"
			funcBarLocation=" "
			exceptionPage="/reportJsp/myError2.jsp"
			isInput="<%=isinput%>"
			params="<%=param.toString()%>"
			backAndRefresh="<%=url1.toString()%>"
			needScroll="yes"
			scrollWidth="58%"
			scrollHeight="800"

			srcType="bean" 
			beanName="reportDefine"
                        

		
		/>
	</td></tr>
</table>



<script language="javascript">



	//��ȡ��ť��ת��������תȡ�ı�����
	function save1(){
		var tjDate="<%=tjDate%>";
		
		var startDate="<%=startDate%>";
		var endDate="<%=endDate%>";
		var userID="<%=userID%>";
		var col="<%=col%>";//���Ĵ�
		var tab = "<%=tab%>";  //��ȡ�������ı���
		//console.log("str"+tab);
		var data = tab.split(',');//��ȡ���ı���Ϊһ���ַ�����,���ַ�����ָ�ת��Ϊ����
		var cell1 = document.getElementById(data[0]+"_E1");		 //data[0]��ȡ�������ı����е������еĵ�һ�������е��߼���
		//alert(cell1);
		if(cell1 != null){
			var E1 =document.getElementById(data[0]+"_E1").attributes.value.value;
			//alert(E1);
			}

			if (E1 == '2' || E1=='0')
			{
				alert("���ܳ�ȡ���ݣ�");		

			}
			else {
			    window.open("showReportGroupzq.jsp?rpg=/ganBuTongJi/ganBuTongJi_tbzq/tbzqGroup.rpg&tjDate="+tjDate+"&startDate="+startDate+"&endDate="+endDate+"&userID="+userID+"&col="+col+"&tab="+tab,"_self");
				//document.getElementById( "chouqu" ).style.display = "";
				var index = layer.load();
			}
		
			
		
		
	}










//����ֱ�����
 function save() {
	            
				var tab = "<%=tab%>";
		       //console.log("str"+tab);
		       var data = tab.split(',');
	
               var cell1 = document.getElementById(data[0]+"_E1").attributes.value.value;
	            //alert(cell1);
	          if (cell1=='2'||cell1=='0')
	           {
		          alert("���ܱ������ݣ���")
	           }
	           else {

               

		          
              //�������һ�����ܣ�����У�鲻ͨ��������£�������ʾ�������û�У�鲻ͨ���Ƿ�Ҫ������������
	          if(group_submit_my()==true){
				  
				  //group_submit_my();
			  }else{
				  //���水ť��У��,���У��ͨ��,�Ͳ������ݼ����е�ҳ��,���ͨ��,�����Ǹ������е�ҳ��
                    layer.confirm('У�鲻ͨ����ȷ��Ҫ�ύ������?', 
				{icon: 3, title:'��ʾ',
				        yes: function(index){
                        //do something
                        group_submit(false);
                        },
                        cancel: function(index, layero){ 
                        layer.close(index);
						//reload();// ����������ˢ�´���
                       
                       }  
                });
				  
			  }
			      
			     //group_submit(false);
				//�޸ĵڶ���
				//document.getElementById( "mengban" ).style.display = "";
				//var index = layer.load();
				
				
				
          
			   }
            
				
 
 }

//�ϱ�����޸�״ֵ̬Ϊ2
 function save2() {

        var tab = "<%=tab%>";  //��ȡ�������ı���
		
		var data = tab.split(',');//��ȡ���ı���Ϊһ���ַ�����,���ַ�����ָ�ת��Ϊ����
		
		var length=data.length;//��ȡ����ĳ���,Ҳ���ǽ��յ��ı���һ���ж��ٸ�
		
		var cell1 = document.getElementById(data[length-1]+"_E1").attributes.value.value;
	     
   	if (cell1=='2'||cell1=='0')
	{
		alert("�����ϱ�����")
	
	 }
	else {  //���ж�������û�б����,���״ֵ̬Ϊ��,����ʾ���ȱ�������
			if (cell1 == '' || cell1 == null){
			   alert("���ȱ�������");
			}

			else{
				//���������,���޸�״ֵ̬Ϊ2
				//cell1.attributes.value.value='2';
					
				//alert(group_submit_my()==true);
				 if (group_submit_my()==true) {
					
				document.getElementById(data[length-1]+"_E1").attributes.value.value='2';
				 var cell2=document.getElementById(data[length-1]+"_E1").attributes.value.value='2';
				 //alert("cell2Ϊ�� "+cell2);
		          //document.getElementById("item1_E1").setAttribute("value","2");
		          // var cell2 = document.getElementById("item1_E1").attributes.value.value;
		           //alert(cell2);
		          //alert(cell1);

                 //�ж����У��ͨ���ͽ������ݼ�����ҳ��,�����ͨ��,�Ͳ��������ҳ��
                     if (group_submit_my()){
						
                    //document.getElementById( "mengban" ).style.display = "";
					var index = layer.load();
					}
                     
				 }


                

			}
		  
		
		
  
		   
	}
         

	
	
	
 }


 
//�Զ������У�鷽��
function check(a1,a2){ 
	// a1 ����id ��a2 �����
	var str = a1.split(",");
	var arr = [];//��������
	for (var i = 0;i<str.length ; i++)  //ѭ���������ݽ�����str
	{
		arr[i] = document.getElementById( str[i] ).getAttribute("value");  //��ȡ��Ԫ���value
		if (isNaN(arr[i]) || arr[i].replace(/\s/g,"") == "")     //����зǷ���ֵ���ͣ�����false
		{
			return false;
		}
	}
	//alert(arr);
	var sum = arr[0]+"==";     //��һ��value ==
	for(var i =1 ;i<arr.length;i++){
		sum+=a2.substring(i-1,i); //i=1   sum='3=='+'='                   // i=2   sum='3===1'+'+'  sum='3===1+'
		sum+=arr[i];             // i=1   sum='3==='+1-->sum='3===1'     //i=2     sum='3===1+' + 2   --> sum = '3===1+2'
	}
	//alert(sum);
	var s = eval(sum);  //�жϼ������ʽ����Ƿ�Ϊtrue,������
	return s;
}
 
 

 var tab = "<%=tab%>";  //��ȡ�������ı���
 //console.log("str"+tab);
 var data = tab.split(',');//��ȡ���ı���Ϊһ���ַ�����,���ַ�����ָ�ת��Ϊ����
 var length=data.length;//��ȡ����ĳ���,Ҳ���ǽ��յ��ı���һ���ж��ٸ�

  var cell1 = document.getElementById(data[length-1]+"_E1").attributes.value.value;
 
  if(cell1 == '2'){
	$("#s1").html(">>���ϱ�������ˣ�");
  }else if(cell1 == '3'){
	$("#s2").html(">>�Ѳ��أ�");
  }else if(cell1=='0'){
	 $("#s3").html(">>���ͨ����");
  }

//�����ť�û�
function test(){
	document.getElementById("bcBtn").setAttribute("disabled", true);
}

function test1(){
	document.getElementById("sbBtn").setAttribute("disabled", true);
}


//����ı���ʽ
	var image = document.getElementById( 'image' );
	image.onclick = function() {
		var className = document.getElementById('ljwz').className;
		if(className === 'ljwz'){
			document.getElementById('ljwz').className='ljdx'
			document.getElementById('ljwz2').style.left='0%'
			document.getElementById('ljwz1').style.left='1.1%'
			document.getElementById('image').src="images/shrink.png"
		}else if (className === 'ljdx'){
			document.getElementById('ljwz').className='ljwz'
			document.getElementById('ljwz2').style.left='15%'
			document.getElementById('ljwz1').style.left='16.2%'
			document.getElementById('image').src="images/merge.png"
		}
	}
/**У�����

	function checkSum(){
		for(var i=29;i<=83;i++){
			var sum = parseInt($('#d1b_E'+i).text());
			var checkSum = 0;
			for(var j=i+1;j<=i+4;j++){
				checkSum = checkSum + parseInt($('#d1b_E'+j).text());
			}
			if(checkSum != sum){
				alert("У��ʧ�ܣ�����");
				return;
			}else{
				i=i+4;
			}
		}
	}
	**/
</script>




</body>
</html>