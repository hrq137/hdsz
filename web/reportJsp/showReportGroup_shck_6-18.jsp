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



<body topmargin=0 leftmargin=0 rightmargin=0 bottomMargin=0>
 
<%
	request.setCharacterEncoding( "GBK" );
	String report = request.getParameter( "rpg" );
	String tjDate = request.getParameter("tjDate");
	String userID = request.getParameter("userID");
	String endDate = request.getParameter("endDate");
	String startDate = request.getParameter("startDate");
	String tableName = request.getParameter("tableName");
	String reportFileHome=Context.getInitCtx().getMainDir();
	StringBuffer param=new StringBuffer();
	String url1 = "showReportGroup_shck?rpg=/ganBuTongJi/ganBuTongJi_tb/shlb_one.raq&tjDate="+tjDate+"&tableName=�ɲ�ͳ�Ʊ�"+"&userID="+userID;
	
	
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
<script language="javascript">
    var frame=document.getElementById('iframeId');
	frame.contentWindow.postMessage(object,'*');


</script>
<iframe src="" id="m1" name='m1' width=250 height=63 scrolling="no" ></iframe><br />


<!--<td> <p id="s1"   style="color:red;font-size:17px;font-weight:400"> </p> </td>
<td> <p id="s2"   style="color:red;font-size:17px;font-weight:400"> </p> </td>
<td> <p id="s3"   style="color:#00ff00;font-size:17px;font-weight:400"> </p> </td>-->


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
			funcBarLocation="no"
			exceptionPage="/reportJsp/myError2.jsp"
			isInput="<%=isinput%>"
			params="<%=param.toString()%>"
			backAndRefresh="<%=url1.toString()%>"
			needScroll="yes"
			scrollWidth="58%"
			scrollHeight="800"
		/>
	</td></tr>
</table>
<script language="javascript"> 


 // var cell1 = document.getElementById("item1_E1").attributes.value.value;
  
//  if(cell1 == '2'){
//	$("#s1").html(">>���ϱ�������ˣ�");
//  }else if(cell1 == '3'){
//	$("#s2").html(">>�Ѳ��أ�");
//  }else if(cell1=='0'){
//	 $("#s3").html(">>���ͨ����");
//  }


</script>
<script language="javascript" >
//��̬��ȡsrc��ַ

var userID="<%=userID.toString()%>";
var tjDate="<%=tjDate.toString()%>";
//alert(userID);
//alert(tjDate);

//parent.document.getElementById("m1").src="sh_button.jsp?raq=/ganBuTongJi/ganBuTongJi_tb/shlb_button.raq&tjDate="+tjDate+"&tableName=�ɲ�ͳ�Ʊ�"+"&userID="+userID;
	$(function(){
		$("#m1").attr("src","sh_button.jsp?raq=/ganBuTongJi/ganBuTongJi_tb/shlb_button.raq&tjDate="+tjDate+"&tableName=�ɲ�ͳ�Ʊ�"+"&userID="+userID);
	})

</script>
</body>
</html>
