<%@ page contentType="text/html;charset=utf-8" %>
<%@ taglib uri="/WEB-INF/runqianReport4.tld" prefix="report" %>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>
<%@ page import="com.runqian.report4.usermodel.Context"%>
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
		#rq_tabs { background:#F4F7FB;font-size:12px;font-family: Verdana, Geneva, sans-serif;line-height:normal;border-bottom:1px solid #BCD2E6; }
		#rq_tabs label { margin:0;padding:0; }
		#rq_tabs a { float:left;margin:0;padding:0 0 0 4px;text-decoration:none;}
		#rq_tabs a span { float:left;padding:5px 15px 4px 6px;color:#627EB7; }
		#rq_tabs a:hover { background-position:0% -42px; }
		#rq_tabs a:hover span { background-position:100% -42px; color:red; }
		#rq_tabs label.rq_curr a { background-position:0% -42px; }
		#rq_tabs label.rq_curr a span { background-position:100% -42px; color:red; }
		.title {width : 6rem}
		.title label {float : left}
		.menu{overflow:scroll; width:15%; height:650px;}
		.menu1{overflow:scroll; width:0%; height:650px;}
	</style>
	<%
		request.setCharacterEncoding( "GBK" );
		String report = request.getParameter( "raq" );
		String endDate = request.getParameter("endDate");
		String startDate = request.getParameter("startDate");
		//String tableName = request.getParameter("tableName");
		String tjDate = request.getParameter("tjDate");
		String userID = request.getParameter("userID");
		String col = request.getParameter("col"); //第一处
		String reportFileHome=Context.getInitCtx().getMainDir();
		StringBuffer param=new StringBuffer();
		String root = request.getContextPath();
		String name = request.getParameter("tab");
	%>
	<div id="menu" class="menu">
		<div style='padding-bottom:1px;text-align:left;display: inline-block;float: left;' >
			<table cellspacing=0 cellpadding=0 border=0>
			<td id=rq_tabs style="padding: 1px 2px 0 2px" nowrap>
			<label id="tab_item1">
			<a href='#' id='d1b' style='display:none;' onclick="moduleClick('/report/dn_reportJsp/showReport_tb.jsp?raq=/dangNeiTongJi/dangNeiTongJi_zx/d1b_zx.raq&tjDate=<%=tjDate%>&startDate=<%=startDate%>&endDate=<%=endDate%>&userID=<%=userID%>&col=<%=col%>')">
			<span title="党员数量变化情况" style='cursor:pointer;width:250px;'>
				党员数量变化情况
			</span>
			</a>
			</label>
			<div style='padding-bottom:1px;text-align:left;display: inline-block;float: left;' >
				<label id="tab_item1">
				<a href='#' id='d2b' style='display:none;' onclick="moduleClick('/report/dn_reportJsp/showReport_tb.jsp?raq=/dangNeiTongJi/dangNeiTongJi_zx/d2b_zx.raq&tjDate=<%=tjDate%>&startDate=<%=startDate%>&endDate=<%=endDate%>&userID=<%=userID%>&col=<%=col%>')">
				<span title="党员基本情况" style='cursor:pointer;width:250px;'>
					党员基本情况
				</span>
				</a>
				</label>
			</div>
			<div style='padding-bottom:1px;text-align:left;display: inline-block;float: left;' >
				<label id="tab_item1">
				<a href='#' id='d3b' style='display:none;' onclick="moduleClick('/report/dn_reportJsp/showReport_tb.jsp?raq=/dangNeiTongJi/dangNeiTongJi_zx/d3b_zx.raq&tjDate=<%=tjDate%>&startDate=<%=startDate%>&endDate=<%=endDate%>&userID=<%=userID%>&col=<%=col%>')">
				<span title="党员入党时间情况" style='cursor:pointer;width:250px;'>
					党员入党时间情况
				</span>
				</a>
				</label>
			</div>
			<div style='padding-bottom:1px;text-align:left;display: inline-block;float: left;' >
				<label id="tab_item1">
				<a href='#' id='d4b' style='display:none;' onclick="moduleClick('/report/dn_reportJsp/showReport_tb.jsp?raq=/dangNeiTongJi/dangNeiTongJi_zx/d4b_zx.raq&tjDate=<%=tjDate%>&startDate=<%=startDate%>&endDate=<%=endDate%>&userID=<%=userID%>&col=<%=col%>')">
				<span title="党员学历情况" style='cursor:pointer;width:250px;'>
					党员学历情况
				</span>
				</a>
				</label>
			</div>
			<div style='padding-bottom:1px;text-align:left;display: inline-block;float: left;' >
				<label id="tab_item1">
				<a href='#' id='d7b' style='display:none;' onclick="moduleClick('/report/dn_reportJsp/showReport_tb.jsp?raq=/dangNeiTongJi/dangNeiTongJi_zx/d7b_zx.raq&tjDate=<%=tjDate%>&startDate=<%=startDate%>&endDate=<%=endDate%>&userID=<%=userID%>&col=<%=col%>')">
				<span title="学生党员情况" style='cursor:pointer;width:250px;'>
					学生党员情况
				</span>
				</a>
				</label>
			</div>
			<div style='padding-bottom:1px;text-align:left;display: inline-block;float: left;' >
				<label id="tab_item1">
				<a href='#' id='d8b' style='display:none;' onclick="moduleClick('/report/dn_reportJsp/showReport_tb.jsp?raq=/dangNeiTongJi/dangNeiTongJi_zx/d8b_zx.raq&tjDate=<%=tjDate%>&startDate=<%=startDate%>&endDate=<%=endDate%>&userID=<%=userID%>&col=<%=col%>')">
				<span title="民主评议党员情况" style='cursor:pointer;width:250px;'>
					民主评议党员情况
				</span>
				</a>
				</label>
			</div>
			<div style='padding-bottom:1px;text-align:left;display: inline-block;float: left;' >
				<label id="tab_item1">
				<a href='#' id='d9b' style='display:none;' onclick="moduleClick('/report/dn_reportJsp/showReport_tb.jsp?raq=/dangNeiTongJi/dangNeiTongJi_zx/d9b_zx.raq&tjDate=<%=tjDate%>&startDate=<%=startDate%>&endDate=<%=endDate%>&userID=<%=userID%>&col=<%=col%>')">
				<span title="党员培训情况" style='cursor:pointer;width:250px;'>
					党员培训情况
				</span>
				</a>
				</label>
			</div>
			<div style='padding-bottom:1px;text-align:left;display: inline-block;float: left;' >
				<label id="tab_item1">
				<a href='#' id='d10b' style='display:none;' onclick="moduleClick('/report/dn_reportJsp/showReport_tb.jsp?raq=/dangNeiTongJi/dangNeiTongJi_zx/d10b_zx.raq&tjDate=<%=tjDate%>&startDate=<%=startDate%>&endDate=<%=endDate%>&userID=<%=userID%>&col=<%=col%>')">
				<span title="党员出党情况（一）" style='cursor:pointer;width:250px;'>
					党员出党情况（一）
				</span>
				</a>
				</label>
			</div>
			<div style='padding-bottom:1px;text-align:left;display: inline-block;float: left;' >
				<label id="tab_item1">
				<a href='#' id='d11b' style='display:none;' onclick="moduleClick('/report/dn_reportJsp/showReport_tb.jsp?raq=/dangNeiTongJi/dangNeiTongJi_zx/d11b_zx.raq&tjDate=<%=tjDate%>&startDate=<%=startDate%>&endDate=<%=endDate%>&userID=<%=userID%>&col=<%=col%>')">
				<span title="党员出党情况（二）" style='cursor:pointer;width:250px;'>
					党员出党情况（二）
				</span>
				</a>
				</label>
			</div>
			<div style='padding-bottom:1px;text-align:left;display: inline-block;float: left;' >
				<label id="tab_item1">
				<a href='#' id='d12b' style='display:none;' onclick="moduleClick('/report/dn_reportJsp/showReport_tb.jsp?raq=/dangNeiTongJi/dangNeiTongJi_zx/d12b_zx.raq&tjDate=<%=tjDate%>&startDate=<%=startDate%>&endDate=<%=endDate%>&userID=<%=userID%>&col=<%=col%>')">
				<span title="党员受党的纪律处分情况（一）" style='cursor:pointer;width:250px;'>
					党员受党的纪律处分情况（一）
				</span>
				</a>
				</label>
			</div>
			<div style='padding-bottom:1px;text-align:left;display: inline-block;float: left;' >
				<label id="tab_item1">
				<a href='#' id='d13b' style='display:none;' onclick="moduleClick('/report/dn_reportJsp/showReport_tb.jsp?raq=/dangNeiTongJi/dangNeiTongJi_zx/d13b_zx.raq&tjDate=<%=tjDate%>&startDate=<%=startDate%>&endDate=<%=endDate%>&userID=<%=userID%>&col=<%=col%>')">
				<span title="党员受党的纪律处分情况（二）" style='cursor:pointer;width:250px;'>
					党员受党的纪律处分情况（二）
				</span>
				</a>
				</label>
			</div>
			<div style='padding-bottom:1px;text-align:left;display: inline-block;float: left;' >
				<label id="tab_item1">
				<a href='#' id='d14b' style='display:none;' onclick="moduleClick('/report/dn_reportJsp/showReport_tb.jsp?raq=/dangNeiTongJi/dangNeiTongJi_zx/d14b_zx.raq&tjDate=<%=tjDate%>&startDate=<%=startDate%>&endDate=<%=endDate%>&userID=<%=userID%>&col=<%=col%>')">
				<span title="党内表彰情况" style='cursor:pointer;width:250px;'>
					党内表彰情况
				</span>
				</a>
				</label>
			</div>
			<div style='padding-bottom:1px;text-align:left;display: inline-block;float: left;' >
				<label id="tab_item1">
				<a href='#' id='d15b' style='display:none;' onclick="moduleClick('/report/dn_reportJsp/showReport_tb.jsp?raq=/dangNeiTongJi/dangNeiTongJi_zx/d15b_zx.raq&tjDate=<%=tjDate%>&startDate=<%=startDate%>&endDate=<%=endDate%>&userID=<%=userID%>&col=<%=col%>')">
				<span title="预备党员转正情况" style='cursor:pointer;width:250px;'>
					预备党员转正情况
				</span>
				</a>
				</label>
			</div>
			<div style='padding-bottom:1px;text-align:left;display: inline-block;float: left;' >
				<label id="tab_item1">
				<a href='#' id='d16b' style='display:none;' onclick="moduleClick('/report/dn_reportJsp/showReport_tb.jsp?raq=/dangNeiTongJi/dangNeiTongJi_zx/d16b_zx.raq&tjDate=<%=tjDate%>&startDate=<%=startDate%>&endDate=<%=endDate%>&userID=<%=userID%>&col=<%=col%>')">
				<span title="发展党员情况（一）" style='cursor:pointer;width:250px;'>
					发展党员情况（一）
				</span>
				</a>
				</label>
			</div>
			<div style='padding-bottom:1px;text-align:left;display: inline-block;float: left;' >
				<label id="tab_item1">
				<a href='#' id='d17b' style='display:none;' onclick="moduleClick('/report/dn_reportJsp/showReport_tb.jsp?raq=/dangNeiTongJi/dangNeiTongJi_zx/d17b_zx.raq&tjDate=<%=tjDate%>&startDate=<%=startDate%>&endDate=<%=endDate%>&userID=<%=userID%>&col=<%=col%>')">
				<span title="发展党员情况（二）" style='cursor:pointer;width:250px;'>
					发展党员情况（二）
				</span>
				</a>
				</label>
			</div>
			<div style='padding-bottom:1px;text-align:left;display: inline-block;float: left;' >
				<label id="tab_item1">
				<a href='#' id='d18b' style='display:none;' onclick="moduleClick('/report/dn_reportJsp/showReport_tb.jsp?raq=/dangNeiTongJi/dangNeiTongJi_zx/d18b_zx.raq&tjDate=<%=tjDate%>&startDate=<%=startDate%>&endDate=<%=endDate%>&userID=<%=userID%>&col=<%=col%>')">
				<span title="发展对象情况" style='cursor:pointer;width:250px;'>
					发展对象情况
				</span>
				</a>
				</label>
			</div>
			<div style='padding-bottom:1px;text-align:left;display: inline-block;float: left;' >
				<label id="tab_item1">
				<a href='#' id='d19b' style='display:none;' onclick="moduleClick('/report/dn_reportJsp/showReport_tb.jsp?raq=/dangNeiTongJi/dangNeiTongJi_zx/d19b_zx.raq&tjDate=<%=tjDate%>&startDate=<%=startDate%>&endDate=<%=endDate%>&userID=<%=userID%>&col=<%=col%>')">
				<span title="入党积极分子情况" style='cursor:pointer;width:250px;'>
					入党积极分子情况
				</span>
				</a>
				</label>
			</div>
			<div style='padding-bottom:1px;text-align:left;display: inline-block;float: left;' >
				<label id="tab_item1">
				<a href='#' id='d20b' style='display:none;' onclick="moduleClick('/report/dn_reportJsp/showReport_tb.jsp?raq=/dangNeiTongJi/dangNeiTongJi_zx/d20b_zx.raq&tjDate=<%=tjDate%>&startDate=<%=startDate%>&endDate=<%=endDate%>&userID=<%=userID%>&col=<%=col%>')">
				<span title="入党申请人情况" style='cursor:pointer;width:250px;'>
					入党申请人情况
				</span>
				</a>
				</label>
			</div>
			<div style='padding-bottom:1px;text-align:left;display: inline-block;float: left;' >
				<label id="tab_item1">
				<a href='#' id='d24b' style='display:none;' onclick="moduleClick('/report/dn_reportJsp/showReport_tb.jsp?raq=/dangNeiTongJi/dangNeiTongJi_zx/d24b_zx.raq&tjDate=<%=tjDate%>&startDate=<%=startDate%>&endDate=<%=endDate%>&userID=<%=userID%>&col=<%=col%>')">
				<span title="党的基层组织数量情况和换届情况" style='cursor:pointer;width:250px;'>
					党的基层组织数量情况和换届情况
				</span>
				</a>
				</label>
			</div>
			<div style='padding-bottom:1px;text-align:left;display: inline-block;float: left;' >
				<label id="tab_item1">
				<a href='#' id='d26b' style='display:none;' onclick="moduleClick('/report/dn_reportJsp/showReport_tb.jsp?raq=/dangNeiTongJi/dangNeiTongJi_zx/d26b_zx.raq&tjDate=<%=tjDate%>&startDate=<%=startDate%>&endDate=<%=endDate%>&userID=<%=userID%>&col=<%=col%>')">
				<span title="公有经济控制的企业法人单位建立党的基层组织情况" style='cursor:pointer;width:250px;'>
					公有经济控制的企业法人单位建立党的基层组织情况
				</span>
				</a>
				</label>
			</div>
			<div style='padding-bottom:1px;text-align:left;display: inline-block;float: left;' >
				<label id="tab_item1">
				<a href='#' id='d28b' style='display:none;' onclick="moduleClick('/report/dn_reportJsp/showReport_tb.jsp?raq=/dangNeiTongJi/dangNeiTongJi_zx/d28b_zx.raq&tjDate=<%=tjDate%>&startDate=<%=startDate%>&endDate=<%=endDate%>&userID=<%=userID%>&col=<%=col%>')">
				<span title="事业法人单位建立党的基层组织情况" style='cursor:pointer;width:250px;'>
					事业法人单位建立党的基层组织情况
				</span>
				</a>
				</label>
			</div>
			<div style='padding-bottom:1px;text-align:left;display: inline-block;float: left;' >
				<label id="tab_item1">
				<a href='#' id='d30b' style='display:none;' onclick="moduleClick('/report/dn_reportJsp/showReport_tb.jsp?raq=/dangNeiTongJi/dangNeiTongJi_zx/d30b_zx.raq&tjDate=<%=tjDate%>&startDate=<%=startDate%>&endDate=<%=endDate%>&userID=<%=userID%>&col=<%=col%>')">
				<span title="机关法人单位建立党的基层组织情况" style='cursor:pointer;width:250px;'>
					机关法人单位建立党的基层组织情况
				</span>
				</a>
				</label>
			</div>
			<div style='padding-bottom:1px;text-align:left;display: inline-block;float: left;' >
				<label id="tab_item1">
				<a href='#' id='d35b' style='display:none;' onclick="moduleClick('/report/dn_reportJsp/showReport_tb.jsp?raq=/dangNeiTongJi/dangNeiTongJi_zx/d35b_zx.raq&tjDate=<%=tjDate%>&startDate=<%=startDate%>&endDate=<%=endDate%>&userID=<%=userID%>&col=<%=col%>')">
				<span title="流动党员情况（一）" style='cursor:pointer;width:250px;'>
					流动党员情况（一）
				</span>
				</a>
				</label>
			</div>
			<div style='padding-bottom:1px;text-align:left;display: inline-block;float: left;' >
				<label id="tab_item1">
				<a href='#' id='d36b' style='display:none;' onclick="moduleClick('/report/dn_reportJsp/showReport_tb.jsp?raq=/dangNeiTongJi/dangNeiTongJi_zx/d36b_zx.raq&tjDate=<%=tjDate%>&startDate=<%=startDate%>&endDate=<%=endDate%>&userID=<%=userID%>&col=<%=col%>')">
				<span title="流动党员情况（二）" style='cursor:pointer;width:250px;'>
					流动党员情况（二）
				</span>
				</a>
				</label>
			</div>
			<div style='padding-bottom:1px;text-align:left;display: inline-block;float: left;' >
				<label id="tab_item1">
				<a href='#' id='d37b' style='display:none;' onclick="moduleClick('/report/dn_reportJsp/showReport_tb.jsp?raq=/dangNeiTongJi/dangNeiTongJi_zx/d37b_zx.raq&tjDate=<%=tjDate%>&startDate=<%=startDate%>&endDate=<%=endDate%>&userID=<%=userID%>&col=<%=col%>')">
				<span title="出国（境）党员情况" style='cursor:pointer;width:250px;'>
					出国（境）党员情况
				</span>
				</a>
				</label>
			</div>	
			<div style='padding-bottom:1px;text-align:left;display: inline-block;float: left;' >
				<label id="tab_item1">
				<a href='#' id='d38b' style='display:none;' onclick="moduleClick('/report/dn_reportJsp/showReport_tb.jsp?raq=/dangNeiTongJi/dangNeiTongJi_zx/d38b_zx.raq&tjDate=<%=tjDate%>&startDate=<%=startDate%>&endDate=<%=endDate%>&userID=<%=userID%>&col=<%=col%>')">
				<span title="留学回国人员党员情况" style='cursor:pointer;width:250px;'>
					留学回国人员党员情况
				</span>
				</a>
				</label>
			</div>
			<div style='padding-bottom:1px;text-align:left;display: inline-block;float: left;' >
				<label id="tab_item1">
				<a href='#' id='d39b' style='display:none;' onclick="moduleClick('/report/dn_reportJsp/showReport_tb.jsp?raq=/dangNeiTongJi/dangNeiTongJi_zx/d39b_zx.raq&tjDate=<%=tjDate%>&startDate=<%=startDate%>&endDate=<%=endDate%>&userID=<%=userID%>&col=<%=col%>')">
				<span title="省、市、县、乡和铁路系统党的代表大会代表情况" style='cursor:pointer;width:250px;'>
					省、市、县、乡和铁路系统党的代表大会代表情况
				</span>
				</a>
				</label>
			</div>
			<div style='padding-bottom:1px;text-align:left;display: inline-block;float: left;' >
				<label id="tab_item1">
				<a href='#' id='ztdc6' style='display:none;' onclick="moduleClick('/report/dn_reportJsp/showReport_tb.jsp?raq=/dangNeiTongJi/dangNeiTongJi_zx/ztdc6_zx.raq&tjDate=<%=tjDate%>&startDate=<%=startDate%>&endDate=<%=endDate%>&userID=<%=userID%>&col=<%=col%>')">
				<span title="整顿软弱涣散基层党组织情况" style='cursor:pointer;width:250px;'>
					整顿软弱涣散基层党组织情况
				</span>
				</a>
				</label>
			</div>
			<div style='padding-bottom:1px;text-align:left;display: inline-block;float: left;' >
				<label id="tab_item1">
				<a href='#' id='ztdc9' style='display:none;' onclick="moduleClick('/report/dn_reportJsp/showReport_tb.jsp?raq=/dangNeiTongJi/dangNeiTongJi_zx/ztdc9_zx.raq&tjDate=<%=tjDate%>&startDate=<%=startDate%>&endDate=<%=endDate%>&userID=<%=userID%>&col=<%=col%>')">
				<span title="国有经济控制的企业党建工作情况" style='cursor:pointer;width:250px;'>
					国有经济控制的企业党建工作情况
				</span>
				</a>
				</label>
			</div>
			<div style='padding-bottom:1px;text-align:left;display: inline-block;float: left;' >
				<label id="tab_item1">
				<a href='#' id='bb1' style='display:none;' onclick="moduleClick('/report/dn_reportJsp/showReport_tb.jsp?raq=/dangNeiTongJi/dangNeiTongJi_zx/bb1_zx.raq&tjDate=<%=tjDate%>&startDate=<%=startDate%>&endDate=<%=endDate%>&userID=<%=userID%>&col=<%=col%>')">
				<span title="党的基层组织及基层党组织书记分布情况（一）" style='cursor:pointer;width:250px;'>
					党的基层组织及基层党组织书记分布情况（一）
				</span>
				</a>
				</label>
			</div>
			<div style='padding-bottom:1px;text-align:left;display: inline-block;float: left;' >
				<label id="tab_item1">
				<a href='#' id='bb2' style='display:none;' onclick="moduleClick('/report/dn_reportJsp/showReport_tb.jsp?raq=/dangNeiTongJi/dangNeiTongJi_zx/bb2_zx.raq&tjDate=<%=tjDate%>&startDate=<%=startDate%>&endDate=<%=endDate%>&userID=<%=userID%>&col=<%=col%>')">
				<span title="党的基层组织及基层党组织书记分布情况（二）" style='cursor:pointer;width:250px;'>
					党的基层组织及基层党组织书记分布情况（二）
				</span>
				</a>
				</label>
			</div>
			<div style='padding-bottom:1px;text-align:left;display: inline-block;float: left;' >
				<label id="tab_item1">
				<a href='#' id='bb3' style='display:none;' onclick="moduleClick('/report/dn_reportJsp/showReport_tb.jsp?raq=/dangNeiTongJi/dangNeiTongJi_zx/bb3_zx.raq&tjDate=<%=tjDate%>&startDate=<%=startDate%>&endDate=<%=endDate%>&userID=<%=userID%>&col=<%=col%>')">
				<span title="运输站段党组织、党员情况" style='cursor:pointer;width:250px;'>
					运输站段党组织、党员情况
				</span>
				</a>
				</label>
			</div>
			<div style='padding-bottom:1px;text-align:left;display: inline-block;float: left;' >
				<label id="tab_item1">
				<a href='#' id='bb4' style='display:none;' onclick="moduleClick('/report/dn_reportJsp/showReport_tb.jsp?raq=/dangNeiTongJi/dangNeiTongJi_zx/bb4_zx.raq&tjDate=<%=tjDate%>&startDate=<%=startDate%>&endDate=<%=endDate%>&userID=<%=userID%>&col=<%=col%>')">
				<span title="全路运输企业党群机构现员统计表" style='cursor:pointer;width:250px;'>
					全路运输企业党群机构现员统计表
				</span>
				</a>
				</label>
			</div>
			<div style='padding-bottom:1px;text-align:left;display: inline-block;float: left;' >
				<label id="tab_item1">
				<a href='#' id='bb5' style='display:none;' onclick="moduleClick('/report/dn_reportJsp/showReport_tb.jsp?raq=/dangNeiTongJi/dangNeiTongJi_zx/bb5_zx.raq&tjDate=<%=tjDate%>&startDate=<%=startDate%>&endDate=<%=endDate%>&userID=<%=userID%>&col=<%=col%>')">
				<span title="党组织换届情况" style='cursor:pointer;width:250px;'>
					党组织换届情况
				</span>
				</a>
				</label>
			</div>
			<div style='padding-bottom:1px;text-align:left;display: inline-block;float: left;' >
				<label id="tab_item1">
				<a href='#' id='bb6' style='display:none;' onclick="moduleClick('/report/dn_reportJsp/showReport_tb.jsp?raq=/dangNeiTongJi/dangNeiTongJi_zx/bb6_zx.raq&tjDate=<%=tjDate%>&startDate=<%=startDate%>&endDate=<%=endDate%>&userID=<%=userID%>&col=<%=col%>')">
				<span title="高铁领域运输站段党组织和党员情况专项调查表" style='cursor:pointer;width:250px;'>
					高铁领域运输站段党组织和党员情况专项调查表
				</span>
				</a>
				</label>
			</div>
			<div style='padding-bottom:1px;text-align:left;display: inline-block;float: left;' >
				<label id="tab_item1">
				<a href='#' id='zb1' style='display:none;' onclick="moduleClick('/report/dn_reportJsp/showReport_tb.jsp?raq=/dangNeiTongJi/dangNeiTongJi_zx/zb1_zx.raq&tjDate=<%=tjDate%>&startDate=<%=startDate%>&endDate=<%=endDate%>&userID=<%=userID%>&col=<%=col%>')">
				<span title="党组织情况一览表" style='cursor:pointer;width:250px;'>
					党组织情况一览表
				</span>
				</a>
				</label>
			</div>
			<div style='padding-bottom:1px;text-align:left;display: inline-block;float: left;' >
				<label id="tab_item1">
				<a href='#' id='zb1' style='display:none;' onclick="moduleClick('/report/dn_reportJsp/showReport_tb.jsp?raq=/dangNeiTongJi/dangNeiTongJi_zx/zb1_zx.raq&tjDate=<%=tjDate%>&startDate=<%=startDate%>&endDate=<%=endDate%>&userID=<%=userID%>&col=<%=col%>')">
				<span title="党组织情况一览表" style='cursor:pointer;width:250px;'>
					党组织情况一览表
				</span>
				</a>
				</label>
			</div>
			<div style='padding-bottom:1px;text-align:left;display: inline-block;float: left;' >
				<label id="tab_item1">
				<a href='#' id='zb2' style='display:none;' onclick="moduleClick('/report/dn_reportJsp/showReport_tb.jsp?raq=/dangNeiTongJi/dangNeiTongJi_zx/zb2_zx.raq&tjDate=<%=tjDate%>&startDate=<%=startDate%>&endDate=<%=endDate%>&userID=<%=userID%>&col=<%=col%>')">
				<span title="党员基本情况及其他情况一览表" style='cursor:pointer;width:250px;'>
					党员基本情况及其他情况一览表
				</span>
				</a>
				</label>
			</div>
			<div style='padding-bottom:1px;text-align:left;display: inline-block;float: left;' >
				<label id="tab_item1">
				<a href='#' id='qt' style='display:none;' onclick="moduleClick('/report/dn_reportJsp/showReport_tb.jsp?raq=/dangNeiTongJi/dangNeiTongJi_zx/qt_zx.raq&tjDate=<%=tjDate%>&startDate=<%=startDate%>&endDate=<%=endDate%>&userID=<%=userID%>&col=<%=col%>')">
				<span title="铁路局党群机构现员统计表" style='cursor:pointer;width:250px;'>
				铁路局党群机构现员统计表
				</span>
				</a>
				</label>
			</div>
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
		<iframe id="mainframe" style="width:80%;height:100vh;marging:0px;" frameborder="0"></iframe>
	</div>
