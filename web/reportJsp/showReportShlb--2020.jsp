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



</script>
</body>
</html>
