	function betweenTable() {
		if(isCheckAll){
			alert("���-У������");
			tableName = allReports;
		}else{
			alert("���-У�鵱ǰ��")
			var rq = document.getElementsByClassName("rq_curr");
			tableName = rq[0].id.replace("tab_","");
		}
        //var parameter = $("table table table:eq(1) tr td:eq(0)").html();
		//alert(parameter)
		//var parameterArr = parameter.split("^");
		var parameterArr = [tableName,'2019','1'];
		if(parameterArr.length<3){
			alert("У�������ȫ�����鱨���Ƿ�����������������汾�š������û�Ȩ�ޡ�");
			return;
		}
		var tableName = parameterArr[0];
		var version = parameterArr[1];
		var userRole = parameterArr[2];
        //�ٴ�����ʱ������쳣�Ŀ�
		$("#rpt td").css("background-color","transparent")
        $.ajax({
            type:"post",
            url:"CheckBetweenTableServlet",
            data:{"tableName":tableName,"version":version,"userRole":userRole},
            success:function(data) {
				if(data.length==0){
					alert("���ݿ���û�иñ��У�����");
					return;
				}
                for(var i=0;i<data.length;i++){
                    var first = data[i].first;
                    var second = data[i].second;
                    var third = data[i].third;
                    var logicalOperator = data[i].logicalOperator;
                    var commonOperator = data[i].commonOperator;
					//��id
                    var leftIdPrefix = data[i].idPrefix.split("^");
					//��id
					var rightIdPrefix = data[i].idPrefix1.split("^");
                    var errorMes = data[i].errorMes;
                    var checkTimes = data[i].checkTimes;
                    //У����ʼ�к�
                    var startLine = parseInt(data[i].startLine);
                    //У������к�
                    var endLine = parseInt(data[i].endLine);
					//��ͷռ������
					var headerRowNum = parseInt(data[i].headerRowNum);
                    //�����ִ�ж�ε����
                    if(checkTimes!=1){
                        //������ʼ�кźͽ����к�
                        for(var j = startLine;j<=endLine;j++){
                            var firstArr = first.split('^');
                            var secondArr = second.split('^');
                            var firstVal = 0;
                            var secondVal = 0;
							if(leftIdPrefix.length != firstArr.length || rightIdPrefix.length != secondArr.length){
								alert("���У���Զ���id��У�鵥Ԫ��ƥ��");
								return;
							}
                            //ǰ�߼������   A+B = C+D
                            for(var k = 0;k<firstArr.length;k++){
                                if($("#"+leftIdPrefix[k]+"_"+ firstArr[k]+j)){
                                    firstVal += parseInt($("#"+leftIdPrefix[k]+"_"+ firstArr[k]+j).html()==""?0:$("#"+leftIdPrefix[k]+"_"+ firstArr[k]+j).html());
                                }else{
                                    alert("���ݿ����õ�У������е�Ԫ���ڵ�ǰ�����в����ڣ�����У�����ָ���ĵ�Ԫ���Ƿ���ȷ");
                                    return;
                                }
                            }
                            for(var k = 0;k<secondArr.length;k++){
                                if($("#"+rightIdPrefix[k]+"_"+ secondArr[k]+j)){
                                    secondVal += parseInt($("#"+rightIdPrefix[k]+"_"+ secondArr[k]+j).html()==""?0:$("#"+rightIdPrefix[k]+"_"+ secondArr[k]+j).html());
                                }else{
                                    alert("���ݿ����õ�У������е�Ԫ���ڵ�ǰ�����в����ڣ�����У�����ָ���ĵ�Ԫ���Ƿ���ȷ");
                                    return;
                                }
                            }
                            if(eval(firstVal+logicalOperator+secondVal)){

                            }else{
								//��ʾY���кż�ȥ��ͷռ���к�
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
                        //ǰ�߼������   A1+B1 = C1+D1
                        for(var k = 0;k<firstArr.length;k++){
                            //���ڲ����ߵ����
                            if(firstArr[k].indexOf("~")>0){
                                var total = continuitySum(firstArr[k],leftIdPrefix[k]);
                                if(total=="error"){
                                    alert("���ݿ����õ�У������е�Ԫ���ڵ�ǰ�����в����ڣ�����У�����ָ���ĵ�Ԫ���Ƿ���ȷ");
                                    return;
                                }else{
                                    firstVal += parseInt(total);
                                }
                            }else{
                                if($("#"+leftIdPrefix[k]+"_"+ firstArr[k])){
                                    firstVal += parseInt($("#"+leftIdPrefix[k]+"_"+ firstArr[k]).html()==""?0:$("#"+leftIdPrefix[k]+"_"+ firstArr[k]).html());
                                }else{
                                    alert("���ݿ����õ�У������е�Ԫ���ڵ�ǰ�����в����ڣ�����У�����ָ���ĵ�Ԫ���Ƿ���ȷ");
                                    return;
                                }
                            }
                        }
                        for(var k = 0;k<secondArr.length;k++){
                            if(secondArr[k].indexOf("~")>0){
                                var total = continuitySum(secondArr[k],rightIdPrefix[k]);
                                if(total=="error"){
                                    alert("���ݿ����õ�У������е�Ԫ���ڵ�ǰ�����в����ڣ�����У�����ָ���ĵ�Ԫ���Ƿ���ȷ");
                                    return;
                                }else{
                                    secondVal += parseInt(total);
                                }
                            }else{
                                if($("#"+rightIdPrefix[k]+"_"+ secondArr[k])){
                                    secondVal += parseInt($("#"+rightIdPrefix[k]+"_"+ secondArr[k]).html()==""?0:$("#"+rightIdPrefix[k]+"_"+ secondArr[k]).html());
                                }else{
                                    alert("���ݿ����õ�У������е�Ԫ���ڵ�ǰ�����в����ڣ�����У�����ָ���ĵ�Ԫ���Ƿ���ȷ");
                                    return;
                                }
                            }
                        }
                        //��������Ϊ�յ��򱨱�Ϊ��У��
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
				alert("У��ͨ��");
            },
            error:function(data,status){
                alert("������ִ�������ϵ����Ա��");
            }
        });
    }
  //����������ڲ����� ������͵���������
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
            alert("���ݿ����õ�У������е�Ԫ���ڵ�ǰ�����в����ڣ�����У�����ָ���ĵ�Ԫ���Ƿ���ȷ");
            return "error";
        }
    }
    return total;
  }
  //�������ߵĵ�Ԫ��������ɫ
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