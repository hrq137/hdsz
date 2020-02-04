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
<script type="text/javascript" src="js/layer-v2.1/layer/layer.js"></script>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/check.js"></script>


<script type="text/javascript">
	//弹框JS
	function tanKuang(){
	
		//alert("测试");
		window.open ('showReport1.jsp?raq=/ganBuTongJi/ganBuTongJi_tbzq/detailTable.raq', 'newwindow', 'height=300, width=800, top=200, left=100, toolbar=no, menubar=no, scrollbars=no, resizable=no,location=n o, status=no'); 
	
	};
</script>
<body topmargin=0 leftmargin=0 rightmargin=0 bottomMargin=0>
<%
	request.setCharacterEncoding( "GBK" );
    String report = request.getParameter( "rpg" );
	String endDate = request.getParameter("endDate");
	String startDate = request.getParameter("startDate");
	//String tableName = request.getParameter("tableName");
	String tjDate = request.getParameter("tjDate");
	String userID = request.getParameter("userID");
	String col = request.getParameter("col"); 
	String tab = request.getParameter("tab");  //新加一个tab参数
	String dept = request.getParameter("dept");
	String rybm = request.getParameter("rybm"); 
	   //修改第一处

	String reportFileHome=Context.getInitCtx().getMainDir();
	StringBuffer param=new StringBuffer();                                                                     //修改第二处
	//String url1 = "reportJsp/showReportGrouptb.jsp?rpg=/ganBuTongJi/ganBuTongJi_zx/zxGroup.rpg&tjDate="+tjDate+"&userID="+userID;
    String url1 = "reportJsp/showReportGrouptb_luju.jsp?rpg=/ganBuTongJi/ganBuTongJi_zx/zxGroup.rpg&tjDate="+tjDate+"&startDate="+startDate+"&endDate="+endDate+"&userID="+userID+"&col="+col+"&tab="+tab+"&dept="+dept+"&rybm="+rybm;

    
	    //测试
	
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
	
	//测试
	
	
	//保证报表名称的完整性
	int iTmp = 0;
	if( (iTmp = report.lastIndexOf(".rpg")) <= 0 ){
		report = report + ".rpg";
		iTmp = 0;
	}
	//判断是否需要填报
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
				//把参数拼成name=value;name2=value2;.....的形式
				param.append(paramName).append("=").append(paramValue).append(";");
			}
		}
	}

	//以下代码是检测这个报表是否有相应的参数模板
	String paramFile = report.substring(0,iTmp)+"_arg.raq";
	File f=new File(application.getRealPath(reportFileHome+ File.separator +paramFile));

%>


<!--修改第一处-->
<div id=mengban style="background-color:white;position:absolute;margin-left:16%;z-index:999;width:100%;height:100% ;display:none">
	<table width=100% height=100%>
		<tr><td width=100% style="text-align:center;vertical-align:middle">数据提交中，请稍后......</td></tr>
	</table>
</div>
<td><button onclick="save()" class="tbBtn">保存</button></td>

<td><button onclick="save2()" class="tbBtn">上报</button></td>

<td><button  onclick="group_saveAsExcel();return false;" class="tbBtn">导出Excel</button></td>
<td><button  onclick="group_print();return false;" class="tbBtn">打印</button></td>
<td><button class="tbBtn"> 表间校验</button></td>
<td><button class="tbBtn"> 表内校验</button></td>
<td><button  class="tbBtn" onclick="homePage()">首页</button></td>


<!--<td><button onclick="window.history.back()" class="tbBtn">返回</button></td>-->



<td> <p id="s1"   style="color:red;font-size:17px;font-weight:400"> </p> </td>
<td> <p id="s2"   style="color:red;font-size:17px;font-weight:400"> </p> </td>
<td> <p id="s3"   style="color:#00ff00;font-size:17px;font-weight:400"> </p> </td>


<table id=rpt align=center><tr><td>
<%	//如果参数模板存在，则显示参数模板
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



