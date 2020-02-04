<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/WEB-INF/runqianReport4.tld" prefix="report" %>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>
<%@ page import="com.runqian.report4.usermodel.Context"%>
<%@ page import="javax.crypto.Cipher"%>
<%@ page import="javax.crypto.spec.SecretKeySpec"%>
<%@ page import="com.runqian.report4.tag.AES"%>
<%@ page import="com.huida.ReportApproval"%>
<%@ page import="com.huida.ReportDataMain"%>
<%@ page import="com.huida.DataSourceMain"%>

<html>
<link type="text/css" href="css/style.css" rel="stylesheet"/>
<script type="text/javascript" src="js/jquery-1.11.1.min.js"></script>

<script type="text/javascript" src="js/layer-v2.1/layer/layer.js"></script>

<body topmargin=0 leftmargin=0 rightmargin=0 bottomMargin=0>
<%
	request.setCharacterEncoding( "GBK" );
	String report = request.getParameter( "raq" );
	String rybm = request.getParameter( "rybm" );
	String role = request.getParameter("role");
	String reportFileHome=Context.getInitCtx().getMainDir();
	StringBuffer param=new StringBuffer();
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
	DataSourceMain ds = new DataSourceMain();
	String sql = "select a.id as tjDate,a.startdate,a.enddate,a.col,a.slc_tab as tab,celery from parameter a where a.celery ='1'";
	//本地库
	ds.setJdbc("oracle.jdbc.driver.OracleDriver");
	ds.setUrl("jdbc:oracle:thin:@172.25.42.118:1521:orcl");
	ds.setUname("pesoel");
	ds.setPword("pesoel");
	ReportApproval ra = new ReportApproval();
	String lujuUrl = ra.getTasktData(ds,sql);
	//干统库
	ds.setJdbc("oracle.jdbc.driver.OracleDriver");
	ds.setUrl("jdbc:oracle:thin:@172.25.42.231:1521:hrmis");
	ds.setUname("sy");
	ds.setPword("Hrmis150");
	sql = "select dwbsm as id,dwmc as name  from lz_dwjbxx where  dwbsm in "+
		  "(select dwbsm from gg_yhqxxx where dwxxbmbs=(select a.bmbm from gg_zgjbxx a where a.rybm='2021295835'))"+
		  "and  validflag='1'";
	String userId = ra.getCompanyData(ds,sql);
	lujuUrl += "&userID=" + userId;
	sql = "select dwbsm  as id  from gg_yhqxxx where dwxxbmbs=(select a.bmbm from gg_zgjbxx a where a.rybm='2021295835')";
	String opCod = ra.getPowerData(ds,sql);
	lujuUrl += "&opCod=" + opCod;
	sql = "select dwbsm as id,dwmc as name  from lz_dwjbxx where  dwbsm in "+
		  "( select dwbsm from gg_yhqxxx where  regexp_like(dwbsm,replace('"+opCod+
		  "',',','|'))) and validflag='1'  and dwbsm!='"+userId+"'";
	System.out.println("sql----------->"+sql);
	String user_id = ra.getPowerData(ds,sql);
	String direStatisUrl = lujuUrl+"&rybm="+rybm;
	lujuUrl += "&userid=" + user_id +"&rybm="+rybm;
	System.out.println("direStatisUrl----------->"+direStatisUrl);
	System.out.println("lujuUrl----------->"+lujuUrl);
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



	//获取复选框的状态值
	function selcheck(){
	 var values="";
	 var objs = report1.getElementsByTagName("input");//获取页面上的input
	 for(var i=0; i<objs.length; i++) {//循环遍历获取到的input
		 if(objs[i].type.toLowerCase() == "checkbox" && objs[i].checked==true){//判断input的类型是复选框，并且已经被选中
			var cellId = objs[i].parentNode.id;//获取复选框所在单元格的id
            var newCellId = cellId.replace("K","L");//这里因为要获取J列的数据
                values = values+" "+newCellId;
		}    
	 }
	 // alert(values);//将获取到的值alert出来
		return {values:values};

	}


	//获取复选框前边的用户值
	function selUser(){
	 var values="";
	  
	 var objs = report1.getElementsByTagName("input");//获取页面上的input
	 for(var i=0; i<objs.length; i++) {//循环遍历获取到的input
		 if(objs[i].type.toLowerCase() == "checkbox" && objs[i].checked==true){//判断input的类型是复选框，并且已经被选中
			var cellId = objs[i].parentNode.id;//获取复选框所在单元格的id
            var newCellId = cellId.replace("K","G");//这里因为要获取J列的数据
                values = values+" "+newCellId;
		    var endDate = cellId.replace("K","Q"); //这里因为要获取Q列的数据
			var endDate1 = $("#"+endDate)[0]; //获取当前endDate的dom元素
			var endDate = endDate1.innerHTML; //获取当前endDate的value值
			
			 var startDate = cellId.replace("K","R"); //这里因为要获取R列的数据
			 var startDate1 = $("#"+startDate)[0]; //获取当前startDate的dom元素
			 var startDate = startDate1.innerHTML; //获取当前startDate的value值
		    //alert(endDate2);
			
			
			
		}      
	 }
	//  alert(values);//将获取到的值alert出来
		return {values:values,endDate,startDate};

	}


	//loading的方法

    function forDatell_shck(tjDate,userID,tab,endDate,startDate) {
		var index = layer.load();
		window.location.href = "http://"+window.location.host+"/report/"+"reportJsp/showReportGroup_shck.jsp?rpg=/ganBuTongJi/ganBuTongJi_zx/zxGroup.rpg&tjDate="+
			tjDate+"&userID="+userID+"&tab="+tab+"&endDate="+endDate+"&startDate="+startDate ;
	}
	
	//二级单位统计
	//function  twoStatistics(){
		
	//}
	
	//填报跳转的页面
	
	function tb(){
	var role = <%=role%>  ; //权限判断是否是一级还是二级单位，决定点击汇总按钮跳转的页面
	var userID=document.getElementById("report1_E2").attributes.value.value;
	 var firstUnit = "/report/reportJsp/meau.jsp?raq=";
	 var secondUnit = "/report/reportJsp/meau.jsp?raq=";
	 if(role === 1){
		 window.location.href=firstUnit+'<%= direStatisUrl%>'+'&dept=1'
	 }else if(role===2){
		 window.location.href=secondUnit+'<%= direStatisUrl%>'+'&dept=2'
	 }
	
	  //alert(userID);
	  //window.location.href="/report/reportJsp/meau.jsp?raq="+'<%= direStatisUrl%>'
	}
     
	//汇总填报跳转的页面
	function hztb(){
	var role = <%=role%>  ; //权限判断是否是一级还是二级单位，决定点击汇总按钮跳转的页面
	console.log('<%= lujuUrl%>')
	var userID=document.getElementById("report1_E2").attributes.value.value;
	 // alert(userID);
	 var firstUnit = "/report/reportJsp/showReportGrouphztb.jsp?rpg=/ganBuTongJi/ganBuTongJi_hz/hzGroup.rpg";
	 var secondUnit = "/report/reportJsp/showReportGrouptb_luju.jsp?rpg=/ganBuTongJi/ganBuTongJi_hz/hzGroup.rpg";
	 if(role === 1){
		 window.location.href=firstUnit+'<%= lujuUrl%>'+'&dept=1';
	 }else if(role===2){
		 window.location.href=secondUnit+'<%= lujuUrl%>'+'&dept=2';
	 }
	}
</script>
</body>
</html>
