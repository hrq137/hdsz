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
<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
<script type="text/javascript" src="js/layer-v2.1/layer/layer.js"></script>
<script type="text/javascript" src="js/betweenTable.js"></script>
<script type="text/javascript" src="js/inTable.js"></script>
<script type="text/javascript" src="js/outAllTable.js"></script>

<link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
<script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="//apps.bdimg.com/libs/jqueryui/1.10.4/css/jquery-ui.min.css">
<script src="//apps.bdimg.com/libs/jqueryui/1.10.4/jquery-ui.min.js"></script>
<link href="https://cdn.bootcss.com/toastr.js/latest/css/toastr.css" rel="stylesheet">
<script src="https://cdn.bootcss.com/toastr.js/latest/js/toastr.min.js"></script>
  
  
<style>
	#ljwz table label a span {
		margin-left: 30px;
	}
</style>
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
	String userID = request.getParameter("userID");   //�޸ĵ�һ��
	String tab = request.getParameter("tab");  //�¼�һ��tab����
	String dept = request.getParameter("dept");
	String endDate = request.getParameter("endDate"); 
	String rybm = request.getParameter("rybm"); 
	String reportFileHome=Context.getInitCtx().getMainDir();
	StringBuffer param=new StringBuffer();                                                                     //�޸ĵڶ���
	String url1 = "reportJsp/showReportGroup_fr.jsp?rpg=/ganBuTongJi/ganBuTongJi_zx/zxGroup.rpg&tjDate="+tjDate+"&userID="+userID+"&tab="+tab+"&dept="+dept+"&endDate="+endDate+"&rybm="+rybm;
	
	

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
			//String paramName = (String) paramNames.nextElement();
			//String paramValue=request.getParameter(paramName);
			String paramName  = new String(((String) paramNames.nextElement()).getBytes("iso-8859-1"), "GBK"); 
            String paramValue = new String(request.getParameter(paramName).getBytes("iso-8859-1"), "GBK"); 
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
<td><button onclick="save()" class="tbBtn">����</button></td>


<td><button onclick="window.history.back()" class="tbBtn">����</button></td>
<td><button class="tbBtn" onclick="betweenTable()">����У��</button></td>
<td><button class="tbBtn" onclick="inTable()">����У��</button></td>
<td><button id='open' data-toggle="" data-target="#myModal" class="tbBtn" onclick="checkAll()">����</button></td>
<td><button  class="tbBtn" onclick="homePage()">��ҳ</button></td>


<td> <p id="s1"   style="color:red;font-size:17px;font-weight:400"> </p> </td>
<td> <p id="s2"   style="color:red;font-size:17px;font-weight:400"> </p> </td>
<td> <p id="s3"   style="color:#00ff00;font-size:17px;font-weight:400"> </p> </td>
<!--�޸ĵ�һ��-->
<div id=mengban style="background-color:white;position:absolute;z-index:999;width:100%;height:100% ;display:none">
	<table width=100% height=100%>
		<tr><td width=100% style="text-align:center;vertical-align:middle">�����ύ�У����Ժ�......</td></tr>
	</table>
</div>

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

<div class="modal fade bs-example-modal-lg" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" data-backdrop="static" data-keyboard="false">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true" onclick="closes()">
					&times;
				</button>
				<h4 class="modal-title" id="myModalLabel">
					У�������ʾ
				</h4>
			</div>
			<table class="table table-responsive-sm table-bordered table-striped" id ='mytable'>
			  <tr>
				<th>���</th>
				<th>������ʾ</th>
			  </tr>
			</table>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" onclick="loadings()">����
				<button type="button" class="btn btn-default" data-dismiss="modal" onclick="closes()">ȡ��
				</button>
				<button type="button" class="btn btn-primary">
					ȷ��
				</button>
			</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal -->
