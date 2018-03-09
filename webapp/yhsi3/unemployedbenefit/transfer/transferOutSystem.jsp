<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>TransferInto</title>
		<%@ include file="/ta/inc.jsp"%>
		<%@ include file="/yhsi3/benefit/common/js/benefit.js"%>
	</head>
	<body class="no-scrollbar">
		<ta:pageloading />
		<ta:toolbar id="tlb">
			<ta:buttonLayout align="center" span="3">
				<ta:button id="btnSave" icon="xui-icon-spotSave" key="保存[S]" hotKey="S" onClick="submitData()" asToolBarItem="true" disabled="true"/>
				<ta:button id="printBtn" icon="xui-icon-spotPrint" key="打印[P]" onClick="print()" hotKey="P" asToolBarItem="true" disabled="true"/> 
				<ta:button id="btnReset" icon="xui-icon-spotReset" key="重置[R]" hotKey="R" type="resetPage" asToolBarItem="true" />
	    		<ta:button id="colseBtn" key="关闭[C]" icon="xui-icon-spotClose" hotKey="C" onClick="parent.Base.closeWindow('userwin');" asToolBarItem="true" display="false"/>
			</ta:buttonLayout>
		</ta:toolbar>
		<ta:text id="sysdate" key="系统时间" display="false" />
		<ta:form id="form1" cssStyle="overflow:auto;" fit="true">
			<ta:panel id="procInc" key="审核信息" >
				<%@ include file="/yhsi3/comm/veritySuggestView1.jsp"%>
				<%@ include file="/yhsi3/comm/veritySuggestView2.jsp"%>
				<%@ include file="/yhsi3/benefit/common/treatmentTypes.jsp"%> 
			</ta:panel>
			<ta:panel id="fld_emp" cols="3" key="基本信息">
				<%@ include file="/yhsi3/benefit/common/personBaseInfoDYAC60.jsp"%>
				<%@ include file="/yhsi3/benefit/common/personBaseInfoShow.jsp"%>
				<ta:text id="aab999" key="单位管理码" readOnly="true" display="false" labelWidth="130"/>
				<ta:text id="aab001" key="单位编号" readOnly="true" labelWidth="130" />
				<ta:text id="aae044" key="单位名称"  readOnly="true" labelWidth="130" span="2"/>
				<ta:text id="yje004" key="失业证号" readOnly="true" labelWidth="130" />
				<ta:text id="ajc090" key="失业时间" readOnly="true" labelWidth="130" />
				<ta:text id="ajc094" key="失业登记日期" readOnly="true" labelWidth="130" />
				<ta:selectInput id="aae116" key="待遇发放状态" collection="AAE116" readOnly="true" labelWidth="130" />
				<ta:text id="aae210" key="待遇开始年月" readOnly="true" labelWidth="130" />
				<ta:text id="ajc056" key="待遇终止年月" readOnly="true" labelWidth="130" />
				<ta:number id="ajc001" key="视同缴费月数" readOnly="true" labelWidth="130" />
				<ta:number id="ajc071" key="实际缴费月数" readOnly="true" labelWidth="130" />
				<ta:number id="ajc072" key="累计缴费月数" readOnly="true" labelWidth="130" display="false"/>
				
				<ta:number id="ajc097" key="应享受待遇月数" readOnly="true" labelWidth="130" display="false"/>
				<ta:number id="ajc098" key="已享受遇月数" readOnly="true" labelWidth="130" display="false"/>
				<ta:number id="ajc099" key="剩余享受月数" readOnly="true" labelWidth="130" />
				
				<ta:text id="aaz157" key="参保明细ID" display="false" />
				<ta:text id="aaz159" key="参保关系ID" display="false" />
				<ta:text id="aaz257" key="定期待遇人员ID" display="false" />
				<ta:text id="yac001_next" key="个人最大发放期号的下期" display="false" />
			</ta:panel>			
			<ta:tabs id="tabs" height="130">
			    <ta:tab id="tab1" key="待遇信息">
						<ta:datagrid id="ac61List" fit="true">
							<ta:datagridItem id="aaa036" key="待遇项目" showDetailed="true" dataAlign="left" align="left" width="275px" collection="AAA036"/>
							<ta:datagridItem id="aae041" key="待遇开始年月" showDetailed="true"  dataAlign="center" align="center" width="275px" />
							<ta:datagridItem id="aae042" key="待遇结束年月" showDetailed="true"  dataAlign="center" align="center" width="275px"  />
							<ta:datagridItem id="aae019" key="<font color='red'>待遇金额</font>" showDetailed="true"  dataAlign="right" align="right" width="275px" formatter="convertState" dataType="number" />
						</ta:datagrid>
                </ta:tab>
			</ta:tabs>
			<ta:panel id="zyxx" key="转移后社会保险机构信息"    cols="3">
	            <ta:selectInput id="yab139_zr" key="参保机构" required="true" labelWidth="130" collection="YAB003" onSelect="fnSelect"/>
	            <ta:selectInput id="aab001_zr" key="单位编号" required="true" labelWidth="130" />
				<ta:selectInput id="aae160" key="转出原因" required="true" labelWidth="130" collection="AAE160" readOnly="true" />
				<ta:date id="aae041" key="转出日期" required="true" showSelectPanel="true" labelWidth="130" />
