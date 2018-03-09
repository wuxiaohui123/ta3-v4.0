<%@ page language="java" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>BasicInfoMaintenance</title>
<%@ include file="/ta/inc.jsp"%>
<%@ include file="/yhsi3/benefit/common/js/benefit.js"%>
</head>
<body style="margin:0px;padding:2px">
	<ta:pageloading />
	<ta:toolbar id="tlb">
		<ta:button id="saveBtn" icon="xui-icon-spotSave" key="保存[S]" hotKey="ctrl+S" onClick="toSave()" asToolBarItem="true" />
		<ta:button id="resetBtn" icon="xui-icon-spotReset" key="重置[R]" hotKey="ctrl+R" type="resetPage" asToolBarItem="true" />
		<ta:button id="colseBtn" key="关闭[C]" icon="xui-icon-spotClose" hotKey="ctrl+C" onClick="parent.Base.closeWindow('userwin');" asToolBarItem="true" />
	</ta:toolbar>
	<ta:form id="form1" fit="true">
		<ta:panel id="procInc" key="审核信息" cssStyle="display:none;">
			<%@ include file="/yhsi3/comm/veritySuggestView1.jsp"%>
			<%@ include file="/yhsi3/comm/veritySuggestView2.jsp"%>
		</ta:panel>
		<ta:panel id="flt_jbxx" cols="3" key="基本信息" cssStyle="height:1000">
			<%@ include file="/yhsi3/benefit/common/personBaseInfoDYAC60.jsp"%>
			<%@ include file="/yhsi3/benefit/common/treatmentTypes.jsp"%>
			<ta:selectInput id="aac004" display="false" labelWidth="130" key="性别" collection="AAC004" />
			<ta:date id="aac006" display="false" labelWidth="130" showSelectPanel="true" key="出生日期" />
			<ta:text id="aaz001" key="单位编号" labelWidth="130" readOnly="true" required="true" minLength="1"  />
			<ta:text id="aae044" labelWidth="130" key="单位名称" span="2" maxLength="50" readOnly="true" />
			<ta:date id="aac007" labelWidth="130" key="参加工作日期" showSelectPanel="true" required="true" />
			<ta:text id="aab401" labelWidth="130" maxLength="20" key="户口簿编号" />
			<ta:selectInput id="aac009" collection="AAC009" labelWidth="130" key="户口性质" />
			<ta:selectInput id="aac012" collection="AAC012" labelWidth="130" key="个人身份" />
			<ta:text id="aac010" labelWidth="130" key="户口所在地址" maxLength="50" span="2" />
			<ta:selectInput id="aac014" collection="AAC014" labelWidth="130" key="专业技术职务等级" />
			<ta:selectInput id="aac015" collection="AAC015" labelWidth="130" key="国家职业资格等级" />
			<ta:selectInput id="aac016" collection="AAC016" labelWidth="130" key="就业状态" />
			<ta:selectInput id="aac017" collection="AAC017" labelWidth="130" key="婚姻状况" />
			<ta:selectInput id="aac020" collection="AAC020" labelWidth="130" key="行政职务(级别)" maxVisibleRows="10" />
			<ta:text id="aae004" labelWidth="130" key="联系人姓名" maxLength="30" />
			<ta:text id="aae005" labelWidth="130" key="联系电话" maxLength="25" />
			<ta:selectInput id="aic161" collection="AIC161" labelWidth="130" key="离退休类别" />
			<ta:date id="aic162" labelWidth="130" key="离退休日期" showSelectPanel="true" required="true" />
			<ta:date id="aae210" labelWidth="130" key="待遇应享受开始年月" showSelectPanel="true" issue="true" required="true" />
			<ta:selectInput id="aac064" collection="AAC064" labelWidth="130" key="退役军人类别" />
			<ta:selectInput id="aac065" collection="AAC065" labelWidth="130" key="退役军衔级别" />
			<ta:selectInput id="aac081" collection="AAC081" labelWidth="190" key="建国前参加革命工作老工人标志" />
			<ta:selectInput id="aac083" collection="AAC083" labelWidth="230" key="退休前是否为原工伤定期待遇享受人员" />
			<ta:selectInput id="aac085" collection="AAC085" labelWidth="130" key="原工商业者标志" />
			<ta:selectInput id="aac093" collection="AAC093" labelWidth="150" key="最高荣誉称号级别代码" />
			<ta:date id="aac055" labelWidth="130" key="参加革命工作日期" showSelectPanel="true" />
			<ta:number id="aae200" labelWidth="130" key="视同缴费月数" max="999" />
			<ta:number id="aae201" labelWidth="130" key="实际缴费月数" max="999" />
			<ta:number id="aae204" labelWidth="130" key="特殊工种折算月数" max="999" />
			<ta:number id="aac056" labelWidth="130" key="军龄(月)" min="0" max="999" />
			<ta:number id="aae203" labelWidth="130" key="军龄折算月数" min="0" max="999" />
			<ta:text id="aab071" labelWidth="130" key="退休申报单位" maxLength="20" />
			<ta:text id="aac057" labelWidth="130" key="离退休证号" maxLength="20" />
			<ta:selectInput id="aac086" collection="AAC086" labelWidth="130" key="孤寡标志" />
			<ta:selectInput id="yic431" collection="sfbz" labelWidth="130" key="艰苦边远山区标识" />
			<ta:selectInput id="yib301" labelWidth="130" key="所属城区" onSelect="getAab073" />
			<ta:selectInput id="aab073" labelWidth="130" key="所属街道社区" showKey="true" serverCvtCode="true" islevel="true" isMustLeaf="true" onFocus="fnSetValue" />
			<ta:text id="yac015" labelWidth="130" key="亲属姓名" maxLength="30" />
			<ta:text id="yac016" labelWidth="130" key="亲属电话" maxLength="20" />
			<ta:selectInput id="yac017" collection="AAE144" labelWidth="130" key="亲属关系" />
			<ta:text id="yac018" labelWidth="130" key="亲属地址" maxLength="50" />
			<ta:text id="yac019" labelWidth="130" key="亲属情况备注" maxLength="50" />
			<ta:number id="aae007" labelWidth="130" key="邮政编码" min="100000" max="999999" display="false" />
			<ta:text id="aae006" labelWidth="130" key="地址" maxLength="50" span="2" />
			<ta:text id="aaz257" display="false" key="享受定期待遇人员ID" />
			<ta:text id="aac001_old" display="false" labelWidth="130" key="人员ID" />
			<ta:text id="aab401_old" display="false" labelWidth="130" key="户口簿编号" />
			<ta:text id="aac002_old" display="false" labelWidth="130" key="证件号码" />
			<ta:text id="aac003_old" display="false" labelWidth="130" key="姓名" />
			<ta:text id="aac004_old" display="false" labelWidth="130" key="性别" />
			<ta:text id="aac006_old" display="false" labelWidth="130" key="出生日期" />
			<ta:text id="aac007_old" display="false" labelWidth="130" key="参加工作日期" />
			<ta:text id="aac009_old" display="false" labelWidth="130" key="户口性质" />
			<ta:text id="aac010_old" display="false" labelWidth="130" key="户口所在地址" />
			<ta:selectInput id="aac012_old" collection='AAC012' display="false" labelWidth="130" key="个人身份" />
			<ta:text id="aac014_old" display="false" labelWidth="130" key="专业技术职务等级" />
			<ta:text id="aac015_old" display="false" labelWidth="130" key="国家职业资格等级" />
			<ta:text id="aac016_old" display="false" labelWidth="130" key="就业状态" />
			<ta:text id="aac017_old" display="false" labelWidth="130" key="婚姻状况" />
			<ta:text id="aac020_old" display="false" labelWidth="130" key="行政职务(级别)" />
			<ta:text id="aae004_old" display="false" labelWidth="130" key="联系人姓名" />
			<ta:text id="aae005_old" display="false" labelWidth="130" key="联系电话" />
			<ta:text id="aae006_old" display="false" labelWidth="130" key="地址" />
			<ta:text id="aae007_old" display="false" labelWidth="130" key="邮政编码" />
			<ta:selectInput id="aic161_old" collection="AIC161" display="false" labelWidth="130" key="离退休类别" />
			<ta:text id="aic162_old" display="false" labelWidth="130" key="离退休日期" />
			<ta:text id="aae210_old" display="false" labelWidth="130" key="待遇应享受开始年月" />
			<ta:text id="aae200_old" display="false" labelWidth="130" key="视同缴费月数" />
			<ta:text id="aae201_old" display="false" labelWidth="130" key="实际缴费月数" />
			<ta:text id="aae204_old" display="false" labelWidth="130" key="特殊工种折算月数" />
			<ta:text id="aac056_old" display="false" labelWidth="130" key="军龄(月)" />
			<ta:text id="aae203_old" display="false" labelWidth="130" key="军龄折算月数" />
			<ta:text id="aac064_old" display="false" labelWidth="130" key="退役军人类别" />
			<ta:text id="aac065_old" display="false" labelWidth="130" key="退役军衔级别" />
			<ta:text id="aab071_old" display="false" labelWidth="130" key="退休申报单位" />
			<ta:text id="aac057_old" display="false" labelWidth="130" key="离退休证号" />
			<ta:text id="aac081_old" display="false" labelWidth="130" key="建国前参加革命工作老工人标志" />
			<ta:text id="aac083_old" display="false" labelWidth="130" key="退休前是否为原工伤定期待遇享受人员" />
			<ta:text id="aac085_old" display="false" labelWidth="130" key="原工商业者标志" />
			<ta:text id="aac093_old" display="false" labelWidth="130" key="最高荣誉称号级别代码" />
			<ta:text id="aac055_old" display="false" labelWidth="130" key="参加革命工作日期" />
			<ta:text id="aaz257_old" display="false" labelWidth="130" key=" 享受定期待遇人员ID" />
			<ta:text id="aaz001_old" display="false" labelWidth="130" key="单位编号" />
			<ta:text id="aae044_old" display="false" labelWidth="130" key="单位名称" />
			<ta:text id="aac086_old" display="false" labelWidth="130" key="孤寡标志" />
			<ta:text id="yic431_old" display="false" labelWidth="130" key="艰苦边远山区标识" />
			<ta:text id="yib301_old" display="false" labelWidth="130" key="所属城区" />
			<ta:text id="aab073_old" display="false" labelWidth="130" key="所属街道社区" />
			<ta:text id="yac015_old" display="false" labelWidth="130" key="亲属姓名" />
			<ta:text id="yac016_old" display="false" labelWidth="130" key="亲属电话" />
			<ta:text id="yac017_old" display="false" labelWidth="130" key="亲属关系" />
			<ta:text id="yac018_old" display="false" labelWidth="130" key="亲属地址" />
			<ta:text id="yac019_old" display="false" labelWidth="130" key="亲属情况备注" />
		</ta:panel>
		<ta:panel id="ac31a1Panel" key="上次变更信息" height="200px" bodyStyle="margin:0px">
			<ta:datagrid id="ac31a1Grid" fit="true" haveSn="true" forceFitColumns="true">
				<ta:datagridItem id="aaz205" key="人员信息变更明细ID" hiddenColumn="false" width="115" />
				<ta:datagridItem id="aaz206" key="人员信息变更事件ID" hiddenColumn="false" width="115" />
				<ta:datagridItem id="aae155" key="变更项目" width="160" />
				<ta:datagridItem id="aae301" key="变更前值描述" width="160" />
				<ta:datagridItem id="aae123" key="变更前信息" width="160" />
				<ta:datagridItem id="aae302" key="变更后值描述" width="160" />
				<ta:datagridItem id="aae124" key="变更后信息" width="160" />
				<ta:datagridItem id="aae036" key="经办时间" width="160" dataAlign="center" align="center" />
				<ta:datagridItem id="aae011" key="经办人" collection="YAE092" width="160" />
			</ta:datagrid>
		</ta:panel>
	</ta:form>
