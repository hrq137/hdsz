<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/WEB-INF/runqianReport4.tld" prefix="report" %>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>
<%@ page import="com.runqian.report4.usermodel.Context"%>
<%@ page import="javax.crypto.Cipher"%>
<%@ page import="javax.crypto.spec.SecretKeySpec"%>
<%@ page import="com.runqian.report4.tag.AES"%>

<html>
<link type="text/css" href="css/style.css" rel="stylesheet"/>
<script type="text/javascript" src="js/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="js/layer-v2.1/layer/layer.js"></script>

<body topmargin=0 leftmargin=0 rightmargin=0 bottomMargin=0>
<%
	request.setCharacterEncoding( "GBK" );
	String sSrc = request.getParameter("userid");
	String sKey = "1234123412ABCDEF";
	String report = request.getParameter( "raq" );
	String reportFileHome=Context.getInitCtx().getMainDir();
	StringBuffer param=new StringBuffer();
	String userid = AES.Decrypt(sSrc.replace(" ","+"), sKey);
	String personDepartHid = request.getParameter("personDepartHid");
	
	//保证报表名称的完整性
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
			
				if(paramName.equals("personDepartHid")){
					param.append("userID").append("=").append(personDepartHid).append(";");
				
				}else{
					param.append(paramName).append("=").append(paramValue).append(";");
				}
				//把参数拼成name=value;name2=value2;.....的形式
				
			}
		}
	}

	//以下代码是检测这个报表是否有相应的参数模板
	String paramFile = report.substring(0,iTmp)+"_arg.raq";
	File f=new File(application.getRealPath(reportFileHome+ File.separator +paramFile));

%>

<table id="rpt" align="center" width=100% height=100%>
<%	//如果参数模板存在，则显示参数模板
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
		/>
	</td></tr>
</table>

<script language="javascript">
	//设置分页显示值
	document.getElementById( "t_page_span" ).innerHTML=report1_getTotalPage();
	document.getElementById( "c_page_span" ).innerHTML=report1_getCurrPage();


	//loading的方法

function forDatell(tjDate,userID,startDate,endDate,col,tab,dept,opCod) {  //111111111111111111111111111111
		var index = layer.load();
		window.location.href = "http://"+window.location.host+"/report/"+"reportJsp/showReportGrouptb.jsp?rpg=/ganBuTongJi/ganBuTongJi_zx/zxGroup.rpg&tjDate="+
			tjDate+"&userID="+userID+"&startDate="+startDate+"&endDate="+endDate+"&col="+col+"&tab="+tab+"&dept="+dept+"&opCod="+opCod ;
	}

	function forDatell_lujuhz(tjDate,userID,userid,tab,dept,endDate) {
		var index = layer.load();
		window.location.href = "http://"+window.location.host+"/report/"+"reportJsp/showReportGrouptb_luju.jsp?rpg=/ganBuTongJi/ganBuTongJi_hz/hzGroup.rpg&tjDate="+
			tjDate+"&userID="+userID+"&userid="+userid+"&tab="+tab+"&dept="+dept+"&endDate="+endDate ;
	}
	
   /////////
   function forDatell_lujuhzor(tjDate,userID,userid,tab,dept,endDate) {
		var index = layer.load();
		window.location.href = "http://"+window.location.host+"/report/"+"reportJsp/showReportGrouptb_luju.jsp?rpg=/ganBuTongJi/ganBuTongJi_hzor/hzorGroup.rpg&tjDate="+
			tjDate+"&userID="+userID+"&userid="+userid+"&tab="+tab+"&dept="+dept+"&endDate="+endDate ;
	}
   /////////
   
   
	
	
	function forDatell_lujuzx(tjDate,userID,tab,dept,endDate) {
		var index = layer.load();
		window.location.href = "http://"+window.location.host+"/report/"+"reportJsp/showReportGrouptb_luju.jsp?rpg=/ganBuTongJi/ganBuTongJi_zx/zxGroup.rpg&tjDate="+
			tjDate+"&userID="+userID+"&tab="+tab+"&dept="+dept+"&endDate="+endDate ;
	}

  //总公司的归档跳转链接
   //状态值为null跳转的链接
    function forDatell_hztb(tjDate,userID,userid,tab,dept,endDate) {
    var index = layer.load();
    window.location.href = "http://"+window.location.host+"/report/"+"reportJsp/showReportGrouphztb.jsp?rpg=/ganBuTongJi/ganBuTongJi_hz/hzGroup.rpg&tjDate="+
      tjDate+"&userID="+userID+"&userid="+userid+"&tab="+tab+"&dept="+dept+"&endDate="+endDate ;
  }
  //状态值5跳转的链接
  function forDatell_fr(tjDate,userID,tab,dept,endDate) {
    var index = layer.load();
  window.location.href = "http://"+window.location.host+"/report/"+"reportJsp/showReportGroup_fr.jsp?rpg=/ganBuTongJi/ganBuTongJi_zx/zxGroup.rpg&tjDate="+tjDate+"&userID="+userID+"&tab="+tab+"&dept="+dept+"&endDate="+endDate ;
  }
   //状态值9跳转的链接
  function forDatell_ck(tjDate,userID,tab,dept,endDate) {
    var index = layer.load();
    window.location.href = "http://"+window.location.host+"/report/"+"reportJsp/showReportGroupck.jsp?rpg=/ganBuTongJi/ganBuTongJi_zx/zxGroup.rpg&tjDate="+
      tjDate+"&userID="+userID+"&tab="+tab+"&dept="+dept+"&endDate="+endDate ;
  }

  
  
  
  
  
</script>
</body>
</html>