<script>
	function isBigEnough(element, index, array) {
		return (element[1] == 'rateOfTime');
	}
	$(function(){
		var src = {};
		src["d1b"] = "/report/dn_reportJsp/showReport_tb.jsp?raq=/dangNeiTongJi/dangNeiTongJi_zx/d1b_zx.raq&tjDate=<%=tjDate%>&startDate=<%=startDate%>&endDate=<%=endDate%>&userID=<%=userID%>&col=<%=col%>";
		src["d2b"] = "/report/dn_reportJsp/showReport_tb.jsp?raq=/dangNeiTongJi/dangNeiTongJi_zx/d2b_zx.raq&tjDate=<%=tjDate%>&startDate=<%=startDate%>&endDate=<%=endDate%>&userID=<%=userID%>&col=<%=col%>";
		src["d3b"] = "/report/dn_reportJsp/showReport_tb.jsp?raq=/dangNeiTongJi/dangNeiTongJi_zx/d3b_zx.raq&tjDate=<%=tjDate%>&startDate=<%=startDate%>&endDate=<%=endDate%>&userID=<%=userID%>&col=<%=col%>";
		src["d4b"] = "/report/dn_reportJsp/showReport_tb.jsp?raq=/dangNeiTongJi/dangNeiTongJi_zx/d4b_zx.raq&tjDate=<%=tjDate%>&startDate=<%=startDate%>&endDate=<%=endDate%>&userID=<%=userID%>&col=<%=col%>";
		src["d7b"] = "/report/dn_reportJsp/showReport_tb.jsp?raq=/dangNeiTongJi/dangNeiTongJi_zx/d7b_zx.raq&tjDate=<%=tjDate%>&startDate=<%=startDate%>&endDate=<%=endDate%>&userID=<%=userID%>&col=<%=col%>";
		src["d8b"] = "/report/dn_reportJsp/showReport_tb.jsp?raq=/dangNeiTongJi/dangNeiTongJi_zx/d8b_zx.raq&tjDate=<%=tjDate%>&startDate=<%=startDate%>&endDate=<%=endDate%>&userID=<%=userID%>&col=<%=col%>";
		src["d9b"] = "/report/dn_reportJsp/showReport_tb.jsp?raq=/dangNeiTongJi/dangNeiTongJi_zx/d9b_zx.raq&tjDate=<%=tjDate%>&startDate=<%=startDate%>&endDate=<%=endDate%>&userID=<%=userID%>&col=<%=col%>";
		src["d10b"] = "/report/dn_reportJsp/showReport_tb.jsp?raq=/dangNeiTongJi/dangNeiTongJi_zx/d10b_zx.raq&tjDate=<%=tjDate%>&startDate=<%=startDate%>&endDate=<%=endDate%>&userID=<%=userID%>&col=<%=col%>";
		src["d11b"] = "/report/dn_reportJsp/showReport_tb.jsp?raq=/dangNeiTongJi/dangNeiTongJi_zx/d11b_zx.raq&tjDate=<%=tjDate%>&startDate=<%=startDate%>&endDate=<%=endDate%>&userID=<%=userID%>&col=<%=col%>";
		src["d12b"] = "/report/dn_reportJsp/showReport_tb.jsp?raq=/dangNeiTongJi/dangNeiTongJi_zx/d12b_zx.raq&tjDate=<%=tjDate%>&startDate=<%=startDate%>&endDate=<%=endDate%>&userID=<%=userID%>&col=<%=col%>";
		src["d13b"] = "/report/dn_reportJsp/showReport_tb.jsp?raq=/dangNeiTongJi/dangNeiTongJi_zx/d13b_zx.raq&tjDate=<%=tjDate%>&startDate=<%=startDate%>&endDate=<%=endDate%>&userID=<%=userID%>&col=<%=col%>";
		src["d14b"] = "/report/dn_reportJsp/showReport_tb.jsp?raq=/dangNeiTongJi/dangNeiTongJi_zx/d14b_zx.raq&tjDate=<%=tjDate%>&startDate=<%=startDate%>&endDate=<%=endDate%>&userID=<%=userID%>&col=<%=col%>";
		src["d15b"] = "/report/dn_reportJsp/showReport_tb.jsp?raq=/dangNeiTongJi/dangNeiTongJi_zx/d15b_zx.raq&tjDate=<%=tjDate%>&startDate=<%=startDate%>&endDate=<%=endDate%>&userID=<%=userID%>&col=<%=col%>";
		src["d16b"] = "/report/dn_reportJsp/showReport_tb.jsp?raq=/dangNeiTongJi/dangNeiTongJi_zx/d16b_zx.raq&tjDate=<%=tjDate%>&startDate=<%=startDate%>&endDate=<%=endDate%>&userID=<%=userID%>&col=<%=col%>";
		src["d17b"] = "/report/dn_reportJsp/showReport_tb.jsp?raq=/dangNeiTongJi/dangNeiTongJi_zx/d17b_zx.raq&tjDate=<%=tjDate%>&startDate=<%=startDate%>&endDate=<%=endDate%>&userID=<%=userID%>&col=<%=col%>";
		src["d18b"] = "/report/dn_reportJsp/showReport_tb.jsp?raq=/dangNeiTongJi/dangNeiTongJi_zx/d18b_zx.raq&tjDate=<%=tjDate%>&startDate=<%=startDate%>&endDate=<%=endDate%>&userID=<%=userID%>&col=<%=col%>";
		src["d19b"] = "/report/dn_reportJsp/showReport_tb.jsp?raq=/dangNeiTongJi/dangNeiTongJi_zx/d19b_zx.raq&tjDate=<%=tjDate%>&startDate=<%=startDate%>&endDate=<%=endDate%>&userID=<%=userID%>&col=<%=col%>";
		src["d20b"] = "/report/dn_reportJsp/showReport_tb.jsp?raq=/dangNeiTongJi/dangNeiTongJi_zx/d20b_zx.raq&tjDate=<%=tjDate%>&startDate=<%=startDate%>&endDate=<%=endDate%>&userID=<%=userID%>&col=<%=col%>";
		src["d24b"] = "/report/dn_reportJsp/showReport_tb.jsp?raq=/dangNeiTongJi/dangNeiTongJi_zx/d24b_zx.raq&tjDate=<%=tjDate%>&startDate=<%=startDate%>&endDate=<%=endDate%>&userID=<%=userID%>&col=<%=col%>";
		src["d26b"] = "/report/dn_reportJsp/showReport_tb.jsp?raq=/dangNeiTongJi/dangNeiTongJi_zx/d26b_zx.raq&tjDate=<%=tjDate%>&startDate=<%=startDate%>&endDate=<%=endDate%>&userID=<%=userID%>&col=<%=col%>";
		src["d28b"] = "/report/dn_reportJsp/showReport_tb.jsp?raq=/dangNeiTongJi/dangNeiTongJi_zx/d28b_zx.raq&tjDate=<%=tjDate%>&startDate=<%=startDate%>&endDate=<%=endDate%>&userID=<%=userID%>&col=<%=col%>";
		src["d30b"] = "/report/dn_reportJsp/showReport_tb.jsp?raq=/dangNeiTongJi/dangNeiTongJi_zx/d30b_zx.raq&tjDate=<%=tjDate%>&startDate=<%=startDate%>&endDate=<%=endDate%>&userID=<%=userID%>&col=<%=col%>";
		src["d35b"] = "/report/dn_reportJsp/showReport_tb.jsp?raq=/dangNeiTongJi/dangNeiTongJi_zx/d35b_zx.raq&tjDate=<%=tjDate%>&startDate=<%=startDate%>&endDate=<%=endDate%>&userID=<%=userID%>&col=<%=col%>";
		src["d36b"] = "/report/dn_reportJsp/showReport_tb.jsp?raq=/dangNeiTongJi/dangNeiTongJi_zx/d36b_zx.raq&tjDate=<%=tjDate%>&startDate=<%=startDate%>&endDate=<%=endDate%>&userID=<%=userID%>&col=<%=col%>";
		src["d37b"] = "/report/dn_reportJsp/showReport_tb.jsp?raq=/dangNeiTongJi/dangNeiTongJi_zx/d37b_zx.raq&tjDate=<%=tjDate%>&startDate=<%=startDate%>&endDate=<%=endDate%>&userID=<%=userID%>&col=<%=col%>";
		src["d38b"] = "/report/dn_reportJsp/showReport_tb.jsp?raq=/dangNeiTongJi/dangNeiTongJi_zx/d38b_zx.raq&tjDate=<%=tjDate%>&startDate=<%=startDate%>&endDate=<%=endDate%>&userID=<%=userID%>&col=<%=col%>";
		src["d39b"] = "/report/dn_reportJsp/showReport_tb.jsp?raq=/dangNeiTongJi/dangNeiTongJi_zx/d39b_zx.raq&tjDate=<%=tjDate%>&startDate=<%=startDate%>&endDate=<%=endDate%>&userID=<%=userID%>&col=<%=col%>";
		src["ztdc6"] = "/report/dn_reportJsp/showReport_tb.jsp?raq=/dangNeiTongJi/dangNeiTongJi_zx/ztdc6_zx.raq&tjDate=<%=tjDate%>&startDate=<%=startDate%>&endDate=<%=endDate%>&userID=<%=userID%>&col=<%=col%>";
		src["ztdc9"] = "/report/dn_reportJsp/showReport_tb.jsp?raq=/dangNeiTongJi/dangNeiTongJi_zx/ztdc9_zx.raq&tjDate=<%=tjDate%>&startDate=<%=startDate%>&endDate=<%=endDate%>&userID=<%=userID%>&col=<%=col%>";
		src["bb1"] = "/report/dn_reportJsp/showReport_tb.jsp?raq=/dangNeiTongJi/dangNeiTongJi_zx/bb1_zx.raq&tjDate=<%=tjDate%>&startDate=<%=startDate%>&endDate=<%=endDate%>&userID=<%=userID%>&col=<%=col%>";
		src["bb2"] = "/report/dn_reportJsp/showReport_tb.jsp?raq=/dangNeiTongJi/dangNeiTongJi_zx/bb2_zx.raq&tjDate=<%=tjDate%>&startDate=<%=startDate%>&endDate=<%=endDate%>&userID=<%=userID%>&col=<%=col%>";
		src["bb3"] = "/report/dn_reportJsp/showReport_tb.jsp?raq=/dangNeiTongJi/dangNeiTongJi_zx/bb3_zx.raq&tjDate=<%=tjDate%>&startDate=<%=startDate%>&endDate=<%=endDate%>&userID=<%=userID%>&col=<%=col%>";
		src["bb4"] = "/report/dn_reportJsp/showReport_tb.jsp?raq=/dangNeiTongJi/dangNeiTongJi_zx/bb4_zx.raq&tjDate=<%=tjDate%>&startDate=<%=startDate%>&endDate=<%=endDate%>&userID=<%=userID%>&col=<%=col%>";
		src["bb5"] = "/report/dn_reportJsp/showReport_tb.jsp?raq=/dangNeiTongJi/dangNeiTongJi_zx/bb5_zx.raq&tjDate=<%=tjDate%>&startDate=<%=startDate%>&endDate=<%=endDate%>&userID=<%=userID%>&col=<%=col%>";
		src["bb6"] = "/report/dn_reportJsp/showReport_tb.jsp?raq=/dangNeiTongJi/dangNeiTongJi_zx/bb6_zx.raq&tjDate=<%=tjDate%>&startDate=<%=startDate%>&endDate=<%=endDate%>&userID=<%=userID%>&col=<%=col%>";
		src["zb1"] = "/report/dn_reportJsp/showReport_tb.jsp?raq=/dangNeiTongJi/dangNeiTongJi_zx/zb1_zx.raq&tjDate=<%=tjDate%>&startDate=<%=startDate%>&endDate=<%=endDate%>&userID=<%=userID%>&col=<%=col%>";
		src["zb2"] = "/report/dn_reportJsp/showReport_tb.jsp?raq=/dangNeiTongJi/dangNeiTongJi_zx/zb2_zx.raq&tjDate=<%=tjDate%>&startDate=<%=startDate%>&endDate=<%=endDate%>&userID=<%=userID%>&col=<%=col%>";
		src["qt"] = "/report/dn_reportJsp/showReport_tb.jsp?raq=/dangNeiTongJi/dangNeiTongJi_zx/qt_zx.raq&tjDate=<%=tjDate%>&startDate=<%=startDate%>&endDate=<%=endDate%>&userID=<%=userID%>&col=<%=col%>";
		//$("#mainframe").attr("src","/report/dn_reportJsp/showReport_tb.jsp?raq=/ganBuTongJi/ganBuTongJi_zx/hz3_zx.raq&tjDate=<%=tjDate%>&startDate=<%=startDate%>&endDate=<%=endDate%>&userID=<%=userID%>&col=<%=col%>");
		var str = "<%=name%>";
		console.log(""+str);
		var data = str.split(',');
		console.log(data);
		console.log(data.length);
		for(var i=0;i<data.length;i++){
			document.getElementById(data[i]).style.display = "block";
		}
		 console.log(src["zb1"])
		if (data[0]!="" || data[0] != undfinded) {
			$("#mainframe").attr("src",src[data[0]]);
		}
	})
	function moduleClick(link){
		$("#mainframe").attr("src",link);
	}
	$('a span').each(function() {
        var words = $(this).text().length;
        if(words >= 16){
            $(this).text($(this).text().slice(0,25)+"...");
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
			document.getElementById('mainframe').style.width = '80%';
			document.getElementById('showLeftPush').src = "images/merge.png";
			document.getElementById('images').style.left = "15%";
			document.getElementById('showLeftPush').title = "点击收缩";
		}
	};
</script>
</body>
</html>