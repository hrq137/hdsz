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
<script type="text/javascript" src="js/tanKuang_zq.js"></script>
<script type="text/javascript" src="js/layer-v2.1/layer/layer.js"></script>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/check.js"></script>

<body topmargin=0 leftmargin=0 rightmargin=0 bottomMargin=0>
<%
	request.setCharacterEncoding( "GBK" );
	String report = request.getParameter( "rpg" );
	String endDate = request.getParameter("endDate");
	String startDate = request.getParameter("startDate");
	//String tableName = request.getParameter("tableName");
	String tjDate = request.getParameter("tjDate");
	String userID = request.getParameter("userID");
	String col = request.getParameter("col"); //��һ��
	String tab = request.getParameter("tab");  //�¼�һ��tab����
	String dept = request.getParameter("dept");
	String opCod = request.getParameter("opCod");
	
	String reportFileHome=Context.getInitCtx().getMainDir();
	StringBuffer param=new StringBuffer();
	String url1 = "reportJsp/showReportGrouptb.jsp?rpg=/ganBuTongJi/ganBuTongJi_zx/zxGroup.rpg&tjDate="+tjDate+"&startDate="+startDate+"&endDate="+endDate+"&userID="+userID+"&col="+col+"&dept="+dept+"&opCod="+opCod; //�ڶ���
	
	
		
    //���Խ��ձ���������ķ���
	
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


     <div id=chouqu style="background-color:white;position:absolute;margin-left:16%;z-index:999;width:100%;height:100% ;display:none">
	<table width=100% height=100%>
		<tr><td width=100% style="text-align:center;vertical-align:middle">���ݼ����У����Ժ�......</td></tr>
	</table>
    </div>

	<!--<td><button onclick="tbtz()" id="tbBtn">����</button></td>-->
	<td><button onclick="save3()"class="tbBtn">�༭</button></td>
	<td><button class="tbBtn"> ���У��</button></td>
    <td><button class="tbBtn"> ����У��</button></td>
	<td><button onclick="window.history.back()" class="tbBtn">����</button></td>
	

	<td> <p id="st1" style="color:red;font-size:17px;font-weight:400"></p></td>
	<td> <p id="st2" style="color:red;font-size:17px;font-weight:400"> </p> </td>
	<td> <p id="st3" style="color:#00ff00;font-size:17px;font-weight:400"> </p> </td>

	



	<input type="hidden" name="tjDate" id="tjDate" value="<%=tjDate%>"></input>
	<input type="hidden" name="startDate" id="startDate" value="<%=startDate%>"></input>
	<input type="hidden" name="endDate" id="endDate" value="<%=endDate%>"></input>
	<input type="hidden" name="userID" id="userID" value="<%=userID%>"></input>
	<input type="hidden" name="col" id="col" value="<%=col%>"></input> <!--������-->
	<input type="hidden" name="dept" id="dept" value="<%=dept%>"></input>
    <input type="hidden" name="opCod" id="opCod" value="<%=opCod%>"></input>
	


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
<table align=center>
	<tr><td>
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
<script type="text/javascript">

	

	

     //�༭��ť��ת������ΪorGroup 
 function save3() {

	 var tjDate="<%=tjDate%>";
		
		var startDate="<%=startDate%>";
		var endDate="<%=endDate%>";
		var userID="<%=userID%>";
		var col="<%=col%>";
		var tab = "<%=tab%>";  //��ȡ�������ı���
		var dept = "<%=dept%>"; 
		var opCod = "<%=opCod%>"; 
		console.log("str"+tab);
		var data = tab.split(',');//��ȡ���ı���Ϊһ���ַ�����,���ַ�����ָ�ת��Ϊ����

		
		var cell1 = document.getElementById(data[0]+"_E1");		
		//alert(cell1);
		if(cell1 != null){
			var E1 =document.getElementById(data[0]+"_E1").attributes.value.value;
						
			}

		if (E1 == '2' || E1=='0')
		{
			alert("���ܱ༭��");
		}
		else {
			window.open("showReportGroup_oltb.jsp?rpg=/ganBuTongJi/ganBuTongJi_or/orGroup.rpg&tjDate="+tjDate+"&startDate="+startDate+"&endDate="+endDate+"&userID="+userID+"&col="+col+"&tab="+tab+"&dept="+dept+"&opCod="+opCod,"_self");
			//document.getElementById( "chouqu" ).style.display = "";
			var index = layer.load();

			}
	
 	


 }
		 var tab = "<%=tab%>";  //��ȡ�������ı���
		console.log("str"+tab);
		var data = tab.split(',');//��ȡ���ı���Ϊһ���ַ�����,���ַ�����ָ�ת��Ϊ����
	var  cell = document.getElementById(data[0]+"_E1");
	if(cell != null){
		var E1 = document.getElementById(data[0]+"_E1").attributes.value.value;
	}
	
  
	if(E1=='2'){
	$("#st1").html(">>���ϱ�������ˣ�");
  }else if(E1 == "3"){
	$("#st2").html(">>�Ѳ��أ�");
  }else if(E1=="0"){
	  $("#st3").html(">>���ͨ����");
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

</script>

</body>
</html>
