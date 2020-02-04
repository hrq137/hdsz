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
<div id="menu" style="overflow:scroll; width:15%; height:650px;" >
    <!--显示菜单-->
	<div style='padding-bottom:1px;text-align:left;display: inline-block;float: left;' >
		<table cellspacing=0 cellpadding=0 border=0>
		<tr>
		<td id=rq_tabs style="padding: 1px 2px 0 2px" nowrap>
		<label id="tab_item1">
		<a href='#' id='hz1' style='display:none;' onclick="moduleClick('/report/reportJsp/showReport_tb.jsp?raq=/ganBuTongJi/ganBuTongJi_zx/hz1_zx.raq&tjDate=<%=tjDate%>&startDate=<%=startDate%>&endDate=<%=endDate%>&userID=<%=userID%>&col=<%=col%>')">
		<span title="全路领导班子情况一览表" style='cursor:pointer;width:250px;'>
		全路领导班子情况一览表
		</span>
		</a>
		</label>
	<div style='padding-bottom:1px;text-align:left;display: inline-block;float: left;' >
		<label cellspacing=0 cellpadding=0 border=0>
		<a href='#' id='hz2' style='display:none;' onclick="moduleClick('/report/reportJsp/showReport_tb.jsp?raq=/ganBuTongJi/ganBuTongJi_zx/hz2_zx.raq&tjDate=<%=tjDate%>&startDate=<%=startDate%>&endDate=<%=endDate%>&userID=<%=userID%>&col=<%=col%>')">
		<span title="全路干部情况一览表" style='cursor:pointer;width:250px;'>
		全路干部情况一览表
		</span>
		</a>
		</label>
   <div style='padding-bottom:1px;text-align:left;display: inline-block;float: left;' >
		<label cellspacing=0 cellpadding=0 border=0>
		<a href='#' id='hz3' style='display:none;' onclick="moduleClick('/report/reportJsp/showReport_tb.jsp?raq=/ganBuTongJi/ganBuTongJi_zx/hz3_zx.raq&tjDate=<%=tjDate%>&startDate=<%=startDate%>&endDate=<%=endDate%>&userID=<%=userID%>&col=<%=col%>')">
		<span title="各类班次培训统计" style='cursor:pointer;width:250px;'>
		各类班次培训统计
		</span>
		</a>
		</label>
	<div style='padding-bottom:1px;text-align:left;display: inline-block;float: left;'>
		<label cellspacing=0 cellpadding=0 border=0>
		<a href='#' id='jg1' style='display:none;' onclick = "moduleClick('/report/reportJsp/showReport_tb.jsp?raq=/ganBuTongJi/ganBuTongJi_zx/jg1_zx.raq&tjDate=<%=tjDate%>&startDate=<%=startDate%>&endDate=<%=endDate%>&userID=<%=userID%>&col=<%=col%>')">
		<span title="铁路总公司机关管理人员基本情况" style='cursor:pointer;width:250px;'>
		铁路总公司机关管理人员基本情况
		</span>
		</a>
		</label>
	<div style='padding-bottom:1px;text-align:left;display: inline-block;float: left;'>
		<label cellspacing=0 cellpadding=0 border=0>
		<a href='#' id='d1b' style='display:none;' onclick = "moduleClick('/report/reportJsp/showReport_tb.jsp?raq=/ganBuTongJi/ganBuTongJi_zx/d1b_zx.raq&tjDate=<%=tjDate%>&startDate=<%=startDate%>&endDate=<%=endDate%>&userID=<%=userID%>&col=<%=col%>')">
		<span title="企业单位(运输业）管理人员、专业技术人员基本情况(按聘任职务统计）" style='cursor:pointer;width:250px;'>
		企业单位(运输业）管理人员、专业技术人员基本情况(按聘任职务统计）
		</span>
		</a>
		</label>
	<div style='padding-bottom:1px;text-align:left;display: inline-block;float: left;'>
		<label cellspacing=0 cellpadding=0 border=0>
		<a href='#' id='d2b' style='display:none;' onclick = "moduleClick('/report/reportJsp/showReport_tb.jsp?raq=/ganBuTongJi/ganBuTongJi_zx/d2b_zx.raq&tjDate=<%=tjDate%>&startDate=<%=startDate%>&endDate=<%=endDate%>&userID=<%=userID%>&col=<%=col%>')">
		<span title="企业单位(非运输业）管理人员、专业技术人员基本情况(按聘任职务统计）" style='cursor:pointer;width:250px;'>
		企业单位(非运输业）管理人员、专业技术人员基本情况(按聘任职务统计）
		</span>
		</a>
		</label>
	<div style='padding-bottom:1px;text-align:left;display: inline-block;float: left;'>
		<label cellspacing=0 cellpadding=0 border=0>
		<a href='#' id='d3b' style='display:none;' onclick = "moduleClick('/report/reportJsp/showReport_tb.jsp?raq=/ganBuTongJi/ganBuTongJi_zx/d3b_zx.raq&tjDate=<%=tjDate%>&startDate=<%=startDate%>&endDate=<%=endDate%>&userID=<%=userID%>&col=<%=col%>')">
		<span title="事业单位管理人员、专业技术人员基本情况(按聘任职务统计）" style='cursor:pointer;width:250px;'>
		事业单位管理人员、专业技术人员基本情况(按聘任职务统计）
		</span>
		</a>
		</label>
	<div style='padding-bottom:1px;text-align:left;display: inline-block;float: left;'>
		<label cellspacing=0 cellpadding=0 border=0>
		<a href='#' id='d4b' style='display:none;' onclick = "moduleClick('/report/reportJsp/showReport_tb.jsp?raq=/ganBuTongJi/ganBuTongJi_zx/d4b_zx.raq&tjDate=<%=tjDate%>&startDate=<%=startDate%>&endDate=<%=endDate%>&userID=<%=userID%>&col=<%=col%>')">
		<span title="铁路取得专业技术资格人员基本情况" style='cursor:pointer;width:250px;'>
		铁路取得专业技术资格人员基本情况
		</span>
		</a>
		</label>
	<div style='padding-bottom:1px;text-align:left;display: inline-block;float: left;'>
		<label cellspacing=0 cellpadding=0 border=0>
		<a href='#' id='item1' style='display:none;' onclick = "moduleClick('/report/reportJsp/showReport_tb.jsp?raq=/ganBuTongJi/ganBuTongJi_zx/d5b_zx.raq&tjDate=<%=tjDate%>&startDate=<%=startDate%>&endDate=<%=endDate%>&userID=<%=userID%>&col=<%=col%>')">
		<span title="铁路管理人员基本情况统计表" style='cursor:pointer;width:250px;'>
		铁路管理人员基本情况统计表
		</span>
		</a>
		</label>
	<div style='padding-bottom:1px;text-align:left;display: inline-block;float: left;'>
		<label cellspacing=0 cellpadding=0 border=0>
		<a href='#' id='d6b' style='display:none;' onclick = "moduleClick('/report/reportJsp/showReport_tb.jsp?raq=/ganBuTongJi/ganBuTongJi_zx/d6b_zx.raq&tjDate=<%=tjDate%>&startDate=<%=startDate%>&endDate=<%=endDate%>&userID=<%=userID%>&col=<%=col%>')">
		<span title="铁路专业技术人员基本情况一" style='cursor:pointer;width:250px;'>
		铁路专业技术人员基本情况一
		</span>
		</a>
		</label>
	<div style='padding-bottom:1px;text-align:left;display: inline-block;float: left;'>
		<label cellspacing=0 cellpadding=0 border=0>
		<a href='#' id='d7b' style='display:none;' onclick = "moduleClick('/report/reportJsp/showReport_tb.jsp?raq=/ganBuTongJi/ganBuTongJi_zx/d7b_zx.raq&tjDate=<%=tjDate%>&startDate=<%=startDate%>&endDate=<%=endDate%>&userID=<%=userID%>&col=<%=col%>')">
		<span title="铁路专业技术人员基本情况二" style='cursor:pointer;width:250px;'>
		铁路专业技术人员基本情况二
		</span>
		</a>
		</label>
	<div style='padding-bottom:1px;text-align:left;display: inline-block;float: left;'>
		<label cellspacing=0 cellpadding=0 border=0>
		<a href='#' id='d8b' style='display:none;' onclick = "moduleClick('/report/reportJsp/showReport_tb.jsp?raq=/ganBuTongJi/ganBuTongJi_zx/d8b_zx.raq&tjDate=<%=tjDate%>&startDate=<%=startDate%>&endDate=<%=endDate%>&userID=<%=userID%>&col=<%=col%>')">
		<span title="基本情况统计表" style='cursor:pointer;width:250px;'>
		基本情况统计表
		</span>
		</a>
		</label>
		
	<div style='padding-bottom:1px;text-align:left;display: inline-block;float: left;'>
		<label cellspacing=0 cellpadding=0 border=0>
		<a href='#' id='d9b' style='display:none;' onclick = "moduleClick('/report/reportJsp/showReport_tb.jsp?raq=/ganBuTongJi/ganBuTongJi_zx/d9b_zx.raq&tjDate=<%=tjDate%>&startDate=<%=startDate%>&endDate=<%=endDate%>&userID=<%=userID%>&col=<%=col%>')">
		<span title="干部调整职务情况统计表" style='cursor:pointer;width:250px;'>
		干部调整职务情况统计表
		</span>
		</a>
		</label>
	<div style='padding-bottom:1px;text-align:left;display: inline-block;float: left;'>
		<label cellspacing=0 cellpadding=0 border=0>
		<a href='#' id='d10b' style='display:none;' onclick = "moduleClick('/report/reportJsp/showReport_tb.jsp?raq=/ganBuTongJi/ganBuTongJi_zx/d10b_zx.raq&tjDate=<%=tjDate%>&startDate=<%=startDate%>&endDate=<%=endDate%>&userID=<%=userID%>&col=<%=col%>')">
		<span title="领导班子基本情况统计表" style='cursor:pointer;width:250px;'>
		领导班子基本情况统计表
		</span>
		</a>
		</label>
	<div style='padding-bottom:1px;text-align:left;display: inline-block;float: left;'>
		<label cellspacing=0 cellpadding=0 border=0>
		<a href='#' id='d11b' style='display:none;' onclick = "moduleClick('/report/reportJsp/showReport_tb.jsp?raq=/ganBuTongJi/ganBuTongJi_zx/d11b_zx.raq&tjDate=<%=tjDate%>&startDate=<%=startDate%>&endDate=<%=endDate%>&userID=<%=userID%>&col=<%=col%>')">
		<span title="政工干部基本情况统计表" style='cursor:pointer;width:250px;'>
		政工干部基本情况统计表
		</span>
		</a>
		</label>
	<div style='padding-bottom:1px;text-align:left;display: inline-block;float: left;'>
		<label cellspacing=0 cellpadding=0 border=0>
		<a href='#' id='d12b' style='display:none;' onclick = "moduleClick('/report/reportJsp/showReport_tb.jsp?raq=/ganBuTongJi/ganBuTongJi_zx/d12b_zx.raq&tjDate=<%=tjDate%>&startDate=<%=startDate%>&endDate=<%=endDate%>&userID=<%=userID%>&col=<%=col%>')">
		<span title="组织人事部门干部基本情况统计表" style='cursor:pointer;width:250px;'>
		组织人事部门干部基本情况统计表
		</span>
		</a>
		</label>
	<div style='padding-bottom:1px;text-align:left;display: inline-block;float: left;'>
		<label cellspacing=0 cellpadding=0 border=0>
		<a href='#' id='d13b' style='display:none;' onclick = "moduleClick('/report/reportJsp/showReport_tb.jsp?raq=/ganBuTongJi/ganBuTongJi_zx/d13b_zx.raq&tjDate=<%=tjDate%>&startDate=<%=startDate%>&endDate=<%=endDate%>&userID=<%=userID%>&col=<%=col%>')">
		<span title="铁路运输业专业技术人员基本情况按层统计分析表（一）" style='cursor:pointer;width:250px;'>
		铁路运输业专业技术人员基本情况按层统计分析表（一）
		</span>
		</a>
		</label>
	<div style='padding-bottom:1px;text-align:left;display: inline-block;float: left;'>
		<label cellspacing=0 cellpadding=0 border=0>
		<a href='#' id='d14b' style='display:none;' onclick = "moduleClick('/report/reportJsp/showReport_tb.jsp?raq=/ganBuTongJi/ganBuTongJi_zx/d14b_zx.raq&tjDate=<%=tjDate%>&startDate=<%=startDate%>&endDate=<%=endDate%>&userID=<%=userID%>&col=<%=col%>')">
		<span title="铁路运输业专业技术人员基本情况按层统计分析表（二）" style='cursor:pointer;width:250px;'>
		铁路运输业专业技术人员基本情况按层统计分析表（二）
		</span>
		</a>
		</label>
	<div style='padding-bottom:1px;text-align:left;display: inline-block;float: left;'>
		<label cellspacing=0 cellpadding=0 border=0>
		<a href='#' id='d15b' style='display:none;' onclick = "moduleClick('/report/reportJsp/showReport_tb.jsp?raq=/ganBuTongJi/ganBuTongJi_zx/d15b_zx.raq&tjDate=<%=tjDate%>&startDate=<%=startDate%>&endDate=<%=endDate%>&userID=<%=userID%>&col=<%=col%>')">
		<span title="铁路运输业专职专业技术人员基本情况按层统计分析表（三）" style='cursor:pointer;width:250px;'>
		铁路运输业专职专业技术人员基本情况按层统计分析表（三）
		</span>
		</a>
		</label>

	<div style='padding-bottom:1px;text-align:left;display: inline-block;float: left;'>
		<label cellspacing=0 cellpadding=0 border=0>
		<a href='#' id='d33b' style='display:none;' onclick = "moduleClick('/report/reportJsp/showReport_tb.jsp?raq=/ganBuTongJi/ganBuTongJi_zx/d33b_zx.raq&tjDate=<%=tjDate%>&startDate=<%=startDate%>&endDate=<%=endDate%>&userID=<%=userID%>&col=<%=col%>')">
		<span title="铁路管理人员、技术人员基本情况表1" style='cursor:pointer;width:250px;'>
		铁路管理人员、技术人员基本情况表1
		</span>
		</a>
		</label>

	<div style='padding-bottom:1px;text-align:left;display: inline-block;float: left;'>
		<label cellspacing=0 cellpadding=0 border=0>
		<a href='#' id='d34b' style='display:none;' onclick = "moduleClick('/report/reportJsp/showReport_tb.jsp?raq=/ganBuTongJi/ganBuTongJi_zx/d34b_zx.raq&tjDate=<%=tjDate%>&startDate=<%=startDate%>&endDate=<%=endDate%>&userID=<%=userID%>&col=<%=col%>')">
		<span title="铁路管理人员、技术人员基本情况表" style='cursor:pointer;width:250px;'>
		铁路管理人员、技术人员基本情况表
		</span>
		</a>
		</label>

	<div style='padding-bottom:1px;text-align:left;display: inline-block;float: left;'>
		<label cellspacing=0 cellpadding=0 border=0>
		<a href='#' id='d35b' style='display:none;' onclick = "moduleClick('/report/reportJsp/showReport_tb.jsp?raq=/ganBuTongJi/ganBuTongJi_zx/d35b_zx.raq&tjDate=<%=tjDate%>&startDate=<%=startDate%>&endDate=<%=endDate%>&userID=<%=userID%>&col=<%=col%>')">
		<span title="国有经济控制企业、事业单位管理、专业技术人员增加、减少情况" style='cursor:pointer;width:250px;'>
		国有经济控制企业、事业单位管理、专业技术人员增加、减少情况
		</span>
		</a>
		</label>

	<div style='padding-bottom:1px;text-align:left;display: inline-block;float: left;'>
		<label cellspacing=0 cellpadding=0 border=0>
		<a href='#' id='d36b' style='display:none;' onclick = "moduleClick('/report/reportJsp/showReport_tb.jsp?raq=/ganBuTongJi/ganBuTongJi_zx/d36b_zx.raq&tjDate=<%=tjDate%>&startDate=<%=startDate%>&endDate=<%=endDate%>&userID=<%=userID%>&col=<%=col%>')">
		<span title="事业单位专业技术人才基本情况" style='cursor:pointer;width:250px;'>
		事业单位专业技术人才基本情况
		</span>
		</a>
		</label>
  <!--PM表-->
	<div style='padding-bottom:1px;text-align:left;display: inline-block;float: left;'>
		<label cellspacing=0 cellpadding=0 border=0>
		<a href='#' id='PM01' style='display:none;' onclick = "moduleClick('/report/reportJsp/showReport_tb.jsp?raq=/ganBuTongJi/ganBuTongJi_zx/PM01_zx.raq&tjDate=<%=tjDate%>&startDate=<%=startDate%>&endDate=<%=endDate%>&userID=<%=userID%>&col=<%=col%>')">
		<span title="公有经济企业经营管理人才、专业技术人才增加、减少情况" style='cursor:pointer;width:250px;'>
		公有经济企业经营管理人才、专业技术人才增加、减少情况
		</span>
		</a>
		</label>
	<div style='padding-bottom:1px;text-align:left;display: inline-block;float: left;'>
		<label cellspacing=0 cellpadding=0 border=0>
		<a href='#' id='PM02' style='display:none;' onclick = "moduleClick('/report/reportJsp/showReport_tb.jsp?raq=/ganBuTongJi/ganBuTongJi_zx/PM02_zx.raq&tjDate=<%=tjDate%>&startDate=<%=startDate%>&endDate=<%=endDate%>&userID=<%=userID%>&col=<%=col%>')">
		<span title="各类型公有经济企业经营管理人才基本情况" style='cursor:pointer;width:250px;'>
		各类型公有经济企业经营管理人才基本情况
		</span>
		</a>
		</label>
	<div style='padding-bottom:1px;text-align:left;display: inline-block;float: left;'>
		<label cellspacing=0 cellpadding=0 border=0>
		<a href='#' id='PM03' style='display:none;' onclick = "moduleClick('/report/reportJsp/showReport_tb.jsp?raq=/ganBuTongJi/ganBuTongJi_zx/PM03_zx.raq&tjDate=<%=tjDate%>&startDate=<%=startDate%>&endDate=<%=endDate%>&userID=<%=userID%>&col=<%=col%>')">
		<span title="公有经济企业分行业经营管理人才基本情况" style='cursor:pointer;width:250px;'>
		公有经济企业分行业经营管理人才基本情况
		</span>
		</a>
		</label>
	<div style='padding-bottom:1px;text-align:left;display: inline-block;float: left;'>
		<label cellspacing=0 cellpadding=0 border=0>
		<a href='#' id='PM04' style='display:none;' onclick = "moduleClick('/report/reportJsp/showReport_tb.jsp?raq=/ganBuTongJi/ganBuTongJi_zx/PM04_zx.raq&tjDate=<%=tjDate%>&startDate=<%=startDate%>&endDate=<%=endDate%>&userID=<%=userID%>&col=<%=col%>')">
		<span title="公有经济企业专业技术人才基本情况" style='cursor:pointer;width:250px;'>
		公有经济企业专业技术人才基本情况
		</span>
		</a>
		</label>
	<div style='padding-bottom:1px;text-align:left;display: inline-block;float: left;'>
		<label cellspacing=0 cellpadding=0 border=0>
		<a href='#' id='PM05' style='display:none;' onclick = "moduleClick('/report/reportJsp/showReport_tb.jsp?raq=/ganBuTongJi/ganBuTongJi_zx/PM05_zx.raq&tjDate=<%=tjDate%>&startDate=<%=startDate%>&endDate=<%=endDate%>&userID=<%=userID%>&col=<%=col%>')">
		<span title="公有经济企业特殊专业技术人才基本情况" style='cursor:pointer;width:250px;'>
		公有经济企业特殊专业技术人才基本情况
		</span>
		</a>
		</label>
	<div style='padding-bottom:1px;text-align:left;display: inline-block;float: left;'>
		<label cellspacing=0 cellpadding=0 border=0>
		<a href='#' id='PM06' style='display:none;' onclick = "moduleClick('/report/reportJsp/showReport_tb.jsp?raq=/ganBuTongJi/ganBuTongJi_zx/PM06_zx.raq&tjDate=<%=tjDate%>&startDate=<%=startDate%>&endDate=<%=endDate%>&userID=<%=userID%>&col=<%=col%>')">
		<span title="公有经济企业专业技术人才分行业情况" style='cursor:pointer;width:250px;'>
		公有经济企业专业技术人才分行业情况
		</span>
		</a>
		</label>
	<div style='padding-bottom:1px;text-align:left;display: inline-block;float: left;'>
		<label cellspacing=0 cellpadding=0 border=0>
		<a href='#' id='PM07' style='display:none;' onclick = "moduleClick('/report/reportJsp/showReport_tb.jsp?raq=/ganBuTongJi/ganBuTongJi_zx/PM07_zx.raq&tjDate=<%=tjDate%>&startDate=<%=startDate%>&endDate=<%=endDate%>&userID=<%=userID%>&col=<%=col%>')">
		<span title="公有经济企业分行业专业技术人才基本情况" style='cursor:pointer;width:250px;'>
		公有经济企业分行业专业技术人才基本情况
		</span>
		</a>
		</label>
		
		<div style='padding-bottom:1px;text-align:left;display: inline-block;float: left;'>
		<label cellspacing=0 cellpadding=0 border=0>
		<a href='#' id='PM08' style='display:none;' onclick = "moduleClick('/report/reportJsp/showReport_tb.jsp?raq=/ganBuTongJi/ganBuTongJi_zx/PM08_zx.raq&tjDate=<%=tjDate%>&startDate=<%=startDate%>&endDate=<%=endDate%>&userID=<%=userID%>&col=<%=col%>')">
		<span title="公有经济企业经营管理人才、专业技术人才参加培训情况" style='cursor:pointer;width:250px;'>
		公有经济企业经营管理人才、专业技术人才参加培训情况
		</span>
		</a>
		</label>
		
		<div style='padding-bottom:1px;text-align:left;display: inline-block;float: left;'>
		<label cellspacing=0 cellpadding=0 border=0>
		<a href='#' id='PM09' style='display:none;' onclick = "moduleClick('/report/reportJsp/showReport_tb.jsp?raq=/ganBuTongJi/ganBuTongJi_zx/PM09_zx.raq&tjDate=<%=tjDate%>&startDate=<%=startDate%>&endDate=<%=endDate%>&userID=<%=userID%>&col=<%=col%>')">
		<span title="公有经济企业工人分行业情况" style='cursor:pointer;width:250px;'>
		公有经济企业工人分行业情况
		</span>
		</a>
		</label>
		
		
		
		<div style='padding-bottom:1px;text-align:left;display: inline-block;float: left;'>
		<label cellspacing=0 cellpadding=0 border=0>
		<a href='#' id='PM10' style='display:none;' onclick = "moduleClick('/report/reportJsp/showReport_tb.jsp?raq=/ganBuTongJi/ganBuTongJi_zx/PM10_zx.raq&tjDate=<%=tjDate%>&startDate=<%=startDate%>&endDate=<%=endDate%>&userID=<%=userID%>&col=<%=col%>')">
		<span title="公有经济企业经营管理人才、专业技术人才、工勤技能人员分地区情况（中央单位填报）" style='cursor:pointer;width:250px;'>
		公有经济企业经营管理人才、专业技术人才、工勤技能人员分地区情况（中央单位填报）
		</span>
		</a>
		</label>
		
		
	<!-------新增20张表----------------------------->
	
	<div style='padding-bottom:1px;text-align:left;display: inline-block;float: left;'>
		<label cellspacing=0 cellpadding=0 border=0>
		<a href='#' id='x1b' style='display:none;' onclick = "moduleClick('/report/reportJsp/showReport_tb.jsp?raq=/ganBuTongJi/ganBuTongJi_zx/x1b_zx.raq&tjDate=<%=tjDate%>&startDate=<%=startDate%>&endDate=<%=endDate%>&userID=<%=userID%>&col=<%=col%>')">
		<span title="干部基本情况--性别、民族、文化程度、政治面貌" style='cursor:pointer;width:250px;'>
		干部基本情况--性别、民族、文化程度、政治面貌
		</span>
		</a>
		</label>
	<div style='padding-bottom:1px;text-align:left;display: inline-block;float: left;'>
		<label cellspacing=0 cellpadding=0 border=0>
		<a href='#' id='x2b' style='display:none;' onclick = "moduleClick('/report/reportJsp/showReport_tb.jsp?raq=/ganBuTongJi/ganBuTongJi_zx/x2b_zx.raq&tjDate=<%=tjDate%>&startDate=<%=startDate%>&endDate=<%=endDate%>&userID=<%=userID%>&col=<%=col%>')">
		<span title="干部基本情况--年龄" style='cursor:pointer;width:250px;'>
		干部基本情况--年龄
		</span>
		</a>
		</label>
	<div style='padding-bottom:1px;text-align:left;display: inline-block;float: left;'>
		<label cellspacing=0 cellpadding=0 border=0>
		<a href='#' id='x4b' style='display:none;' onclick = "moduleClick('/report/reportJsp/showReport_tb.jsp?raq=/ganBuTongJi/ganBuTongJi_zx/x4b_zx.raq&tjDate=<%=tjDate%>&startDate=<%=startDate%>&endDate=<%=endDate%>&userID=<%=userID%>&col=<%=col%>')">
		<span title="干部基本情况--政治面貌、年龄（一）" style='cursor:pointer;width:250px;'>
		干部基本情况--政治面貌、年龄（一）
		</span>
		</a>
		</label>
	<div style='padding-bottom:1px;text-align:left;display: inline-block;float: left;'>
		<label cellspacing=0 cellpadding=0 border=0>
		<a href='#' id='x5b' style='display:none;' onclick = "moduleClick('/report/reportJsp/showReport_tb.jsp?raq=/ganBuTongJi/ganBuTongJi_zx/x5b_zx.raq&tjDate=<%=tjDate%>&startDate=<%=startDate%>&endDate=<%=endDate%>&userID=<%=userID%>&col=<%=col%>')">
		<span title="干部基本情况--性别、民族、文化程度、级别（二）" style='cursor:pointer;width:250px;'>
		干部基本情况--性别、民族、文化程度、级别（二）
		</span>
		</a>
		</label>
	<div style='padding-bottom:1px;text-align:left;display: inline-block;float: left;'>
		<label cellspacing=0 cellpadding=0 border=0>
		<a href='#' id='x6b' style='display:none;' onclick = "moduleClick('/report/reportJsp/showReport_tb.jsp?raq=/ganBuTongJi/ganBuTongJi_zx/x6b_zx.raq&tjDate=<%=tjDate%>&startDate=<%=startDate%>&endDate=<%=endDate%>&userID=<%=userID%>&col=<%=col%>')">
		<span title="干部基本情况--政治面貌、年龄（二）" style='cursor:pointer;width:250px;'>
		干部基本情况--政治面貌、年龄（二）
		</span>
		</a>
		</label>
	<div style='padding-bottom:1px;text-align:left;display: inline-block;float: left;'>
		<label cellspacing=0 cellpadding=0 border=0>
		<a href='#' id='x7b' style='display:none;' onclick = "moduleClick('/report/reportJsp/showReport_tb.jsp?raq=/ganBuTongJi/ganBuTongJi_zx/x7b_zx.raq&tjDate=<%=tjDate%>&startDate=<%=startDate%>&endDate=<%=endDate%>&userID=<%=userID%>&col=<%=col%>')">
		<span title="专业技术干部基本情况--性别、民族、文化程度、年龄" style='cursor:pointer;width:250px;'>
		专业技术干部基本情况--性别、民族、文化程度、年龄
		</span>
		</a>
		</label>
	<div style='padding-bottom:1px;text-align:left;display: inline-block;float: left;'>
		<label cellspacing=0 cellpadding=0 border=0>
		<a href='#' id='x8b' style='display:none;' onclick = "moduleClick('/report/reportJsp/showReport_tb.jsp?raq=/ganBuTongJi/ganBuTongJi_zx/x8b_zx.raq&tjDate=<%=tjDate%>&startDate=<%=startDate%>&endDate=<%=endDate%>&userID=<%=userID%>&col=<%=col%>')">
		<span title="专业技术干部--专业分布情况（一）" style='cursor:pointer;width:250px;'>
		专业技术干部--专业分布情况（一）
		</span>
		</a>
		</label>
	<div style='padding-bottom:1px;text-align:left;display: inline-block;float: left;'>
		<label cellspacing=0 cellpadding=0 border=0>
		<a href='#' id='x9b' style='display:none;' onclick = "moduleClick('/report/reportJsp/showReport_tb.jsp?raq=/ganBuTongJi/ganBuTongJi_zx/x9b_zx.raq&tjDate=<%=tjDate%>&startDate=<%=startDate%>&endDate=<%=endDate%>&userID=<%=userID%>&col=<%=col%>')">
		<span title="专业技术干部--政治面貌、学历、年龄情况（一）" style='cursor:pointer;width:250px;'>
		专业技术干部--政治面貌、学历、年龄情况（一）
		</span>
		</a>
		</label>	
	<div style='padding-bottom:1px;text-align:left;display: inline-block;float: left;'>
		<label cellspacing=0 cellpadding=0 border=0>
		<a href='#' id='x10b' style='display:none;' onclick = "moduleClick('/report/reportJsp/showReport_tb.jsp?raq=/ganBuTongJi/ganBuTongJi_zx/x10b_zx.raq&tjDate=<%=tjDate%>&startDate=<%=startDate%>&endDate=<%=endDate%>&userID=<%=userID%>&col=<%=col%>')">
		<span title="专业技术干部--专业分布情况（二）" style='cursor:pointer;width:250px;'>
		专业技术干部--专业分布情况（二）
		</span>
		</a>
		</label>
	<div style='padding-bottom:1px;text-align:left;display: inline-block;float: left;'>
		<label cellspacing=0 cellpadding=0 border=0>
		<a href='#' id='x11b' style='display:none;' onclick = "moduleClick('/report/reportJsp/showReport_tb.jsp?raq=/ganBuTongJi/ganBuTongJi_zx/x11b_zx.raq&tjDate=<%=tjDate%>&startDate=<%=startDate%>&endDate=<%=endDate%>&userID=<%=userID%>&col=<%=col%>')">
		<span title="专业技术干部--政治面貌、学历、年龄情况（二）" style='cursor:pointer;width:250px;'>
		专业技术干部--政治面貌、学历、年龄情况（二）
		</span>
		</a>
		</label>
	<div style='padding-bottom:1px;text-align:left;display: inline-block;float: left;'>
		<label cellspacing=0 cellpadding=0 border=0>
		<a href='#' id='x12b' style='display:none;' onclick = "moduleClick('/report/reportJsp/showReport_tb.jsp?raq=/ganBuTongJi/ganBuTongJi_zx/x12b_zx.raq&tjDate=<%=tjDate%>&startDate=<%=startDate%>&endDate=<%=endDate%>&userID=<%=userID%>&col=<%=col%>')">
		<span title="具有政工职称人员基本情况--性别、民族、文化程度、年龄" style='cursor:pointer;width:250px;'>
		具有政工职称人员基本情况--性别、民族、文化程度、年龄
		</span>
		</a>
		</label>
	<div style='padding-bottom:1px;text-align:left;display: inline-block;float: left;'>
		<label cellspacing=0 cellpadding=0 border=0>
		<a href='#' id='x13b' style='display:none;' onclick = "moduleClick('/report/reportJsp/showReport_tb.jsp?raq=/ganBuTongJi/ganBuTongJi_zx/x13b_zx.raq&tjDate=<%=tjDate%>&startDate=<%=startDate%>&endDate=<%=endDate%>&userID=<%=userID%>&col=<%=col%>')">
		<span title="具有政工职称人员基本情况--性别、民族、文化程度、年龄（一）" style='cursor:pointer;width:250px;'>
		具有政工职称人员基本情况--性别、民族、文化程度、年龄（一）
		</span>
		</a>
		</label>	
	<div style='padding-bottom:1px;text-align:left;display: inline-block;float: left;'>
		<label cellspacing=0 cellpadding=0 border=0>
		<a href='#' id='x14b' style='display:none;' onclick = "moduleClick('/report/reportJsp/showReport_tb.jsp?raq=/ganBuTongJi/ganBuTongJi_zx/x14b_zx.raq&tjDate=<%=tjDate%>&startDate=<%=startDate%>&endDate=<%=endDate%>&userID=<%=userID%>&col=<%=col%>')">
		<span title="具有政工职称人员基本情况--性别、民族、文化程度、年龄（二）" style='cursor:pointer;width:250px;'>
		具有政工职称人员基本情况--性别、民族、文化程度、年龄（二）
		</span>
		</a>
		</label>	
	<div style='padding-bottom:1px;text-align:left;display: inline-block;float: left;'>
		<label cellspacing=0 cellpadding=0 border=0>
		<a href='#' id='x15b' style='display:none;' onclick = "moduleClick('/report/reportJsp/showReport_tb.jsp?raq=/ganBuTongJi/ganBuTongJi_zx/x15b_zx.raq&tjDate=<%=tjDate%>&startDate=<%=startDate%>&endDate=<%=endDate%>&userID=<%=userID%>&col=<%=col%>')">
		<span title="政工干部--基本情况" style='cursor:pointer;width:250px;'>
		政工干部--基本情况
		</span>
		</a>
		</label>
	<div style='padding-bottom:1px;text-align:left;display: inline-block;float: left;'>
		<label cellspacing=0 cellpadding=0 border=0>
		<a href='#' id='x16b' style='display:none;' onclick = "moduleClick('/report/reportJsp/showReport_tb.jsp?raq=/ganBuTongJi/ganBuTongJi_zx/x16b_zx.raq&tjDate=<%=tjDate%>&startDate=<%=startDate%>&endDate=<%=endDate%>&userID=<%=userID%>&col=<%=col%>')">
		<span title="政工干部--基本情况（一）" style='cursor:pointer;width:250px;'>
		政工干部--基本情况（一）
		</span>
		</a>
		</label>
	<div style='padding-bottom:1px;text-align:left;display: inline-block;float: left;'>
		<label cellspacing=0 cellpadding=0 border=0>
		<a href='#' id='x17b' style='display:none;' onclick = "moduleClick('/report/reportJsp/showReport_tb.jsp?raq=/ganBuTongJi/ganBuTongJi_zx/x17b_zx.raq&tjDate=<%=tjDate%>&startDate=<%=startDate%>&endDate=<%=endDate%>&userID=<%=userID%>&col=<%=col%>')">
		<span title="政工干部--基本情况（二）" style='cursor:pointer;width:250px;'>
		政工干部--基本情况（二）
		</span>
		</a>
		</label>
	<div style='padding-bottom:1px;text-align:left;display: inline-block;float: left;'>
		<label cellspacing=0 cellpadding=0 border=0>
		<a href='#' id='x18b' style='display:none;' onclick = "moduleClick('/report/reportJsp/showReport_tb.jsp?raq=/ganBuTongJi/ganBuTongJi_zx/x18b_zx.raq&tjDate=<%=tjDate%>&startDate=<%=startDate%>&endDate=<%=endDate%>&userID=<%=userID%>&col=<%=col%>')">
		<span title="组织人事部门干部——基本情况" style='cursor:pointer;width:250px;'>
		组织人事部门干部——基本情况
		</span>
		</a>
		</label>
	<div style='padding-bottom:1px;text-align:left;display: inline-block;float: left;'>
		<label cellspacing=0 cellpadding=0 border=0>
		<a href='#' id='x19b' style='display:none;' onclick = "moduleClick('/report/reportJsp/showReport_tb.jsp?raq=/ganBuTongJi/ganBuTongJi_zx/x19b_zx.raq&tjDate=<%=tjDate%>&startDate=<%=startDate%>&endDate=<%=endDate%>&userID=<%=userID%>&col=<%=col%>')">
		<span title="领导班子基本情况" style='cursor:pointer;width:250px;'>
		领导班子基本情况
		</span>
		</a>
		</label>	
	<div style='padding-bottom:1px;text-align:left;display: inline-block;float: left;'>
		<label cellspacing=0 cellpadding=0 border=0>
		<a href='#' id='x20b' style='display:none;' onclick = "moduleClick('/report/reportJsp/showReport_tb.jsp?raq=/ganBuTongJi/ganBuTongJi_zx/x20b_zx.raq&tjDate=<%=tjDate%>&startDate=<%=startDate%>&endDate=<%=endDate%>&userID=<%=userID%>&col=<%=col%>')">
		<span title="干部调整职务情况统计表" style='cursor:pointer;width:250px;'>
		干部调整职务情况统计表
		</span>
		</a>
		</label>	
		</div></td></tr></table></div>
		
		
</div>

<script src="js/menu.js"></script> <!--控制js-->
<div style="padding:0px;">
	<iframe id="mainframe" style="width:80%;height:100vh" frameborder="0" style="marging:0px;"></iframe>
</div>
<script>
	function isBigEnough(element, index, array) {
		return (element[1] == 'rateOfTime');
	}
	$(function(){
		var src = {};
		src["PM01"] = "/report/reportJsp/showReport_tb.jsp?raq=/ganBuTongJi/ganBuTongJi_zx/PM01_zx.raq&tjDate=<%=tjDate%>&startDate=<%=startDate%>&endDate=<%=endDate%>&userID=<%=userID%>&col=<%=col%>";
		src["hz1"] = "/report/reportJsp/showReport_tb.jsp?raq=/ganBuTongJi/ganBuTongJi_zx/hz1_zx.raq&tjDate=<%=tjDate%>&startDate=<%=startDate%>&endDate=<%=endDate%>&userID=<%=userID%>&col=<%=col%>";
		src["hz2"] = "/report/reportJsp/showReport_tb.jsp?raq=/ganBuTongJi/ganBuTongJi_zx/hz2_zx.raq&tjDate=<%=tjDate%>&startDate=<%=startDate%>&endDate=<%=endDate%>&userID=<%=userID%>&col=<%=col%>";
		src["hz3"] = "/report/reportJsp/showReport_tb.jsp?raq=/ganBuTongJi/ganBuTongJi_zx/hz3_zx.raq&tjDate=<%=tjDate%>&startDate=<%=startDate%>&endDate=<%=endDate%>&userID=<%=userID%>&col=<%=col%>";
		src["jg1"] = "/report/reportJsp/showReport_tb.jsp?raq=/ganBuTongJi/ganBuTongJi_zx/jg1_zx.raq&tjDate=<%=tjDate%>&startDate=<%=startDate%>&endDate=<%=endDate%>&userID=<%=userID%>&col=<%=col%>";
		src["d1b"] = "/report/reportJsp/showReport_tb.jsp?raq=/ganBuTongJi/ganBuTongJi_zx/d1b_zx.raq&tjDate=<%=tjDate%>&startDate=<%=startDate%>&endDate=<%=endDate%>&userID=<%=userID%>&col=<%=col%>";
		src["d2b"] = "/report/reportJsp/showReport_tb.jsp?raq=/ganBuTongJi/ganBuTongJi_zx/d2b_zx.raq&tjDate=<%=tjDate%>&startDate=<%=startDate%>&endDate=<%=endDate%>&userID=<%=userID%>&col=<%=col%>";
		src["d3b"] = "/report/reportJsp/showReport_tb.jsp?raq=/ganBuTongJi/ganBuTongJi_zx/d3b_zx.raq&tjDate=<%=tjDate%>&startDate=<%=startDate%>&endDate=<%=endDate%>&userID=<%=userID%>&col=<%=col%>";
		src["d4b"] = "/report/reportJsp/showReport_tb.jsp?raq=/ganBuTongJi/ganBuTongJi_zx/d4b_zx.raq&tjDate=<%=tjDate%>&startDate=<%=startDate%>&endDate=<%=endDate%>&userID=<%=userID%>&col=<%=col%>";
		src["item1"] = "/report/reportJsp/showReport_tb.jsp?raq=/ganBuTongJi/ganBuTongJi_zx/d5b_zx.raq&tjDate=<%=tjDate%>&startDate=<%=startDate%>&endDate=<%=endDate%>&userID=<%=userID%>&col=<%=col%>";
		src["d6b"] = "/report/reportJsp/showReport_tb.jsp?raq=/ganBuTongJi/ganBuTongJi_zx/d6b_zx.raq&tjDate=<%=tjDate%>&startDate=<%=startDate%>&endDate=<%=endDate%>&userID=<%=userID%>&col=<%=col%>";
		src["d7b"] = "/report/reportJsp/showReport_tb.jsp?raq=/ganBuTongJi/ganBuTongJi_zx/d7b_zx.raq&tjDate=<%=tjDate%>&startDate=<%=startDate%>&endDate=<%=endDate%>&userID=<%=userID%>&col=<%=col%>";
		src["d8b"] = "/report/reportJsp/showReport_tb.jsp?raq=/ganBuTongJi/ganBuTongJi_zx/d8b_zx.raq&tjDate=<%=tjDate%>&startDate=<%=startDate%>&endDate=<%=endDate%>&userID=<%=userID%>&col=<%=col%>";
		src["d9b"] = "/report/reportJsp/showReport_tb.jsp?raq=/ganBuTongJi/ganBuTongJi_zx/d9b_zx.raq&tjDate=<%=tjDate%>&startDate=<%=startDate%>&endDate=<%=endDate%>&userID=<%=userID%>&col=<%=col%>";
		src["d10b"] = "/report/reportJsp/showReport_tb.jsp?raq=/ganBuTongJi/ganBuTongJi_zx/d10b_zx.raq&tjDate=<%=tjDate%>&startDate=<%=startDate%>&endDate=<%=endDate%>&userID=<%=userID%>&col=<%=col%>";
		src["d11b"] = "/report/reportJsp/showReport_tb.jsp?raq=/ganBuTongJi/ganBuTongJi_zx/d11b_zx.raq&tjDate=<%=tjDate%>&startDate=<%=startDate%>&endDate=<%=endDate%>&userID=<%=userID%>&col=<%=col%>";
		src["d12b"] = "/report/reportJsp/showReport_tb.jsp?raq=/ganBuTongJi/ganBuTongJi_zx/d12b_zx.raq&tjDate=<%=tjDate%>&startDate=<%=startDate%>&endDate=<%=endDate%>&userID=<%=userID%>&col=<%=col%>";
		src["d13b"] = "/report/reportJsp/showReport_tb.jsp?raq=/ganBuTongJi/ganBuTongJi_zx/d13b_zx.raq&tjDate=<%=tjDate%>&startDate=<%=startDate%>&endDate=<%=endDate%>&userID=<%=userID%>&col=<%=col%>";
		src["d14b"] = "/report/reportJsp/showReport_tb.jsp?raq=/ganBuTongJi/ganBuTongJi_zx/d14b_zx.raq&tjDate=<%=tjDate%>&startDate=<%=startDate%>&endDate=<%=endDate%>&userID=<%=userID%>&col=<%=col%>";
		src["d15b"] = "/report/reportJsp/showReport_tb.jsp?raq=/ganBuTongJi/ganBuTongJi_zx/d15b_zx.raq&tjDate=<%=tjDate%>&startDate=<%=startDate%>&endDate=<%=endDate%>&userID=<%=userID%>&col=<%=col%>";
		src["d33b"] = "/report/reportJsp/showReport_tb.jsp?raq=/ganBuTongJi/ganBuTongJi_zx/d33b_zx.raq&tjDate=<%=tjDate%>&startDate=<%=startDate%>&endDate=<%=endDate%>&userID=<%=userID%>&col=<%=col%>";
		src["d34b"] = "/report/reportJsp/showReport_tb.jsp?raq=/ganBuTongJi/ganBuTongJi_zx/d34b_zx.raq&tjDate=<%=tjDate%>&startDate=<%=startDate%>&endDate=<%=endDate%>&userID=<%=userID%>&col=<%=col%>";
		src["d35b"] = "/report/reportJsp/showReport_tb.jsp?raq=/ganBuTongJi/ganBuTongJi_zx/d35b_zx.raq&tjDate=<%=tjDate%>&startDate=<%=startDate%>&endDate=<%=endDate%>&userID=<%=userID%>&col=<%=col%>";
		src["d36b"] = "/report/reportJsp/showReport_tb.jsp?raq=/ganBuTongJi/ganBuTongJi_zx/d36b_zx.raq&tjDate=<%=tjDate%>&startDate=<%=startDate%>&endDate=<%=endDate%>&userID=<%=userID%>&col=<%=col%>";
		src["PM02"] = "/report/reportJsp/showReport_tb.jsp?raq=/ganBuTongJi/ganBuTongJi_zx/PM02_zx.raq&tjDate=<%=tjDate%>&startDate=<%=startDate%>&endDate=<%=endDate%>&userID=<%=userID%>&col=<%=col%>";
		src["PM03"] = "/report/reportJsp/showReport_tb.jsp?raq=/ganBuTongJi/ganBuTongJi_zx/PM03_zx.raq&tjDate=<%=tjDate%>&startDate=<%=startDate%>&endDate=<%=endDate%>&userID=<%=userID%>&col=<%=col%>";
		src["PM04"] = "/report/reportJsp/showReport_tb.jsp?raq=/ganBuTongJi/ganBuTongJi_zx/PM04_zx.raq&tjDate=<%=tjDate%>&startDate=<%=startDate%>&endDate=<%=endDate%>&userID=<%=userID%>&col=<%=col%>";
		src["PM05"] = "/report/reportJsp/showReport_tb.jsp?raq=/ganBuTongJi/ganBuTongJi_zx/PM05_zx.raq&tjDate=<%=tjDate%>&startDate=<%=startDate%>&endDate=<%=endDate%>&userID=<%=userID%>&col=<%=col%>";
		src["PM06"] = "/report/reportJsp/showReport_tb.jsp?raq=/ganBuTongJi/ganBuTongJi_zx/PM06_zx.raq&tjDate=<%=tjDate%>&startDate=<%=startDate%>&endDate=<%=endDate%>&userID=<%=userID%>&col=<%=col%>";
		src["PM07"] = "/report/reportJsp/showReport_tb.jsp?raq=/ganBuTongJi/ganBuTongJi_zx/PM07_zx.raq&tjDate=<%=tjDate%>&startDate=<%=startDate%>&endDate=<%=endDate%>&userID=<%=userID%>&col=<%=col%>";
		src["PM08"] = "/report/reportJsp/showReport_tb.jsp?raq=/ganBuTongJi/ganBuTongJi_zx/PM08_zx.raq&tjDate=<%=tjDate%>&startDate=<%=startDate%>&endDate=<%=endDate%>&userID=<%=userID%>&col=<%=col%>";
		src["PM09"] = "/report/reportJsp/showReport_tb.jsp?raq=/ganBuTongJi/ganBuTongJi_zx/PM09_zx.raq&tjDate=<%=tjDate%>&startDate=<%=startDate%>&endDate=<%=endDate%>&userID=<%=userID%>&col=<%=col%>";
		src["PM10"] = "/report/reportJsp/showReport_tb.jsp?raq=/ganBuTongJi/ganBuTongJi_zx/PM10_zx.raq&tjDate=<%=tjDate%>&startDate=<%=startDate%>&endDate=<%=endDate%>&userID=<%=userID%>&col=<%=col%>";
		
		src["x1b"] = "/report/reportJsp/showReport_tb.jsp?raq=/ganBuTongJi/ganBuTongJi_zx/x1b_zx.raq&tjDate=<%=tjDate%>&startDate=<%=startDate%>&endDate=<%=endDate%>&userID=<%=userID%>&col=<%=col%>";
		src["x2b"] = "/report/reportJsp/showReport_tb.jsp?raq=/ganBuTongJi/ganBuTongJi_zx/x2b_zx.raq&tjDate=<%=tjDate%>&startDate=<%=startDate%>&endDate=<%=endDate%>&userID=<%=userID%>&col=<%=col%>";
		src["x4b"] = "/report/reportJsp/showReport_tb.jsp?raq=/ganBuTongJi/ganBuTongJi_zx/x4b_zx.raq&tjDate=<%=tjDate%>&startDate=<%=startDate%>&endDate=<%=endDate%>&userID=<%=userID%>&col=<%=col%>";
		src["x5b"] = "/report/reportJsp/showReport_tb.jsp?raq=/ganBuTongJi/ganBuTongJi_zx/x5b_zx.raq&tjDate=<%=tjDate%>&startDate=<%=startDate%>&endDate=<%=endDate%>&userID=<%=userID%>&col=<%=col%>";
		src["x6b"] = "/report/reportJsp/showReport_tb.jsp?raq=/ganBuTongJi/ganBuTongJi_zx/x6b_zx.raq&tjDate=<%=tjDate%>&startDate=<%=startDate%>&endDate=<%=endDate%>&userID=<%=userID%>&col=<%=col%>";
		src["x7b"] = "/report/reportJsp/showReport_tb.jsp?raq=/ganBuTongJi/ganBuTongJi_zx/x7b_zx.raq&tjDate=<%=tjDate%>&startDate=<%=startDate%>&endDate=<%=endDate%>&userID=<%=userID%>&col=<%=col%>";
		src["x8b"] = "/report/reportJsp/showReport_tb.jsp?raq=/ganBuTongJi/ganBuTongJi_zx/x8b_zx.raq&tjDate=<%=tjDate%>&startDate=<%=startDate%>&endDate=<%=endDate%>&userID=<%=userID%>&col=<%=col%>";
		src["x9b"] = "/report/reportJsp/showReport_tb.jsp?raq=/ganBuTongJi/ganBuTongJi_zx/x9b_zx.raq&tjDate=<%=tjDate%>&startDate=<%=startDate%>&endDate=<%=endDate%>&userID=<%=userID%>&col=<%=col%>";
		src["x10b"] = "/report/reportJsp/showReport_tb.jsp?raq=/ganBuTongJi/ganBuTongJi_zx/x10b_zx.raq&tjDate=<%=tjDate%>&startDate=<%=startDate%>&endDate=<%=endDate%>&userID=<%=userID%>&col=<%=col%>";
		src["x11b"] = "/report/reportJsp/showReport_tb.jsp?raq=/ganBuTongJi/ganBuTongJi_zx/x11b_zx.raq&tjDate=<%=tjDate%>&startDate=<%=startDate%>&endDate=<%=endDate%>&userID=<%=userID%>&col=<%=col%>";
		src["x12b"] = "/report/reportJsp/showReport_tb.jsp?raq=/ganBuTongJi/ganBuTongJi_zx/x12b_zx.raq&tjDate=<%=tjDate%>&startDate=<%=startDate%>&endDate=<%=endDate%>&userID=<%=userID%>&col=<%=col%>";
		src["x13b"] = "/report/reportJsp/showReport_tb.jsp?raq=/ganBuTongJi/ganBuTongJi_zx/x13b_zx.raq&tjDate=<%=tjDate%>&startDate=<%=startDate%>&endDate=<%=endDate%>&userID=<%=userID%>&col=<%=col%>";
		src["x14b"] = "/report/reportJsp/showReport_tb.jsp?raq=/ganBuTongJi/ganBuTongJi_zx/x14b_zx.raq&tjDate=<%=tjDate%>&startDate=<%=startDate%>&endDate=<%=endDate%>&userID=<%=userID%>&col=<%=col%>";
		src["x15b"] = "/report/reportJsp/showReport_tb.jsp?raq=/ganBuTongJi/ganBuTongJi_zx/x15b_zx.raq&tjDate=<%=tjDate%>&startDate=<%=startDate%>&endDate=<%=endDate%>&userID=<%=userID%>&col=<%=col%>";
		src["x16b"] = "/report/reportJsp/showReport_tb.jsp?raq=/ganBuTongJi/ganBuTongJi_zx/x16b_zx.raq&tjDate=<%=tjDate%>&startDate=<%=startDate%>&endDate=<%=endDate%>&userID=<%=userID%>&col=<%=col%>";
		src["x17b"] = "/report/reportJsp/showReport_tb.jsp?raq=/ganBuTongJi/ganBuTongJi_zx/x17b_zx.raq&tjDate=<%=tjDate%>&startDate=<%=startDate%>&endDate=<%=endDate%>&userID=<%=userID%>&col=<%=col%>";
		src["x18b"] = "/report/reportJsp/showReport_tb.jsp?raq=/ganBuTongJi/ganBuTongJi_zx/x18b_zx.raq&tjDate=<%=tjDate%>&startDate=<%=startDate%>&endDate=<%=endDate%>&userID=<%=userID%>&col=<%=col%>";
		src["x19b"] = "/report/reportJsp/showReport_tb.jsp?raq=/ganBuTongJi/ganBuTongJi_zx/x19b_zx.raq&tjDate=<%=tjDate%>&startDate=<%=startDate%>&endDate=<%=endDate%>&userID=<%=userID%>&col=<%=col%>";
		src["x20b"] = "/report/reportJsp/showReport_tb.jsp?raq=/ganBuTongJi/ganBuTongJi_zx/x20b_zx.raq&tjDate=<%=tjDate%>&startDate=<%=startDate%>&endDate=<%=endDate%>&userID=<%=userID%>&col=<%=col%>";
		//$("#mainframe").attr("src","/report/reportJsp/showReport_tb.jsp?raq=/ganBuTongJi/ganBuTongJi_zx/hz3_zx.raq&tjDate=<%=tjDate%>&startDate=<%=startDate%>&endDate=<%=endDate%>&userID=<%=userID%>&col=<%=col%>");
		var str = "<%=name%>";
		console.log("str"+str);
		var data = str.split(',');
		console.log(data);
		console.log(data.length);
		for(var i=0;i<data.length;i++){
			document.getElementById(data[i]).style.display = "block";
		}
		 console.log(src["PM01"])
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
</script>
</body>
</html>