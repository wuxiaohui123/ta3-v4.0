<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>参保关系转出登记</title>
<%@ include file="/ta/inc.jsp"%>
</head>
<body class="no-scrollbar">
	<ta:pageloading />
	<ta:toolbar id="tlb">
		<ta:button id="saveBtn" key="保存[S]" icon="xui-icon-spotSave" hotKey="ctrl+S" onClick="toSave();" asToolBarItem="true" />
		<ta:button id="printBtn1" key="打印转移单" icon="icon-print" onClick="fnPrint1();" asToolBarItem="true" />
		<ta:button id="printBtn2" key="打印历史明细" icon="icon-print" onClick="fnPrint2();" asToolBarItem="true" />
		<ta:button id="printBtn3" key="打印拨款单[P]" icon="icon-print" hotKey="P" onClick="fnPrint3()" asToolBarItem="true" />
		<ta:button id="closeBtn" key="关闭[C]" icon="xui-icon-spotClose" hotKey="ctrl+C" onClick="closeWin();" asToolBarItem="true" />
		<ta:button id="resetBtn" key="重置[R]" icon="xui-icon-spotReset" hotKey="ctrl+R" type="resetPage" asToolBarItem="true" />
	</ta:toolbar>
	<ta:form id="form1" fit="true">
		<ta:box id="procInc">
			<%@ include file="/yhsi3/comm/veritySuggestView1.jsp"%>
		</ta:box>
		<ta:box id="hideArea">
			<ta:text id="aaz002" key="业务日志ID" display="false" />
		</ta:box>
		<ta:tabs id="tabs" fit="true">
			<ta:tab key="个人基本信息和参保信息" id="tab1">
				<ta:panel id="ryjbxx" key="人员基本信息" cols="3" expanded="false" scalable="false">
					<%@ include file="/yhsi3/commonJSP/ryjbxx.jsp"%>
					<ta:selectInput id="zhlb" labelWidth="120" data="[{'id':'0','name':'一般账户'},{'id':'1','name':'临时缴费账户'}]" key="账户类别" required="true" />
					<ta:date id="aab305_1" key="首次参保地实行个人缴费时间" labelWidth="200" issue="true" showSelectPanel="true" />
					<ta:textarea id="beizhu" key="备注" height="70" labelWidth="120" span="3" />
					<ta:textarea id="aae011" key="经办人" height="70" display="false" />
				</ta:panel>
				<ta:panel id="grcbxx" key="个人参保信息" expanded="false" scalable="false" fit="true">
					<ta:datagrid id="insurlist" enableColumnMove="true" selectType="radio" haveSn="true" border="true" onSelectChange="getInfo" snWidth="20" fit="true">
						<%@ include file="/yhsi3/commonJSP/grcbxx.jsp"%>
					</ta:datagrid>
				</ta:panel>
			</ta:tab>
			<ta:tab key="缴费信息" id="tab2">
				<ta:datagrid id="ac43a1list" enableColumnMove="true" forceFitColumns="true" haveSn="true" snWidth="30" fit="true">
					<ta:datagridItem id="aab301" key="行政区划" maxChart="5" align="center" dataAlign="left" collection="AAB301" />
					<ta:datagridItem id="aae140" key="险种类型" maxChart="7" collection="aae140" align="center" dataAlign="left" />
					<ta:datagridItem id="aae003" key="费款所属期" maxChart="4" align="center" dataAlign="center" />
					<ta:datagridItem id="aac040" key="缴费工资" maxChart="4" align="center" dataAlign="right" />
					<ta:datagridItem id="aae180" key="缴费基数" maxChart="4" align="center" dataAlign="right" />
					<ta:datagridItem id="aae079" key="到账年月" maxChart="6" dataType="date" align="center" dataAlign="left" />
					<ta:datagridItem id="dwhzh" key="单位划账户" maxChart="4" align="center" dataAlign="right" totals="sum" tatalsTextShow="false" />
					<ta:datagridItem id="dwhtc" key="单位划统筹" maxChart="4" align="center" dataAlign="right" totals="sum" tatalsTextShow="false" />
					<ta:datagridItem id="grhzh" key="个人划账户" maxChart="4" align="center" dataAlign="right" totals="sum" tatalsTextShow="false" />
					<ta:datagridItem id="grhtc" key="个人划统筹" maxChart="4" align="center" dataAlign="right" totals="sum" tatalsTextShow="false" />
				</ta:datagrid>
			</ta:tab>
			<ta:tab key="关系转移接续联系函" id="tab3">
				<ta:panel key="关系转移接续申请表" cols="3" id="lxh" expanded="false" scalable="false">
					<%@ include file="/yhsi3/commonJSP/ic89_sqb.jsp"%>
				</ta:panel>
				<ta:panel key="关系转移接续联系函" id="lxh_2" cols="3" expanded="false" scalable="false">
					<%@ include file="/yhsi3/commonJSP/ic89_lxh.jsp"%>
				</ta:panel>
			</ta:tab>
			<ta:tab key="关系转移接续信息表（一）" id="tab4">
				<ta:panel id="pnlJBXX" key="人员基本信息" cols="2" height="133" expanded="false" scalable="false">
					<%@ include file="/yhsi3/commonJSP/ic90_jbxx.jsp"%>
				</ta:panel>
				<ta:panel id="pnlJJXX" key="基金转移信息" height="82" cols="2" expanded="false" scalable="false">
					<%@ include file="/yhsi3/commonJSP/ic90_jjxx.jsp"%>
				</ta:panel>
			</ta:tab>
			<ta:tab key="关系转移接续信息表（二）" id="tab5">
				<ta:panel key="历年缴费及个人账户记账信息" id="id_2" expanded="false" scalable="false" fit="true">
					<ta:datagrid id="ic91list" enableColumnMove="true" snWidth="30" haveSn="true" fit="true">
						<%@ include file="/yhsi3/commonJSP/ic91.jsp"%>
					</ta:datagrid>
				</ta:panel>
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
		Base.focus('aac001');
		initializeSuggestFramework(1, "ac01", "aac001", 710, 400, 3, fn_getQuery, 0, false);
	});

	//回调查询信息
	function fn_getQuery() {
		Base.setValue("aac001", g_Suggest[2]); //1 姓名 2个人编号 3 身份证	
		Base.submit("from1", "insurTransOutRegisterAction!getQueryInfo.do", {
			"dto['aac001']" : Base.getValue('aac001')
		});
	}

	//保存
	function toSave() {
		Base.submit("form1", "insurTransOutRegisterAction!toSave.do");
	}

	//按钮打印
	function toPrint() {
		var yae099 = Base.getValue('yae099');
		if (yae099 == '' || yae099 == null) {
			alert("请获取到yae099,请检查过程传出值！");
			return;
		}
		var prm = "yae099=" + yae099;
		fnPrintComm("contactLetter.raq", prm);
	}

	//行打印
	function fnClick(data, e) {
		var yac196 = data.yac196;
		//alert(yac196);
		if (yac196 == '' || yac196 == null) {
			alert("请选择需要打印的数据！");
			return;
		}
		var prm = "yac196=" + yac196;
		fnPrintComm("contactLetter.raq", prm);
	}

	//关闭窗口
	function closeWin() {
		parent.Base.closeWindow('userwin');
	}

	// 根据选择的参保信息获取机构信息
	function getInfo(rowdata, n) {
		var aaz002 = Base.getValue('aaz002');
		if (aaz002 == '' || aaz002 == null) {
			Base.clearData("lxh");
			Base.clearData("lxh_2");
			if (n > 0) {
				var data = Base.getGridSelectedRows("insurlist");
				Base.submit(null, "insurTransOutRegisterAction!getJGXX.do", {
					"dto['dbclick']" : Base.getValue("dbclick"),
					"dto['aae140']" : data[0].aae140,
					"dto['aac001']" : data[0].aac001
				});
			} else {
				Base.submit(null, "insurTransOutRegisterAction!getJGXX.do", {
					"dto['dbclick']" : "no"
				});
			}
		}
	}

	//打印信息表一    
	function fnPrint1() {
		//通过日志表获取本次ic90和ac27中的信息
		var aac001 = Base.getValue("aac001");
		var aaz002 = Base.getValue("aaz002");
		var zhlb = Base.getValue("zhlb");
		var fileName = "qwzyxxb1.raq";
		var prm = "prm_aac001=" + aac001 + ";prm_aaz002=" + aaz002 + ";prm_zhlb=" + zhlb;
		//通过传过去的aac001 和 aaz002进行打印数据
		fnPrintComm(fileName, prm);
	}

	//打印信息表二  
	function fnPrint2() {
		//通过日志表获取本次ic91和ac27中的信息
		var aac001 = Base.getValue("aac001");
		var aaz002 = Base.getValue("aaz002");
		var zhlb = Base.getValue("zhlb");
		var fileName = "qwzyxxb2.raq";
		var beizhu = Base.getValue("beizhu");
		var prm = "prm_aac001=" + aac001 + ";prm_aaz002=" + aaz002 + ";prm_zhlb=" + zhlb + ";prm_beizhu=" + beizhu;
		//通过传过去的aac001 和 aaz002进行打印数据
		fnPrintComm(fileName, prm);
	}

	//打印拨款单 
	function fnPrint3() {
		//通过日志表获取本次ic91和ac27中的信息
		var aac001 = Base.getValue("aac001");
		var aaz002 = Base.getValue("aaz002");
		var aae011 = Base.getValue("aae011");
		var fileName = "WZSTFD_ylsw.raq";
		var prm = "aac001=" + aac001 + ";aaz002=" + aaz002 + ";aae011=" + aae011;
		//通过传过去的aac001 和 aaz002进行打印数据
		fnPrintComm(fileName, prm);
	}

	function fn_setRyInfo() {
		Base.submit("from1", "insurTransOutRegisterAction!getQueryInfo.do", {
			"dto['aac001']" : Base.getValue('aac001')
		});
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>