<script language="javascript"> 
//保存直接入库
 function save() {
	
                var tab = "<%=tab%>";  //获取传进来的表名
				var data = tab.split(',');//获取到的表名为一串字符串组,将字符串组分割转换为数组
                var cell1 = document.getElementById(data[0]+"_E1");		 //data[0]获取传进来的表名中的数组中的第一个表格中的逻辑名
	            //alert(cell1);
				if (cell1=='2'||cell1=='0')
				{
		          alert("不能保存数据！！")
				}
				else {
                 //这块新增一个功能，就是校验不通过的情况下，弹出提示框，提醒用户校验不通过是否要继续保存数据
                 if(group_submit_my()==true){
				  
				  //group_submit_my();
			     }else{
					  layer.confirm('校验不通过，确认要提交数据吗?', 
					  {icon: 3, title:'提示',
							yes: function(index){
							//do something
							group_submit(false);
							},
							cancel: function(index, layero){ 
							layer.close(index);
							//reload();// 可以在这里刷新窗口
						   
						   }  
					  });
				  
			  }
				  
			  }

			     //group_submit(false);
				//修改第二处
				//document.getElementById( "mengban" ).style.display = "";
				//var index = layer.load();
          
			   }
            
				
 
 


 

	//上报入库修改状态值为2
	 function save2() {
					var tab = "<%=tab%>";  //获取传进来的表名
					var data = tab.split(',');//获取到的表名为一串字符串组,将字符串组分割转换为数组
					var length=data.length;//获取数组的长度,也就是接收到的表名一共有多少个
					var cell1 = document.getElementById(data[length-1]+"_E1").attributes.value.value; //data[length-1]最后一个tab参数
					if (cell1=='2'||cell1=='0')
					{
						  alert("不能上报！！")
		            }
				    else {  //先判断数据有没有保存过,如果状态值为空,就提示请先保存数据
						if (cell1 == '' || cell1 == null){
							   alert("请先保存数据");
						}else{
							//如果有数据,就修改状态值为2
							//cell1.attributes.value.value='2';
								if (group_submit_my()==true) {
										document.getElementById(data[length-1]+"_E1").attributes.value.value='2';
										var cell2=document.getElementById(data[length-1]+"_E1").attributes.value.value='2';
										//判断如果校验通过就进入数据加载中页面,如果不通过,就不进入加载页面
										if (group_submit_my()){
											//document.getElementById( "mengban" ).style.display = "";
											var index = layer.load();
										}
								}
					     }
					}
	}

 
	 //自定义校验函数 专为路局，站段定义的方法   22222222222222222222222222222
	  function checkRs(dept,station,sta_ope,roadbureau,roa_ope){ 
	  dept = <%=dept%>
	  //alert(dept);
	  //dept参数为接收站段或者路局的参数，
	  //station和sta_ope 为接收站段校验，第一个是单元格值，第二个是运算符
	  //roadbureau和roa_ope 为接收路局校验，第一个是单元格值，第二个是运算符
		var zd =check("d35b_G9,d35b_H9,d35b_I9,d35b_J9","=++"); 
		var lj =check("d35b_G9,d35b_H9,d35b_I9","=+");
		//alert(zd+":"+lj);
		if (dept=='1'){//字符串'1'代表站段
		  //站段的校验   
		  //alert('站段'+dept);
		  if(zd){
			return true; //如果校验通过就不提醒
		  }else{
			return false; //如果校验不通过就提醒校验
		  }
		}
		else if (dept=='2'){//字符串'2'代表路局
		  //路局的校验  
		  //alert('路局'+dept);
		  if(lj){
			
			return true;  //如果校验通过就不提醒
		  }else{
			return false;  //如果校验不通过就提醒校验
		  }
		}
	  }
 


	 //自定义表间校验方法
	function check(a1,a2){ 
		// a1 数据id ，a2 运算符
		var str = a1.split(",");
		var arr = [];//数据数组
		for (var i = 0;i<str.length ; i++)  //循环遍历传递进来的str
		{
			arr[i] = document.getElementById( str[i] ).getAttribute("value");  //获取单元格的value
			if (isNaN(arr[i]) || arr[i].replace(/\s/g,"") == "")     //如果有非法数值类型，返回false
			{
				return false;
			}
		}
		//alert(arr);
		var sum = arr[0]+"==";     //第一个value ==
		for(var i =1 ;i<arr.length;i++){
			sum+=a2.substring(i-1,i); //i=1   sum='3=='+'='                   // i=2   sum='3===1'+'+'  sum='3===1+'
			sum+=arr[i];             // i=1   sum='3==='+1-->sum='3===1'     //i=2     sum='3===1+' + 2   --> sum = '3===1+2'
		}
		//alert(sum);
		var s = eval(sum);  //判断计算表达式结果是否为true,并返回
		return s;
	}

 


	var tab = "<%=tab%>";  //获取传进来的表名
	var data = tab.split(',');//获取到的表名为一串字符串组,将字符串组分割转换为数组
	var length=data.length;//获取数组的长度,也就是接收到的表名一共有多少个
    var cell1 = document.getElementById(data[length-1]+"_E1").attributes.value.value; //data[length-1]最后一个tab参数
				  
				
	  if(cell1 == '2'){
		$("#s1").html(">>已上报，待审核！");
	  }else if(cell1 == '3'){
		$("#s2").html(">>已驳回！");
	  }else if(cell1=='0'){
		 $("#s3").html(">>审核通过！");
	  }



	//点击改变样式
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
	
		
	//回到首页的方法

	function homePage(){
			
		var rybm="<%=rybm%>";
		var dept="<%=dept%>";

		window.location.href = "http://localhost/report/reportJsp/showReportShlb.jsp?raq=/ganBuTongJi/ganBuTongJi_tb/shlb_one_roadbureau.raq&dept="+dept+"&rybm="+rybm;
		
		 //var index = layer.load();
	}


</script>




</body>
</html>
