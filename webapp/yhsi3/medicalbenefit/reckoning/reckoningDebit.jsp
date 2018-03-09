<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" uri="/ta3"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>定点医疗机构扣款初审</title>
<%@ include file="/ta/inc.jsp"%>
</head>
 <body class="no-scrollbar">
	<ta:pageloading />
	<ta:toolbar id="tbr1" >
		<ta:toolbarItem id="btnSave" key="保存[S]" icon="xui-icon-spotSave" hotKey="S" onClick="toSave()" />
		<ta:button id="btnReset" asToolBarItem="true" key="重置[R]" icon="xui-icon-spotReset" hotKey="R" type="resetPage"/> 
	</ta:toolbar>
	<ta:form id="form1" fit="true">
		<ta:box id="procInc">
			<%@ include file="/xbpm/common/xbpmInc.jsp"%>
			<%@ include file="/yhsi3/comm/veritySuggestView1.jsp"%>
		</ta:box>
		<ta:panel id="fdstHospital" key="医疗服务机构信息" cols="3" >
			<ta:text id="akb020" key="医疗机构编码" onChange="sfwQueryUtil(2,'getKb01',Base.getValue('akb020'))" required="true" bpopTipMsg="输入医疗机构名称或ID,可自动查询相关数据！" labelWidth="160"/>
			<ta:text id="akb021" key="医疗机构名称" readOnly="true" span="2" labelWidth="160"/>
			<ta:selectInput id="akb022" key="医疗机构类型" collection="AKB022" labelWidth="160" readOnly="true" />
			<ta:selectInput id="akb097" key="医疗机构等级" collection="AKB096" labelWidth="160" readOnly="true" />
		</ta:panel>
		<ta:panel id="fdstYFXX" key="扣款信息" cols="3" >
			<ta:text id="yke106" key="医院扣款流水号" display="false"/>
			<ta:selectInput id="ykd112" key="医院扣款类型" collection="YKD112" required="true" labelWidth="160" />
			<ta:number id="yka415" key="应扣基本统筹违规扣款" min="0" max="999999999999.99" precision="2" labelWidth="160" required="true" />
			<ta:number id="yka414" key="应扣公务员统筹违规扣款" min="0" max="999999999999.99" precision="2" labelWidth="160" display="false"/>
			<ta:number id="yka413" key="应扣大额统筹违规扣款" min="0" max="999999999999.99" precision="2" labelWidth="160" display="false" />
			<ta:text id="aae013" key="备注" span="3" maxLength="120" labelWidth="160" />
		</ta:panel>
		<ta:panel id="pnlReckoning" key="已扣款金额" expanded="false" scalable="false" fit="true">
			<ta:datagrid id="dgReckoning" fit="true" forceFitColumns="true" >
				<ta:datagridItem id="yka415" key="应扣基本统筹违规扣款" dataAlign="right" align="center" width="60" formatter="fnDatagridFormatter" dataType="number" totals="sum"/>
				<ta:datagridItem id="yka413" key="应扣大额统筹违规扣款" dataAlign="right" align="center" width="120" formatter="fnDatagridFormatter" dataType="number" totals="sum" hiddenColumn="true"/>
				<ta:datagridItem id="yka414" key="应扣公务员统筹违规扣款" dataAlign="right" align="center" width="130" formatter="fnDatagridFormatter" dataType="number" totals="sum" hiddenColumn="true"/>
				<ta:datagridItem id="yka394" key="实扣基本统筹违规扣款" dataAlign="right" align="center" width="60" formatter="fnDatagridFormatter" dataType="number" totals="sum"/>
				<ta:datagridItem id="yka392" key="实扣大额统筹违规扣款" dataAlign="right" align="center" width="120" formatter="fnDatagridFormatter" dataType="number" totals="sum" hiddenColumn="true"/>
				<ta:datagridItem id="yka393" key="实扣公务员统筹违规扣款" dataAlign="right" align="center" formatter="fnDatagridFormatter" width="130" dataType="number" totals="sum" hiddenColumn="true"/>
				<ta:datagridItem id="aae013" key="备注" width="200" align="center" showDetailed="true"/>
			</ta:datagrid>
		</ta:panel>
	</ta:form>
</body>
</html>
<script type="text/javascript">
	$(document).ready(function() {
		$("body").taLayout();
		fnSetRedBorder();
		initializeSuggestFramework(2,"", "akb020", 500, 100, 4, fn_getHospital, 0, false);
	});
	function fn_getHospital(){
		Base.getJson("<%=path%>/medicalbenefit/common/baseInfoAction!getHospitalInfo.do",
					{"dto['akb020']":Base.getValue("akb020")},
					function(data){
						if (data.errMsg != null && data.errMsg != ''){
							Base.alert(data.errMsg);
							Base.setValue("akb020","");
							return false;
						}
						if(data && data.hospitalInfoDto) {
							Base.setValue("akb022",data.hospitalInfoDto.akb022);
							Base.setValue("akb097",data.hospitalInfoDto.akb097);
							Base.setValue("akb021",data.hospitalInfoDto.akb021);
							Base.submit("akb020","reckoningDebitAction!toQueryHospitalInfo.do");
						}
					});
	}
	//保存
	function toSave(){
		if(Base.validateForm("form1")){
			var yka413 = Base.getValue('yka413');
			var yka414 = Base.getValue('yka414');
			var yka415 = Base.getValue('yka415');
			yka413 = (yka413 == "" || yka413 == null) ? 0 : yka413;
			yka414 = (yka414 == "" || yka414 == null) ? 0 : yka414;
			yka415 = (yka415 == "" || yka415 == null) ? 0 : yka415;
			if(parseFloat(yka415) + parseFloat(yka414) + parseFloat(yka413) == 0){
				Base.alert("扣款金额必须大于零", "warn");
				return false;
			}
			Base.confirm("确定要保存吗?",function(yes){
				if(yes){
					Base.submit("form1","reckoningDebitAction!toSave.do");
				}
			}); 
		}else{
			Base.alert("带红星的为必输项!","warn");
		}
	}
	/**
	 * 页面数字格式化，保留2位小数
	 */
	function fnDatagridFormatter(row, cell, value, columnDef, dataContext){
		if(value || value == "0"){
			var v = parseFloat(value);
			return v.toFixed(2);
		}else{
			return "";
		}
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>