</body>
</html>
<script type="text/javascript">
	$(document).ready(function() {
		$("form").css("overflow", "auto");
		$("body").css("overflow", "hidden");
	});

	//人员信息RPC
	function showRyRPC() {
		Base.openWindow("newRPCWindow", "RPC查询窗口", myPath() + "/newRPCWindows/newRPCWindowsAction!showRPCWindow01.do", null, 1000, 450, null, function() {
			Base.submit("aac001,aaa121,aae140", "basicInfoMaintenance110Action!queryBaseInfo.do", null, null, null, null);
		}, true);
	}

	// 单位RPC
	function callDwRPC() {
		sfwQueryUtil_newRPC(2, "getAb01String", {
			"dto['inputString']" : Base.getValue("aab001")
		});
	}

	// 打开单位信息查询页面
	function showDwRPC() {
		Base.openWindow("newRPCWindow", "RPC查询窗口", myPath() + "/newRPCWindows/newRPCWindowsAction!showRPCWindow02.do", null, 1000, 450, null,null, true);
	}
	
	// 回调函数	
	function fn_queryInfo() {
		if (g_Suggest != "") {
			fn_setPersonBaseInfoData();
			Base.submit("aac001,aaa121,aae140", "basicInfoMaintenance110Action!queryBaseInfo.do", null, null, null, null);
		}
	}

	function fn_check() {
		var aab401 = Base.getValue("aab401"); //修改后的-户口簿编号                           
		var aac002 = Base.getValue("aac002"); //修改后的-证件号码                             
		var aac003 = Base.getValue("aac003"); //修改后的-姓名                                 
		var aac004 = Base.getValue("aac004"); //修改后的-性别                                 
		var aac006 = Base.getValue("aac006"); //修改后的-出生日期                             
		var aac007 = Base.getValue("aac007"); //修改后的-参加工作日期                         
		var aac009 = Base.getValue("aac009"); //修改后的-户口性质                             
		var aac010 = Base.getValue("aac010"); //修改后的-户口所在地址                         
		var aac012 = Base.getValue("aac012"); //修改后的-个人身份                             
		var aac014 = Base.getValue("aac014"); //修改后的-专业技术职务等级                     
		var aac015 = Base.getValue("aac015"); //修改后的-国家职业资格等级                     
		var aac016 = Base.getValue("aac016"); //修改后的-就业状态                             
		var aac017 = Base.getValue("aac017"); //修改后的-婚姻状况                             
		var aac020 = Base.getValue("aac020"); //修改后的-行政职务(级别)                       
		var aae004 = Base.getValue("aae004"); //修改后的-联系人姓名                           
		var aae005 = Base.getValue("aae005"); //修改后的-联系电话                             
		var aae006 = Base.getValue("aae006"); //修改后的-地址                                 
		var aae007 = Base.getValue("aae007"); //修改后的-邮政编码                             
		var aic161 = Base.getValue("aic161"); //修改后的-离退休类别   
		var yic006 = Base.getValue("yic006"); //修改后的-退休后工资职级
		var yic007 = Base.getValue("yic007"); //修改后的-退休后津贴职级                        
		var aic162 = Base.getValue("aic162"); //修改后的-离退休日期                           
		var aae210 = Base.getValue("aae210"); //修改后的-待遇应享受开始年月                   
		var aae200 = Base.getValue("aae200"); //修改后的-视同缴费月数                         
		var aae201 = Base.getValue("aae201"); //修改后的-实际缴费月数                         
		var aae204 = Base.getValue("aae204"); //修改后的-特殊工种折算月数                     
		var aac056 = Base.getValue("aac056"); //修改后的-军龄(月)                             
		var aae203 = Base.getValue("aae203"); //修改后的-军龄折算月数                         
		var aac064 = Base.getValue("aac064"); //修改后的-退役军人类别                         
		var aac065 = Base.getValue("aac065"); //修改后的-退役军衔级别                         
		var aab071 = Base.getValue("aab071"); //修改后的-退休申报单位                         
		var aac057 = Base.getValue("aac057"); //修改后的-离退休证号                           
		var aac081 = Base.getValue("aac081"); //修改后的-建国前参加革命工作老工人标志         
		var aac083 = Base.getValue("aac083"); //修改后的-退休前是否为原工伤定期待遇享受人员   
		var aac085 = Base.getValue("aac085"); //修改后的-原工商业者标志                       
		var aac093 = Base.getValue("aac093"); //修改后的-最高荣誉称号级别代码                 
		var aac055 = Base.getValue("aac055"); //修改后的-参加革命工作日期   
		var aac086 = Base.getValue("aac086"); //修改后的-孤寡标志 
		var yic431 = Base.getValue("yic431"); //修改后的-艰苦边远山区工作标识
		var aab073 = Base.getValue("aab073"); //修改后的-所属街道社区
		var yib301 = Base.getValue("yib301"); //修改后的-所属城区
		var yac015 = Base.getValue("yac015"); //修改后的-亲属姓名
		var yac016 = Base.getValue("yac016"); //修改后的-亲属电话
		var yac017 = Base.getValue("yac017"); //修改后的-亲属关系
		var yac018 = Base.getValue("yac018"); //修改后的-亲属地址
		var yac019 = Base.getValue("yac019"); //修改后的-亲属情况备注

		var aab401_old = Base.getValue("aab401_old"); //修改前的-户口簿编号                           
		var aac002_old = Base.getValue("aac002_old"); //修改前的-证件号码                             
		var aac003_old = Base.getValue("aac003_old"); //修改前的-姓名                                 
		var aac004_old = Base.getValue("aac004_old"); //修改前的-性别                                 
		var aac006_old = Base.getValue("aac006_old"); //修改前的-出生日期                             
		var aac007_old = Base.getValue("aac007_old"); //修改前的-参加工作日期                         
		var aac009_old = Base.getValue("aac009_old"); //修改前的-户口性质                             
		var aac010_old = Base.getValue("aac010_old"); //修改前的-户口所在地址                         
		var aac012_old = Base.getValue("aac012_old"); //修改前的-个人身份                             
		var aac014_old = Base.getValue("aac014_old"); //修改前的-专业技术职务等级                     
		var aac015_old = Base.getValue("aac015_old"); //修改前的-国家职业资格等级                     
		var aac016_old = Base.getValue("aac016_old"); //修改前的-就业状态                             
		var aac017_old = Base.getValue("aac017_old"); //修改前的-婚姻状况                             
		var aac020_old = Base.getValue("aac020_old"); //修改前的-行政职务(级别)                       
		var aae004_old = Base.getValue("aae004_old"); //修改前的-联系人姓名                           
		var aae005_old = Base.getValue("aae005_old"); //修改前的-联系电话                             
		var aae006_old = Base.getValue("aae006_old"); //修改前的-地址                                 
		var aae007_old = Base.getValue("aae007_old"); //修改前的-邮政编码                             
		var aic161_old = Base.getValue("aic161_old"); //修改前的-离退休类别    
		var yic006_old = Base.getValue("yic006_old"); //修改前的-退休后工资职级
		var yic007_old = Base.getValue("yic007_old"); //修改前的-退休后津贴职级                          
		var aic162_old = Base.getValue("aic162_old"); //修改前的-离退休日期                           
		var aae210_old = Base.getValue("aae210_old"); //修改前的-待遇应享受开始年月                   
		var aae200_old = Base.getValue("aae200_old"); //修改前的-视同缴费月数                         
		var aae201_old = Base.getValue("aae201_old"); //修改前的-实际缴费月数                         
		var aae204_old = Base.getValue("aae204_old"); //修改前的-特殊工种折算月数                     
		var aac056_old = Base.getValue("aac056_old"); //修改前的-军龄(月)                             
		var aae203_old = Base.getValue("aae203_old"); //修改前的-军龄折算月数                         
		var aac064_old = Base.getValue("aac064_old"); //修改前的-退役军人类别                         
		var aac065_old = Base.getValue("aac065_old"); //修改前的-退役军衔级别                         
		var aab071_old = Base.getValue("aab071_old"); //修改前的-退休申报单位                         
		var aac057_old = Base.getValue("aac057_old"); //修改前的-离退休证号                           
		var aac081_old = Base.getValue("aac081_old"); //修改前的-建国前参加革命工作老工人标志         
		var aac083_old = Base.getValue("aac083_old"); //修改前的-退休前是否为原工伤定期待遇享受人员 
		var aac085_old = Base.getValue("aac085_old"); //修改前的-原工商业者标志                       
		var aac093_old = Base.getValue("aac093_old"); //修改前的-最高荣誉称号级别代码                 
		var aac055_old = Base.getValue("aac055_old"); //修改前的-参加革命工作日期   
		var aac086_old = Base.getValue("aac086_old"); //修改前的-孤寡标志 
		var yic431_old = Base.getValue("yic431_old"); //修改后的-艰苦边远山区工作标识
		var aab073_old = Base.getValue("aab073_old"); //修改前的-所属街道社区
		var yib301_old = Base.getValue("yib301_old"); //修改后的-所属城区
		var yac015_old = Base.getValue("yac015_old"); //修改前的-亲属姓名
		var yac016_old = Base.getValue("yac016_old"); //修改前的-亲属电话
		var yac017_old = Base.getValue("yac017_old"); //修改前的-亲属关系
		var yac018_old = Base.getValue("yac018_old"); //修改前的-亲属地址
		var yac019_old = Base.getValue("yac019_old"); //修改前的-亲属情况备注	

		if (aab401 == aab401_old && aac002 == aac002_old && aac003 == aac003_old 
				&& aac004 == aac004_old && aac006 == aac006_old && aac007 == aac007_old 
				&& aac009 == aac009_old && aac010 == aac010_old && aac012 == aac012_old 
				&& aac014 == aac014_old && aac015 == aac015_old && aac016 == aac016_old
				&& aac017 == aac017_old && aac020 == aac020_old && aae004 == aae004_old 
				&& aae005 == aae005_old && aae006 == aae006_old && aae007 == aae007_old 
				&& aic161 == aic161_old && yic006 == yic006_old && yic007 == yic007_old 
				&& aic162 == aic162_old && aae210 == aae210_old && aae200 == aae200_old
				&& aae201 == aae201_old && aae204 == aae204_old && aac056 == aac056_old 
				&& aae203 == aae203_old && aac064 == aac064_old && aac065 == aac065_old 
				&& aab071 == aab071_old && aac057 == aac057_old && aac081 == aac081_old 
				&& aac083 == aac083_old && aac085 == aac085_old && aac093 == aac093_old
				&& aac055 == aac055_old && aac086 == aac086_old && yic431 == yic431_old 
				&& aab073 == aab073_old && yib301 == yib301_old && yac015 == yac015_old
				&& yac016 == yac016_old && yac017 == yac017_old && yac018 == yac018_old
				&& yac019 == yac019_old) {
			Base.alert("信息没被修改，不能提交，请确认！", "warn");
			return false;
		} else {
			return true;
		}
	}

	//动态加载所属街道社区aab073
	function getAab073() {
		if (Base.getValue("yib301") != "") {
			Base.submit("yib301", "basicInfoMaintenance110Action!getAab073List.do");
		}
	}
	
	//保存经办信息
	function toSave() {
		if (fn_check()) {
			Base.submit("form1", "basicInfoMaintenance110Action!toSave.do", null, null, null, function() {});
		}
	}

	function fnSetValue(key, value) {
		//将社区编码传到后台进行拼接，查询出完整的信息
		var aaf030 = value;
		var aab073 = Base.getValue("aab073");
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>