<%--				<ta:textarea id="aae013_1" key="备注" span="3" maxLength="200" labelWidth="130"/>--%>
			</ta:panel>
			
		</ta:form>
		<iframe id="report1_printIFrame" name="report1_printIFrame" width="100" height="100" style="position:absolute;left:-100px;top:-100px"></iframe>
	</body>
</html>
<script type="text/javascript">
	//RPC
	function convertState(row, cell, value, columnDef, dataContext){
	    var val = value + '';
		 var x = val.split('.'),x1 = x[0],x2 = x.length > 1 ? '.' + x[1] : '.00',rgx = /(\d+)(\d{3})/;
		 while (rgx.test(x1)) {
		    x1 = x1.replace(rgx, '$1' + ',' + '$2');
		 }
		 value = x1 + x2;
		return "<div style='color:red;font-weight:bolder;margin-top:4px;text-align:right'>"+value+"</div>";
	}	
	//回调函数	
	function fn_queryInfo(){
	   if (g_Suggest!=""){ 
			Base.submit("form1","transferOutSystemAction!queryBaseInfo.do",null,null,false,null);
			}
	}
	
	//保存经办信息
	function submitData(){
		Base.submit("form1","transferOutSystemAction!toSave.do",null,null,null,null);
	}
		
	function fnSelect(key,value){
	   Base.submit("","transferOutSystemAction!queryUnit.do",{"dto['yab003']":value},null,null,null)
	}
	
	function print(){
	    var aaz002 = Base.getValue("aaz002");
	    var aae140 = "210";
	    if(aaz002 == "" || aaz002 == null){
	    	Base.alert("业务日志ID为空,不能打印");
	    	return false;
	    }
	    $("#report1_printIFrame").attr("src","<%=path%>/reportServlet?action=2&name=report1&reportFileName=SYzyd_n.raq&"+
				"srcType=file&savePrintSetup=yes&appletJarName=runqian/runqianReport4Applet.jar%2Crunqian/dmGraphApplet.jar&"+
				"serverPagedPrint=no&mirror=no&"+
				"paramString=aaz002="+aaz002+";aae140="+aae140);	
	}
	
	$(document).ready(function() {
		$("form").css("overflow","auto");
		$("body").css("overflow","hidden");
		initializeSuggestFramework(1, null, "aac001", 500, 200,4,fn_queryInfo,2,false); //查询人员用，fn_queryInfo是回调函数里面写自己的查询(根据取得的aac001来查询)
	});
</script>
<%@ include file="/ta/incfooter.jsp"%>