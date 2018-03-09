<%@ page language="java" pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>registerEmployee</title>
<%@ include file="/ta/inc.jsp"%>
</head>
<body class="no-scrollbar">
    <ta:pageloading />
    <ta:toolbar id="tlb">
		<ta:button id="saveBtn" key="保存[S]" icon="xui-icon-spotSave" hotKey="alt+S" onClick="submitData();"  asToolBarItem="true" />
		<ta:button id="resetBtn" key="重置[R]" icon="xui-icon-spotReset" hotKey="alt+R" asToolBarItem="true" type="resetPage" onClick="fnReset();"/>
		<ta:toolbarItem id="closeWinBtn" key="关闭[C]" icon="xui-icon-spotClose" hotKey="C" onClick="closeWin();" />
		<ta:button id="verityBtn" icon="icon-save" key="审核记录" asToolBarItem="true" onClick="verityHistorySuggestView();" display="false"/>
	</ta:toolbar>
	<ta:form id="form1" fit="true">
		<ta:box id="procInc">
			
			<%@ include file="/yhsi3/comm/veritySuggestView1.jsp"%>
		</ta:box>
	<ta:panel fit="true">	
		<ta:tabs id="tabsSI" fit="true">
			<ta:tab id="infoTb" key="个人基本信息" cssStyle="overflow:auto">
				<ta:panel id="fldryxx" key="人员信息" cols="3" expanded="false" scalable="false">
					<ta:text id="isNew" display="false" value="0"/>
					<ta:text id="aaz002" key="业务日志ID" display="false" />
					<ta:selectInput id="aac058" key="证件类型" collection="aac058" required="true" labelWidth="120" selectFirstValue="true" onSelect="checkaac058"/>
					<ta:text id="aac002" key="证件号码" validType="idcard" required="true" maxLength="18" labelWidth="120" onChange="fnChange(Base.getValue('aac002'))"/>
					<ta:text id="aac001" key="个人编号" readOnly="true" labelWidth="120" maxLength="15"/>
					<ta:text id="aac003" key="姓名" labelWidth="120" maxLength="60" required="true"/>
					<ta:selectInput id="aac004" key="性别" readOnly="true" collection="aac004" labelWidth="120" required="true"/>
					<ta:date id="aac006" key="出生日期" readOnly="true" labelWidth="120" showSelectPanel="true" required="true"/>
					<ta:date id="aac007" key="参加工作时间" required="true" labelWidth="120" showSelectPanel="true" onChange="checkworkTime()"/>
					<ta:selectInput id="aac012" key="个人身份" collection="aac012" labelWidth="120" required="true"/>
					<ta:selectInput id="aja004" key="农民工标示" collection="aja004" labelWidth="120" required="true" selectFirstValue="true"/>
					<ta:selectInput id="aac005" key="民族" collection="aac005" labelWidth="120" value="01"/>
					<ta:selectInput id="aac011" key="学历" collection="aac011" labelWidth="120"/>
					<ta:selectInput id="aac017" key="婚姻状况" collection="aac017" labelWidth="120"/>
					<ta:selectInput id="aac016" key="就业状态" collection="aac016" labelWidth="120"/>
					<ta:selectInput id="aac033" key="健康状况" collection="aac033" labelWidth="120"/>
					<ta:selectInput id="aab301" key="所属行政区代码" collection="aab301" labelWidth="120" islevel="true" isMustLeaf="true"/>
					<ta:text id="aae013" key="备注" span="3" labelWidth="120" maxLength="200"/>
				</ta:panel>
				<ta:panel id="fldry" key="荣誉信息" cols="3" expanded="false" scalable="false">
					<ta:selectInput id="aac014" key="专业技术职务等级" collection="aac014" labelWidth="120"/>
					<ta:selectInput id="aac015" key="国家职业资格等级" collection="aac015" labelWidth="120"/>
					<ta:selectInput id="aac020" key="行政职务" collection="aac020" labelWidth="120"/>
				</ta:panel>
				<ta:panel id="fldlx" key="联系信息" cols="3" expanded="false" scalable="false">
					<ta:text id="aae006" key="地址" labelWidth="120" span="2" required="true" maxLength="200"/>
					<ta:text id="aae007" key="邮编" validType="zipcode" maxLength="6" labelWidth="120" onChange="checkPost()"/>
					<ta:text id="aae004" key="联系人姓名" labelWidth="120" required="true" maxLength="60"/>
					<ta:text id="aae005" key="联系人电话" labelWidth="120" required="true" onChange="fnAae005();" validType="number" maxLength="30"/>
					<ta:text id="yae107" key="移动电话" labelWidth="120" validType="number"  onChange="fnYae107();" maxLength="50"/>
					<ta:text id="aae159" key="联系电子邮箱" validType="email" labelWidth="120"  maxLength="50" onChange="checkMail()"/>
				</ta:panel>
				<ta:panel id="fldhj" key="户籍信息" cols="3" expanded="false" scalable="false">
					<ta:selectInput id="aac009" key="户口性质" collection="aac009" labelWidth="120" required="true" selectFirstValue="true"/>
					<ta:text id="aac010" key="户口所在地" labelWidth="120" maxLength="100" required="true"/>
					<ta:text id="aab401" key="户口簿编号" labelWidth="120" validType="number" onChange="fnAab401();" maxLength="20"/>
				</ta:panel>
			</ta:tab>
			<ta:tab id="sjlcTb" key="事件流程记录" >
					<%@ include file="/yhsi3/commonJSP/sjlcjl.jsp"%>
			</ta:tab>
		</ta:tabs>
	</ta:panel>
	</ta:form>
