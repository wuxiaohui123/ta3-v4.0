<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags" %>
<html xmlns="http://www.w3.org/1999/xhtml" style="height:100%">
<html>
	<head>
		<title>供养亲属续期复核</title>
		<%@ include file="/ta/inc.jsp"%>

	</head>
	<body style="margin:0px;padding:1px;" class="no-scrollbar" >
	<ta:pageloading/>
		<ta:toolbar id="tld">
				<ta:toolbarItem id="btnSave" key="保存[S]" icon="xui-icon-spotSave" hotKey="s" onClick="toSave();"/>
				<ta:toolbarItemSeperator />
				<ta:button id="printBtn" icon="xui-icon-spotPrint" key="打印[P]" onClick="print()" hotKey="P" asToolBarItem="true"/>
				<ta:toolbarItem id="closeBtn" key="关闭[C]" icon="xui-icon-spotClose" hotKey="c"  onClick="parent.Base.closeWindow('userwin');"/>
		</ta:toolbar>
		<ta:form id="form1" fit="true">
				<ta:box id="procInc">
					<%@ include file="/yhsi3/comm/veritySuggestView1.jsp"%>			
				</ta:box>
				  <%@ include file="/yhsi3/comm/veritySuggestView2.jsp"%>
				<ta:text id="fhjc" display="false" key="复核级次"/>
				<ta:tabs fit="true" cssClass="overflow:auto">
				<ta:tab key="基本信息" >
				<ta:panel id="grjbxx" key="个人基本信息" cols="3" columnWidth="0.2" scalable="false" expanded="false">
					<ta:text id="yab003" labelWidth="130" key = "经办所属机构" display="false"/>
					<ta:text id="aaz257" key="享受定期待遇人员ID"  labelWidth="130" display="false"/>
					<ta:text id="aac001" key="个人编号"  labelWidth="130" maxLength="100"/>
					<ta:text id="aac003" key="姓名" labelWidth="130" maxLength="100"/>
					<ta:text id="aac002" key="身份证号码" labelWidth="130" maxLength="100"/>
					<ta:text id="aae210" key="开始享受年月"  labelWidth="130" />
					<ta:text id="aae235" key="终止享受年月"  labelWidth="130" />
					<ta:selectInput id="aae144" key="供养关系"  labelWidth="130" collection="AAE144"/>
					<ta:selectInput id="aae140" key="险种类型"  labelWidth="130" collection="AAE140"/>
					<ta:text id="aae019" key="金额"  labelWidth="130" />
				</ta:panel>
				<ta:panel id="xqxx" key="供养亲属续期信息" cols="3" columnWidth="0.2" scalable="false" expanded="false">
					<ta:text id="aae042" key="续期终止年月"  labelWidth="130" required="true"/>
					<ta:text id="yaz293" key="续期原因" span="2" labelWidth="130" maxLength="100"/>
					<ta:text id="yaz294" key="学校"  required="true" maxLength="200"  labelWidth="130" />
					<ta:number id="yaz295" key="学制" required="true"  max="100" min="0" labelWidth="130" />
					<ta:date id="yaz296" key="入学时间" required="true" showSelectPanel="true"  labelWidth="130"/>
				</ta:panel>
				
				</ta:tab>
				<ta:tab id="tab_caseInfo" key="事件流程记录">
			    		<%@ include file="/yhsi3/commonJSP/sjlcjl.jsp"%>
				</ta:tab>
			</ta:tabs>
		</ta:form>
		<iframe id="report1_printIFrame" name="report1_printIFrame" width="100" height="100" style="position:absolute;left:-100px;top:-100px"></iframe>
	</body>
</html>
<script type="text/javascript">
	$(document).ready(function () {
		$("body").taLayout();
// 		fnSetRedBorder();
	});
	function toSave(){
		var aae140=Base.getValue("aae140");
		if(aae140!=""){
			if(aae140=='110'){
				Base.submit("form1","renewalTerminate110Check1Action!toSave.do");
			}else if(aae140=='120'){
				Base.submit("form1","renewalTerminate120Check1Action!toSave.do");
			}else if(aae140=='410'){
				Base.submit("form1","renewalTerminate410Check1Action!toSave.do");
			
			}
		
		}
		
	}
	
	function print(){
        var aaz002 = Base.getValue("aaz002");
        var aaz257 = Base.getValue("aaz257");
        var aae140 = Base.getValue("aae140");
        var yab003 = Base.getValue("yab003");
        if(aaz002 == "" && aaz002 == null){
        	Base.alert("业务日记为空,不能打印");
        	return ;
        }
        
         if(aaz257 == "" && aaz257 == null){
        	Base.alert("享受待遇人员ID为空,不能打印");
        	return ;
        }
        if(aae140 == "" && aae140 == null){
        	Base.alert("险种为空,不能打印");
        	return ;
        }
        
        $("#report1_printIFrame").attr("src","/yhsi3/reportServlet?action=2&name=report1&reportFileName=gyxsxq.raq&"+
			"srcType=file&savePrintSetup=yes&appletJarName=runqian/runqianReport4Applet.jar%2Crunqian/dmGraphApplet.jar&"+
			"serverPagedPrint=no&mirror=no&"+
			"paramString=aaz002="+aaz002+";aaz257="+aaz257
			+";aae140="+aae140+";yab003="+yab003);
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>
