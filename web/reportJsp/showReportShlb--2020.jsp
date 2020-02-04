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
	
	//��֤�������Ƶ�������
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
				//�Ѳ���ƴ��name=value;name2=value2;.....����ʽ
				
			}
		}
	}

	//���´����Ǽ����������Ƿ�����Ӧ�Ĳ���ģ��
	String paramFile = report.substring(0,iTmp)+"_arg.raq";
	File f=new File(application.getRealPath(reportFileHome+ File.separator +paramFile));

%>

<table id="rpt" align="center" width=100% height=100%>
<%	//�������ģ����ڣ�����ʾ����ģ��
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
	//���÷�ҳ��ʾֵ
	
	document.getElementById( "t_page_span" ).innerHTML=report1_getTotalPage();
	document.getElementById( "c_page_span" ).innerHTML=report1_getCurrPage();



	//��ȡ��ѡ���״ֵ̬
	function selcheck(){
	 var values="";
	 var objs = report1.getElementsByTagName("input");//��ȡҳ���ϵ�input
	 for(var i=0; i<objs.length; i++) {//ѭ��������ȡ����input
		 if(objs[i].type.toLowerCase() == "checkbox" && objs[i].checked==true){//�ж�input�������Ǹ�ѡ�򣬲����Ѿ���ѡ��
			var cellId = objs[i].parentNode.id;//��ȡ��ѡ�����ڵ�Ԫ���id
            var newCellId = cellId.replace("K","L");//������ΪҪ��ȡJ�е�����
                values = values+" "+newCellId;
		}    
	 }
	 // alert(values);//����ȡ����ֵalert����
		return {values:values};

	}


	//��ȡ��ѡ��ǰ�ߵ��û�ֵ
	function selUser(){
	 var values="";
	  
	 var objs = report1.getElementsByTagName("input");//��ȡҳ���ϵ�input
	 for(var i=0; i<objs.length; i++) {//ѭ��������ȡ����input
		 if(objs[i].type.toLowerCase() == "checkbox" && objs[i].checked==true){//�ж�input�������Ǹ�ѡ�򣬲����Ѿ���ѡ��
			var cellId = objs[i].parentNode.id;//��ȡ��ѡ�����ڵ�Ԫ���id
            var newCellId = cellId.replace("K","G");//������ΪҪ��ȡJ�е�����
                values = values+" "+newCellId;
		    var endDate = cellId.replace("K","Q"); //������ΪҪ��ȡQ�е�����
			var endDate1 = $("#"+endDate)[0]; //��ȡ��ǰendDate��domԪ��
			var endDate = endDate1.innerHTML; //��ȡ��ǰendDate��valueֵ
			
			 var startDate = cellId.replace("K","R"); //������ΪҪ��ȡR�е�����
			 var startDate1 = $("#"+startDate)[0]; //��ȡ��ǰstartDate��domԪ��
			 var startDate = startDate1.innerHTML; //��ȡ��ǰstartDate��valueֵ
		    //alert(endDate2);
			
			
			
		}      
	 }
	//  alert(values);//����ȡ����ֵalert����
		return {values:values,endDate,startDate};

	}


	//loading�ķ���

    function forDatell_shck(tjDate,userID,tab,endDate,startDate) {
		var index = layer.load();
		window.location.href = "http://"+window.location.host+"/report/"+"reportJsp/showReportGroup_shck.jsp?rpg=/ganBuTongJi/ganBuTongJi_zx/zxGroup.rpg&tjDate="+
			tjDate+"&userID="+userID+"&tab="+tab+"&endDate="+endDate+"&startDate="+startDate ;
	}



</script>
</body>
</html>
