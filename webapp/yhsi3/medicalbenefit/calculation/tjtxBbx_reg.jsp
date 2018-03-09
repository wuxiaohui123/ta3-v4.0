<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" uri="/ta3"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>报销结算</title>
<%@ include file="/ta/inc.jsp"%>
</head>
<body class="no-scrollbar">
	<ta:pageloading />
	<ta:toolbar id="ButtonLayout1">
		<ta:toolbarItem id="regBtn"     key="保存"    icon="xui-icon-spotAdd"        onClick="toSave()" />
		<ta:toolbarItem id="closeBtn"   key="退出"    icon="xui-icon-spotClose"      onClick="closeWin()" />
	</ta:toolbar>
	<ta:form id="form1" fit="true">  
	     <ta:text id="aaz217" key="登记流水号" display="false"/>
	     <ta:text id="aaa027" key="分中心" display="false"/>
		 <ta:panel id="pnlCxtj" key="登记信息" cols="3" >
			<ta:text id="aac001"  key="个人ID"  required="true"  labelWidth="120"/>
			<ta:text id="aac003" key="姓名" readOnly="true" labelWidth="120" />
			<ta:text id="aac002" key="身份证号" readOnly="true" labelWidth="120" />
			<ta:selectInput id="aac004" key="性别" collection="AAC004"  readOnly="true" labelWidth="120" />
			<ta:date id="aac006" key="出生日期" readOnly="true" labelWidth="120" />
			<ta:selectInput id="yac084" key="离退休标志" readOnly="true" collection="YAC084" labelWidth="120" />
			<ta:selectInput id="aac066" key="参保身份" readOnly="true" collection="AAC066" labelWidth="120" display="false"/>
			<ta:selectInput id="aac020" key="行政职务" readOnly="true" collection="AAC020" labelWidth="120" />
			<ta:text id="aab003" key="单位名称"  readOnly="true" span="2" labelWidth="120" />
			<ta:text id="yke112" key="年龄"  readOnly="true" span="1" labelWidth="120" />
			<ta:selectInput id="ykc005" key="人员类型" readOnly="true" collection="YKC005" labelWidth="120" />
			<ta:selectInput id="ykc006" key="人员类别" readOnly="true" collection="YKC006" labelWidth="120" />
			<ta:text id="akb020"  key="医疗机构编号"  required="true"  labelWidth="120"   popWin="true" popWinType="top" popWinUrl="medicalbenefit/common/commonFunctionAction.do" popWinHeight="500" popWinWidth="900" />
			<ta:text id="akb021" key="医疗机构名称" required="true"   labelWidth="120" span="2"/>
			<ta:selectInput id="aka130" key="就诊类型" required="true" collection="AKA130" labelWidth="120" filter="11,21"  reverseFilter="true"/>
			<ta:date id="aae030" key="就诊开始日期"  required="true"  showSelectPanel="true"  labelWidth="120"/>
			<ta:date id="aae031" key="就诊结束日期"  required="true"  showSelectPanel="true"  labelWidth="120"/>
			<ta:number id="akc264"  key="总费用"  precision="2"  required="true"  max="9999999999" labelWidth="120"/>
			<ta:number id="akc228"  key="自费"  precision="2"  required="true"  max="9999999999" labelWidth="120"/>
			<ta:number id="ake039"  key="统筹支付金额"  precision="2"  required="true"  max="9999999999" labelWidth="120"/>
			<ta:number id="ake035"  key="补充保险支付金额"  precision="2"  required="true"  max="9999999999" labelWidth="120"/>
		</ta:panel>    
   </ta:form>
</body>
</html>
<script type="text/javascript">
	$(document).ready(function() {
		$("body").taLayout();
		initializeSuggestFramework(1,"", "aac001", 750, 300, 7, fn_getPerson, 0, false);
	});
	// 个人ID change事件
	$("#aac001").change(function(){
		sfwQueryUtilForYl(1,'getAc01ByAae140ForYL',{"dto.jstj":Base.getValue('aac001')});
	});
	// 医疗人员回调方法
	function fn_getPerson(){
		Base.setValue("aac001",g_Suggest[2]);
		Base.getJson("<%=path%>/medicalbenefit/common/baseInfoAction!getPersonInfo.do",
					{"dto['aac001']":Base.getValue("aac001")},
					function(data){
						if (data.errMsg != null && data.errMsg != ''){
							Base.alert(data.errMsg, 'warn');
							Base.setValue("aac001",'');
							return true;
						}
						if(data &&  data.personInfoDto) {
							if(data.personInfoDto.yab139 != Base.getValue('aaa027')){
								Base.setValue("aac001",'');
								Base.alert('非本经办机构的参保人员,不能办理登记!', 'warn');
								return false;
							}
							
							Base.setValue("aac002",data.personInfoDto.aac002); // 身份证件号码
							Base.setValue("aac003",data.personInfoDto.aac003); // 姓名
							Base.setValue("aac004",data.personInfoDto.aac004); // 性别
							Base.setValue("aac006",data.personInfoDto.aac006); // 出生日期
							Base.setValue("aab003",data.personInfoDto.aab003); // 单位名称
							Base.setValue("aac066",data.personInfoDto.aac066); // 参保身份
							Base.setValue("yac084",data.personInfoDto.yac084); // 离退休标志
							Base.setValue("ykc005",data.personInfoDto.ykc005); // 人员类型
							Base.setValue("ykc006",data.personInfoDto.ykc006); // 人员类别
							Base.setValue("yke112",data.personInfoDto.yke112); // 实足年龄
							Base.setValue("aac020",data.personInfoDto.aac020); // 行政职务
							Base.setValue("aae140",data.personInfoDto.aae140); // 险种
							Base.setValue("aac008",data.personInfoDto.aac008); // 参保状态
						}
					});
	}
	 // 医疗机构放大镜回调方法
	function fnKb01MagifierBack(rowdata)
	 {
	   Base.setValue("akb020",rowdata.akb020); // 医疗机构编码
	   Base.setValue("akb021",rowdata.akb021); // 医疗机构名称
	}
	 
	// 关闭窗口
	function closeWin()
	{
		top.tjtxbbx_aaz217 = Base.getValue("aaz217");
		top.Base.closeWindow("win_reg");
	}
	
	//保存
    function toSave()
	{
		if(Base.validateForm("form1"))
		{
			Base.setDisabled("regBtn");
			Base.submit("form1","tjtxBbxAction!toSaveReg.do");
		}
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>