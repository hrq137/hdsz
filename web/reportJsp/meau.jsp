﻿<%@ page contentType="text/html;charset=utf-8" %>
<%@ taglib uri="/WEB-INF/runqianReport4.tld" prefix="report" %>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>
<%@ page import="com.runqian.report4.usermodel.Context"%>
<%@ page import="com.huida.ReportApproval"%>
<%@ page import="com.huida.ReportDataMain"%>
<%@ page import="com.huida.DataSourceMain"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<%@ page isELIgnored="false"%>
<!doctype html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport"content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>报表组</title>

<script src="js/adapter.js"></script> <!--rem适配js-->
<script type="text/javascript" src="js/jquery-1.11.1.min.js"></script>
<link rel="stylesheet" href="css/base.css"> <!--初始化文件-->
<link rel="stylesheet" href="css/menu.css"> <!--主样式-->

</head>
<body style="overflow:hidden;">
<style>
	#rq_tabs { background:white;font-size:13px;font-family:Arial;line-height:normal; }
	#rq_tabs label { margin:0;padding:0; }
	#rq_tabs a { float:left;margin:0;padding:0 0 0 4px;text-decoration:none;}
	#rq_tabs a span { float:left;padding:5px 15px 4px 6px;color:#696969; }
	#rq_tabs a:hover { background-position:0% -42px; }
	// #rq_tabs a:hover span { background-position:100% -42px; color:blue; }
	#rq_tabs label.rq_curr a { background-position:0% -42px; }
	#rq_tabs label.rq_curr a span { background-position:100% -42px; color:blue; }
	.title {width : 6rem}
	.title label {float : left}
	.menu{
		width:15%; 
		height:650px;
	}
	.menu1{
		width:0%; 
		height:650px;
	}
</style>
<%
	request.setCharacterEncoding( "GBK" );
	//用户部门
	String dept = request.getParameter("dept");
	ReportApproval ra = new ReportApproval();
	DataSourceMain ds = new DataSourceMain();
	ds.setJdbc("oracle.jdbc.driver.OracleDriver");
	ds.setUrl("jdbc:oracle:thin:@172.25.42.118:1521:orcl");
	ds.setUname("pesoel");
	ds.setPword("pesoel");
	String sql = "select * from (select distinct * from (select regexp_substr(q.slc_tab, '[^,]+', 1, Level,'i') " +
			     "tab,q.id tjdate,q.startdate,q.enddate,q.col,q.celery from parameter q " +
				 "connect by Level <= LENGTH(q.slc_tab) - LENGTH(REGEXP_REPLACE(q.slc_tab, ',', '')) + 1)"+
				 "a where  a.celery = 1) a left join Test1 b on a.tab = b.table_ID";
	List<ReportDataMain> lists=ra.getMenuData(ds,sql);
	//干统库 获取userId参数
	ds.setJdbc("oracle.jdbc.driver.OracleDriver");
	ds.setUrl("jdbc:oracle:thin:@172.25.42.231:1521:hrmis");
	ds.setUname("sy");
	ds.setPword("Hrmis150");
	sql = "select dwbsm as id,dwmc as name  from lz_dwjbxx where  dwbsm in "+
		  "(select dwbsm from gg_yhqxxx where dwxxbmbs=(select a.bmbm from gg_zgjbxx a where a.rybm='2021295835'))"+
		  "and  validflag='1'";
	String userId = ra.getCompanyData(ds,sql);
	//干统库 获取opCod 参数
	sql = "select dwbsm  as id  from gg_yhqxxx where dwxxbmbs=(select a.bmbm from gg_zgjbxx a where a.rybm='2021295835')";
	String opCod = ra.getPowerData(ds,sql);
	String oneUrl = "";
	//将完整的url后边的参数拼接好
	for(int i=0;i<lists.size();i++){
		System.out.println("---->"+lists.get(i).getTableName());
		ReportDataMain rm = lists.get(i);
		rm.setUrl(rm.getUrl()+"&userID="+userId+"&opCod="+opCod+"&dept="+dept);
	}
	if(lists != null && lists.size()>0){
		//默认右边iframe显示第一个链接的url
		oneUrl = lists.get(0).getUrl();
	}
	System.out.println("数组长度:"+lists.size());
