<%@ page language="java" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>registerEmployeeCheck1</title>
<%@ include file="/ta/inc.jsp"%>
</head>
<body class="no-scrollbar">
    <ta:pageloading />
    <ta:toolbar id="tlb">
		<ta:button id="saveBtn" key="保存[S]" icon="xui-icon-spotSave" hotKey="alt+S" onClick="submitData();"  asToolBarItem="true" />
		<ta:toolbarItem id="closeBtn" key="关闭[C]" icon="xui-icon-spotClose" hotKey="alt+C" onClick="closeWin();"/>
	</ta:toolbar>
<ta:form id="form1" fit="true">
	<ta:panel key="审核信息" height="85" expanded="false" scalable="false">
		<ta:box id="procInc">
			
			<%@ include file="/yhsi3/comm/veritySuggestView1.jsp"%>
		</ta:box>
		<%@ include file="/yhsi3/comm/veritySuggestView2.jsp"%>
		<ta:text id="fhjc" display="false" key="复核级次"/>
	</ta:panel>
	<ta:panel fit="true" hasBorder="false">
		<ta:tabs id="tabsSI" fit="true">
			<ta:tab id="infoTb" key="个人基本信息" cssStyle="overflow:auto">
				<ta:panel id="fldryxx" key="人员信息" cols="3" expanded="false" scalable="false">
					<ta:text id="isNew" display="false" value="0"/>
					<ta:text id="aaz002" key="业务日志ID" display="false" />
					<ta:selectInput id="aac058" key="证件类型" collection="aac058"  labelWidth="120" selectFirstValue="true"/>
					<ta:text id="aac002" key="证件号码" validType="idcard"  maxLength="18" labelWidth="120" />
					<ta:text id="aac001" key="个人编号" readOnly="true" labelWidth="120" maxLength="15"/>
					<ta:text id="aac003" key="姓名" labelWidth="120" maxLength="60" />
					<ta:selectInput id="aac004" key="性别" readOnly="true" collection="aac004" labelWidth="120" />
					<ta:date id="aac006" key="出生日期" readOnly="true" labelWidth="120" showSelectPanel="true" />
					<ta:date id="aac007" key="参加工作时间"  labelWidth="120" showSelectPanel="true"/>
					<ta:selectInput id="aac012" key="个人身份" collection="aac012" labelWidth="120" />
					<ta:selectInput id="aja004" key="农民工标示" collection="aja004" labelWidth="120"  selectFirstValue="true"/>
					<ta:selectInput id="aac005" key="民族" collection="aac005" labelWidth="120"/>
					<ta:selectInput id="aac011" key="学历" collection="aac011" labelWidth="120"/>
					<ta:selectInput id="aac017" key="婚姻状况" collection="aac017" labelWidth="120"/>
					<ta:selectInput id="aac016" key="就业状态" collection="aac016" labelWidth="120"/>
					<ta:selectInput id="aac033" key="健康状况" collection="aac033" labelWidth="120"/>
					<ta:selectInput id="aab301" key="所属行政区代码" collection="aab301" labelWidth="120"/>
					<ta:text id="aae013_emp" key="备注" span="3" labelWidth="120" maxLength="200"/>
				</ta:panel>
				<ta:panel id="fldry" key="荣誉信息" cols="3" expanded="false" scalable="false">
					<ta:selectInput id="aac014" key="专业技术职务等级" collection="aac014" labelWidth="120"/>
					<ta:selectInput id="aac015" key="国家职业资格等级" collection="aac015" labelWidth="120"/>
					<ta:selectInput id="aac020" key="行政职务" collection="aac020" labelWidth="120"/>
				</ta:panel>
				<ta:panel id="fldlx" key="联系信息" cols="3" expanded="false" scalable="false">
					<ta:text id="aae006" key="地址" labelWidth="120" span="2"  maxLength="200"/>
					<ta:text id="aae007" key="邮编" validType="zipcode" maxLength="6" labelWidth="120" />
					<ta:text id="aae004" key="联系人姓名" labelWidth="120"  maxLength="60"/>
					<ta:text id="aae005" key="联系人电话" labelWidth="120"  validType="number" maxLength="30"/>
					<ta:text id="yae107" key="移动电话" validType="number" labelWidth="120"  maxLength="50"/>
					<ta:text id="aae159" key="联系电子邮箱" validType="email" labelWidth="120"  maxLength="50"/>
				</ta:panel>
				<ta:panel id="fldhj" key="户籍信息" cols="3" expanded="false" scalable="false">
					<ta:selectInput id="aac009" key="户口性质" collection="aac009" labelWidth="120"  selectFirstValue="true"/>
					<ta:text id="aac010" key="户口所在地" labelWidth="120" maxLength="100" />
					<ta:text id="aab401" key="户口簿编号" labelWidth="120" validType="number" maxLength="20"/>
				</ta:panel>
			</ta:tab>
			
			
			
			<ta:tab id="sjlcTb" key="事件流程记录" cssStyle="overflow:auto">
				<%@ include file="/yhsi3/commonJSP/sjlcjl.jsp"%>
			</ta:tab>
		</ta:tabs>
	</ta:panel>	
	</ta:form>
</body>
</html>
<script type="text/javascript">
	//保存经办信息
	function submitData(){
		Base.submit("form1","employeeaddCheck1Action!toSave.do");
		Base.setDisabled('saveBtn');
	}
	
	//关闭窗口
	function closeWin(){
	    parent.Base.closeWindow('userwin');
	}
	
	$(document).ready(function() {
		$("body").taLayout();
		$("caption.tableView-title").css("margin-bottom","10px");
		$("div.slick-pager-nav-dis").hide();
		$("span.slick-pager-settings").css("float","left");
		$("body").css("overflow","hidden");
		
	});
</script>
<%@ include file="/ta/incfooter.jsp"%>