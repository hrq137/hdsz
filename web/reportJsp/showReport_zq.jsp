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

<body topmargin=0 leftmargin=0 rightmargin=0 bottomMargin=0 style="margin-left:20px" >
<%
	String url  = request.getContextPath(); 
	request.setCharacterEncoding( "GBK" );
	String report = request.getParameter( "raq" );
	String endDate = request.getParameter("endDate");
	String startDate = request.getParameter("startDate");
	//String tableName = request.getParameter("tableName");
	String tjDate = request.getParameter("tjDate");
	String userID = request.getParameter("userID");
	String col = request.getParameter("col"); //第一处
	String dept = request.getParameter("dept");
	String opCod = request.getParameter("opCod"); 
	
	String reportFileHome=Context.getInitCtx().getMainDir();
	StringBuffer param=new StringBuffer();
	String url1 = "reportJsp/showReport_tb.jsp?raq=/ganBuTongJi/ganBuTongJi_zx/d5b_zx.raq&tjDate="+tjDate+"&startDate="+startDate+"&endDate="+endDate+"&userID="+userID+"&col="+col+"&dept="+dept;
	


	
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
				//把参数拼成name=value;name2=value2;.....的形式
				param.append(paramName).append("=").append(paramValue).append(";");
			}
		}
	}

	//以下代码是检测这个报表是否有相应的参数模板
	String paramFile = report.substring(0,iTmp)+"_arg.raq";
	File f=new File(application.getRealPath(reportFileHome+ File.separator +paramFile));

%>

    <input type="hidden" name="report" id="report" value="<%=report%>"></input>
	<input type="hidden" name="tjDate" id="tjDate" value="<%=tjDate%>"></input>
	<input type="hidden" name="startDate" id="startDate" value="<%=startDate%>"></input>
	<input type="hidden" name="endDate" id="endDate" value="<%=endDate%>"></input>
	<input type="hidden" name="userID" id="userID" value="<%=userID%>"></input>
	<input type="hidden" name="col" id="col" value="<%=col%>"></input> <!--第三处-->
	<input type="hidden" name="dept" id="dept" value="<%=dept%>"></input> 
	<input type="hidden" name="opCod" id="opCod" value="<%=opCod%>"></input> 

<div id=chouqu style="background-color:white;position:absolute;z-index:999;width:100%;height:100% ;display:none">
	<table width=100% height=100%>
		<tr><td width=100% style="text-align:center;vertical-align:middle">数据加载中，请稍后......</td></tr>
	</table>
</div>

<td><button onclick="save1()"class="tbBtn">编辑</button></td>
<td><button  class="tbBtn" onclick="checkRule()">表内检查</button></td>
<td><button onclick="window.history.back()" class="tbBtn">返回</button></td>


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
			backAndRefresh="<%=url1.toString()%>"
			
		/>
	</td></tr>
</table>
<div style="padding:0px;">
	<iframe id="mainframe" style="width:85%;height:100vh" frameborder="0" style="marging:0px;"></iframe>
</div>
<script language="javascript">
	//设置分页显示值
	
	document.getElementById( "t_page_span" ).innerHTML=report1_getTotalPage();
	document.getElementById( "c_page_span" ).innerHTML=report1_getCurrPage();


	


 



	//编辑如果表中无数据，进的是tbGroup ,有数进的就是orGroup
 function save1() {
	    
			
        var report="<%=report%>";   //获取当前表名带后缀.raq
		var initStart=report.indexOf("."); //获取当前表名带后缀的.位置
		  //alert(report);
           //alert(initStart);

		var report2=report.substring(0,initStart); //截取表名，不带.raq
		   // alert(report2);
       
        var report1=report2.replace(/tbzq/g,"tb"); //把tbzq替换成tb

	     //alert(report1);

		  var report3=report2.replace(/tbzq/g,"or");//把tbzq替换成or

         //alert(report3);
 	   var tjDate="<%=tjDate%>";
		
		var startDate="<%=startDate%>";
		var endDate="<%=endDate%>";
		var userID="<%=userID%>";
		var col="<%=col%>";
		var dept="<%=dept%>";
		var opCod="<%=opCod%>";
		var cell1 = document.getElementById("report1_D1");		//这里的E1是填报转取表中的单元格E1
		
		//var cell2 = document.getElementById("report1_E1").innerHTML;	
       var cell2 =document.getElementById("report1_D1").attributes.value.value;
		//alert(cell2);
			var E1 =document.getElementById("report1_E1").attributes.value.value;
		if(cell2 != null){
			var D1 =document.getElementById("report1_D1").attributes.value.value;
		
            //alert(D1);
						
			}

			if (cell2==null||cell2=='')
				
			{
                 
				window.open("showReport_oltb.jsp?raq="+report1+"&tjDate="+tjDate+"&startDate="+startDate+"&endDate="+endDate+"&userID="+userID+"&col="+col+"&dept="+dept+"&opCod="+opCod,"_self");
				//document.getElementById( "chouqu" ).style.display = "";
				var index = layer.load();


            }
 
            
		
	       else {
			   if (E1 == '2' || E1=='0')
		{
			alert("不能编辑！");
		}
		else {
			window.open("showReport_oltb.jsp?raq="+report3+"&tjDate="+tjDate+"&startDate="+startDate+"&endDate="+endDate+"&userID="+userID+"&col="+col+"&dept="+dept+"&opCod="+opCod,"_self");
             //document.getElementById( "chouqu" ).style.display = "";
			 var index = layer.load();
	
			}



 	
		   }
 
 }

 
 
	


</script>
</body>
</html>
