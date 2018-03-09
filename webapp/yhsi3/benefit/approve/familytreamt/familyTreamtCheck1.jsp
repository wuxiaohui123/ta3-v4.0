<%@ page language="java" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags" %>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>供养亲属待遇审核</title>
		<%@ include file="/ta/inc.jsp"%>
	</head>
	<body  class="no-scrollbar">
		<ta:pageloading />
		<ta:toolbar id="tlb">
			<ta:button id="saveBtn" key="审核[S]" icon="xui-icon-spotSave"
				hotKey="S" onClick="submitData();" asToolBarItem="true" />
			<ta:button id="colseBtn" key="关闭[C]" icon="xui-icon-spotClose"
				hotKey="ctrl+C" onClick="parent.Base.closeWindow('userwin');"
				asToolBarItem="true" />
			<ta:button id="printBtn" icon="icon-save" key="打印确认"
				asToolBarItem="true" display="false" />
		</ta:toolbar>
		<ta:form id="form1" fit="true">
			<ta:box id="procInc">
				<%@ include file="/yhsi3/comm/veritySuggestView1.jsp"%>
				<%@ include file="/yhsi3/comm/veritySuggestView2.jsp"%>
				<ta:text id="fhjc" display="false" key="复核级次" />
			</ta:box>
			<ta:panel id="grjbxx" key="死亡人员信息" cols="3" cssStyle="margin-left:3px">
				<ta:text id="aac001" key="个人ID" readOnly="true" />
				<ta:text id="aac003" key="姓 名" readOnly="true" />
				<ta:text id="aac002" key="身份证号码" readOnly="true" />
				<ta:text id="aab001" key="单位ID" readOnly="true" />
				<ta:text id="aae044" key="单位名称" readOnly="true" span="2" />
				<ta:text id="aab999" key="单位管理码" display="false" />
				<ta:date id="aae138" key="死亡时间" display="false" />
				<ta:selectInput id="yac551" key="丧葬方式" collection="YAC551" display="false" />
				<ta:text id="yac001" key="最大发放期" display="false" />
				<ta:selectInput id="aae140" key="险种" collection="AAE140" display="false" />
			</ta:panel>
			
			<ta:tabs id="tabs1" height="350" >
				<ta:tab id="tab1" key="待遇信息">
					<ta:panel id="gyqsdyxx" key="供养亲属当前待遇信息" fit="true" >
						<ta:datagrid id="gyqsdyxxList" fit="true" forceFitColumns="true">
							<ta:datagridItem id="aac003" key="姓名" />
							<ta:datagridItem id="aac002" key="身份证" />
							<ta:datagridItem id="aaa036" key="待遇项目" collection="AAA036" />
							<ta:datagridItem id="aae128" key="计算金额" />
							<ta:datagridItem id="aae129" key="核发金额" />
							<ta:datagridItem id="aic172" key="享受比例" />
							<ta:datagridItem id="aac086" key="孤寡标志" collection="AAC086" />
							<ta:datagridItem id="aae144" key="供养关系" collection="AAE144" />
							<ta:datagridItem id="yac520" key="丧失劳动" collection="AAC086" />
							<ta:datagridItem id="aae210_1" key="开始年月" />
							<ta:datagridItem id="aae235" key="结束年月" />
							<ta:datagridItem id="yad169" key="发放对象" collection="YAD169" />
							<ta:datagridItem id="aae145" key="支付方式" collection="AAE145" />
							<ta:datagridItem id="aac059" key="领取人证件类型 " collection="AAC059"/>
							<ta:datagridItem id="aae136" key="领取人证件号码"  />
							<ta:datagridItem id="aae133" key="领取人姓名" />
							<ta:datagridItem id="aaf002" key="银行类别" collection="AAF002" />
							<ta:datagridItem id="aae010" key="银行账号" />
							<ta:datagridItem id="aae007" key="邮政编码" />
							<ta:datagridItem id="aae006" key="联系地址" />
							<ta:datagridItem id="aae005" key="联系电话" />
							<ta:datagridItem id="aae016" key="复核标志" collection="AAE016">
							</ta:datagridItem>
						</ta:datagrid>
					</ta:panel>
				</ta:tab>
				<ta:tab id="tab2" key="补发信息">
					<ta:panel id="dqbfxx" key="补发核定信息" fit="true" >
						<ta:datagrid id="dqbfxxList" fit="true" forceFitColumns="true">
							<ta:datagridItem id="aac003" key="姓名" width="250">
							</ta:datagridItem>
							<ta:datagridItem id="aaa036" key="待遇项目" collection="AAA036"
								width="250">
							</ta:datagridItem>
							<ta:datagridItem id="aae128" key="核发金额" width="250">
							</ta:datagridItem>
							<ta:datagridItem id="aae016" key="复核标志" width="250"
								collection="AAE016">
							</ta:datagridItem>
							<ta:datagridItem id="aae003" key="对应所属期" width="250">
							</ta:datagridItem>
						</ta:datagrid>
					</ta:panel>
				</ta:tab>
			</ta:tabs>
		</ta:form>
	</body>
</html>
<script type="text/javascript">

function submitData(){
	
	Base.submit("form1", "familyTreamtCheck1110Action!toSave.do");
}
//渲染核定标志
function getHdbz(e,o,v){
	if(v == "0"){
		return "未核定";
	}
	else if(v == "1"){
		return "已核定";
	}
}


//页面布局控制
$(document).ready(function() {
	$("body").taLayout();
	$("caption.tableView-title").css("margin-bottom","10px");
	$("div.slick-pager-nav-dis").hide();
	$("span.slick-pager-settings").css("float","left");
});
</script>
<%@ include file="/ta/incfooter.jsp"%>
