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
    String report1 = request.getParameter( "raq" );
	 report = report1;

	//String ref_report = request.getParameter( "raq" );
     System.out.println(report+"fasdfadfasdfsadfasdfasdfasdfsa");
	String endDate = request.getParameter("endDate");
	String startDate = request.getParameter("startDate");
	//String tableName = request.getParameter("tableName");
	String tjDate = request.getParameter("tjDate");
	String userID = request.getParameter("userID");
	String col = request.getParameter("col"); //第一处
	String dept = request.getParameter("dept"); 
	String opCod = request.getParameter("opCod");
    String rybm = request.getParameter("rybm"); 	
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

    <input type="hidden" name="report" id="report" value="<%=report%>"></input>
	<input type="hidden" name="tjDate" id="tjDate" value="<%=tjDate%>"></input>
	<input type="hidden" name="startDate" id="startDate" value="<%=startDate%>"></input>
	<input type="hidden" name="endDate" id="endDate" value="<%=endDate%>"></input>
	<input type="hidden" name="userID" id="userID" value="<%=userID%>"></input>
	<input type="hidden" name="col" id="col" value="<%=col%>"></input> <!--第三处-->
	<input type="hidden" name="dept" id="dept" value="<%=dept%>"></input>
	<input type="hidden" name="opCod" id="opCod" value="<%=opCod%>"></input>
	
	<div id=mengban style="background-color:white;position:absolute;z-index:999;width:100%;height:100% ;display:none">
	<table width=100% height=100%>
		<tr><td width=100% style="text-align:center;vertical-align:middle">数据提交中，请稍后......</td></tr>
	</table>
    </div>

    <div id=chouqu style="background-color:white;position:absolute;z-index:999;width:100%;height:100% ;display:none">
	<table width=100% height=100%>
		<tr><td width=100% style="text-align:center;vertical-align:middle">数据加载中，请稍后......</td></tr>
	</table>
    </div>

<td><button onclick="save()" class="tbBtn">保存</button></td>


<td><button onclick="save2()"class="tbBtn">统计</button></td>
<td><button onclick="report1_print();return false;" class="tbBtn">打印</button></td>
<td><button  onclick="excl()" class="tbBtn">导出Excel</button></td>  
<td><button  class="tbBtn" onclick="checkRule()">表内检查</button></td>
<td><button  class="tbBtn" onclick="homePage()">首页</button></td>





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




	//保存按钮
function save(){
	    
		var cell1 = document.getElementById("report1_E1");		//这里的E1是展现表的单元格E1
		//alert(cell1);
		var  cell2= document.getElementById("report1_D1").attributes.value.value;; //这个是为了判断进入展现表时,该表中有无保存数据,如果没有数据的话就弹框,请先抽取数据,如果有数据,就可以保存
		//alert(cell2);

	if ( cell2==null || cell2==""){ alert("请先抽取数据")}

	else{
			if(cell1 != null){
			var E1 =document.getElementById("report1_E1").attributes.value.value;
						
			}

                   if (E1 == '2' || E1=='0')
			     {
				alert("不能保存数据！");		

			    }
			    else {

              //这块新增一个功能，就是校验不通过的情况下，弹出提示框，提醒用户校验不通过是否要继续保存数据
	         // if(_submitTable( document.getElementById( 'report1' ) )==true){
				  
				 // _submitTable( document.getElementById( 'report1' ) );
			 // }else{
				  //保存按钮有校验,如果校验通过,就不走数据加载中的页面,如果通过,就走那个加载中的页面
                 //   layer.confirm('校验不通过，确认要提交数据吗?', 
				//{icon: 3, title:'提示',
				   //     yes: function(index){
                        //do something
                        _submitReport(document.getElementById( 'report1' ));
                    //    },
                     //   cancel: function(index, layero){ 
                      //  layer.close(index);
						//reload();// 可以在这里刷新窗口
                       
                      // }  
               // });
				  
			  //}
			  
			  
			  
             

                   
				   
			 // if  ( _submitTable( document.getElementById( 'report1' ) )) {
				  
                  // var index = layer.load();
                  //document.getElementById( "mengban" ).style.display = "";
				 // }
				 
				 /////////////

            }

	}
}

//统计按钮跳转的链接,就是zq表


  function save2() {
	   
	   var report="<%=report%>";  //去掉.raq获取表名称
	  // alert(report);
       //var report="<%=report.substring(0,iTmp)%>";  //去掉.raq获取表名称(也是一种方法,但是第一轮过后这个方法就不可用了)
	   report = report.replace(".raq","");  //这个就是补充上一个方法的不足,,去掉.raq获取表名称
	  // alert(report);
           //alert(typeof(report));
	    var report1=report.replace(/\zx/g,"tbzq");  //把zx替换成tbzq
	   //alert(typeof(report1));
	  // alert(report1);
        
 	   var tjDate="<%=tjDate%>";
		
		var startDate="<%=startDate%>";
		var endDate="<%=endDate%>";
		var userID="<%=userID%>";
		var col="<%=col%>";
		var dept="<%=dept%>";
		var opCod="<%=opCod%>";
	
		var cell1 = document.getElementById("report1_E1");		//这里的E1是展现表的单元格E1
		//alert(cell1);
		if(cell1 != null){
			var E1 =document.getElementById("report1_E1").attributes.value.value;
						
			}

        if (E1 == '2' || E1=='0')
			{
				alert("不能抽取数据！");		

			}
			else {
			   
 	            window.open("showReport_zq.jsp?raq="+report1+"&tjDate="+tjDate+"&startDate="+startDate+"&endDate="+endDate+"&userID="+userID+"&col="+col+"&dept="+dept+"&opCod="+opCod,"_self");
				var index = layer.load();
				//document.getElementById( "chouqu" ).style.display = "";
			}
		

 }
//导出Excel方法    只有审核通过才可以导出excl
 function excl(){
	    var cell1 = document.getElementById("report1_E1").attributes.value.value;		//这里的E1是展现表的单元格E1
		//alert(cell1);
		if(cell1=='0'){ //当cell1=='0'时，审核通过之后，可以导出操作
			report1_saveAsExcel();
		}else{
			alert('只有审核通过才能导出Excel');
		}
		
	
}


//回到首页的方法

function homePage(){
	var rybm="<%=rybm%>";
	var dept="<%=dept%>";
	top.location.href = "/report/reportJsp/showReportShlb.jsp?raq=/ganBuTongJi/ganBuTongJi_tb/shlb_one_roadbureau.raq&dept="+dept+"&rybm="+rybm;
	var index = layer.load();
}
	


</script>
</body>
</html>
