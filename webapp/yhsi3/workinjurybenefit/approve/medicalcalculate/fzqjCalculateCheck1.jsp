<%@ page language="java" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags" %>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>医疗费用审批</title>
		<%@ include file="/ta/inc.jsp"%>
	</head>
	<body style="margin:0px;padding:0px">
		<ta:pageloading />
		<ta:toolbar id="tlb">
			<ta:button id="saveBtn" key="审核[S]" icon="xui-icon-spotSave" hotKey="S" onClick="submitData();" asToolBarItem="true" />
			<ta:button id="printBtn" icon="xui-icon-spotPrint" key="打印工伤辅助器具结算表" asToolBarItem="true" disabled="true" onClick="print()"/>
			<ta:button id="colseBtn" key="关闭[C]" icon="xui-icon-spotClose" hotKey="ctrl+C" onClick="parent.Base.closeWindow('userwin');" asToolBarItem="true" />
		</ta:toolbar>
		<ta:form id="form1" fit="true">
			<ta:box id="procInc">
			    <%@ include file="/yhsi3/benefit/common/js/benefit.js"%>
				<%@ include file="/yhsi3/comm/veritySuggestView1.jsp"%>
				<%@ include file="/yhsi3/comm/veritySuggestView2.jsp"%>
				<ta:text id="fhjc" display="false" key="复核级次" />
				<ta:text id="yab003" display="false" key="经办机构" />
			</ta:box>
			<ta:panel id="jbxxfset" key="人员基本信息" cols="3">
				<ta:text id="aac001" key="人员ID" readOnly="true" />
				<ta:text id="aac003" key="姓 名" readOnly="true" />
				<ta:text id="aac002" key="身份证号码" readOnly="true" />
				<ta:text id="aab001" key="单位ID" readOnly="true" />
				<ta:text id="aae044" key="单位名称" span="2" readOnly="true" />
				<ta:text id="aab999" key="单位管理码" display="false" />
				<ta:selectInput id="aac060" key="生存状态" collection="AAC060" display="false" />
				<ta:selectInput id="aae116" key="待遇发放状态" collection="AAE116" display="false" />
			</ta:panel>
			<!-- 初始化工伤认定信息 -->
			<ta:panel id="gsrdxx" key="工伤信息">
				<ta:datagrid id="gsxxList" height="80px" forceFitColumns="true">
					<ta:datagridItem id="aaz127" key="工伤登记号" hiddenColumn="true" />
					<ta:datagridItem id="alc020" key="工伤时间" />
					<ta:datagridItem id="ylc035" key="人员类别" collection="YLC035"/>
					<ta:datagridItem id="alc022" key="伤害部位" collection="ALC022" />
					<ta:datagridItem id="alc021" key="伤害程度" collection="ALC021" />
					<ta:datagridItem id="ala040" key="伤残等级" collection="ALA040" />
					<ta:datagridItem id="alc060" key="护理依赖等级" collection="ALC060" />
					<ta:datagridItem id="alc031" key="认定时间" />
					<ta:datagridItem id="alc034" key="鉴定时间" />
					<ta:datagridItem id="ylc044" key="医疗终结期" />
					<ta:datagridItem id="alc027" key="工亡类别" collection="ALC027"/>
					<ta:datagridItem id="ala017" key="职业病" collection="ALA017"/>
					<ta:datagridItem id="alc040" key="因公死亡(失踪)日期" width="140"/>
				</ta:datagrid>
			</ta:panel>
            <ta:panel id="ffxx" key="发放信息" cols="3">
               <ta:selectInput id="yad169" key="支付对象" required="true" collection="YAD169" readOnly="true"/>
            </ta:panel>
			<ta:panel id="gsylfbxDetailHisPanel" key="工伤医疗费详细信息(未核定)">
				<ta:datagrid id="gsylfbxDetailHisGrid" haveSn="true" height="80px">
					<ta:datagridItem id="aaz127" key="工伤认定ID" hiddenColumn="false" />
					<ta:datagridItem id="aaz194" key="工伤医疗登记情况ID" hiddenColumn="false" />
					<ta:datagridItem id="aae196" key="发票张数" width="100" />
					<ta:datagridItem id="ylc051" key="发票费用总金额" width="105" />
					<ta:datagridItem id="ake051" key="个人自费金额" width="100" />
					<ta:datagridItem id="aae187" key="基金支付核定金额" width="115" />
					<ta:datagridItem id="aka078" key="就诊方式" collection="AKA078" />
					<ta:datagridItem id="ylf102" key="救治类型" collection="YLF102" />
					<ta:datagridItem id="ylc052" key="住院补助费" />
					<ta:datagridItem id="ylc053" key="医疗费" />
					<ta:datagridItem id="ylc054" key="扣减金额" />
					<ta:datagridItem id="akb020" key="医院代码" hiddenColumn="false" />
					<ta:datagridItem id="akb021" key="医院名称" />
					<ta:datagridItem id="ylf013" key="门诊时间" />
					<ta:datagridItem id="aae030" key="出院时间" />
					<ta:datagridItem id="aae031" key="入院时间" />
					<ta:datagridItem id="ylf101" key="住院天数" />
					<ta:datagridItem id="aae013" key="备注" />
				</ta:datagrid>
			</ta:panel>

			<ta:panel id="gsfzqjfbxDetailHisPanel" key="工伤辅助器具详细信息(未核定)">
				<ta:datagrid id="gsfzqjfbxDetailHisGrid" forceFitColumns="true" haveSn="true" height="80px">
					<ta:datagridItem id="aaz127" key="工伤认定ID" hiddenColumn="false" />
				    <ta:datagridItem id="aaz195" key="辅助器具配置登记ID" hiddenColumn="false" />
				    <ta:datagridItem id="aaz106" key="辅助器具配置机构ID" hiddenColumn="false" />
				    <ta:datagridItem id="faae196" key="发票张数" />
				    <ta:datagridItem id="ylc051" key="发票费用总金额" width="105" />
				    <ta:datagridItem id="ake051" key="个人自费金额" width="100" />
				    <ta:datagridItem id="ylc054" key="扣减金额" width="100" />
				    <ta:datagridItem id="aae187" key="基金支付核定金额" width="115" />
			    	<ta:datagridItem id="aae030" key="出院时间" dataType="date" />
				    <ta:datagridItem id="aae031" key="入院时间" dataType="date" />
				    <ta:datagridItem id="ylf101" key="住院天数"  />
				    <ta:datagridItem id="aae0441" key="机构名称" />
				    <ta:datagridItem id="aaz217" key="人员医疗就诊事件ID" hiddenColumn="false" />
				    <ta:datagridItem id="aaz002" key="业务日志id" hiddenColumn="false" />
				</ta:datagrid>
			</ta:panel>
			<ta:panel id="dqdyxx" key="当前报销信息">
				<ta:datagrid id="dqdyxxList" forceFitColumns="true" haveSn="true" height="80px">
					<ta:datagridItem id="aaa036" key="待遇项目" collection="AAA036"/>
					<ta:datagridItem id="aae128" key="核发金额"/>
					<ta:datagridItem id="ylc033" key="第三方赔付金额"/>
					<ta:datagridItem id="aae016" key="复核标志" collection="AAE016"/>
					<ta:datagridItem id="aae036" key="经办时间"/>
				</ta:datagrid>
			</ta:panel>
		</ta:form>
		<iframe id="report1_printIFrame" name="report1_printIFrame" width="50" height="50" style="position:absolute;left:-100px;top:-100px"></iframe>
	</body>
