<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="org.jdom.*,java.lang.*,java.io.*,java.util.*" %>
<%@ page import="com.runqian.report4.view.ParamsPool" %>
<html>
<body topmargin=0 leftmargin=0 rightmargin=0 bottomMargin=0>
<%
	Enumeration enu=request.getParameterNames();
	Hashtable hash = new Hashtable();  
	while(enu.hasMoreElements()){
		String paraName=(String)enu.nextElement();  
		System.out.println(paraName+": "+request.getParameter(paraName));
		hash.put(paraName,request.getParameter(paraName));
	}
	String raqName=request.getParameter("raq");//报表名称，到时候改成干部任免表
	String reportParamsId = null;//定义reportParamsId
	if( hash.size() > 0 ) {
		reportParamsId = ParamsPool.createParamsId();//生成参数缓存id
		System.out.println("reportParamsId="+reportParamsId);
		ParamsPool.put( reportParamsId,  hash);//将id放到缓存中
	}
	//response.sendRedirect("http://localhost:8080/demo/reportServlet?action=7&file=test.rpx&columns=0&srcType=file&cachedId=A_10747002&reportParamsId=100008&t_i_m_e=1557734658711");
	response.sendRedirect("/report/reportServlet?action=3&file="+raqName+"&columns=0&srcType=file&width=0&height=0&reportParamsId="+
	reportParamsId+"&excelFormat=2003&pageStyle=0&formula=0&ratio=100");
	System.out.println("reportParamsId="+reportParamsId);
%>
<iframe name="report1_saveAs_frame" id="report1_saveAs_frame" src="a.html" style="display:none"></iframe>
<iframe name="report1_printIFrame" id="report1_printIFrame" src="a.html" style="position:absolute;left:-100px;top:-100px" width=50 height=50></iframe>
</body>
</html>
