<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>单位银行信息查询</title>
		<%@ include file="/ta/inc.jsp"%>
	</head>
	<body>
		<ta:pageloading />   
		<ta:toolbar id="toolbar1">
			<ta:button key="查询[Q]" hotKey="Q" icon="xui-icon-query" onClick="fnQuery()" asToolBarItem="true" />
			<ta:button key="导出[O]" hotKey="O" id="btnOut" icon="icon-output"   onClick="fnExpFile('list');" asToolBarItem="true"/>
			<ta:button key="重置[R]" hotKey="R" icon="xui-icon-spotReset" type="resetPage" asToolBarItem="true" />
		</ta:toolbar>     
		<ta:form id="form1" fit="true">
			<ta:tabs id="tabs" fit="true">
			    <ta:tab id="tab1" key="单位银行信息">
			        <ta:datagrid id="list1" fit="true" haveSn="true" forceFitColumns="true" snWidth="40" columnFilter="true">
						<ta:datagridItem id="aab001" key="单位编号" align="center" dataAlign="left" maxChart="5" sortable="true"/>
						<ta:datagridItem id="aae044" key="单位名称" align="center" dataAlign="left" maxChart="12" showDetailed="true" sortable="true"/>
						<ta:datagridItem id="aaf002" key="银行类别" align="center" dataAlign="center" maxChart="8" collection="AAF002"/>
						<ta:datagridItem id="yae597" key="开户银行名称" align="center" dataAlign="left" maxChart="12" />
						<ta:datagridItem id="aae009" key="户名" align="center" dataAlign="center" maxChart="12" />
						<ta:datagridItem id="aae010" key="银行账号" align="center" dataAlign="left" maxChart="12" />
						<ta:datagridItem id="aae010_sb" key="社保机构银行账号" align="center" dataAlign="center" maxChart="12" />
						<ta:datagridItem id="aae009_sb" key="社保机构银行户名" align="center" dataAlign="center" maxChart="12" />
					</ta:datagrid>
			    </ta:tab>
			    <ta:tab id="tab2" key="托收银行统计(双击查看详细信息)">
			        <ta:datagrid id="list2" fit="true" haveSn="true" snWidth="40" columnFilter="true" groupingBy="aab033" onRowDBClick="fnClick2">
			            <ta:datagridItem id="aab033" key="征收方式" align="center" dataAlign="center" maxChart="19" collection="AAB033"/>
						<ta:datagridItem id="aaf002" key="银行类别" align="center" dataAlign="center" maxChart="19" collection="AAF002"/>
						<ta:datagridItem id="thts" key="同行托收单位数" align="center" dataAlign="left" maxChart="19" totals="sum" tatalsTextShow="false"/>
						<ta:datagridItem id="khts" key="跨行托收单位数" align="center" dataAlign="left" maxChart="19" totals="sum" tatalsTextShow="false"/>
					</ta:datagrid>
			    </ta:tab>
			    <ta:tab id="tab3" key="单位存在多个征收方式">
			        <ta:datagrid id="list3" fit="true" haveSn="true" snWidth="40" forceFitColumns="true">
						<ta:datagridItem id="aab001" key="单位编号" align="center" dataAlign="center" maxChart="19"/>
						<ta:datagridItem id="aae044" key="单位名称" align="center" dataAlign="left" maxChart="19"/>
						<ta:datagridItem id="aab033" key="征收方式" align="center" dataAlign="center" maxChart="19" collection="AAB033"/>
					</ta:datagrid>
			    </ta:tab>
			    <ta:tab id="tab4" key="单位参保所在地与社保银行所在地不一致">
			        <ta:datagrid id="list4" fit="true" haveSn="true" snWidth="40" forceFitColumns="true">
						<ta:datagridItem id="aab001" key="单位编号" align="center" dataAlign="center" maxChart="19"/>
						<ta:datagridItem id="aae044" key="单位名称" align="center" dataAlign="left" maxChart="19"/>
					 	<ta:datagridItem id="aae009" key="社保局开户名" align="center" dataAlign="center" maxChart="19" />
					    <ta:datagridItem id="aae010" key="社保局账户" align="center" dataAlign="center" maxChart="19" />
					</ta:datagrid>
			    </ta:tab>
			</ta:tabs>
		</ta:form>
	</body>
</html>
<script type="text/javascript">
	$(function() {    
		$("body").taLayout();
		Base.setDisabled("btnOut");
	});

	function fnQuery(){
		Base.submit(null, "unitInfoBankInfoAction!toQuery.do");
	}

   //输出excel表格信息
	function fnExpFile(gridId) {
		var rows = Base.getGridData(gridId);
		if (rows != "") {
			Base.expGridExcel(gridId);
		} else {
			Base.alert("没有数据需要导出,请确认!", "warn");
		}
	}
	
	//行双击事件  此次核定详情
	function fnClick2(e,rowdata){
        Base.openWindow("HDInfo","单位详情",myPath()+"/process/publicBusiness/publicQuery/unitPersonQuery/unitInfoBankInfoAction!toEditHD.do",
            {"dto['aab033']":rowdata.aab033,"dto['aaf002']":rowdata.aaf002},"95%","90%",null,null,true);
    }
</script>
<%@ include file="/ta/incfooter.jsp"%>