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


<script type="text/javascript">
	//����JS
	function tanKuang(){
	
		//alert("����");
		window.open ('showReport1.jsp?raq=/ganBuTongJi/ganBuTongJi_tbzq/detailTable.raq', 'newwindow', 'height=300, width=800, top=200, left=100, toolbar=no, menubar=no, scrollbars=no, resizable=no,location=n o, status=no'); 
	
	};
</script>
<body topmargin=0 leftmargin=0 rightmargin=0 bottomMargin=0>
<%
	request.setCharacterEncoding( "GBK" );
	String report = request.getParameter( "rpg" );
	String tjDate = request.getParameter("tjDate");
	String endDate = request.getParameter("endDate");
	String startDate = request.getParameter("startDate");
	String userID = request.getParameter("userID");
	String tab = request.getParameter("tab");  //�¼�һ��tab����
	
	String dept = request.getParameter("dept");
	
	String reportFileHome=Context.getInitCtx().getMainDir();
	StringBuffer param=new StringBuffer();
	String url1 = "reportJsp/showReportGrouptb.jsp?rpg=/ganBuTongJi/ganBuTongJi_zx/zxGroup.rpg&tjDate="+tjDate+"&userID="+userID+"&tab="+tab+"&dept="+dept+"&endDate="+endDate;
	

	 //����
	
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
	
	//����

	
	//��֤�������Ƶ�������
	int iTmp = 0;
	if( (iTmp = report.lastIndexOf(".rpg")) <= 0 ){
		report = report + ".rpg";
		iTmp = 0;
	}
	//�ж��Ƿ���Ҫ�
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

<!--<td><button onclick="window.history.back()" class="tbBtn">����</button></td>-->	

<td> <p id="s1"   style="color:red;font-size:17px;font-weight:400"> </p> </td>
<td> <p id="s2"   style="color:red;font-size:17px;font-weight:400"> </p> </td>
<td> <p id="s3"   style="color:#00ff00;font-size:17px;font-weight:400"> </p> </td>

<table id=rpt align=center><tr><td>
<%	//�������ģ����ڣ�����ʾ����ģ��
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
  

    var tab = "<%=tab%>";  //��ȡ�������ı���
		//console.log("str"+tab);
		var data = tab.split(',');//��ȡ���ı���Ϊһ���ַ�����,���ַ�����ָ�ת��Ϊ����
		var length=data.length;//��ȡ����ĳ���,Ҳ���ǽ��յ��ı���һ���ж��ٸ�
	
 	    var cell1 = document.getElementById(data[length-1]+"_E1").attributes.value.value; //data[length-1]���һ��tab����
              
  
  if(cell1 == '9'){
	$("#s3").html(">>�ѹ鵵��");
  }else if(cell1 == '3'){
	$("#s2").html(">>�Ѳ��أ�");
  }else if(cell1=='0'){
	 $("#s3").html(">>���ͨ����");
  }
 
 //�Զ���У�麯�� רΪ·�֣�վ�ζ���ķ���   22222222222222222222222222222
  function checkRs(dept,station,sta_ope,roadbureau,roa_ope){ 
  dept = <%=dept%>
  //alert(dept);
  //dept����Ϊ����վ�λ���·�ֵĲ�����
  //station��sta_ope Ϊ����վ��У�飬��һ���ǵ�Ԫ��ֵ���ڶ����������
  //roadbureau��roa_ope Ϊ����·��У�飬��һ���ǵ�Ԫ��ֵ���ڶ����������
    var zd =check("d35b_G9,d35b_H9,d35b_I9,d35b_J9","=++"); 
    var lj =check("d35b_G9,d35b_H9,d35b_I9","=+");
	//alert(zd+":"+lj);
    if (dept=='1'){//�ַ���'1'����վ��
      //վ�ε�У��   
      //alert('վ��'+dept);
      if(zd){
        return true; //���У��ͨ���Ͳ�����
      }else{
        return false; //���У�鲻ͨ��������У��
      }
    }
    else if (dept=='2'){//�ַ���'2'����·��
      //·�ֵ�У��  
      //alert('·��'+dept);
      if(lj){
        
        return true;  //���У��ͨ���Ͳ�����
      }else{
        return false;  //���У�鲻ͨ��������У��
      }
    }
  }
 
//�Զ�����У�鷽��
function check(a1,a2){ 
	// a1 ����id ��a2 �����
	//alert(a1+":"+a2);
	var str = a1.split(",");
	var arr = [];//��������
	for (var i = 0;i<str.length ; i++)  //ѭ���������ݽ�����str
	{
		arr[i] = document.getElementById( str[i] ).getAttribute("value");  //��ȡ��Ԫ���value
		if (isNaN(arr[i]) || arr[i].replace(/\s/g,"") == "")     //����зǷ���ֵ���ͣ�����false
		{
			return false;
		}
	}
	//alert(arr);
	var sum = arr[0]+"==";     //��һ��value ==
	for(var i =1 ;i<arr.length;i++){
		sum+=a2.substring(i-1,i); //i=1   sum='3=='+'='                   // i=2   sum='3===1'+'+'  sum='3===1+'
		sum+=arr[i];             // i=1   sum='3==='+1-->sum='3===1'     //i=2     sum='3===1+' + 2   --> sum = '3===1+2'
	}
	//alert(sum);
	var s = eval(sum);  //�жϼ�����ʽ����Ƿ�Ϊtrue,������
	return s;
}
 
//����ı���ʽ
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
</script>
</body>
</html>
