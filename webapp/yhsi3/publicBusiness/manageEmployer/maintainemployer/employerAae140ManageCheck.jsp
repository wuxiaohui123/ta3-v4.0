<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>单位险种变更</title>
		<%@ include file="/ta/inc.jsp"%>
	</head>
	<body class="no-scrollbar">
		<ta:pageloading />
		<ta:toolbar id="tlb">
			<ta:button id="saveBtn" key="保存[S]" icon="xui-icon-spotSave" hotKey="S" onClick="toSave();" asToolBarItem="true" />
			<ta:button id="closeBtn" key="关闭[C]" hotKey="ctrl+C" icon="xui-icon-spotClose" onClick="closeWin();" asToolBarItem="true"/>
		</ta:toolbar>
		<ta:form id="form1" fit="true" cssStyle="overflow:auto;">
			<ta:box id="procInc">
				
				<%@ include file="/yhsi3/comm/veritySuggestView1.jsp"%>
			</ta:box>
			<%@ include file="/yhsi3/comm/veritySuggestViewGg2.jsp"%>
			<ta:text id="fhjc" display="false" key="复核级次"/>
			<ta:text id="aaz002" display="false" key="日志ID"/>
			<ta:tabs id="tabs1" fit="true">
				<ta:tab id="tab1" key="变更信息汇总">
					<ta:panel id="p2" key="变更信息汇总" fit="true">
						<ta:datagrid id="dgdnew" enableColumnMove="false" groupingBy="aac050" snWidth="30" haveSn="true" fit="true">
							<ta:datagridItem id="aab033" key="征收方式" hiddenColumn="false" />
							<ta:datagridItem id="aac013" key="用工形式" hiddenColumn="false" />
							<ta:datagridItem id="aac066" key="参保身份" hiddenColumn="false" />
							<ta:datagridItem id="aaz159" key="人员参保关系ID(工伤恢复参保的时候使用)" hiddenColumn="false" />
							<ta:datagridItem id="aac050" key="变更类型" width="150" collection="AAC050" />
							<ta:datagridItem id="aab001" key="变更前单位编号" hiddenColumn="false"/>
							<ta:datagridItem id="aae044" key="变更前单位名称" width="160" showDetailed="true" />
							<ta:datagridItem id="aab001_z" key="变更后单位编号" hiddenColumn="false"/>
							<ta:datagridItem id="aae044_z" key="变更后单位名称" width="160" showDetailed="true" />
							<ta:datagridItem id="aac001" key="个人编号" hiddenColumn="false"/>
							<ta:datagridItem id="aac003" key="姓名" width="80" showDetailed="true"/>
							<ta:datagridItem id="aac002" key="证件号码" width="150" showDetailed="true"/>
							<ta:datagridItem id="aac004" key="性别" collection="AAC004"
								width="40" />
							<ta:datagridItem id="aae140" key="险种类型" collection="AAE140"
								width="150" showDetailed="true"/>
							<ta:datagridItem id="aaz136" key="基数规则" collection="AAZ136"
								width="150" hiddenColumn="false"/>
							<ta:datagridItem id="yaz289" key="征缴规则" collection="yaz289"
								width="150" hiddenColumn="false"/>
							<ta:datagridItem id="aac040" key="工资" dataAlign="right"
								align="right" dataType="Number" hiddenColumn="false" />
							<ta:datagridItem id="ajc050" key="本次参工日期" dataAlign="center"
								align="center" dataType="Date" width="100" hiddenColumn="false"/>
							<ta:datagridItem id="aab008_z" key="变更后参保状态" width="100"
								hiddenColumn="false"
								collectionData="[{'id':'0','name':'不变','py':'bb'},{'id':'1','name':'暂停缴费','py':'ztjf'},{'id':'2','name':'恢复缴费','py':'hfjf'},{'id':'3','name':'终止缴费','py':'zzjf'}]" />
							<ta:datagridItem id="aae035" key="变更日期" dataAlign="center"
								align="center" width="100" />
							<ta:datagridItem id="aae160" key="变更原因" showDetailed="true"
								width="150" />
							<ta:datagridItem id="aae013" key="备注" width="250"
								showDetailed="true" />
						</ta:datagrid>
					</ta:panel>
				</ta:tab>
				<ta:tab id="tabsjlc" key="事件流程记录">
			    	<%@ include file="/yhsi3/commonJSP/sjlcjl.jsp"%>
				</ta:tab>
			</ta:tabs>

		</ta:form>
	</body>
</html>
<script type="text/javascript">	
	$(document).ready(function() {
		$("body").taLayout();
	});
	
	
	//保存经办信息
	function toSave(){
		var myData = Base.getGridData("dgdnew");
		var param = {};
		if(myData.length == 0){
			Base.alert("尚无已变更内容，请添加后再尝试保存！","warn");
		}else{
			param.dgdnew = Ta.util.obj2string(myData);
			Base.confirm("共计变更数据<span style='color:#ff0000;'>"+myData.length+"</span>条,是否确认提交？", function(btn, callback) {
			if (btn) {
				Base.submit("form1", "employerAae140ManageCheckAction!toSave.do",param);
			} else {
				Base.alert("请求已取消，谢谢！","success");
			}
		});
		}
	}		
	
	//关闭窗口
	function closeWin(){
	    parent.Base.closeWindow('userwin');
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>