</html>
<script type="text/javascript">
	//初始化布局
	$(document).ready(function() {
		//$("body").taLayout();
		$("form").css("overflow","auto");
		//checkRequired();
		//fnChange();
		var fhjc=Base.getValue("fhjc");
		if(fhjc=="2"){
			Base.showObj("printBtn");
		}
	});
 	
 	//根据待遇类型控制输入页面
	function fnChange(){
		var aaa036 = Base.getValue("aaa036");
		if(aaa036 == null || aaa036 == ""){
			return false;
		}
	  	if(aaa036=="400012"){
			Base.showObj("gsfzqjfbxDetailHisPanel");
			Base.hideObj("gsylfbxDetailHisPanel");
	  	}else if(aaa036=="400010"){
		  	Base.showObj("gsylfbxDetailHisPanel");
		  	Base.hideObj("gsfzqjfbxDetailHisPanel");
	  	}
	}
	
	//打印
	function print(){
	    var aac001 = Base.getValue("aac001");
	    var aaz002 = Base.getValue("aaz002");
	    $("#report1_printIFrame").attr("src","<%=path%>/reportServlet?action=2&name=report1&reportFileName=GS_fzqj_jsb.raq&"+
			"srcType=file&savePrintSetup=yes&appletJarName=runqian/runqianReport4Applet.jar%2Crunqian/dmGraphApplet.jar&"+
			"serverPagedPrint=no&mirror=no&"+
			"paramString=aac001="+aac001+";aaz002="+aaz002);
	}
	//提交
	function submitData(){
		
		Base.submit("form1", "medicalCalculateCheck1Action!toSave.do",null,null,null,function(){
			Base.setEnable("printBtn");
		});
	}

</script>
<%@ include file="/ta/incfooter.jsp"%>
