<%@ page language="java" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>fzqjCalculate</title>
<%@ include file="/ta/inc.jsp"%>
<ta:text id="fhjc" display="false" key="复核级次" />
</head>
<body>
	<ta:pageloading />
	<ta:toolbar id="tlb">
		<ta:button id="saveBtn" icon="xui-icon-spotSave" key="待遇核定[S]" hotKey="ctrl+S" onClick="submitData()" asToolBarItem="true" />
		<ta:button id="resetBtn" icon="xui-icon-spotReset" key="重置[R]" hotKey="ctrl+R" type="resetPage" asToolBarItem="true" />		
		<ta:button id="colseBtn" key="关闭[C]" icon="xui-icon-spotClose" hotKey="ctrl+C" onClick="parent.Base.closeWindow('userwin');"
			asToolBarItem="true" display="false" />
	</ta:toolbar>

	<ta:form id="form1" fit="true" cssStyle="overflow:auto;">
		<ta:box id="procInc">
            <%@ include file="/yhsi3/benefit/common/js/benefit.js"%>
            <%@ include file="/yhsi3/comm/veritySuggestView1.jsp"%>
            <%@ include file="/yhsi3/comm/veritySuggestView2.jsp"%>
		</ta:box>

		<ta:panel id="jbxxfset" key="人员基本信息" cols="3">
			<%@ include file="/yhsi3/benefit/common/treatmentTypes.jsp"%>
			<%@ include file="/yhsi3/benefit/common/personBaseInfoDY.jsp"%>
			<%@ include file="/yhsi3/benefit/common/unitBaseInfoShow.jsp"%>
			<ta:selectInput id="aac060" key="生存状态" collection="AAC060" display="false" />
			<ta:selectInput id="aae116" key="待遇发放状态" collection="AAE116" display="false" />
			<ta:text id="yab003" key="经办机构"  display="false" />
		</ta:panel>

		<!-- 初始化工伤认定信息 -->
		<ta:panel id="gsrdxx" key="工伤信息">
			<ta:datagrid id="gsxxList" selectType="radio" onChecked="fnGsxxSelectChange" height="100px" forceFitColumns="true">
				<ta:datagridItem id="aab001" key="单位ID" hiddenColumn="true" />
				<ta:datagridItem id="aae044" key="单位名称" width="100"/>
				<ta:datagridItem id="aaz127" key="工伤登记号" hiddenColumn="true" />
				<ta:datagridItem id="alc020" key="工伤时间" />
				<ta:datagridItem id="ylc035" key="人员类别" collection="YLC035"/>
				<ta:datagridItem id="alc022" key="伤害部位" collection="ALC022" />
				<ta:datagridItem id="alc021" key="伤害程度" collection="ALC021" />
				<ta:datagridItem id="ala040" key="伤残等级" collection="ALA040" />
				<ta:datagridItem id="alc060" key="护理依赖等级" width="90" collection="ALC060" />
				<ta:datagridItem id="alc031" key="认定时间" />
				<ta:datagridItem id="alc034" key="鉴定时间" />
				<ta:datagridItem id="ylc044" key="医疗终结期" />
				<ta:datagridItem id="alc027" key="工亡类别" collection="ALC027"/>
				<ta:datagridItem id="ala017" key="职业病" collection="ALA017"/>
				<ta:datagridItem id="alc040" key="因公死亡(失踪)日期" width="140"/>
			</ta:datagrid>
		</ta:panel>

		<ta:panel id="paymentInfo" key="" hasBorder="false" >
			<ta:panel id="ffxxsyqk" key="其他信息录入" cols="3">
				<ta:text id="aaz127" key="工伤认定ID" display="false" />
				<ta:selectInput id="aaa036" key="待遇类型" labelWidth="130" data="[{'id':'400010','name':'工伤医疗费'},{'id':'400012','name':'辅助器具费'}]"
					required="true" onSelect="fnChange"  collection="AAA036" value="400012" readOnly="true"/>					
			</ta:panel>
		</ta:panel>
		<ta:panel id="gsylfbxDetailHisPanel" key="工伤医疗费详细信息(未核定)">
			<ta:datagrid id="gsylfbxDetailHisGrid" onRowDBClick="clickFn" haveSn="true" height="100px">
				<ta:datagridItem id="aaz127" key="工伤认定ID" hiddenColumn="false" />
				<ta:datagridItem id="aaz194" key="工伤医疗登记情况ID" hiddenColumn="false" />
				<ta:datagridItem id="aae196" key="发票张数" width="80" />
				<ta:datagridItem id="ylc051" key="发票费用总金额" width="105" />
				<ta:datagridItem id="ake051" key="个人自费金额" width="100" />
				<ta:datagridItem id="aae187" key="基金支付核定金额" width="115" />
				<ta:datagridItem id="aka078" key="就诊方式" collection="AKA078" />
				<ta:datagridItem id="ylf102" key="救助类型" collection="YLF102" />
				<ta:datagridItem id="ylc052" key="住院补助费" />
				<ta:datagridItem id="ylc053" key="医疗费" />
				<ta:datagridItem id="akb020" key="医院代码" hiddenColumn="false" />
				<ta:datagridItem id="akb021" key="医院名称" width="100" />
				<ta:datagridItem id="ylf013" key="门诊时间" dataType="date" />
				<ta:datagridItem id="aae030" key="出院时间" dataType="date" />
				<ta:datagridItem id="aae031" key="入院时间" dataType="date" />
				<ta:datagridItem id="ylf101" key="住院天数" />
				<ta:datagridItem id="aae013" key="备注" />
				<ta:datagridItem id="aaz002" key="业务日志id" hiddenColumn="false" />
			</ta:datagrid>
		</ta:panel>

		<ta:panel id="gsfzqjfbxDetailHisPanel" key="工伤辅助器具详细信息(未核定)">
			<ta:datagrid id="gsfzqjfbxDetailHisGrid" forceFitColumns="true" haveSn="true" height="100px" selectType="radio">
				<ta:datagridItem id="aaz127" key="工伤认定ID" hiddenColumn="false" />
				<ta:datagridItem id="aaz195" key="辅助器具配置登记ID" hiddenColumn="false" />
				<ta:datagridItem id="aaz106" key="辅助器具配置机构ID" hiddenColumn="false" />
				<ta:datagridItem id="aae196" key="发票张数" width="80" />
				<ta:datagridItem id="ylc051" key="发票费用总金额" width="105" />
				<ta:datagridItem id="aae187" key="基金支付核定金额" width="115" />
				<ta:datagridItem id="ylc052" key="住院补助费" />
				<ta:datagridItem id="aae030" key="出院时间" dataType="date" />
				<ta:datagridItem id="aae031" key="入院时间" dataType="date" />
				<ta:datagridItem id="ylf101" key="住院天数"  />
				<ta:datagridItem id="akb020" key="医院代码" hiddenColumn="false" />
				<ta:datagridItem id="akb021" key="机构名称" />
				<ta:datagridItem id="aaz217" key="人员医疗就诊事件ID" hiddenColumn="false" />
				<ta:datagridItem id="aaz002" key="业务日志id" hiddenColumn="false" />
			</ta:datagrid>
		</ta:panel>
		<%@ include file="/yhsi3/benefit/common/paymentBaseInfo.jsp"%>
		<ta:box cols="2">
			<ta:panel id="dqdyxx" key="本次核定信息" height="153px" bodyStyle="margin:0px">
				<ta:datagrid id="dqdyxxList" forceFitColumns="true">
					<ta:datagridItem id="aaa036" key="待遇项目" collection="AAA036">
					</ta:datagridItem>
					<ta:datagridItem id="aae128" key="核发金额">
					</ta:datagridItem>
					<ta:datagridItem id="ylc033" key="第三方赔付金额">
					</ta:datagridItem>
					<ta:datagridItem id="aae016" key="复核标志" collection="AAE016">
					</ta:datagridItem>
					<ta:datagridItem id="aae036" key="经办时间">
					</ta:datagridItem>
				</ta:datagrid>
			</ta:panel>

			<ta:panel id="hisdyxx" key="历史核定信息" height="153px" bodyStyle="margin:0px">
				<ta:datagrid id="hisdyxxList" forceFitColumns="true">
					<ta:datagridItem id="aaa036" key="待遇项目" collection="AAA036">
					</ta:datagridItem>
					<ta:datagridItem id="aae128" key="核发金额">
					</ta:datagridItem>
					<ta:datagridItem id="ylc033" key="第三方赔付金额">
					</ta:datagridItem>
					<ta:datagridItem id="aae016" key="复核标志" collection="AAE016">
					</ta:datagridItem>
					<ta:datagridItem id="aae036" key="经办时间">
					</ta:datagridItem>
				</ta:datagrid>
			</ta:panel>
		</ta:box>
	</ta:form>
