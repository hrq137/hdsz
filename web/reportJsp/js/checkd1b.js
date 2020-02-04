	function checkSum(param){
		//6、管理人员及专业技术人员等于管理人员、专职专业技术人员之和 ${E9[1]}= ${E9[2]}+ ${E9[160]}
		var gj = document.getElementById('d1b_'+param+'9').innerText-0;//管理人员及专业技术人员等于管理人员
		var gl = document.getElementById('d1b_'+param+'10').innerText-0;//管理人员
		var zj = document.getElementById('d1b_'+param+'168').innerText-0;//专职专业技术人员
		if(gj != gl + zj){
			alert("管理人员及专业技术人员等于管理人员、专职专业技术人员之和");
			return false;
		}
		//7、管理人员等于各级别之和 ${E9[2]}=${E9[3]}+${E9[4]}+${E9[5]}+${E9[6]}+${E9[7]}+${E9[8]}+${E9[9]}
		var gjzh = 0;
		for(var i=11;i<=17;i++){
			gjzh = gjzh + (document.getElementById('d1b_'+param+i).innerText-0); 
		}
		if(gl != gjzh){
			alert("管理人员等于各级别之和");
			return false;
		}
		//8、专业技术人员等于高级、中级、初级之和 ${E9[10]}=${E9[12]}+${E9[14]}+${E9[15]}
		var zyjs = document.getElementById('d1b_'+param+'18').innerText-0;//专业技术人员
		var gjzw = document.getElementById('d1b_'+param+'20').innerText-0;//高级职务
		var zjzw = document.getElementById('d1b_'+param+'22').innerText-0;//中级职务
		var cjzw = document.getElementById('d1b_'+param+'23').innerText-0;//初级职务
		if(zyjs != gjzw + zjzw + cjzw){
			alert("专业技术人员等于高级、中级、初级之和");
			return false;
		}
		//9、专业技术人员等于专业技术人员中从事专业技术管理的、专职专业技术人员之和 ${E9[10]}=${E9[153]}+ ${E9[160]}
		var csjsgl = document.getElementById('d1b_'+param+'161').innerText-0;//专业技术人员中从事专业技术管理的
		if(zyjs != csjsgl + zj){
			alert("专业技术人员等于专业技术人员中从事专业技术管理的、专职专业技术人员之和");
			return false;
		}
		//15、各系列分别等于系列下正高、高级、中级、初级之和？？不确定
		if(common(24,103,4,param)){
			return false;
		}
		if(common(104,107,3,param)){
			return false;
		}
		if(common(108,117,4,param)){
			return false;
		}
		if(common(118,121,3,param)){
			return false;
		}
		if(common(122,146,4,param)){
			return false;
		}
		if(common(147,150,3,param)){
			return false;
		}
		if(common(151,160,4,param)){
			return false;
		}
		//18、工程技术人员正高级等于下面分系列正高级之和 //${E9[17]}=${E9[22]}+${E9[27]}+${E9[32]}+${E9[37]}+${E9[42]}+${E9[47]}+${E9[52]}+${E9[57]}+${E9[62]}+${E9[67]}+${E9[72]}
		if(commonOne(25,80,5,param,"工程技术人员正高级等于下面分系列正高级之和")){
			return;
		}
		//19、工程技术人员高级等于下面分系列高级之和 //${E9[18]}=${E9[23]}+${E9[28]}+${E9[33]}+${E9[38]}+${E9[43]}+${E9[48]}+${E9[53]}+${E9[58]}+${E9[63]}+${E9[68]}+${E9[73]}
		if(commonOne(26,81,5,param,"工程技术人员高级等于下面分系列高级之和")){
			return;
		}	//20、工程技术人员中级等于下面分系列中级之和${E9[19]}=${E9[24]}+${E9[29]}+${E9[34]}+${E9[39]}+${E9[44]}+${E9[49]}+${E9[54]}+${E9[59]}+${E9[64]}+${E9[69]}+${E//9[74]}
		if(commonOne(27,82,5,param,"工程技术人员中级等于下面分系列中级之和")){
			return;
		}//21、工程技术人员初级等于下面分系列初级之和${E9[20]}=${E9[25]}+${E9[30]}+${E9[35]}+${E9[40]}+${E9[45]}+${E9[50]}+${E9[55]}+${E9[60]}+${E9[65]}+${E9[70]}+${E//9[75]}
		if(commonOne(28,83,5,param,"工程技术人员中级等于下面分系列中级之和")){
			return;
		}
			//22、专业技术人员中从事专业技术管理的不小于下面各级别之和 ${E9[153]}>=${E9[154]}+${E9[155]}+${E9[156]}+${E9[157]}+${E9[158]}+${E9[159]}
		var xmgjzh = 0;
		for(var i=162;i<=167;i++){
			xmgjzh = xmgjzh + (document.getElementById('d1b_'+param+i).innerText-0);
		}
		if(csjsgl != xmgjzh){
			alert("专业技术人员中从事专业技术管理的不小于下面各级别之和");
			return true;
		}
		//24、专职专业技术人员高级不小于正高级${E9[161]}>=${E9[162]}&& ${E9[167]}>=${E9[166]}&& ${E9[172]}>=${E9[171]}&& ${E9[177]}>=${E9[176]}&& //${E9[182]}>=${E9[181]}
		//&& ${E9[187]}>=${E9[186]}&& ${E9[192]}>=${E9[191]}&& ${E9[197]}>=${E9[196]}&& ${E9[202]}>=${E9[201]}&& ${E9[207]}>=${E9[206]}&& ${E9[212]}>=${E9[211]}
		//&& ${E9[217]}>=${E9[216]}&& ${E9[222]}>=${E9[221]}
		if(check24(175,230,5,param)){
			alert("专职专业技术人员高级不小于正高级");
			return;
		}
		//25、专职专业技术人员等于下面各系列人员之和${E9[160]}=${E9[165]}+${E9[225]}+${E9[230]}+${E9[235]}+${E9[240]}+${E9[244]}+${E9[249]}+${E9[254]}+${E9[258]}+${E//9[263]}+${E9[268]}
		var value165 = document.getElementById('d1b_'+param+"173").innerText-0;//165的值
		value165 = value165 + commonTwo(233,248,5,param);
		value165 = value165 + commonTwo(252,262,5,param);
		value165 = value165 + commonTwo(266,276,5,param);
		if(zj != value165){
			alert(专职专业技术人员等于下面各系列人员之和);
			return;
		}
		//26、专职专业技术人员高级等于下面各系列高级之和${E9[161]}=${E9[167]}+${E9[227]}+${E9[232]}+${E9[237]}+${E9[241]}+${E9[246]}+${E9[251]}+${E9[255]}+${E9[260]}+${E9[265]}+${E9[269]}
		var value161 = document.getElementById('d1b_'+param+"169").innerText-0;//161的值
		var value167 = document.getElementById('d1b_'+param+"175").innerText-0;//167的值
		value167 = value167 + commonTwo(235,245,5,param);
		value167 = value167 + commonTwo(249,259,5,param);
		value167 = value167 + commonTwo(263,273,5,param);
		value167 = value167 + document.getElementById('d1b_'+param+"277").innerText-0;
		if(value167!=value161){
			alert("专职专业技术人员高级等于下面各系列高级之和");
			return;
		}
		//27、专职专业技术人员中级等于下面各系列中级之和${E9[163]}=${E9[168]}+${E9[228]}+${E9[233]}+${E9[238]}+
		//${E9[242]}+${E9[247]}+${E9[252]}+${E9[256]}+${E9[261]}+${E9[266]}+${E9[270]}
		var value163 = document.getElementById('d1b_'+param+"171").innerText-0;//163的值
		var value168 = document.getElementById('d1b_'+param+"176").innerText-0;//167的值
		value168 = value168 + commonTwo(236,246,5,param);
		value168 = value168 + commonTwo(250,260,5,param);
		value168 = value168 + commonTwo(264,274,5,param);
		value168 = value168 + document.getElementById('d1b_'+param+"278").innerText-0;
		if(value168 != value163){
			alert("专职专业技术人员中级等于下面各系列中级之和");
			return;
		}
		//28、专职专业技术人员初级等于下面各系列初级之和
		//${E9[164]}=${E9[169]}+${E9[229]}+${E9[234]}+${E9[239]}+${E9[243]}+${E9[248]}+${E9[253]}+${E9[257]}+${E9[262]}+
		//${E9[267]}+${E9[271]}
		var value164 = document.getElementById('d1b_'+param+"172").innerText-0;//164的值
		var value169 = document.getElementById('d1b_'+param+"177").innerText-0;//169的值
		value169 = value169 + commonTwo(237,247,5,param);
		value169 = value169 + commonTwo(251,261,5,param);
		value169 = value169 + commonTwo(265,275,5,param);
		value169 = value169 + document.getElementById('d1b_'+param+"279").innerText-0;
		if(value169 != value164){
			alert("专职专业技术人员初级等于下面各系列初级之和");
			return;
		}
		//29、专职专业技术人员各系列分别等于系列下正高、高级、中级、初级之和
		var str = "专职专业技术人员各系列分别等于系列下正高、高级、中级、初级之和";
		if(commonOne(173,177,1,param,str) || commonOne(233,237,1,param,str) ||
		   commonOne(238,242,1,param,str) || commonOne(243,247,1,param,str) ||
		   commonOne(248,251,1,param,str) || commonOne(252,256,1,param,str) || 
		   commonOne(257,261,1,param,str) || commonOne(262,265,1,param,str) ||
		   commonOne(266,270,1,param,str) || commonOne(271,275,1,param,str) ||
		   commonOne(276,279,1,param,str)){
			return;
		}
		//30、专职专业技术人员中的工程技术人员等于下面分系列之和 ${E9[165]}=${E9[170]}+${E9[175]}+${E9[180]}+${E9[185]}+
		//{E9[190]}+${E9[195]}+${E9[200]}+${E9[205]}+${E9[210]}+${E9[215]}+${E9[220]}
		if(commonOne(173,228,5,param,"专职专业技术人员中的工程技术人员等于下面分系列之和")){
			return;
		}
		//31、专职专业技术人员中的工程技术人员分系列等于该系列正高、高级、中级、初级之和
		var str1 = "专职专业技术人员中的工程技术人员分系列等于该系列正高、高级、中级、初级之和";
		if(commonOne(178,182,1,param,str1) || commonOne(183,187,1,param,str1) ||
		   commonOne(188,192,1,param,str1) || commonOne(193,197,1,param,str1) ||
		   commonOne(198,202,1,param,str1) || commonOne(203,207,1,param,str1) ||
		   commonOne(208,212,1,param,str1) || commonOne(213,217,1,param,str1) ||
		   commonOne(218,222,1,param,str1) || commonOne(223,227,1,param,str1) ||
		   commonOne(228,232,1,param,str1)){
			return;
		}
		//32、专职专业技术人员中的工程技术人员正高级等于下面分系列正高级之和
		if(commonOne(174,229,5,param,"专职专业技术人员中的工程技术人员正高级等于下面分系列正高级之和")){
			return;
		}
		//33、专职专业技术人员中的工程技术人员高级等于下面分系列高级之和
		if(commonOne(175,230,5,param,"专职专业技术人员中的工程技术人员高级等于下面分系列高级之和")){
			return;
		}
		//34、专职专业技术人员中的工程技术人员中级等于下面分系列中级之和
		if(commonOne(176,231,5,param,"专职专业技术人员中的工程技术人员中级等于下面分系列中级之和")){
			return;
		}
		//35、专职专业技术人员中的工程技术人员初级等于下面分系列初级之和
		if(commonOne(177,232,5,param,"专职专业技术人员中的工程技术人员初级等于下面分系列初级之和")){
			return;
		}
		return true
	}
	//抽出共有方法 a-->开始数字，b-->结束数字，c-->一共有几位数字相加，param-->哪一列的空格 验证需求15
	function common(a,b,c,param){
		for(var i=a;i<=b;i++){
			var gxlzh = document.getElementById('d1b_'+param+i).innerText-0;
			var sum = 0;
			if(gxlzh != summation(i,c,param)){
				alert("各系列分别等于系列下正高、高级、中级、初级之和");
				return true;
			}
			i=i+c;
		}
		return false;
	}
	//计算求和的方法a-->开始数字，b-->几位数字,c-->哪一列的空格
	function summation(a,b,c){
		var sum = 0;
		for(var i=1;i<=b;i++){
			 sum = sum + (document.getElementById('d1b_'+c+(a+i)).innerText-0);
		}
		return sum;
	}
	//抽出共有方法 a-->开始数字，b-->结束数字，c-->累计加几，param-->哪一列的空格 tips--> 错误提示 验证需求18、19、20、21
	function commonOne(a,b,c,param,tips){
		var zgjgcs = document.getElementById('d1b_'+param+a).innerText-0;//工程技术人员正高级
		var zgjzh = 0;
		for(var i=a+c;i<=b;){
			var gxlzh = document.getElementById('d1b_'+param+i).innerText-0;
			i=i+c;
		}
		if(zgjgcs != zgjzh){
			alert(tips);
			return true;
		}
		return false;
	}
	//验证需求24的方法 a-->开始数字，b-->结束数字，c-->累计加几，param-->哪一列的空格
	function check24(a,b,c,param){
		var sum161 = document.getElementById('d1b_'+param+'169').innerText-0;//161的值
		var sum162 = document.getElementById('d1b_'+param+'170').innerText-0;//162的值
		if(sum161<sum162){
			return true;
		}
		for(var i=a;i<=b;){
			var sum = document.getElementById('d1b_'+param+i).innerText-0;
			var sum1 = document.getElementById('d1b_'+param+(i-1)).innerText-0;
			if(sum<sum1){
				return true;
			}
			i=i+c;
		}
		return false;
	}
	//抽出共有方法 a-->开始数字，b-->结束数字，c-->累计加几，param-->哪一列的空格
	function commonTwo(a,b,c,param){
		var sum = 0;
		for(var i=a;i<=b;){
			sum = sum + document.getElementById('d1b_'+param+i).innerText-0;
			i = i+c;
		}
		return sum;
	}