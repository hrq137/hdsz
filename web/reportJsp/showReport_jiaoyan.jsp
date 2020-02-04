<%@ page contentType="text/html;charset=GBK"%>
<%@ taglib uri="/WEB-INF/runqianReport4.tld" prefix="report" %>
<%@page import="com.runqian.mis2.util.Base64Util"%>
<%@page import="com.runqian.report4.usermodel.Context"%>
<%@page import="com.runqian.report4.model.ReportDefine"%>
<%@page import="com.runqian.report4.util.ReportUtils"%>
<%@page import="com.runqianapp.ngr.data.managers.DataSourceManager"%>
<%@page import="com.runqian.report4.ide.base.DataSource"%>
<%@page import="com.runqian.base4.util.PwdUtils"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="com.runqian.report4.usermodel.Engine"%>
<%@ page import="com.runqian.report4.usermodel.IReport"%>
<%@ page import="com.runqian.report4.usermodel.PageBuilder"%>
<%@ page import="com.runqianapp.flexdesigner.ExpressionParser"%>
<%@ page import="java.util.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="com.runqian.base4.util.DBTypes"%>
<%@ page import="java.sql.SQLException"%>
<%@ page import="com.runqian.mis2.util.DBAccess"%>

<html>
<body topmargin=0 leftmargin=0 rightmargin=0 bottomMargin=0>
<%! List<String> cacheList = new ArrayList<String>(); %>
<%
	request.setCharacterEncoding("UTF-8");
	String report = request.getParameter("raq");
	
	String reportFileHome=Context.getInitCtx().getMainDir();
	StringBuffer param=new StringBuffer();
	String path = request.getSession().getServletContext().getRealPath("");
	
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
	report=report;
%>
<jsp:include page="toolbar.jsp" flush="false" />
<table id="rpt" align="center"><tr><td>
<%	//如果参数模板存在，则显示参数模板
	if( f.exists() ) {
	%>
	<table id="param_tbl" width="100%" height="100%"><tr><td>
		<report:param name="form1" paramFileName="<%=paramFile%>"
			needSubmit="no"
			params="<%=param.toString()%>"
			
		/>
	</td>
	<td><a href="javascript:_submit( form1 )"><img src="../images/query.jpg" border=no style="vertical-align:middle"></a></td>
	</tr></table>
	<% }
%>
<table align="center" width="100%" height="100%">
	<tr><td>
		<report:html name="report1" reportFileName="<%=report%>"
			funcBarLocation="top"
			needPageMark="yes"
			width="-1"		
			height="-1"	
			generateParamForm="no"
			params="<%=param.toString()%>"			
			exceptionPage="/reportJsp/myError2.jsp"
		/>
	</td></tr>
</table>

<script language="javascript">

	//设置分页显示值
	document.getElementById( "t_page_span" ).innerHTML=report1_getTotalPage();
	document.getElementById( "c_page_span" ).innerHTML=report1_getCurrPage();
</script>
<%
	String reportName = report.substring(0,report.lastIndexOf(".raq"));
	List<String[]> validations=getValidation(reportName);
	String result="校验提示：<br>";
	for(int i=0;i<validations.size();i++){
		result+=reportValidate(request,validations.get(i)[1],validations.get(i)[2],param.toString());
	}
	
	
	for(int i=0;i<cacheList.size();i++){
		File file = new File(cacheList.get(i));
		if (file.exists()) {
			file.delete();
		}
	}
	
	
	//System.out.println(result);
	if(result.equals("校验提示：<br>")){
	
}else{
	out.println(result);
	}
%>
</body>
</html>


<%!
	private List<String[]> getValidation(String reportName){
		List<String[]> rlt = new ArrayList<String[]>();
		Connection conn = getConnection();
		String sql = "select * from t_validation where report_code=?";
		PreparedStatement ps = null;
		ResultSet rs = null;
		try{
			ps = conn.prepareStatement(sql);
			ps.setString(1,reportName);
			rs = ps.executeQuery();
			while(rs.next()){
				String[] temp = new String[3];
				temp[0] = rs.getString("Report_Code");
				temp[1] = rs.getString("validate_exp");
				temp[2] = rs.getString("error_prompt");
				rlt.add(temp);
			}
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			close(rs,ps,conn);
		}
		return rlt;
	}

	//报表校验关系验证
	private String reportValidate(HttpServletRequest request,String exp,String error,String params){
		ExpressionParser test = new ExpressionParser();
		test.path=request.getSession().getServletContext().getRealPath("")+"/runqian/reportFiles/";
		test.paramStr=params;
		test.cacheList = cacheList;
		String leftExp=exp.split("=")[0];
		String rightExp=exp.split("=")[1];
		double leftValue=0;
		double rightValue=0;
		try{
		//	System.out.println("leftExp====="+leftExp);
			leftValue=test.calc(leftExp);
			rightValue=test.calc(rightExp);
		//	System.out.println("rightExp====="+rightExp);

		}catch(Exception e){
			e.printStackTrace();
		}
		//System.out.println("leftValue:"+leftValue);
		//System.out.println("rightValue:"+rightValue);
		
		if(leftValue==rightValue){
			return "";
		}else{
			return error+"</br>";
		}
	}
	
	private Connection getConnection(){
		DBAccess dba = null;
		Connection con = null;
		try{
  			dba = new DBAccess();
  			con = dba.getConnectionFromDBA();
  		}catch(Exception e){
			e.printStackTrace();
  		}
		return con;
	}
	
		private void close(ResultSet rs ,PreparedStatement ps ,Connection conn){
		if(rs!=null){
			try {
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		if(ps!=null){
			try {
				ps.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		if(conn!=null){
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
%>