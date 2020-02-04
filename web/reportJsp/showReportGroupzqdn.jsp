<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/WEB-INF/runqianReport4.tld" prefix="report" %>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>
<%@ page import="com.runqian.report4.usermodel.Context"%>
<%@ page import="com.runqian.report4.util.ReportUtils"%>
<%@ page import="com.runqian.report4.model.ReportDefine"%>
<%@ page import="com.runqian.report4.usermodel.ReportGroup"%>
<%@ page import="com.runqian.report4.usermodel.SubReportConfig"%>

<html>

<link type="text/css" href="css/style.css" rel="stylesheet"/>
<script type="text/javascript" src="js/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="js/tanKuang_zqdn.js"></script>

<style type="text/css">
	#tbBtn{
	background-color: #e7e7e7;
	color: black;
	padding: 3px 5px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 12px;
	margin: 4px 2px;
	cursor: pointer;
	}

	#backBtn{
	background-color: #e7e7e7;
	color: black;
	padding: 3px 5px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 12px;
	margin: 4px 2px;
	cursor: pointer;
	}
</style>

<body topmargin=0 leftmargin=0 rightmargin=0 bottomMargin=0>
<%
	request.setCharacterEncoding( "GBK" );
	String report = request.getParameter( "rpg" );
	String endDate = request.getParameter("endDate");
	String startDate = request.getParameter("startDate");
	String tableName = request.getParameter("tableName");
	String tjDate = request.getParameter("tjDate");
	String userID = request.getParameter("userID");
	String col = request.getParameter("col");
	
	
	String reportFileHome=Context.getInitCtx().getMainDir();
	StringBuffer param=new StringBuffer();
	String url1 = "reportJsp/showReportGroup.jsp?rpg=/dangNeiTongJi/dangNeiTongJi_zx/zxGroup.rpg&tjDate="+tjDate+"&startDate="+startDate+"&endDate="+endDate+"&tableName=����ͳ�Ʊ�"+"&userID="+userID+"&col="+col;
	
	

	
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
			String paramName = (String) paramNames.nextElement();
			String paramValue=request.getParameter(paramName);
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
<jsp:include page="grouptoolbar1.jsp" flush="false" />

	<td><button onclick="tbtz()" id="tbBtn">�</button></td>
	<td><button onclick="window.history.back()" id="backBtn">����</button></td>

	<td> <p id="st1" style="color:red;font-size:17px;font-weight:400"></p></td>
	<td> <p id="st2" style="color:red;font-size:17px;font-weight:400"> </p> </td>
	<td> <p id="st3" style="color:#00ff00;font-size:17px;font-weight:400"> </p> </td>


	<input type="hidden" name="tjDate" id="tjDate" value="<%=tjDate%>"></input>
	<input type="hidden" name="startDate" id="startDate" value="<%=startDate%>"></input>
	<input type="hidden" name="endDate" id="endDate" value="<%=endDate%>"></input>
	<input type="hidden" name="userID" id="userID" value="<%=userID%>"></input>
	<input type="hidden" name="col" id="col" value="<%=col%>"></input>
	

	


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
			funcBarLocation="top"
			exceptionPage="/reportJsp/myError2.jsp"
			isInput="<%=isinput%>"
			params="<%=param.toString()%>"
			backAndRefresh="<%=url1.toString()%>"
		/>
	</td></tr>
</table>
<script type="text/javascript">

	
	//���ť��ת�����ӵ�ַ
	function tbtz(){
		var tjDate="<%=tjDate%>";
		var tableName="<%=tableName%>";
		var startDate="<%=startDate%>";
		var endDate="<%=endDate%>";
		var userID="<%=userID%>";
		var col="<%=col%>";
       

		var cell1 = document.getElementById("item1_E1");	
			
		if(cell1 != null){
			var E1 =document.getElementById("item1_E1").attributes.value.value;
				
			}
		
			
			if(E1 == '2' || E1=='0'){
             alert("�������");
						

			}else if(E1==null || E1==''){
				
						
				window.open("showReportGrouptb_dn.jsp?rpg=/dangNeiTongJi/dangNeiTongJi_tb/tbGroup.rpg&tjDate="+tjDate+"&startDate="+startDate+"&endDate="+endDate+"&userID="+userID+"&col="+col,"_self");
				
			}else{
				
				
				window.open("showReportGrouptb_dn.jsp?rpg=/dangNeiTongJi/dangNeiTongJi_zx/zxGroup.rpg&tjDate="+tjDate+"&tableName="+tableName+"&userID="+userID+"&col="+col,"_self");
			}
		
	}
	
	var  cell = document.getElementById("item1_E1");
	if(cell != null){
		var E1 = document.getElementById("item1_E1").attributes.value.value;
	}
	
  
	if(E1=='2'){
	$("#st1").html(">>���ϱ�������ˣ�");
  }else if(E1 == "3"){
	$("#st2").html(">>�Ѳ��أ�");
  }else if(E1=="0"){
	  $("#st3").html(">>���ͨ����");
  }





</script>

</body>
</html>
