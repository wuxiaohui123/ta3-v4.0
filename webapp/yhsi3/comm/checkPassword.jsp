<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>密码验证</title>
<%@ include file="/ta/inc.jsp"%>
</head>
<body>
	<ta:form id="form1">
	    <ta:text id="jlcs" type="password" display="false"/>
	    <ta:text id="aaa121" key="业务类型" display="false"/>
	    <ta:text id="aaz010" key="当事人ID" display="false"/>
	    <ta:panel id="pnl_yz">
		    <ta:datagrid id="dg_yz">
			    <ta:datagridItem id="yae858" key="业务规则ID" align="center" dataAlign="center" hiddenColumn="false"></ta:datagridItem>
			    <ta:datagridItem id="aaa121" collection="AAA121" key="业务类型" align="center" dataAlign="center" maxChart="14"></ta:datagridItem>
				<ta:datagridItem id="yae859" key="业务规则" align="center" dataAlign="center" showDetailed="true" maxChart="50"></ta:datagridItem>
			</ta:datagrid>
		</ta:panel>
	    <ta:box id="box_yz">
	        <ta:buttonLayout id="tlb" span="2">
				<ta:button id="btnSave_yz" icon="xui-icon-spotSave" key="验证" onClick="checkMM()" />
	            <ta:button id="btnSave1" icon="xui-icon-spotSave" key="随机密码申请" onClick="toRandomPW()" />
	        </ta:buttonLayout>
	        <ta:box id="pnl_yz" cols="3">
			    <ta:panel id="pnl1" span="1" hasBorder="false">
			    </ta:panel>
				<ta:panel span="1" key="密码验证" id="pwCreate">
				    <ta:selectInput id="yae853" key="密码类型" collection="YAE853"/>
					<ta:text id="yae854" key="密码" type="password" />
				</ta:panel>
				<ta:panel id="pnl2" span="1" hasBorder="false">
			    </ta:panel>
			</ta:box>
	    </ta:box>
		<ta:box id="box_sq" fit="true">
		    <ta:buttonLayout id="ButtonLayout_sq">
				<ta:button id="btnSave_sq" icon="xui-icon-spotSave" key="申请[S]" hotKey="alt+S" onClick="fnSaveSq()"/>
			    <ta:button id="btnShowYz" icon="xui-icon-spotSave" key="密码验证" onClick="fnShow_yz()" />
			</ta:buttonLayout>
			<ta:box id="pnl_sq" cols="3" fit="true">
			    <ta:panel id="pnl1_sq" span="1" hasBorder="false" columnWidth="0.1">
			    </ta:panel>
				<ta:panel span="1" key="随机密码业务规则申请" id="pwCreate_sq" columnWidth="0.8" height="400">
					<ta:datagrid id="dg_sq" selectType="checkbox" columnFilter="true" fit="true" haveSn="true">
					    <ta:datagridItem id="yae858" key="业务规则ID" align="center" dataAlign="center" hiddenColumn="false"></ta:datagridItem>
					    <ta:datagridItem id="aaa121" collection="AAA121" key="业务类型" align="center" dataAlign="center" maxChart="14"></ta:datagridItem>
					    <ta:datagridItem id="yae859" key="业务规则" align="center" dataAlign="center" showDetailed="true" maxChart="50"></ta:datagridItem>
					</ta:datagrid>
					<ta:text id="aae013" key="备注" maxLength="100" labelWidth="20"/>
				</ta:panel>
				<ta:panel id="pnl2_sq" span="1" hasBorder="false" columnWidth="0.1">
			    </ta:panel>
			</ta:box>
		</ta:box>
	</ta:form>
</body>
</html>
<script type="text/javascript">
	$(document).ready(function () {
		$("body").taLayout();
		Base.hideObj("box_sq,pnl_yz");
	});
	function checkMM(){
	    var dg_yz = Base.getGridData("dg_yz");
	    var param = {};
	  	param.dg_yz = Ta.util.obj2string(dg_yz);
		Base.submit("form1",myPath()+"/process/synthesis/checkPaswordAction!checkMM.do",param,false,false,
			function(){
			    top._cbinfojlcs = Base.getValue("jlcs");
			    Base.closeWindow("CheckPasswordInfo");
			},function(){
			    Base.setValue("yae854","");
			});
	}
	//随机密码申请  展示申请的页面 隐藏验证的页面
	function toRandomPW(){
	    //隐藏验证的页面及按钮
	    Base.hideObj("tlb,box_yz");
	    Base.showObj("box_sq");
	}
	//随机密码申请
	function fnSaveSq(){
	    var dg_sq = Base.getGridSelectedRows("dg_sq");
	    if(dg_sq.length==0){
	       Base.alert("请勾选随机密码业务规则！"); 
	    }
	    var param = {};
	  	param.dg_sq = Ta.util.obj2string(dg_sq);
	    Base.submit("aaa121,aaz010,aae013","checkPaswordAction!toCheckPW.do",param);
	}
	//密码验证 展示密码验证的页面
	function fnShow_yz(){
	    Base.hideObj("box_sq");
	    Base.showObj("box_yz");
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>