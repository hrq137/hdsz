 //表内校验方法  孙旭阳
 function checkRule() {
        var parameter = $("#report1 tr td:eq(0)").html();
		var parameterArr = parameter.split("^");
		if(parameterArr.length<3){
			alert("校验参数不全，请检查报表是否包含“表名”，“版本号”，“用户权限”");
			return;
		}
		var tableName = parameterArr[0];
		var version = parameterArr[1];
		var userRole = parameterArr[2];
        //再次请求时先清空异常的框
		$("#rpt td").css("background-color","transparent")
        $.ajax({
            type:"post",
            url:"dataVerification",
            data:{"tableName":tableName,"version":version,"userRole":userRole},
            success:function(data) {
				if(data.length==0){
					alert("数据库中没有该表的校验规则");
					return;
				}
                for(var i=0;i<data.length;i++){
                    var first = data[i].first;
                    var second = data[i].second;
                    var third = data[i].third;
                    var logicalOperator = data[i].logicalOperator;
                    var commonOperator = data[i].commonOperator;
                    var idPrefix = data[i].idPrefix;
                    var errorMes = data[i].errorMes;
                    var checkTimes = data[i].checkTimes;
                    //校验起始行号
                    var startLine = parseInt(data[i].startLine);
                    //校验结束行号
                    var endLine = parseInt(data[i].endLine);
					//表头占用行数
					var headerRowNum = parseInt(data[i].headerRowNum);
                    //如果是执行多次的情况
                    if(checkTimes!=1){
                        //遍历起始行号和结束行号
                        for(var j = startLine;j<=endLine;j++){
                            var firstArr = first.split('^');
                            var secondArr = second.split('^');
                            var firstVal = 0;
                            var secondVal = 0;
                            //前边几行求和   A+B = C+D
                            for(var k = 0;k<firstArr.length;k++){
                                if($("#"+idPrefix+"_"+ firstArr[k]+j)){
                                    firstVal += parseInt($("#"+idPrefix+"_"+ firstArr[k]+j).html()==""?0:$("#"+idPrefix+"_"+ firstArr[k]+j).html());
                                }else{
                                    alert("数据库配置的校验规则中单元格在当前报表中不存在，请检查校验规则指定的单元格是否正确");
                                    return;
                                }
                            }
                            for(var k = 0;k<secondArr.length;k++){
                                if($("#"+idPrefix+"_"+ secondArr[k]+j)){
                                    secondVal += parseInt($("#"+idPrefix+"_"+ secondArr[k]+j).html()==""?0:$("#"+idPrefix+"_"+ secondArr[k]+j).html());
                                }else{
                                    alert("数据库配置的校验规则中单元格在当前报表中不存在，请检查校验规则指定的单元格是否正确");
                                    return;
                                }
                            }
                            if(eval(firstVal+logicalOperator+secondVal)){

                            }else{
								//提示Y的行号减去表头占用行号
                                errorMes = errorMes.replace(/\^/g,j-headerRowNum);
                                alert(errorMes);
                                for(var k = 0;k<firstArr.length;k++){
                                    $("#"+idPrefix+"_"+ firstArr[k]+j).css("background-color","red")
                                }
                                for(var k = 0;k<secondArr.length;k++){
                                    $("#"+idPrefix+"_"+ secondArr[k]+j).css("background-color","red")
                                }
                                return;
                            }
                        }
                    }else{
                        var firstArr = first.split('^');
                        var secondArr = second.split('^');
                        var firstVal = 0;
                        var secondVal = 0;
                        //前边几行求和   A1+B1 = C1+D1
                        for(var k = 0;k<firstArr.length;k++){
                            //存在波浪线的情况
                            if(firstArr[k].indexOf("~")>0){
                                var total = continuitySum(firstArr[k],idPrefix);
                                if(total=="error"){
                                    alert("数据库配置的校验规则中单元格在当前报表中不存在，请检查校验规则指定的单元格是否正确");
                                    return;
                                }else{
                                    firstVal += parseInt(total);
                                }
                            }else{
                                if($("#"+idPrefix+"_"+ firstArr[k])){
                                    firstVal += parseInt($("#"+idPrefix+"_"+ firstArr[k]).html()==""?0:$("#"+idPrefix+"_"+ firstArr[k]).html());
                                }else{
                                    alert("数据库配置的校验规则中单元格在当前报表中不存在，请检查校验规则指定的单元格是否正确");
                                    return;
                                }
                            }
                        }
                        for(var k = 0;k<secondArr.length;k++){
                            if(secondArr[k].indexOf("~")>0){
                                var total = continuitySum(secondArr[k],idPrefix);
                                if(total=="error"){
                                    alert("数据库配置的校验规则中单元格在当前报表中不存在，请检查校验规则指定的单元格是否正确");
                                    return;
                                }else{
                                    secondVal += parseInt(total);
                                }
                            }else{
                                if($("#"+idPrefix+"_"+ secondArr[k])){
                                    secondVal += parseInt($("#"+idPrefix+"_"+ secondArr[k]).html()==""?0:$("#"+idPrefix+"_"+ secondArr[k]).html());
                                }else{
                                    alert("数据库配置的校验规则中单元格在当前报表中不存在，请检查校验规则指定的单元格是否正确");
                                    return;
                                }
                            }
                        }
                        //如果运算符为空的则报表为简单校验
                        if(eval(firstVal+logicalOperator+secondVal)){

                        }else{
                            alert(errorMes);
                            for(var k = 0;k<firstArr.length;k++){
                                if(firstArr[k].indexOf("~")>0){
                                    addClassSum(firstArr[k],idPrefix);
                                }else{
                                    $("#"+idPrefix+"_"+ firstArr[k]).css("background-color","red")
                                }
                            }
                            for(var k = 0;k<secondArr.length;k++){
                                if(secondArr[k].indexOf("~")>0){
                                    addClassSum(secondArr[k],idPrefix);
                                }else{
                                    $("#"+idPrefix+"_"+ secondArr[k]).css("background-color","red")
                                }
                            }
                            return;
                        }
                    }
                }
				alert("校验通过");
            },
            error:function(data,status){
                alert("请求出现错误，请联系管理员！");
            }
        });
    }
  //解析如果存在波浪线 连续求和的情况的情况
  function continuitySum(val,idPrefix){
	var total = 0;
    var colArr = val.split("~") ;
    var start = parseInt(colArr[0].replace(/[^0-9]/ig,""));
    var colName = colArr[0].replace(start,"");
    var end = parseInt(colArr[1].replace(/[^0-9]/ig,""));
    for(var i = start; i<=end;i++){
        if($("#"+idPrefix+"_"+ colName + i)){
            total += parseInt($("#"+idPrefix+"_"+ colName+i).html()==""?0:$("#"+idPrefix+"_"+ colName + i).html());
        }else{
            alert("数据库配置的校验规则中单元格在当前报表中不存在，请检查校验规则指定的单元格是否正确");
            return "error";
        }
    }
    return total;
  }
  //给波浪线的单元格设置颜色
  function addClassSum(val,idPrefix){
	var total = 0;
    var colArr = val.split("~") ;
    var start = parseInt(colArr[0].replace(/[^0-9]/ig,""));
    var colName = colArr[0].replace(start,"");
    var end = parseInt(colArr[1].replace(/[^0-9]/ig,""));
    for(var i = start; i<=end;i++){
        $("#"+idPrefix+"_"+ colName+i).css("background-color","red")
    }
  }
  
  
  
  
  
  
  

