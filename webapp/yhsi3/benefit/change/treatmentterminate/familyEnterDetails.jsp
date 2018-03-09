<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%@ include file="/ta/inc.jsp"%>
<%@ include file="/yhsi3/benefit/common/js/benefit.js"%>
</head>
<body class="no-scrollbar"> <!-- class="no-scrollbar" -->
	<ta:pageloading />
	<ta:toolbar id="tlb">
	    <ta:buttonLayout align="center">
	    	<ta:button id="fenterBtn" key="保存[F]" icon="xui-icon-spotSave" hotKey="ctrl+F" onClick="fn_familyEnter();"  asToolBarItem="true" />
	    	<ta:button id="fdeleteBtn" key="删除[D]" icon="xui-icon-spotDelete" hotKey="ctrl+D" onClick="fn_familyDelete();"  asToolBarItem="true" />
	   	 	<ta:button id="colseBtn" key="关闭[C]" icon="xui-icon-spotClose" hotKey="ctrl+C" onClick="parent.Base.closeWindow('userwin');" asToolBarItem="true" />
	    </ta:buttonLayout>
	</ta:toolbar>
	
	<ta:panel id="personinfo" key="人员信息" cols="3" expanded="false" scalable="false">
	    <ta:text id="aac001" key="个人编号" labelWidth="130" display="false"/>
		<ta:text id="aac002" key="身份证号" required="true" maxLength="18" labelWidth="130" validType="idcard" onChange="fnCheckIdCard()"/>
		<ta:text id="aac003" key="姓名" labelWidth="130" maxLength="60" required="true"/>	
		<ta:selectInput id="aac004" key="性别" collection="aac004" labelWidth="130" required="true"/>
		<ta:date id="aac006" key="出生日期"  labelWidth="130" showSelectPanel="true" required="true"/>
		<ta:text id="yac555" key="年龄" required="true" labelWidth="130" validType="number"/>
		<ta:selectInput id="aae144" key="供养关系"  collection="AAE144" labelWidth="130" required="true"/>
		<ta:text id="ajc066" key="工作学习单位" required="true" labelWidth="130" />
		<ta:text id="yae087" key="生活来源" required="true" labelWidth="130" />			
	</ta:panel>
	
	<ta:panel id="dymxlist" key="待遇明细信息"  height="200">
		<ta:datagrid id="familylist" forceFitColumns="true" fit="true" selectType="checkbox"> <!-- selectType="checkbox" onRowSelect="fn_fnSelect"   -->
			<ta:datagridItem id="aaz129" key="供养亲属ID" align="center" dataAlign="center" hiddenColumn="false"/>
			<ta:datagridItem id="aac111" key="死亡人员ID" align="center" dataAlign="center"/>
			<ta:datagridItem id="aac002" key="身份证号码" align="center" dataAlign="center"/>
			<ta:datagridItem id="aac003" key="姓名" align="center" dataAlign="center"/>
			<ta:datagridItem id="aac004" key="性别" align="center" dataAlign="center" collection="AAC004"/>
			<ta:datagridItem id="aac006" key="出生日期" align="center" dataAlign="center" dataType="date"/>
			<ta:datagridItem id="aae144" key="供养关系" align="center" dataAlign="center" collection="AAE144"/>
			<ta:datagridItem id="ajc066" key="工作学习单位" align="center" dataAlign="center"/>
		</ta:datagrid>
	</ta:panel>
	
</body>
</html>

