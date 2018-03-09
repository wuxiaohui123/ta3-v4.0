<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>参保关系转移申请(复核)</title>
<%@ include file="/ta/inc.jsp"%>
</head>
<body class="no-scrollbar">
	<ta:pageloading />
	<ta:toolbar id="tlb">
		<ta:toolbarItem id="saveBtn" key="保存[S]" icon="icon-save" hotKey="S" onClick="toSave();" />
		<ta:toolbarItem id="closeBtn" key="关闭[C]" icon="icon-remove" hotKey="C" onClick="closeWin();" />
	</ta:toolbar>
	<ta:form id="form1" fit="true">
		<ta:panel key="审核信息" height="85">
			<ta:box id="procInc">
				<%@ include file="/yhsi3/comm/veritySuggestView1.jsp"%>
			</ta:box>
			<%@ include file="/yhsi3/comm/veritySuggestView2.jsp"%>
		</ta:panel>
		<ta:box id="hideArea">
		</ta:box>
		<ta:text id="fhjc" display="false" key="复核级次" />
		<ta:tabs id="tabs" fit="true">
			<ta:tab key="个人基本信息和参保信息" id="tab1">
				<ta:panel id="ryjbxx" key="人员基本信息" cols="3">
					<%@ include file="/yhsi3/commonJSP/ryjbxx.jsp"%>
				</ta:panel>
				<ta:panel id="grcbxx" key="个人参保信息" expanded="false" scalable="false" fit="true">
					<ta:datagrid id="insurlist" enableColumnMove="true" selectType="radio" haveSn="true" onSelectChange="getInfo" border="true" snWidth="20" fit="true">
						<%@ include file="/yhsi3/commonJSP/grcbxx.jsp"%>
					</ta:datagrid>
				</ta:panel>
			</ta:tab>
			<ta:tab key="关系转移接续申请表和联系函" id="tab2">
				<ta:panel key="关系转移接续申请表" cols="3" id="lxh" expanded="false" scalable="false">
					<%@ include file="/yhsi3/commonJSP/ic89_sqb_edit.jsp"%>
				</ta:panel>
				<ta:panel key="关系转移接续联系函" id="lxh_2" cols="3" expanded="false" scalable="false">
					<%@ include file="/yhsi3/commonJSP/ic89_lxh_edit.jsp"%>
				</ta:panel>
			</ta:tab>
			<ta:tab key="历史关系转移接续联系函" id="tab3">
				<ta:datagrid id="ic89list" enableColumnMove="true" haveSn="true" snWidth="20" fit="true">
					<ta:datagridItem id="print" key="打印" icon="icon-print" align="center" width="40" dataAlign="center" click="toPrint" />
					<%@ include file="/yhsi3/commonJSP/ic89List.jsp"%>
				</ta:datagrid>
			</ta:tab>
			<ta:tab id="tb_fzjg" key="事件流程记录">
				<%@ include file="/yhsi3/commonJSP/sjlcjl.jsp"%>
			</ta:tab>
		</ta:tabs>
	</ta:form>
	<%@ include file="/yhsi3/comm/print.jsp"%>
</body>
</html>
<script type="text/javascript">
	$(document).ready(function() {
		$("body").taLayout();
	});
	
	//关闭窗口
	function closeWin() {
		parent.Base.closeWindow('userwin');
	}
	
	//保存
	function toSave() {
		Base.submit("form1", "insurTransferApplyCheckAction!toSave.do");
	}
	
	//行打印
	function toPrint(data, e) {
		var yae099 = data.yae099;
		if (yae099 == '' || yae099 == null) {
			alert("请选择需要打印的数据查询条件yae099！");
			return;
		}
		var prm = "yae099=" + data.yae099;
		fnPrintComm("zy_lxh.raq", prm);
	}
	
	// 根据选择的参保信息获取机构信息
	function getInfo(rowdata, n) {
		var aaz002 = Base.getValue('aaz002');
		if (aaz002 == '' || aaz002 == null) {
			Base.clearData("lxh");
			Base.clearData("lxh_2");
			if (n > 0) {
				var data = Base.getGridSelectedRows("insurlist");
				Base.submit(null, "insurTransferApplyAction!getJGXX.do", {
					"dto['dbclick']": Base.getValue("dbclick"),
					"dto['aae140']": data[0].aae140
				});
			} else {
				Base.submit(null, "insurTransferApplyAction!getJGXX.do", {
					"dto['dbclick']": "no"
				});
			}
		}
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>