//自定义校验函数 专为路局，站段定义的方法  孙艳婷
  function checkRs(dept,station,sta_ope,roadbureau,roa_ope){ 
  
  
  
  //dept参数为接收站段或者路局的参数，
  //station和sta_ope 为接收站段校验，第一个是单元格值，第二个是运算符
  //roadbureau和roa_ope 为接收路局校验，第一个是单元格值，第二个是运算符
    var zd =check(station,sta_ope); 
    var lj =check(roadbureau,roa_ope);
    if (dept=='1'){//字符串'1'代表站段
      //站段的校验   
      //alert('站段'+dept);
      if(zd){
        return true; //如果校验通过就不提醒
      }else{
        return false; //如果校验不通过就提醒校验
      }
    }
    else if (dept=='2'){//字符串'2'代表路局
      //路局的校验  
      //alert('路局'+dept);
      if(lj){
        
        return true;  //如果校验通过就不提醒
      }else{
        return false;  //如果校验不通过就提醒校验
      }
    }
  }
  
  
  //自定义表间校验方法  何润庆
function check(a1,a2){ 
	// a1 数据id ，a2 运算符
	var str = a1.split(",");
	var arr = [];//数据数组
	for (var i = 0;i<str.length ; i++)  //循环遍历传递进来的str
	{
		arr[i] = document.getElementById( str[i] ).getAttribute("value");  //获取单元格的value
		if (isNaN(arr[i]) || arr[i].replace(/\s/g,"") == "")     //如果有非法数值类型，返回false
		{
			return false;
		}
	}
	//alert(arr);
	var sum = arr[0]+"==";     //第一个value ==
	for(var i =1 ;i<arr.length;i++){
		sum+=a2.substring(i-1,i); //i=1   sum='3=='+'='                   // i=2   sum='3===1'+'+'  sum='3===1+'
		sum+=arr[i];             // i=1   sum='3==='+1-->sum='3===1'     //i=2     sum='3===1+' + 2   --> sum = '3===1+2'
	}
	//alert(sum);
	var s = eval(sum);  //判断计算表达式结果是否为true,并返回
	return s;
}