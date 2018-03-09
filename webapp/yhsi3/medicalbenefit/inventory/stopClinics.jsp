<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>中心诊疗项目修改</title>
<%@ include file="/ta/inc.jsp"%>
</head>
<body class="yes-scrollbar" >
	<ta:pageloading />
	<ta:toolbar id="ButtonLayout1">
		<ta:toolbarItem id="btnSave" key="保存[S]" icon="xui-icon-spotSave" hotKey="S" onClick="toSave()" />
<%--		<ta:button  id="btnReset" key="重置[R]" icon="xui-icon-spotReset" hotKey="R"  asToolBarItem="true"  type="resetPage" />--%>
		<ta:button id="closeBtn" key="关闭[C]" hotKey="ctrl+C" icon="xui-icon-spotClose" onClick="closeWin();" asToolBarItem="true"/>
		<ta:button id="btnShjl" icon="icon-save" key="审核记录" asToolBarItem="true"  onClick="verityHistorySuggestView();" display="false"/>
	</ta:toolbar>
	<ta:form id="form1" fit="true">
		<ta:text id="aaz231"  key="社保三大目录ID"  readOnly="true" display="false"  />
		<ta:text id="aaz234"  key="社保三大目录维护事件ID"  readOnly="true" display="false"  />
		<ta:text id="flag"  readOnly="true"  display="false"  value="stopClinics"/>
		<ta:panel  id="fdtBaseinfo" key="社保中心目录基本信息" cols="3" >
				<ta:text id="ake001" key="社保三大目录编码" onChange="rpc()" readOnly="true" labelWidth="150" required="true"/>
				<ta:text id="ake002" key="社保三大目录名称" labelWidth="150" readOnly="true" span="2"/>
				<ta:selectInput id="ake003" key="三大目录类别" collection="AKE003" value="2" readOnly="true" labelWidth="150"  />
				<ta:text id="aka020" key="拼音助记码" labelWidth="150"  readOnly="true" />
				<ta:text id="aka021" key="五笔助记码"  labelWidth="150"  readOnly="true" />
				<ta:selectInput id="aka022" key="医疗使用标志" collection="AKA022"  labelWidth="150" readOnly="true" display="false"/>
				<ta:selectInput id="ala011" key="工伤使用标志" collection="ALA011"  labelWidth="150"  readOnly="true" display="false"/>
				<ta:selectInput id="ama011" key="生育使用标志" collection="AMA011"  labelWidth="150"  readOnly="true" display="false"/>
				<ta:selectInput id="aka063" key="医疗发票项目类别" collection="AKA063" labelWidth="150"  readOnly="true" />
				<ta:selectInput id="aka065" key="收费项目等级"  collection="AKA065"  labelWidth="150" readOnly="true"/>
				<ta:selectInput id="ake004" key="生产地类别" collection="AKE004" labelWidth="150" readOnly="true"/>
				<ta:text id="akb020" key="服务机构编号" labelWidth="150" readOnly="true"/>
			    <ta:text id="akb021" key="服务机构名称"  span="2"  labelWidth="150" readOnly="true"/>
				<ta:date id="aae030" key="开始日期" showSelectPanel="true" labelWidth="150" required="true" readOnly="true"/>
				<ta:date id="aae031" key="结束生效日期" showSelectPanel="true" labelWidth="150"  required="true" onChange="checkDate(this)"/>
				<ta:text id="yke005" key="项目内涵" labelWidth="150"  readOnly="true" span="3"/>
				<ta:text id="yke006" key="除外内容"  labelWidth="150" readOnly="true" span="3"/>
				<ta:text id="aae013" key="备注" maxLength="200" labelWidth="150" readOnly="true" span="3" />
				<ta:selectInput id="aja006" key="失业使用标志" collection="AJA006" labelWidth="150"  readOnly="true" display="false"/>
				<ta:selectInput id="aka052" key="使用单位" collection="AKA052" display="false" labelWidth="150" readOnly="true" />
				<ta:selectInput id="yke002" key="计价单位" collection="AKA052" display="false" labelWidth="150" readOnly="true" />
				<ta:selectInput id="aka032" key="分类二"  collection="AKA032" display="false" labelWidth="150" readOnly="true"/>
				<ta:selectInput id="aka033" key="分类三"  collection="AKA033" display="false" labelWidth="150" readOnly="true"/>
				<ta:selectInput id="aka034" key="分类四"  collection="AKA034" display="false" labelWidth="150" readOnly="true"/>
				
		</ta:panel>
		<ta:box id="bxCs2" cols="2" fit="true">
			<ta:panel id="dgZfbl2" key="自付比例参数" height="230px">
				<ta:datagrid id="dgZfbl" fit="true" haveSn="true" forceFitColumns="true">
					<ta:datagridItem id="aac066" key="参保身份" collection="AAC066"  showDetailed="true" width="100" hiddenColumn="true"/>
					<ta:datagridItem id="aae140" key="险种类型" collection="AAE140" showDetailed="true" align="center" />
					<ta:datagridItem id="aka057" key="自付比例" showDetailed="true" width="120" dataAlign="right" align="center"/>
					<ta:datagridItem id="aae030" key="开始日期" dataType="date" showDetailed="true"  align="center" width="120"/>
				
				</ta:datagrid>
			</ta:panel>
			<ta:panel id="pnlXjdy2"  key="限价定义参数" height="230px" >
				<ta:datagrid id="dgXjdy" fit="true" haveSn="true" forceFitColumns="true">
					<ta:datagridItem id="akb095" key="限价医院等级" collection="AKB095" showDetailed="true" width="140" align="center"/>
					<ta:datagridItem id="aka068" key="定价上限金额" dataType="number" showDetailed="true" width="100" dataAlign="right" align="center"/>
					<ta:datagridItem id="aae030" key="开始日期" dataType="date" showDetailed="true" align="center" width="120" />
			
				</ta:datagrid>
			</ta:panel>
		</ta:box>
	</ta:form>
