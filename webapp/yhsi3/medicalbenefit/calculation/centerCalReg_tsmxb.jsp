<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" uri="/ta3"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>零星报销登记(特殊慢性病)</title>
<%@ include file="/ta/inc.jsp"%>
</head>
<body class="no-scrollbar">
	<ta:pageloading />
	<ta:toolbar id="ButtonLayout1">
		<ta:toolbarItem id="shBtn" key="明细录入" icon="xui-icon-spotCheck"   onClick="toMxSh()"  />
		<ta:toolbarItem id="jiaofeiBtn" key="查询缴费信息" icon="xui-icon-query"   onClick="toQueryJiaoFei()"/>
		<ta:button id="btnReset" key="重置[R]" icon="xui-icon-spotReset" type="resetPage"  hotKey="R" asToolBarItem="true" />
	</ta:toolbar>
	<ta:form id="form1" fit="true">
		<ta:text id="aaa027" key="参保机构"  display="false"/>
		<ta:panel id="panel1" key="基本信息" cols="3">
		    <ta:date id="aae001"  key="年度"  required="true"  labelWidth="120" showSelectPanel="true" dateYear="true"/>
			<ta:text id="aac001"  key="个人ID" required="true"  labelWidth="120"/>
			<ta:text id="aac003" key="姓名" readOnly="true" labelWidth="120" />
			<ta:text id="aac002" key="身份证号" readOnly="true" labelWidth="120" />
			<ta:selectInput id="aac004" key="性别" collection="AAC004"  readOnly="true" labelWidth="120" />
			<ta:date id="aac006" key="出生日期" readOnly="true" labelWidth="120" />
			<ta:selectInput id="yac084" key="退休标志" readOnly="true" collection="YAC084" labelWidth="120" />
			<ta:selectInput id="aae140" key="险种类型" readOnly="true" collection="AAE140" labelWidth="120"/>
			<ta:selectInput id="aac066" key="参保身份" readOnly="true" collection="AAC066" labelWidth="120" display="false"/>
			<ta:text id="aab003" key="单位名称"  readOnly="true"  labelWidth="120" />
			<ta:text id="yke112" key="年龄"  readOnly="true" span="1" labelWidth="120" />
			<ta:selectInput id="ykc005" key="人员类型" readOnly="true" collection="YKC005" labelWidth="120" />
			<ta:selectInput id="ykc006" key="人员类别" readOnly="true" collection="YKC006" labelWidth="120" />
			<ta:text id="aac008" key="待遇状态" readOnly="true" labelWidth="120" cssInput="color:red;"/>
			<ta:text id="aae003" key="最大缴费年月" readOnly="true"  labelWidth="120" />
			<ta:text id="aae240" key="账户余额" readOnly="true"  labelWidth="120" />
			<ta:text id="cs" key="报销次数"  readOnly="true" span="1" labelWidth="120" />
			<ta:text id="aka121" key="病种名称"  readOnly="true" span="2" labelWidth="120" />
			<ta:text id="aae180" key="年工资"  readOnly="true" span="1" labelWidth="120" />
			<ta:text id="zycs" key="批准期内住院次数"  readOnly="true" span="1" labelWidth="120" />
			<ta:text id="aae030_dy" key="待遇开始时间"  readOnly="true" span="1" labelWidth="120" />
			<ta:text id="yka120" key="年度统筹累计"  readOnly="true" span="1" labelWidth="120" />
			<ta:text id="ake039" key="年度报销累计"  readOnly="true" span="1" labelWidth="120" />
			<ta:text id="yka115" key="起付线"  readOnly="true" span="1" labelWidth="120" />
		</ta:panel>
		<ta:panel id="panel2" key="就诊信息" cols="3">
			<ta:selectInput id="aka130" key="医疗类别" collection="AKA130" required="true" labelWidth="120" filter="13,13a,13b" reverseFilter="true" maxVisibleRows="8"  value="13b"/> 
			<ta:selectInput id="ake013" key="报销原因" collection="AKE013" value="10" filter="11,12,13,14,15" maxVisibleRows="6" required="true" labelWidth="120"/>
		</ta:panel>
	</ta:form>
