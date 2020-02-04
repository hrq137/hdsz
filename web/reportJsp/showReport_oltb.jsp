<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/WEB-INF/runqianReport4.tld" prefix="report" %>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>
<%@ page import="com.runqian.report4.usermodel.Context"%>

<html>
<link type="text/css" href="css/style.css" rel="stylesheet"/>

<script type="text/javascript" src="js/tanKuang_zq.js"></script>
<script type="text/javascript" src="js/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="js/layer-v2.1/layer/layer.js"></script>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/check.js"></script>


<body topmargin=0 leftmargin=0 rightmargin=0 bottomMargin=0 style="margin-left:20px">
<%
	request.setCharacterEncoding( "GBK" );
	String report = request.getParameter( "raq" );
	System.out.println(report+"12222222222222222222222");
    String report1 = report.replaceAll("or","zx").replaceAll("tb","zx");  ////
    System.out.println(report+"12222222222222222222222");
	//String ref_report = report.replaceAll("or","zx").replaceAll("tb","zx"); //ˢ��ҳ��ı������
	
	String endDate = request.getParameter("endDate");
	String startDate = request.getParameter("startDate");
	//String tableName = request.getParameter("tableName");
	String tjDate = request.getParameter("tjDate");
	String userID = request.getParameter("userID");
	String col = request.getParameter("col"); //��һ��
	String dept = request.getParameter("dept");
	String opCod = request.getParameter("opCod");
	
	String reportFileHome=Context.getInitCtx().getMainDir();
	StringBuffer param=new StringBuffer();

	String url1 = "reportJsp/showReport_tb.jsp?raq="+report1+"&tjDate="+tjDate+"&startDate="+startDate+"&endDate="+endDate+"&userID="+userID+"&col="+col+"&dept="+dept+"&opCod="+opCod;
	//System.out.println(url1+"12222222222222222222222");

	
	//��֤�������Ƶ�������
	int iTmp = 0;
	if( (iTmp = report.lastIndexOf(".raq")) <= 0 ){
		report = report + ".raq";
		iTmp = 0;
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

	<input type="hidden" name="tjDate" id="tjDate" value="<%=tjDate%>"></input>
	<input type="hidden" name="startDate" id="startDate" value="<%=startDate%>"></input>
	<input type="hidden" name="endDate" id="endDate" value="<%=endDate%>"></input>
	<input type="hidden" name="userID" id="userID" value="<%=userID%>"></input>
	<input type="hidden" name="col" id="col" value="<%=col%>"></input> <!--������-->
	<input type="hidden" name="dept" id="dept" value="<%=dept%>"></input>
	<input type="hidden" name="opCod" id="opCod" value="<%=opCod%>"></input>
	
  <div id=mengban style="background-color:white;position:absolute;z-index:999;width:100%;height:100% ;display:none">
	<table width=100% height=100%>
		<tr><td width=100% style="text-align:center;vertical-align:middle">�����ύ�У����Ժ�......</td></tr>
	</table>
   </div>


<td><button onclick="save1()" class="tbBtn">�ݴ�</button></td>
<!--<td><button onclick="save()" class="tbBtn">����</button></td>-->

<td><button  class="tbBtn" onclick="checkRule()">���ڼ��</button></td>
<td><button onclick="window.history.back()" class="tbBtn">����</button></td>



<table id="rpt" align="center" width=100% height=100%>
<%	//�������ģ����ڣ�����ʾ����ģ��
	if( f.exists() ) {
	%>
	<tr><td align=center>
		<table id="param_tbl"><tr><td>
			<report:param name="form1" paramFileName="<%=paramFile%>"
				needSubmit="no"
				params="<%=param.toString()%>"
				
				
			/>
		</td>
		<td><a href="javascript:_submit( form1 )"><img src="../images/query.jpg" border=no style="vertical-align:middle"></a></td>
		</tr></table>
	</td></tr>
	<% }%>
	<tr><td align=center valign=top height=100%>
		<report:html name="report1" reportFileName="<%=report%>"
			funcBarLocation=" "
			needPageMark="yes"
			generateParamForm="no"
			params="<%=param.toString()%>"
			exceptionPage="/reportJsp/myError2.jsp"
			appletJarName="runqianReport4Applet.jar,dmGraphApplet.jar"
			backAndRefresh="<%=url1.toString()%>"
			
		/>
	</td></tr>
</table>

<script language="javascript">
	//���÷�ҳ��ʾֵ
	
	document.getElementById( "t_page_span" ).innerHTML=report1_getTotalPage();
	document.getElementById( "c_page_span" ).innerHTML=report1_getCurrPage();


//���水ť
function save(){


             if (_submitTable( document.getElementById( 'report1' ) )){

              //document.getElementById( "mengban" ).style.display = "";
			  var index = layer.load();
			  }

}



//�ݴ水ť
function save1(){

             _submitReport( document.getElementById( 'report1' ) );

              //document.getElementById( "mengban" ).style.display = "";
			  var index = layer.load();
}




</script>
</body>
</html>
