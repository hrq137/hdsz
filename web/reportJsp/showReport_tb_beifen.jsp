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
	String col = request.getParameter("col"); //��һ��
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
				//�Ѳ���ƴ��name=value;name2=value2;.....����ʽ
				param.append(paramName).append("=").append(paramValue).append(";");
			}
		}
	}

	//���´����Ǽ����������Ƿ�����Ӧ�Ĳ���ģ��
	String paramFile = report.substring(0,iTmp)+"_arg.raq";
	File f=new File(application.getRealPath(reportFileHome+ File.separator +paramFile));

%>

    <input type="hidden" name="report" id="report" value="<%=report%>"></input>
	<input type="hidden" name="tjDate" id="tjDate" value="<%=tjDate%>"></input>
	<input type="hidden" name="startDate" id="startDate" value="<%=startDate%>"></input>
	<input type="hidden" name="endDate" id="endDate" value="<%=endDate%>"></input>
	<input type="hidden" name="userID" id="userID" value="<%=userID%>"></input>
	<input type="hidden" name="col" id="col" value="<%=col%>"></input> <!--������-->
	
	
	<div id=mengban style="background-color:white;position:absolute;z-index:999;width:100%;height:100% ;display:none">
	<table width=100% height=100%>
		<tr><td width=100% style="text-align:center;vertical-align:middle">�����ύ�У����Ժ�......</td></tr>
	</table>
    </div>

    <div id=chouqu style="background-color:white;position:absolute;z-index:999;width:100%;height:100% ;display:none">
	<table width=100% height=100%>
		<tr><td width=100% style="text-align:center;vertical-align:middle">���ݼ����У����Ժ�......</td></tr>
	</table>
    </div>

<td><button onclick="save()" class="tbBtn">����</button></td>

<td><button onclick="save2()"class="tbBtn">��ȡ</button></td>
<td><button  onclick="report1_saveAsExcel()" class="tbBtn">����Excel</button></td>  




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




	//���水ť
function save(){
	    
		var cell1 = document.getElementById("report1_E1");		//�����E1��չ�ֱ��ĵ�Ԫ��E1
		//alert(cell1);
		var  cell2= document.getElementById("report1_D1").attributes.value.value;; //�����Ϊ���жϽ���չ�ֱ�ʱ,�ñ������ޱ�������,���û�����ݵĻ��͵���,���ȳ�ȡ����,���������,�Ϳ��Ա���
		//alert(cell2);

	if ( cell2==null || cell2==""){ alert("���ȳ�ȡ����")}

	else{
			if(cell1 != null){
			var E1 =document.getElementById("report1_E1").attributes.value.value;
						
			}

                   if (E1 == '2' || E1=='0')
			     {
				alert("���ܱ������ݣ�");		

			    }
			    else {


	        
             //���水ť��У��,���У��ͨ��,�Ͳ������ݼ����е�ҳ��,���ͨ��,�����Ǹ������е�ҳ��
               if  ( _submitTable( document.getElementById( 'report1' ) )) {
				  
                   var index = layer.load();
                  //document.getElementById( "mengban" ).style.display = "";
				  }

            }

	}
}

//��ȡ��ť��ת������,����zq��


  function save2() {
	   
	   var report="<%=report%>";  //ȥ��.raq��ȡ������
	  // alert(report);
       //var report="<%=report.substring(0,iTmp)%>";  //ȥ��.raq��ȡ������(Ҳ��һ�ַ���,���ǵ�һ�ֹ�����������Ͳ�������)
	   report = report.replace(".raq","");  //������ǲ�����һ�������Ĳ���,,ȥ��.raq��ȡ������
	  // alert(report);
           //alert(typeof(report));
	    var report1=report.replace(/\zx/g,"tbzq");  //��zx�滻��tbzq
	   //alert(typeof(report1));
	  // alert(report1);
        
 	   var tjDate="<%=tjDate%>";
		
		var startDate="<%=startDate%>";
		var endDate="<%=endDate%>";
		var userID="<%=userID%>";
		var col="<%=col%>";
	
		var cell1 = document.getElementById("report1_E1");		//�����E1��չ�ֱ��ĵ�Ԫ��E1
		//alert(cell1);
		if(cell1 != null){
			var E1 =document.getElementById("report1_E1").attributes.value.value;
						
			}

        if (E1 == '2' || E1=='0')
			{
				alert("���ܳ�ȡ���ݣ�");		

			}
			else {
			   
 	            window.open("showReport_zq.jsp?raq="+report1+"&tjDate="+tjDate+"&startDate="+startDate+"&endDate="+endDate+"&userID="+userID+"&col="+col,"_self");
				var index = layer.load();
				//document.getElementById( "chouqu" ).style.display = "";
			}
		

 }



</script>
</body>
</html>