</div>
<script language="javascript">
	var allReports = "<%=tab%>";
	var loadingSum = 10;
	//�������б���
	var tab = $('#rq_tabs').html();
	//�޸���ʽ
	tab = insert_flg(tab," style='margin-left: -255px;margin-top: 25px;'",8);
	tab = "<div>"+
	"<a href='#' id='allReport' value='2' onclick='allReport(this)'>" +
	"<span title='���б���' style='cursor:pointer;width:250px;' >���б���</span>"+
	"</a></div>"+tab;
	$("#rq_tabs").html(tab);
	var isCheckAll = false;//�Ƿ����б���
	//������б���������ʽ
	function allReport(obj){
		var value = $(obj).attr('value');
		var ts = $("#"+obj.getAttribute("id")).children("span").prop("style").color;
		isCheckAll = ts == '';
		//1�죬2��
		if(value == 1){
			$(obj).attr("value","2");
			$("#"+obj.getAttribute("id")).children("span").css("color","");
		}else if(value == 2){
			$(obj).attr("value","1");
			$("#"+obj.getAttribute("id")).children("span").css("color","red");
		}
		console.log(isCheckAll);
	};
	//У������
	function checkAll(){
		outAllTable();
		allError();
	}
	
	//����˵����str��ʾԭ�ַ���������flg��ʾҪ������ַ�����sn��ʾҪ�����λ��
	function insert_flg(str,flg,sn){
		var leftStr = str.substring(0,sn);
		var rightStr = str.substring(sn);
		return leftStr+flg+rightStr;
	}
	//����ֱ�����
	function save() {
		var tab = "<%=tab%>";  //��ȡ�������ı���
		var data = tab.split(',');//��ȡ���ı���Ϊһ���ַ�����,���ַ�����ָ�ת��Ϊ����
		var length=data.length;//��ȡ����ĳ���,Ҳ���ǽ��յ��ı���һ���ж��ٸ�
		//var cell1 = document.getElementById(data[length-1]+"_E1").attributes.value.value; //data[length-1]���һ��tab����
		//�������һ�����ܣ�����У�鲻ͨ��������£�������ʾ�������û�У�鲻ͨ���Ƿ�Ҫ������������
		if(group_submit_my()==true){
		 //group_submit_my();
		}else{
			//���水ť��У��,���У��ͨ��,�Ͳ������ݼ����е�ҳ��,���ͨ��,�����Ǹ������е�ҳ��
			layer.confirm('У�鲻ͨ����ȷ��Ҫ�ύ������?', {
				icon: 3, title:'��ʾ',
				yes: function(index){
					//do something
					group_submit(false);
				},
				cancel: function(index, layero){ 
				layer.close(index);
				//reload();// ����������ˢ�´���
			   }  
			});
		}
	}
	var tab = "<%=tab%>";  //��ȡ�������ı���
	//console.log("str"+tab);
	var data = tab.split(',');//��ȡ���ı���Ϊһ���ַ�����,���ַ�����ָ�ת��Ϊ����
	var length=data.length;//��ȡ����ĳ���,Ҳ���ǽ��յ��ı���һ���ж��ٸ�
	var cell1 = document.getElementById(data[length-1]+"_E1").attributes.value.value; //data[length-1]���һ��tab����
	if(cell1 == '5'){
		$("#s1").html(">>�ѱ��棬���鵵��");
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
		}else if (dept=='2'){//�ַ���'2'����·��
		  //·�ֵ�У��  
		  //alert('·��'+dept);
		  if(lj){
			return true;  //���У��ͨ���Ͳ�����
		  }else{
			return false;  //���У�鲻ͨ��������У��
		  }
		}
	}
 
	//�Զ������У�鷽��
	function check(a1,a2){ 
		// a1 ����id ��a2 �����
		//alert(a1+":"+a2);
		var str = a1.split(",");
		var arr = [];//��������
		for (var i = 0;i<str.length ; i++){
			arr[i] = document.getElementById( str[i] ).getAttribute("value");  //��ȡ��Ԫ���value
			if (isNaN(arr[i]) || arr[i].replace(/\s/g,"") == "")  return false;//����зǷ���ֵ���ͣ�����false
		}
		//alert(arr);
		var sum = arr[0]+"==";     //��һ��value ==
		for(var i =1 ;i<arr.length;i++){
			sum+=a2.substring(i-1,i); //i=1   sum='3=='+'='                   // i=2   sum='3===1'+'+'  sum='3===1+'
			sum+=arr[i];             // i=1   sum='3==='+1-->sum='3===1'     //i=2     sum='3===1+' + 2   --> sum = '3===1+2'
		}
		//alert(sum);
		var s = eval(sum);  //�жϼ������ʽ����Ƿ�Ϊtrue,������
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
	//�ص���ҳ�ķ���
	function homePage(){
		var rybm="<%=rybm%>";
		var dept="<%=dept%>";
		window.location.href = "/report/reportJsp/showReportShlb.jsp?raq=/ganBuTongJi/ganBuTongJi_tb/shlb_one_roadbureau.raq&dept="+dept+"&rybm="+rybm;
		 //var index = layer.load();
	}
	
	//����������Ϣ
	function allError(){
		//allErrorMsg = [{"errorMes":"qwer"}]
		//alert("s-->"+allErrorMsg.length);
		var myDiv =document.getElementById("mytable");
		var data = allErrorMsg.slice(0,loadingSum);
		if(data.length >0){
			for(var i=0; i < data.length; i++) {
				var tr = "<tr><td>"+(i+1)+"</td><td>"+data[i].errorMes+"</td></tr>"
				myDiv.innerHTML+=tr;
			}
			opens();
		}else{
			alert("У��ͨ��");
		}
	}
	//��
	function opens(){
		var shopping = document.getElementById("open");
		shopping.setAttribute("data-toggle","modal");
	}
	//�ر�
	function closes(){
		var myDiv =document.getElementById("mytable");
		myDiv.innerHTML='<tr><th>���</th><th>������ʾ</th></tr>';
		var shopping = document.getElementById("open");
		shopping.setAttribute("data-toggle","");
		allErrorMsg = [];
		loadingSum = 10;
	}
	//������࣬����  10��
	function loadings(){
		if(allErrorMsg.length-loadingSum<0){
			toastr.warning('û�и��������ˣ�');
			return;
		}
		var myDiv =document.getElementById("mytable");
		myDiv.innerHTML='<tr><th>���</th><th>������ʾ</th></tr>';
		loadingSum +=10;
		allError();
	}
</script>




</body>
</html>