</body>
</html>
<script type="text/javascript">
	$(document).ready(function() {
		$("body").taLayout();
		initializeSuggestFramework(1,"", "aac001", 500, 300, 4, fn_getPerson, 2, false);
	});
	// 个人ID change事件
	$("#aac001").change(function(){
		sfwQueryUtil(1,'getKc47ListForYL',Base.getValue('aac001'));
	});
	// 医疗人员回调方法
	function fn_getPerson(){
		Base.setValue("aac001",g_Suggest[2]);
		Base.getJson("<%=path%>/medicalbenefit/common/baseInfoAction!getPersonInfotsmz.do",
					{"dto['aac001']":Base.getValue("aac001"),"dto['aae001']":Base.getValue("aae001")},
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
							
							Base.setValue("aac002",data.personInfoDto.aac002);
							Base.setValue("aac003",data.personInfoDto.aac003);
							Base.setValue("aac004",data.personInfoDto.aac004);
							Base.setValue("aac006",data.personInfoDto.aac006);
							Base.setValue("aab003",data.personInfoDto.aab003);
							Base.setValue("aac066",data.personInfoDto.aac066);
							Base.setValue("yac084",data.personInfoDto.yac084);
							Base.setValue("ykc005",data.personInfoDto.ykc005);
							Base.setValue("ykc006",data.personInfoDto.ykc006);
							Base.setValue("yke112",data.personInfoDto.yke112);
							Base.setValue("aae140",data.personInfoDto.aae140);
							Base.setValue("aac008",data.personInfoDto.aac008);
							Base.setValue("aae003",data.personInfoDto.aae003);
							Base.setValue("aae240",data.personInfoDto.aae240);
							Base.setValue("cs",data.personInfoDto.cs);
							Base.setValue("aka121",data.personInfoDto.aka121);
							Base.setValue("aae180",data.personInfoDto.aae180);
							Base.setValue("zycs",data.personInfoDto.zycs);
							Base.setValue("aae030_dy",data.personInfoDto.aae030);
							Base.setValue("yka120",data.personInfoDto.yka120);
							Base.setValue("ake039",data.personInfoDto.ake039);
							Base.setValue("yka115",data.personInfoDto.yka115);
							
							var aac008 = data.personInfoDto.aac008; // 待遇状态
							if("停保" == aac008){
								Base.alert("不享受待遇,请核实当事人信息!","warn");
							}
							// 焦点置于医疗类型
							Base.focus("aka130");
						}
					});
	}
	
	// 明细录入
	function toMxSh()
	{
		var  aac001 = Base.getValue("aac001"); // 个人ID
		var  aka130 = Base.getValue("aka130"); // 医疗机构类别
		var  ake013 = Base.getValue("ake013"); // 报销原因
		if("" == aac001 || null == aac001){
           return Base.alert("请输入个人ID!","warn",function(){Base.focus("aac001");});
		}
		if("" == aka130 || null == aka130){
           return Base.alert("请输入医疗类别!","warn",function(){Base.focus("aka130");});
		}
		if("" == ake013 || null == ake013){
           return Base.alert("请输入报销原因!","warn",function(){Base.focus("ake013");});
		}
		var parameter = {};
		parameter["dto.aac001"] = aac001; // 个人ID
		parameter["dto.aka130"] = aka130; // 医疗机构类别
		parameter["dto.ake013"] = ake013; // 报销原因
		parameter["dto.aae140"] = Base.getValue("aae140"); // 险种信息
		Base.openWindow('win_mxlr','明细录入信息', '<%=path%>/medicalbenefit/calculation/centerCalRegMxbAction!toMxSh.do', parameter, '99%', '99%', null, null, true, null, null);
	}
	
	// 查询缴费信息
	function toQueryJiaoFei()
	{
		var aac001 = Base.getValue("aac001");
		if("" == aac001 || null == aac001){
			Base.alert("请输入个人ID","warn");
			return;
		}
		var parameter = {};
		parameter["dto['aac001']"] = aac001;
		parameter["dto['aae140']"] = Base.getValue("aae140");
		Base.openWindow("win_jf", "人员缴费信息", "<%=path%>/medicalbenefit/calculation/centerCalRegMxbAction!toQueryJiaoFei.do", parameter, "98%", "95%", null, null, true, "", ""); 
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>