</body>
</html>
<script type="text/javascript">
	//初始化布局
	$(document).ready(function() {
		$("form").css("overflow", "auto");
	});

	//回调函数
	function fn_queryInfo() {
		if (g_Suggest != "") {
			fn_setPersonBaseInfoData();
			Base.submit("jbxxfset","medicalCalculateAction!queryPersonInfo.do");
		}
	}

	//选择动作
	function fnGsxxSelectChange(rowsData, n) {
		if (rowsData == "") {
			return false;
		}

		Base.setValue("aaz127", rowsData.aaz127);
		Base.setValue("aab001", rowsData.aab001);
	 	Base.setValue("aae044", rowsData.aae044);
		Base.submit("", "fzqjCalculateAction!queryUnitInfo.do", {
			"dto['aaz127']" : rowsData.aaz127,
			"dto['aac001']" : Base.getValue("aac001"),
			"dto['aaz002']" : Base.getValue("aaz002")
		}, null, null, fnChange);
		
		//queryHisInfo();
	}

	//查询历史
	function queryHisInfo() {
		var aaz127 = Base.getValue("aaz127");
		var aaa036 = Base.getValue("aaa036");
		if (aaz127 == "" || aaa036 == "") {
			return false;
		}

		Base.submit("procInc,jbxxfset","fzqjCalculateAction!queryHisInfo.do", {
					"dto['aaz127']" : aaz127,
					"dto['aaa036']" : aaa036,
					"dto['aac001']" : Base.getValue("aac001")
				});
	}

	//根据待遇类型控制输入页面
	function fnChange() {
		var aaa036 = Base.getValue("aaa036");
		if (aaa036 == null || aaa036 == "") {
			return false;
		}
		if (aaa036 == "400012") {
			Base.showObj("gsfzqjfbxDetailHisPanel");
			Base.hideObj("gsylfbxDetailHisPanel,aae129");
			queryHisInfo();
		} else if (aaa036 == "400010") {
			Base.showObj("gsylfbxDetailHisPanel");
			Base.hideObj("gsfzqjfbxDetailHisPanel,aae129");
			queryHisInfo();
		}
	}

	//双击列表数据查询文件内容
	function clickFn(e, rowdata) {
		Base.openWindow("fileInfo", ">>明细内容","medicalCalculateAction!toEdit.do", {
					"dto['aaz194']" : rowdata.aaz194}, "95%", "90%", null, null, true);
	}

	//提交
	function submitData() {

		var gs = Base.getGridSelectedRows("gsxxList");
		if (gs.length == 0) {
			Base.alert("请先选择本次审理的工伤认定信息!", "error");
			return false;
		}

		var aaa036 = Base.getValue("aaa036");
		var bx = "";
		//医疗费
		if (aaa036 == "400010") {
			var bx = Base.getGridData("gsylfbxDetailHisGrid");
			if (bx.length == 0) {
				Base.alert("找不到需要审理的医疗费信息!","error");
				return false;
			}
		}
		//辅助器具
		else if (aaa036 == "400012") {
			var bx = Base.getGridData("gsfzqjfbxDetailHisGrid");
			if (bx.length == 0) {
				Base.alert("找不到需要审理的辅助器具信息!", "error");
				return false;
			}
		}
		var rowdata = Base.getGridSelectedRows("gsfzqjfbxDetailHisGrid");
	    if (rowdata == '' || rowdata == null){
	        alert("请选择要核定的辅配费！");
	        return false;
	     }			
	    var aaz194 = rowdata[0].aaz195;
		Base.submit("form1", "medicalCalculateAction!toSave.do",{"medicalList":Ta.util.obj2string(bx),"dto['aaz194']":aaz194},null,null,function(){
			Base.setEnable("printBtn");
		});
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>