%>
<div id="menu" class="menu" style="overflow:scroll;background: white; overflow-x: hidden; overflow-y: auto;">
    <!--显示菜单-->
	<div style='padding-bottom:1px;text-align:left;display: inline-block;float: left;' >
	<table cellspacing=0 cellpadding=0 border=0>
		<tr>
			<td id=rq_tabs style="padding: 1px 2px 0 2px" nowrap>
				<div style='padding-bottom:1px;text-align:left;display: inline-block;float: left;' >
					<label id="tab_item1">
					<a href='#' id='allReport' style='display:block;' onclick="allReport()">
					<span title="所有报表" style='cursor:pointer;width:250px;'>
					所有报表
					</span>
					</a>
					</label>
				</div>
			<c:forEach var="list" items="<%= lists %>" varStatus="index">
				<div style='padding-bottom:1px;text-align:left;display: inline-block;float: left;' >
					<label id="tab_item1">
					<a href='#' id='${list.tab}' style='display:block;' onclick="moduleClick('${list.url}',this)">
					<span title="${list.title}" style='cursor:pointer;width:250px;'>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${list.tableName}
					</span>
					</a>
					</label>
				</div>
			</c:forEach>
			</td>
		</tr>
	</table>
</div>
</div>

	<div id='images' style="padding-bottom: 1px; text-align: center; position: absolute; left: 15%; margin-top: 20%;">
		<img src="images/merge.png" id="showLeftPush" title="点击收缩">
	</div>
	
<script src="js/menu.js"></script> <!--控制js-->
<div style="padding:0px;">
	<iframe id="mainframe" style="width:85%;height:100vh" frameborder="0" style="marging:0px;"></iframe>
</div>
<script>
	function isBigEnough(element, index, array) {
		return (element[1] == 'rateOfTime');
	}
	$(function(){
		var url = '<%= oneUrl%>';
		$("#mainframe").attr("src",url);
	})
	function redirect(){
		window.location.href="http://www.baidu.com"; 
	}
	function moduleClick(link,obj){
		var ts = $("#"+obj.getAttribute("id")).children("span").attr("title");
		$("a span").each(function(index, element) {
			var title = $(this).attr('title');
			if(ts != title){
				  $(this).css("color","#696969");
				//$(this).css("color","#ccc"); 
			}else {
				//$(this).css("color","#fff"); 
				$(this).css("color","red");
			}
		});
		$("#mainframe").attr("src",link);
	}
	$('a span').each(function() {
		var title = $(this).attr('value');
		if(title.length >11){
			$(this).html(title.substring(0,13)+"...");
		}
    });

	showLeftPush = document.getElementById( 'showLeftPush' ),
	showLeftPush.onclick = function() {
		var className = document.getElementById('menu').className;
		if(className == 'menu'){
			document.getElementById('menu').className = 'menu1';
			document.getElementById('mainframe').style.width = '100%';
			document.getElementById('showLeftPush').src = "images/shrink.png";
			document.getElementById('images').style.left = "0%";
			document.getElementById('showLeftPush').title = "点击展开";
		}else if (className == 'menu1'){
			document.getElementById('menu').className = 'menu';
			document.getElementById('mainframe').style.width = '85%';
			document.getElementById('showLeftPush').src = "images/merge.png";
			document.getElementById('images').style.left = "15%";
			document.getElementById('showLeftPush').title = "点击收缩";
		}
	};
		
	function allReport(){
	  window.location.href="http://localhost/report/reportJsp/showReportGrouptb.jsp?rpg=/ganBuTongJi/ganBuTongJi_zx/zxGroup.rpg&tjDate=svemryuz220cdqnzhem7lvqdx467ruzw4717afvhp5q0mbpervzo6uunscvfr437&userID=999900020003&startDate=2019/01/01&endDate=2019/12/31&col=rybm,xm,xb,dwbsm,dwmc,mz,csrq,xjszwmc,zwjb,gcjsgw,zzmm,zwmc,qrzxl,dwbm,rybdxxbs,bdsj,ryly,ryqx,rylb&tab=hz1,hz2,hz3,jg1&dept=1&opCod=999917256574,999900020003"; 
	}
</script>
</body>
</html>