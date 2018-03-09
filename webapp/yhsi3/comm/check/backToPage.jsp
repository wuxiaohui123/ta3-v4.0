<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>backtopage</title>
<%@ include file="/ta/inc.jsp"%>
</head>
<body>
	<ta:pageloading />
		<ta:toolbar id="tlb">
		    <ta:buttonLayout align="center" span="3">
		       <ta:button id="btnQuery" icon="xui-icon-query" key="查询[Q]" hotKey="ctrl+Q" onClick="queryData()" asToolBarItem="true" />
		       <ta:button id="btnReset" icon="xui-icon-spotReset" key="重置[R]" hotKey="ctrl+R" type="resetPage" asToolBarItem="true" />
		    </ta:buttonLayout>
		</ta:toolbar>
	<ta:form id="form1"  fit="true">
		<ta:panel id="fld_emp" cols="3" key="查询条件">
			<ta:selectInput id="aaa121" key="业务类型" labelWidth="120" collection="aaa121"/>
			<ta:date id="aae036b" key="经办开始时间" labelWidth="120" showSelectPanel="true"/>
			<ta:date id="aae036e" key="经办结束时间" labelWidth="120" showSelectPanel="true"/>
			<ta:selectInput id="aae011" key="经办人" labelWidth="120" collection="AAE011" />
			<ta:text id="aac003" key="当事人名称" labelWidth="120" bpopTipMsg="可输入公民身份号码、姓名、人员ID、单位编号、单位名称"/>
			
		</ta:panel> 

		<ta:panel id="ae02a1ListPanel" key="打回重新经办列表（双击某行数据进入重新经办）" bodyStyle="margin:0px" fit="true">
			<ta:datagrid id="ae02a1ListGrid" haveSn="true"  forceFitColumns="true" fit="true" onRowDBClick="showCheckInfo" >
			   <ta:datagridItem id="yae013" key="功能目标地址" width="235px" dataAlign="center" align="center" hiddenColumn="true"/>
			   <ta:datagridItem id="aae419" key="级次" width="235px" dataAlign="center" align="center"  hiddenColumn="true"/>
			   <ta:datagridItem id="aaz002" key="业务日志编号" width="235px" dataAlign="center" align="center"/>
			   <ta:datagridItem id="aaa121" key="业务类型" collection="AAA121" width="250px" dataAlign="center" align="center"/>
			   <ta:datagridItem id="aac003" key="当事人" width="190px" dataAlign="center" align="center"/>
			   <ta:datagridItem id="aae036" key="经办时间" width="190px" dataAlign="center" align="center"/>
			   <ta:datagridItem id="aae011" key="经办人" collection="YAE092" width="190px" align="center" dataAlign="center"/>
			   <ta:datagridItem id="aaz010" key="当事人ID" width="190px" align="center" dataAlign="center" hiddenColumn="true"/>
			</ta:datagrid>
		</ta:panel>
	</ta:form>
</body>
</html>
<script type="text/javascript">
    $(document).ready(function() {
        $("body").taLayout();
        $("caption.tableView-title").css("margin-bottom", "10px");
        $("div.slick-pager-nav-dis").hide();
        $("span.slick-pager-settings").css("float", "left");
    });
    
    //双击查看经办明细
    function showCheckInfo(e, rowdata) {
        //获取码值描述
        var rdata = rowdata.grid.getOptions().collectionsDataArrayObject.aaa121;
        var descp = null;
        for (var i = 0; i < rdata.length; i++) {
            if (rowdata.aaa121 == rdata[i].id) {
                descp = rdata[i].name
                break;
            }
        }
        var title = rowdata.aac003 + "-" + descp; //标题描述
        var yae013 = rowdata.yae013;
        var aae419 = rowdata.aae419;
        if (yae013 == null || yae013 == "") {
            Base.alert("请配置 业务审批级次对应地址表 AAA4 yae013！","warn");
            return false;
        }

        Base.openWindow('userwin', title + "经办信息", '<%=basePath%>'+yae013, {
            "dto['aaz002']": rowdata.aaz002,
            "dto['aaz010']": rowdata.aaz010,
            "dto['aaa121']": rowdata.aaa121
        },
        '95%', '90%', null, queryData, true);
    }
    
    function queryData() {
        Base.submit("form1", "backToPageAction!queryCheck1List.do");
    }
</script>
<%@ include file="/ta/incfooter.jsp"%>