	function betweenTable() {
		if(isCheckAll){
			alert("表间-校验所有");
			tableName = allReports;
		}else{
			alert("表间-校验当前表")
			var rq = document.getElementsByClassName("rq_curr");
			tableName = rq[0].id.replace("tab_","");
		}
        //var parameter = $("table table table:eq(1) tr td:eq(0)").html();
		//alert(parameter)
		//var parameterArr = parameter.split("^");
		var parameterArr = [tableName,'2019','1'];
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
            url:"CheckBetweenTableServlet",
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
					//左id
                    var leftIdPrefix = data[i].idPrefix.split("^");
					//右id
					var rightIdPrefix = data[i].idPrefix1.split("^");
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
							if(leftIdPrefix.length != firstArr.length || rightIdPrefix.length != secondArr.length){
								alert("表间校验自定义id与校验单元格不匹配");
								return;
							}
                            //前边几行求和   A+B = C+D
                            for(var k = 0;k<firstArr.length;k++){
                                if($("#"+leftIdPrefix[k]+"_"+ firstArr[k]+j)){
                                    firstVal += parseInt($("#"+leftIdPrefix[k]+"_"+ firstArr[k]+j).html()==""?0:$("#"+leftIdPrefix[k]+"_"+ firstArr[k]+j).html());
                                }else{
                                    alert("数据库配置的校验规则中单元格在当前报表中不存在，请检查校验规则指定的单元格是否正确");
                                    return;
                                }
                            }
                            for(var k = 0;k<secondArr.length;k++){
                                if($("#"+rightIdPrefix[k]+"_"+ secondArr[k]+j)){
                                    secondVal += parseInt($("#"+rightIdPrefix[k]+"_"+ secondArr[k]+j).html()==""?0:$("#"+rightIdPrefix[k]+"_"+ secondArr[k]+j).html());
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
                                    $("#"+leftIdPrefix[k]+"_"+ firstArr[k]+j).css("background-color","red")
                                }
                                for(var k = 0;k<secondArr.length;k++){
                                    $("#"+rightIdPrefix[k]+"_"+ secondArr[k]+j).css("background-color","red")
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
                                var total = continuitySum(firstArr[k],leftIdPrefix[k]);
                                if(total=="error"){
                                    alert("数据库配置的校验规则中单元格在当前报表中不存在，请检查校验规则指定的单元格是否正确");
                                    return;
                                }else{
                                    firstVal += parseInt(total);
                                }
                            }else{
                                if($("#"+leftIdPrefix[k]+"_"+ firstArr[k])){
                                    firstVal += parseInt($("#"+leftIdPrefix[k]+"_"+ firstArr[k]).html()==""?0:$("#"+leftIdPrefix[k]+"_"+ firstArr[k]).html());
                                }else{
                                    alert("数据库配置的校验规则中单元格在当前报表中不存在，请检查校验规则指定的单元格是否正确");
                                    return;
                                }
                            }
                        }
                        for(var k = 0;k<secondArr.length;k++){
                            if(secondArr[k].indexOf("~")>0){
                                var total = continuitySum(secondArr[k],rightIdPrefix[k]);
                                if(total=="error"){
                                    alert("数据库配置的校验规则中单元格在当前报表中不存在，请检查校验规则指定的单元格是否正确");
                                    return;
                                }else{
                                    secondVal += parseInt(total);
                                }
                            }else{
                                if($("#"+rightIdPrefix[k]+"_"+ secondArr[k])){
                                    secondVal += parseInt($("#"+rightIdPrefix[k]+"_"+ secondArr[k]).html()==""?0:$("#"+rightIdPrefix[k]+"_"+ secondArr[k]).html());
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
                                    addClassSum(firstArr[k],leftIdPrefix[k]);
                                }else{
                                    $("#"+leftIdPrefix[k]+"_"+ firstArr[k]).css("background-color","red")
                                }
                            }
                            for(var k = 0;k<secondArr.length;k++){
                                if(secondArr[k].indexOf("~")>0){
                                    addClassSum(secondArr[k],rightIdPrefix[k]);
                                }else{
                                    $("#"+rightIdPrefix[k]+"_"+ secondArr[k]).css("background-color","red")
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