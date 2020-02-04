<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/WEB-INF/runqianReport4.tld" prefix="report" %>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>
<%@ page import="com.runqian.report4.usermodel.Context"%>
<%@ page import="javax.crypto.Cipher"%>
<%@ page import="javax.crypto.spec.SecretKeySpec"%>
<%@ page import="com.runqian.report4.tag.AES"%>
<%@ page import="com.huida.ReportApproval"%>
<%@ page import="com.huida.ReportDataMain"%>
<%@ page import="com.huida.DataSourceMain"%>

<html>
<link type="text/css" href="css/style.css" rel="stylesheet"/>
<script type="text/javascript" src="js/jquery-1.11.1.min.js"></script>

<script type="text/javascript" src="js/layer-v2.1/layer/layer.js"></script>

<body topmargin=0 leftmargin=0 rightmargin=0 bottomMargin=0>
<%
	request.setCharacterEncoding( "GBK" );
	String report = request.getParameter( "raq" );
	String rybm = request.getParameter( "rybm" );
	String role = request.getParameter("role");
	String reportFileHome=Context.getInitCtx().getMainDir();
	StringBuffer param=new StringBuffer();
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
	DataSourceMain ds = new DataSourceMain();
	String sql = "select a.id as tjDate,a.startdate,a.enddate,a.col,a.slc_tab as tab,celery from parameter a where a.celery ='1'";
	//���ؿ�
	ds.setJdbc("oracle.jdbc.driver.OracleDriver");
	ds.setUrl("jdbc:oracle:thin:@172.25.42.118:1521:orcl");
	ds.setUname("pesoel");
	ds.setPword("pesoel");
	ReportApproval ra = new ReportApproval();
	String lujuUrl = ra.getTasktData(ds,sql);
	//��ͳ��
	ds.setJdbc("oracle.jdbc.driver.OracleDriver");
	ds.setUrl("jdbc:oracle:thin:@172.25.42.231:1521:hrmis");
	ds.setUname("sy");
	ds.setPword("Hrmis150");
	sql = "select dwbsm as id,dwmc as name  from lz_dwjbxx where  dwbsm in "+
		  "(select dwbsm from gg_yhqxxx where dwxxbmbs=(select a.bmbm from gg_zgjbxx a where a.rybm='2021295835'))"+
		  "and  validflag='1'";
	String userId = ra.getCompanyData(ds,sql);
	lujuUrl += "&userID=" + userId;
	sql = "select dwbsm  as id  from gg_yhqxxx where dwxxbmbs=(select a.bmbm from gg_zgjbxx a where a.rybm='2021295835')";
	String opCod = ra.getPowerData(ds,sql);
	lujuUrl += "&opCod=" + opCod;
	sql = "select dwbsm as id,dwmc as name  from lz_dwjbxx where  dwbsm in "+
		  "( select dwbsm from gg_yhqxxx where  regexp_like(dwbsm,replace('"+opCod+
		  "',',','|'))) and validflag='1'  and dwbsm!='"+userId+"'";
	System.out.println("sql----------->"+sql);
	String user_id = ra.getPowerData(ds,sql);
	String direStatisUrl = lujuUrl+"&rybm="+rybm;
	lujuUrl += "&userid=" + user_id +"&rybm="+rybm;
	System.out.println("direStatisUrl----------->"+direStatisUrl);
	System.out.println("lujuUrl----------->"+lujuUrl);
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
	
	//������λͳ��
	//function  twoStatistics(){
		
	//}
	
	//���ת��ҳ��
	
	function tb(){
	var role = <%=role%>  ; //Ȩ���ж��Ƿ���һ�����Ƕ�����λ������������ܰ�ť��ת��ҳ��
	var userID=document.getElementById("report1_E2").attributes.value.value;
	 var firstUnit = "/report/reportJsp/meau.jsp?raq=";
	 var secondUnit = "/report/reportJsp/meau.jsp?raq=";
	 if(role === 1){
		 window.location.href=firstUnit+'<%= direStatisUrl%>'+'&dept=1'
	 }else if(role===2){
		 window.location.href=secondUnit+'<%= direStatisUrl%>'+'&dept=2'
	 }
	
	  //alert(userID);
	  //window.location.href="/report/reportJsp/meau.jsp?raq="+'<%= direStatisUrl%>'
	}
     
	//�������ת��ҳ��
	function hztb(){
	var role = <%=role%>  ; //Ȩ���ж��Ƿ���һ�����Ƕ�����λ������������ܰ�ť��ת��ҳ��
	console.log('<%= lujuUrl%>')
	var userID=document.getElementById("report1_E2").attributes.value.value;
	 // alert(userID);
	 var firstUnit = "/report/reportJsp/showReportGrouphztb.jsp?rpg=/ganBuTongJi/ganBuTongJi_hz/hzGroup.rpg";
	 var secondUnit = "/report/reportJsp/showReportGrouptb_luju.jsp?rpg=/ganBuTongJi/ganBuTongJi_hz/hzGroup.rpg";
	 if(role === 1){
		 window.location.href=firstUnit+'<%= lujuUrl%>'+'&dept=1';
	 }else if(role===2){
		 window.location.href=secondUnit+'<%= lujuUrl%>'+'&dept=2';
	 }
	}
</script>
</body>
</html>
