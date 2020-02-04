<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/WEB-INF/runqianReport4.tld" prefix="report" %>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>
<%@ page import="com.runqian.report4.usermodel.Context"%>

<html>
<link type="text/css" href="css/style.css" rel="stylesheet"/>
<script type="text/javascript" src="js/jquery-1.11.1.min.js"></script>
 
<body topmargin=0 leftmargin=0 rightmargin=0 bottomMargin=0>
<%
	request.setCharacterEncoding( "GBK" );
	String report = request.getParameter( "raq" );
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
				//把参数拼成name=value;name2=value2;.....的形式
				param.append(paramName).append("=").append(paramValue).append(";");
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
			funcBarLocation="no"
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
</script>

<script language="javascript">
	function selcheck() {
		var objs = report1.getElementsByTagName("input");//得到所有复选框
		for(var i=0; i<objs.length; i++) {//遍历这个所有复选框结果集,对每个复选框进行操作
			if(objs[i].type.toLowerCase() == "checkbox" )
				objs[i].checked =event.srcElement.checked;//如果类型为” checkbox”,则对该复选框进行勾选
		}
	}	

</script>
<script language="javascript">
  	function test(){
		var report = document.getElementById("report1");
		var input = document.getElementsByTagName("input")
		for (var i = 0 ; i <input.length ; i++) {
			if (input[i].checked) {
				var row = report.rows[i+4];
				var cell = row.cells[1];
				report.currCell = cell;
				_deleteRow(report);
			}
		}
 	}

  //获取复选框前边的状态值
	function selZt(){
	 var values="";
	 var objs = report1.getElementsByTagName("input");//获取页面上的input
	 for(var i=0; i<objs.length; i++) {//循环遍历获取到的input
		 if(objs[i].type.toLowerCase() == "checkbox" && objs[i].checked==true){//判断input的类型是复选框，并且已经被选中
			var cellId = objs[i].parentNode.id;//获取复选框所在单元格的id
            var newCellId = cellId.replace("G","F");//这里因为要获取J列的数据
                values = values+" "+newCellId;
		}    
	 }
	  //alert(values);//将获取到的值alert出来
		return {values:values};

	}


//校验函数
function checked(){




	var a=document.getElementById("report1_B8").attributes.value.value;//这只是获取B8的单元格的值
		//alert(a);
	var id=document.getElementById("report1_B8").getAttribute("id");  //获取B8的单元格的id值
	//alert(id);
	var b=parseInt(id.substr(a.length-1,1));  //截取B8单元格的id值"report1_B"
	//alert(b);
	var length=document.getElementById("report1_G7").attributes.value.value; //获取B8列有多少行数据
	//alert(length);
	var arrm=[];
	var arrn=[];

	for (var i=0;i< length;i++ )
	{
		var s=id.substr(0,a.length-1)+(b+i).toString(); //获取B列的id值
		var c=s.replace('B','C');
		//alert(c);
		var m = document.getElementById(s).attributes.value.value;//获取B列的value
		var n = document.getElementById(c).attributes.value.value;//获取C列的value
        
		//alert(s);
		//alert(m);
		// alert(n);
         arrm+=m+" ";
		 arrn+=n+" ";
		
	}

//alert(arrm),alert(arrn);
  return     arrm,arrn;
     

	

	

     
}

 


</script>
</body>
</html>