<script type="text/javascript">
	function fn_fnSelect(rowsData)
	{	
		var rowdata = Base.getGridSelectedRows("detailslist");
		var aaa036 = rowsData.aaa036;
		var j = 1;
		if (rowdata.length == 1){
			Base.setSelectRowsByData("detailslist",[{'aaa036':aaa036}]);
		}else{
			for(var i = 0; rowdata.length > i;i++){
				if(rowdata[i].aaa036 != aaa036){
					j = j + 1;
				}
			}
			if (j == 1){
				Base.cancelCheckedRowsByArray("detailslist",[{'aaa036':aaa036}]);
			}else{
				Base.setSelectRowsByData("detailslist",[{'aaa036':aaa036}]);
			}
			
		}		
		//Base.cancelCheckRowsByArray = function("detailslist",[{"aaa036:"rowsData.aaa036}]){};
		
	}
	
	function fnCheckIdCard(){
		
		if(!Base.validateForm("aac002")){
			return false;
		}
		var idCard = Base.getValue("aac002");
		if(idCard.length==15){
			var csrq = idCard.substring(6,12);
			csrq = "19"+csrq.substring(0,2)+"-"+csrq.substring(2,4)+"-"+csrq.substring(4,6);
			var sex = idCard.charAt(idCard.length - 1);
			if(jioushu(sex)){
				Base.setValue("aac004",1);
			}else{
				Base.setValue("aac004",2);
			}
			Base.setValue("aac006",csrq);
		}else if(idCard.length==18){
			var csrq = idCard.substring(6,14);
			var sex = idCard.charAt(idCard.length - 2);
			csrq = csrq.substring(0,4)+"-"+csrq.substring(4,6)+"-"+csrq.substring(6,8);
			if(jioushu(sex)){
				Base.setValue("aac004",1);
			}else{
				Base.setValue("aac004",2);
			}
			Base.setValue("aac006",csrq);
		}
		familyAge(csrq);
	}
	
	//判断数字的奇偶性
	function jioushu(i) {
		if(Number(i)>=0){
			return Number(i) % 2 == 1; 
		}
		else{
			return Math.abs(Number(i))%2==1;
		}
	}  
	
	function familyAge(dateText){
		
		var birthday=new Date(dateText.replace(/-/g, "\/")); 

		var d=new Date(); 

		var age = d.getFullYear()-birthday.getFullYear()-((d.getMonth()<birthday.getMonth()|| 				
				d.getMonth()==birthday.getMonth() && d.getDate()<birthday.getDate())?1:0);
		
		Base.setValue("yac555",age);
	}
	
	function calcAge(dateText)

	{

		var birthday=new Date(dateText.replace(/-/g, "\/")); 

		var d=new Date(); 

		var age = d.getFullYear()-birthday.getFullYear()-((d.getMonth()<birthday.getMonth()|| 				
				d.getMonth()==birthday.getMonth() && d.getDate()<birthday.getDate())?1:0);
		
		alert(age);

		var month = calculateMonth(dateText);
		
		alert(month);

		var year = calculateAge(dateText);
		
		alert(year);
		

		document.all.item("ageTextField").value=age;

		alert(1);
		if(year >= 0){

			if(month<0 && year==1){

			 	document.all.item("ageTextField").value='0';

		 	}

			 else{

				document.all.item("ageTextField").value=year;

			}

		}

		else{

			document.all.item("ageTextField").value="";

		}

	}

	

	function calculateMonth(birthday)

	{

		var month=-1;

	 	if(checkBirthday(birthday))

		{

			var aDate=birthday.split("-");

			if(aDate[1].substr(0,1) == '0')

				aDate[1]=aDate[1].substring(1);

			var birthdayMonth = parseInt(aDate[1]);

			var currentDate = new Date();

    		var currentMonth = parseInt(currentDate.getMonth()+1);

    		month = currentMonth-birthdayMonth;

    		return month;

		}

	 	return month;

	}

	

	function calculateAge(birthday){

		if(checkBirthday(birthday)){

			var aDate=birthday.split("-");

			var birthdayYear = parseInt(aDate[0]);

			var currentDate = new Date();

    		var currentYear = parseInt(currentDate.getFullYear()); 

    		return currentYear-birthdayYear;

    	}

    	return 0;

	}

	
	
	
	function fn_familyEnter(){
		Base.submit("personinfo,familylist", "treatmentTerminateAction!familyEnter.do",null,null,true);
	}
	
	function fn_familyDelete(){
		Base.submit("personinfo,familylist", "treatmentTerminateAction!familyDelete.do",null,null,false);
	}
	
</script>
<%@ include file="/ta/incfooter.jsp"%>