</body>
</html>
<script type="text/javascript">
	//style
	$(document).ready(function() {
		$("body").taLayout();
		
		$("caption.tableView-title").css("margin-bottom","10px");
		$("div.slick-pager-nav-dis").hide();
		$("span.slick-pager-settings").css("float","left");
		$("body").css("overflow","hidden");
	});
	
	//验证联系电话是否包含中文
	function fnAae005(){
		var aae005 = Base.getValue("aae005");
		if(/.*[\u4e00-\u9fa5]+.*$/.test(aae005)){
			alert("联系人电话不能包含中文,请重新输入!");
 			Base.setValue("aae005","");
 			Base.focus("aae005");
		}
	}
	
	//验证移动电话是否包含中文
	function fnYae107(){
		var yae107 = Base.getValue("yae107");
		if(/.*[\u4e00-\u9fa5]+.*$/.test(yae107)){
			alert("联系电话不能包含中文,请重新输入!");
 			Base.setValue("yae107","");
 			Base.focus("yae107");
		}
	}
	
	//验证户口薄编号是否包含中文
	function fnAab401(){
		var aab401 = Base.getValue("aab401");
		if(/.*[\u4e00-\u9fa5]+.*$/.test(aab401)){
			alert("户口薄编号不能包含中文,请重新输入!");
 			Base.setValue("aab401","");
 			Base.focus("aab401");
		}
	}
	
	//根据身份证获取出生日期和性别
	function fnChange(idCard){
		var birthday = Base.getIdCardBirthday(idCard);
		var strs= new Array();
		var aac058 = Base.getValue("aac058");
		//证件类型为身份证相关才检验
		if(aac058==1||aac058==4||aac058==5){
		
		strs=birthday.split("-");
		var month = strs[1];
		var day = strs[2];
		var year = strs[0];
		if(parseInt(month)<10){
			month = "0" + month;
		}
		if(parseInt(day)<10){
			day = "0" + day;
		}
		birthday = year + "-" + month + "-" + day;
		Base.setValue("aac006",birthday);
		//性别判断
		var gender;
		
		//15位不支持，只能是18位
		//if (idCard.length == 15) {
        //        gender = idCard.substr(14, 1);

        //} 
         if(idCard.length == 18) {
                gender = idCard.substr(16, 1);
        }else if(idCard.length != 18){
        	Base.setValue("aac002","");
        	Base.setValue("aac004","");
        	Base.setValue("aac004","");
        	Base.focus("aac002");
        	alert("身份证格式不对，只能录入18位有效的身份证！");
        	return ;
        }
        var sex = gender % 2 == 0 ? '2' : '1';
		Base.setValue("aac004",sex);
		}
		
		Base.submit('aac002','employeeaddAction!toCheckAac002.do');
	}
	
	//save
	function submitData(){
			
	    Base.submit('form1','employeeaddAction!toSave.do');
			
	}
	
	//reset
	function fnReset(){
		var aae417 = Base.getValue("aae417");
		var yae248 = Base.getValue("yae248");
		Base.resetForm("form1");
		Base.setValue("aae417",aae417);
		Base.setValue("yae248",yae248);
		
		Base.setEnable("aac002,aab401,aac005,aac003,aac007,aac009,aac058");
		Base.setEnable("aac010,aac011,aac012,aac014,aac015,aac016,aac017,aac020,aac033,aac060,aac084");
		Base.setEnable("aae004,aae005,yae107,aae006,aae007,aae159,aja004,aab301,yac011,yac008");
		
		Base.setEnable("saveBtn");
		Base.setEnable("jstj");
	}
	

		//邮政编码判断
	function checkPost(){   
		var pattern = /^[0-9]{6}$/;
		var aae007 = Base.getValue("aae007");
		if (pattern.test(aae007)==false){
		Base.alert("非法的邮政编码，请重新录入！","error");
		Base.setValue("aae007","");
		Base.focus("aae007");
		}
	}
	//电子邮箱判断

	function checkMail(){   
		
		var reMail = /^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/;
 		var aae159 = Base.getValue("aae159");
 		if(!reMail.test(aae159)){
 		Base.alert("无效邮箱地址，请检查后重新录入!","error");
 		Base.setValue("aae159","");
 		Base.focus("aae159");
		}
	}

	//判断证件类型 
	function checkaac058(){
		var aac058 = Base.getValue("aac058");
		if(aac058!="1"){
			Base.setValue("aac002","");
			Base.setValue("aac004","");
			Base.setValue("aac006","");
		}
	}
	
	//判断参工时间与出生日期
	function checkworkTime(){
		var aac006 = Base.getValue("aac006");
		var aac007 = Base.getValue("aac007");
		if(aac007<aac006){
			alert("【参工时间："+aac007+"】不能早于【出生日期："+aac006+"】，请检查后重新录入！");
			Base.setValue("aac007","");
			Base.focus("aac007");
			return ;
		}
	}
	
	//判断个人参保时间 
	function fnCheckAllInsTime(id){
		var aac007 = Base.getValue("aac007");//参工时间
		var aac049 = Base.getValue("aac049");//首次参保时间
		var ajc050 = Base.getValue("ajc050");//本次参保时间
		var aac030 = Base.getValue("aac030_"+id);//个人参保时间 aac030_110
		if(aac030 != ''){
			//与参加工作日期作比较
			if(aac007 == ''){
				alert("请先输入参加工作日期!");
				Base.activeTab('infoTb');
				Base.setValue("aac030_"+id,'');
				Base.focus('aac007');
				return;
			}else{
				if(aac007 > aac030){
					alert(getAae140Name(id)+" 个人参保日期【"+aac030+"】不能早于参加工作日期【"+aac007+"】!");
					Base.setValue("aac030_"+id,'');
					Base.activeTab('tb_aae140_'+id);
					Base.focus("aac030_"+id);
					return;
				}
			}
			//与首次参保日期作比较
			if(aac049 != ''){
				if(aac030 < aac049){
					alert(getAae140Name(id)+" 个人参保日期【"+aac030+"】不能早于首次参保日期【"+aac049+"】!");
					Base.setValue("aac030_"+id,'');
					Base.activeTab('tb_aae140_'+id);
					Base.focus("aac030_"+id);
					return;
				}
			}
			//与本次参加工作日期作比较
			if(ajc050 != ''){
				if(aac030 < ajc050){
					alert(getAae140Name(id)+" 个人参保日期【"+aac030+"】不能早于本次参加工作日期【"+ajc050+"】!");
					Base.setValue("aac030_"+id,'');
					Base.activeTab('tb_aae140_'+id);
					Base.focus("aac030_"+id);
					return;
				}
			}
		}
		
	}
	
	//校验首次参保时间
	function fnSetAac049(){
		var aac007 = Base.getValue('aac007');//参加工作日期
		var aac049 = Base.getValue('aac049');//首次参保日期
		var ajc050 = Base.getValue('ajc050');//本次参加工作日期
		if(aac049 != ''){
			//与参加工作日期作比较
			if(aac007 == ''){
				alert("请先输入参加工作日期!");
				Base.activeTab('infoTb');
				Base.setValue('aac049','');
				Base.focus('aac007');
				return;
			}else{
				if(aac007 > aac049){
					alert("首次参保日期【"+aac049+"】不能早于参加工作日期【"+aac007+"】!");
					Base.setValue('aac049','');
					Base.focus('aac049');
					return;
				}
			}
			//与本次参加工作日期作比较
			if(ajc050 != ''){
				if(ajc050 < aac049){
					alert("首次参保日期【"+aac049+"】不能晚于本次参加工作日期【"+ajc050+"】!");
					Base.setValue('aac049','');
					Base.focus('aac049');
					return;
				}
			}
			//与个人参保日期做比较
			var aae140Arr = ['110','120','210','310','410','510'];
			var len = aae140Arr.length;
			for(i=0;i<len;i++){
				var ck = Base.getObj('aae140_'+aae140Arr[i]).checked;
				if(ck){
					var aac030 = Base.getValue('aac030_'+aae140Arr[i]);
					if((aac030 != '') && (aac049 > aac030)){
						alert("首次参保日期【"+aac049+"】不能晚于【"+getAae140Name(aae140Arr[i])+"】个人参保时间【"+aac030+"】!");
						Base.setValue('aac049','');
						Base.activeTab('tb_aae140_'+aae140Arr[i]);
						return;
					}
				}
			}
		}
	}
	
	//本次参加工作日期校验
	function fnSetAjc050(){
		var aac007 = Base.getValue('aac007');//参加工作日期
		var aac049 = Base.getValue('aac049');//首次参保日期
		var ajc050 = Base.getValue('ajc050');//本次参加工作日期
		if(ajc050 != ''){
			//与参加工作日期作比较
			if(aac007 == ''){
				alert("请先输入参加工作日期!");
				Base.activeTab('infoTb');
				Base.setValue('ajc050','');
				Base.focus('aac007');
				return;
			}else{
				if(aac007 > ajc050){
					alert("本次参加工作日期【"+ajc050+"】不能早于参加工作日期【"+aac007+"】!");
					Base.setValue('ajc050','');
					Base.focus('ajc050');
					return;
				}
			}
			//与本次参加工作日期作比较
			if(aac049 != ''){
				if(ajc050 < aac049){
					alert("本次参加工作日期【"+ajc050+"】不能早于首次参保日期【"+aac049+"】!");
					Base.setValue('ajc050','');
					Base.focus('ajc050');
					return;
				}
			}
			//与个人参保日期做比较
			var aae140Arr = ['110','120','210','310','410','510'];
			var len = aae140Arr.length;
			for(i=0;i<len;i++){
				var ck = Base.getObj('aae140_'+aae140Arr[i]).checked;
				if(ck){
					var aac030 = Base.getValue('aac030_'+aae140Arr[i]);
					if((aac030 != '') && (ajc050 > aac030)){
						alert("本次参加工作日期【"+ajc050+"】不能晚于【"+getAae140Name(aae140Arr[i])+"】个人参保时间【"+aac030+"】!");
						Base.setValue('ajc050','');
						Base.activeTab('tb_aae140_'+aae140Arr[i]);
						return;
					}
				}
			}
		}
	}
	
	//险种名字
	function getAae140Name(id){
		if(id == '110'){
			return '企业养老保险';
		}else if(id == '120'){
			return '机关养老保险';
		}else if(id == '210'){
			return '失业保险';
		}else if(id == '310'){
			return '医疗保险';
		}else if(id == '410'){
			return '工伤保险';
		}else if(id == '510'){
			return '生育保险';
		}
	}
	
	//关闭窗口
	function closeWin(){
	    parent.Base.closeWindow('userwin');
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>