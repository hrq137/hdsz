<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/WEB-INF/runqianReport4.tld" prefix="report" %>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>
<%@ page import="com.runqian.report4.usermodel.Context"%>

<html>
<link type="text/css" href="css/style.css" rel="stylesheet"/>
<script type="text/javascript" src="js/jquery-1.11.1.min.js"></script>
 
<body topmargin=0 leftmargin=0 rightmargin=0 bottomMargin=0>
<%
	request.setCharacterEncoding( "GBK" );
	String report = request.getParameter( "raq" );
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
			funcBarLocation="no"
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
</script>

<script language="javascript">
	function selcheck() {
		var objs = report1.getElementsByTagName("input");//�õ����и�ѡ��
		for(var i=0; i<objs.length; i++) {//����������и�ѡ������,��ÿ����ѡ����в���
			if(objs[i].type.toLowerCase() == "checkbox" )
				objs[i].checked =event.srcElement.checked;//�������Ϊ�� checkbox��,��Ըø�ѡ����й�ѡ
		}
	}	

</script>
<script language="javascript">
  	function test(){
		var report = document.getElementById("report1");
		var input = document.getElementsByTagName("input")
		for (var i = 0 ; i <input.length ; i++) {
			if (input[i].checked) {
				var row = report.rows[i+4];
				var cell = row.cells[1];
				report.currCell = cell;
				_deleteRow(report);
			}
		}
 	}

  //��ȡ��ѡ��ǰ�ߵ�״ֵ̬
	function selZt(){
	 var values="";
	 var objs = report1.getElementsByTagName("input");//��ȡҳ���ϵ�input
	 for(var i=0; i<objs.length; i++) {//ѭ��������ȡ����input
		 if(objs[i].type.toLowerCase() == "checkbox" && objs[i].checked==true){//�ж�input�������Ǹ�ѡ�򣬲����Ѿ���ѡ��
			var cellId = objs[i].parentNode.id;//��ȡ��ѡ�����ڵ�Ԫ���id
            var newCellId = cellId.replace("G","F");//������ΪҪ��ȡJ�е�����
                values = values+" "+newCellId;
		}    
	 }
	  //alert(values);//����ȡ����ֵalert����
		return {values:values};

	}


//У�麯��
function checked(){




	var a=document.getElementById("report1_B8").attributes.value.value;//��ֻ�ǻ�ȡB8�ĵ�Ԫ���ֵ
		//alert(a);
	var id=document.getElementById("report1_B8").getAttribute("id");  //��ȡB8�ĵ�Ԫ���idֵ
	//alert(id);
	var b=parseInt(id.substr(a.length-1,1));  //��ȡB8��Ԫ���idֵ"report1_B"
	//alert(b);
	var length=document.getElementById("report1_G7").attributes.value.value; //��ȡB8���ж���������
	//alert(length);
	var arrm=[];
	var arrn=[];

	for (var i=0;i< length;i++ )
	{
		var s=id.substr(0,a.length-1)+(b+i).toString(); //��ȡB�е�idֵ
		var c=s.replace('B','C');
		//alert(c);
		var m = document.getElementById(s).attributes.value.value;//��ȡB�е�value
		var n = document.getElementById(c).attributes.value.value;//��ȡC�е�value
        
		//alert(s);
		//alert(m);
		// alert(n);
         arrm+=m+" ";
		 arrn+=n+" ";
		
	}

//alert(arrm),alert(arrn);
  return     arrm,arrn;
     

	

	

     
}

 


</script>
</body>
</html>