</body>
</html>
<script type="text/javascript">
	$(document).ready(function() {
		$("body").taLayout();
		initializeSuggestFramework(1,"","ake001",500,300,4,fn_callback,0,false);
		//Base.readOnly("ake001");
	});
	function rpc(){
		sfwQueryUtil(1,"getKa20Filter",Base.getValue("ake001")+',1');
	}  
	//RPC回调函数
	function fn_callback() {
		Base.resetForm('form1');
		Base.clearGridData("dgZfbl");
		Base.clearGridData("dgXjdy");
		Base.clearGridData("dgZfbl2");
		Base.clearGridData("dgXjdy2");
		
		Base.setValue("aaz231",g_Suggest[0]);
		Base.submit("", "stopClinicsAction!toClinicsInfo.do", {"dto['aaz231']" : g_Suggest[0]}, null, false, null, null);
	}
	
	//查询数据库
	function query(){
		Base.submit("aaz231","stopClinicsAction!query.do");
	}
	
	//保存
	function toSave() {
		if(!checkDate('aae031')){
			return false;
		}
		if (Base.validateForm("form1")) {
			Base.confirm("确定要提交吗?", function(btn, callback) {
				if (btn) {
					Base.submit('form1','stopClinicsAction!toSave.do');
				}
			});
		}

	}
	
    //开始时间和结束时间判断
    function checkDate(obj){
        var aae030 = Base.getValue('aae030');
        var aae031 = Base.getValue('aae031');
        if(aae031 == ''){
            Base.alert("结束生效日期不能为空");
            return false;
        }
        
        if(aae030!='' && aae031!='' && aae030>aae031){
            obj.value='';
            Base.alert("结束生效日期应该晚于开始生效日期["+aae030+"]");
            return false;
        }
        return true;
    }
	//关闭窗口
	function closeWin(){
	    parent.Base.closeWindow('userwin');
	}
	
</script>
<%@ include file="/ta/incfooter.jsp"%>