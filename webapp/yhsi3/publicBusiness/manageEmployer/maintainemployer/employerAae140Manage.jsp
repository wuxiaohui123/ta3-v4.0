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
		   <ta:button id="saveBtn" key="保存[S]" icon="xui-icon-spotSave" hotKey="S" onClick="toSave();"  asToolBarItem="true" />
		   <ta:button id="resetBtn" key="重置[R]" icon="xui-icon-spotReset" hotKey="R" type="resetPage" asToolBarItem="true"/>
	   </ta:toolbar>
       <ta:form id="form1" cssStyle="overflow:auto;" fit="true">
       		<ta:box id="procInc">
		       	
		       <%@ include file="/yhsi3/comm/veritySuggestView1.jsp"%>
		    </ta:box>
       		<ta:panel id="fldh" key="单位基本信息" cols="3" expanded="false" scalable="false">
               <ta:text id="mySysDate" key="当前日期"/>
            </ta:panel>
           <ta:panel id="fldbase" key="单位基本信息" cols="3" expanded="false" scalable="false">
              <ta:text id="aab001" key="单位编号" labelWidth="120" required="true" maxLength="20" onChange="sfwQueryUtil(2,'getAab001_q',Base.getValue('aab001'));" bpopTipMsg="可输入单位管理码、公司名称、单位ID"/>
			  <ta:text id="aae044" key="名称" readOnly="true" span="2" labelWidth="120"/>
			  <ta:text id="aab999" key="单位管理码" labelWidth="120" readOnly="true" maxLength="20" />
			  <ta:selectInput id="aab019" key="单位类型" labelWidth="120" collection="AAB019"  readOnly="true"/>
			  <ta:selectInput id="yab019" key="单位管理类型" labelWidth="120" collection="YAB019"  readOnly="true"/>
            </ta:panel>
            
            <ta:panel id="fldcheck" key="变更类型设置" cols="4" cssStyle="display:none;" expanded="false" scalable="false">
              <ta:date id="aae035_z" key="变更日期" showSelectPanel="true" required="true" labelWidth="120" />
              <ta:date id="start" key="中断经办开始时间" showSelectPanel="true" labelWidth="120" />
              <ta:date id="end" key="中断经办结束时间" showSelectPanel="true" labelWidth="120" />
              <ta:selectInput labelWidth="120" id="bglx" key="变更类型" required="true" onSelect="fn_bglx" data="[{'id':'1','name':'暂停缴费','py':'ztjf'},{'id':'2','name':'恢复缴费','py':'hfjf'},{'id':'3','name':'终止缴费','py':'zzjf'}]" />
            </ta:panel>
            
            <ta:panel id="fldz" key="变更信息设置(不填则默认为原单位)" cols="3" expanded="false" scalable="false">
               <ta:text id="aab001_z" key="单位编号" labelWidth="120"  maxLength="20" onChange="sfwQueryUtil(8,'getAab001',Base.getValue('aab001_z'));" bpopTipMsg="可输入单位管理码、公司名称、单位ID"/>
			   <ta:text id="aae044_z" key="名称" readOnly="true" span="2" labelWidth="120"/>
			   <ta:text id="aab999_z" key="单位管理码" labelWidth="120" readOnly="true" maxLength="20" />
			   <ta:selectInput id="aab019_z" key="单位类型" labelWidth="120" collection="AAB019"  readOnly="true"/>
			   <ta:selectInput id="yab019_z" key="单位管理类型" labelWidth="120" collection="YAB019"  readOnly="true"/>
   			</ta:panel>
   			
   			<ta:tabs id="tabs_aae140All" height="120">
   				<ta:tab id="tab_110" key="企业养老">
				    <ta:box cols="3" cssStyle="margin-top:10px;">
						<ta:selectInput id="yaz289_110" key="征缴规则" labelWidth="120" required="true"/>
						<ta:selectInput id="aaz136_110" key="基数核定规则" labelWidth="120" required="true" isAutoExtend="true"/>
			    	</ta:box>
				</ta:tab>
				<ta:tab id="tab_120" key="机关养老">
				    <ta:box cols="3" cssStyle="margin-top:10px;">
						<ta:selectInput id="yaz289_120" key="征缴规则" labelWidth="120" required="true"/>
						<ta:selectInput id="aaz136_120" key="基数核定规则" labelWidth="120" required="true"/>
			    	</ta:box>
				</ta:tab>
				<ta:tab id="tab_210" key="失业">
				    <ta:box cols="3" cssStyle="margin-top:10px;">
						<ta:selectInput id="yaz289_210" key="征缴规则" labelWidth="120" required="true"/>
						<ta:selectInput id="aaz136_210" key="基数核定规则" labelWidth="120" required="true"/>
			    	</ta:box>
				</ta:tab>
				<ta:tab id="tab_310" key="基本医疗">
				    <ta:box cols="3" cssStyle="margin-top:10px;">
				        <ta:selectInput id="akc022_310" key="医疗保险建账类型" display="false" readOnly="true"/>
						<ta:selectInput id="yaz289_310" key="征缴规则" labelWidth="120" required="true"/>
						<ta:selectInput id="aaz136_310" key="基数核定规则" labelWidth="120" required="true"/>
			    	</ta:box>
				</ta:tab>
				<ta:tab id="tab_320" key="公务员补助">
				    <ta:box cols="3" cssStyle="margin-top:10px;">
						<ta:selectInput id="yaz289_320" key="征缴规则" labelWidth="120" required="true"/>
						<ta:selectInput id="aaz136_320" key="基数核定规则" labelWidth="120" required="true"/>
			    	</ta:box>
				</ta:tab>
				<ta:tab id="tab_330" key="大额医疗">
				    <ta:box cols="3" cssStyle="margin-top:10px;">
						<ta:selectInput id="yaz289_330" key="征缴规则" labelWidth="120" required="true"/>
						<ta:selectInput id="aaz136_330" key="基数核定规则" labelWidth="120" required="true"/>
			    	</ta:box>
				</ta:tab>
				<ta:tab id="tab_340" key="离休人员医疗保障">
				    <ta:box cols="3" cssStyle="margin-top:10px;">
						<ta:selectInput id="yaz289_340" key="征缴规则" labelWidth="120" required="true"/>
						<ta:selectInput id="aaz136_340" key="基数核定规则" labelWidth="120" required="true"/>
			    	</ta:box>
				</ta:tab>
				<ta:tab id="tab_350" key="二乙医疗">
				    <ta:box cols="3" cssStyle="margin-top:10px;">
						<ta:selectInput id="yaz289_350" key="征缴规则" labelWidth="120" required="true"/>
						<ta:selectInput id="aaz136_350" key="基数核定规则" labelWidth="120" required="true"/>
			    	</ta:box>
				</ta:tab>
				<ta:tab id="tab_370" key="企业补充医疗">
				    <ta:box cols="3" cssStyle="margin-top:10px;">
						<ta:selectInput id="yaz289_370" key="征缴规则" labelWidth="120" required="true"/>
						<ta:selectInput id="aaz136_370" key="基数核定规则" labelWidth="120" required="true"/>
			    	</ta:box>
				</ta:tab>
				<ta:tab id="tab_410" key="工伤">
				    <ta:box cols="3" cssStyle="margin-top:10px;">
						<ta:selectInput id="yaz289_410" key="征缴规则" labelWidth="120" required="true"/>
						<ta:selectInput id="aaz136_410" key="基数核定规则" labelWidth="120" required="true"/>
			    	</ta:box>
				</ta:tab>
				<ta:tab id="tab_510" key="生育">
				    <ta:box cols="3" cssStyle="margin-top:10px;">
						<ta:selectInput id="yaz289_510" key="征缴规则" labelWidth="120" required="true"/>
						<ta:selectInput id="aaz136_510" key="基数核定规则" labelWidth="120" required="true"/>
			    	</ta:box>
				</ta:tab>
   			</ta:tabs>
   			
            <ta:tabs id="tabold" height="330" onSelect="fnSelect">
            	<ta:tab id="taboldp" key="变更类型" cols="3">
            		<ta:panel id="fldbgxx" key="变更信息设置" columnWidth="0.3" height="260">
            			<ta:number id="aac040" key="缴费工资" required="true" max="999999999" labelWidth="120" display="false" asAamount="true" amountPre="￥" precision="2"/>
						<ta:selectInput id="aac066" key="参保身份" required="true" collection="AAC066" labelWidth="120" selectFirstValue="true"/>					
						<ta:selectInput id="aab033" key="征收方式" required="false" collection="AAB033" filter="6" labelWidth="120"/>
						<ta:selectInput id="aac013" key="用工形式" required="true" collection="AAC013" labelWidth="120"/>
						<ta:date id="ajc050" key="本次参工日期" required="true" showSelectPanel="true"  labelWidth="120" display="false"/>
						<ta:selectInput id="aae160_z" key="变更原因" labelWidth="120" />
						<ta:textarea id="aae013_z" key="备注" maxLength="100" labelWidth="120" />
            		</ta:panel>
            		<ta:panel key="可操作信息(灰色标记为已操作项)" id="pnlcz" columnWidth="0.69" fit="true" withToolBar="true" height="300">
            			<ta:panelToolBar>
							<ta:button id="btnAdds" key="添加变更信息" icon="xui-icon-spotAdd" asToolBarItem="true" onClick="fn_Add2dgdnew()" />
							<ta:button id="btnDel" key="删除信息" icon="xui-icon-spotDelete" asToolBarItem="true" onClick="fn_Del()" />
							<ta:box span="1">
							    <ta:selectInput id="aae140" key="险种类型" collection="AAE140" span="1" filter="110,210,310,410,510" reverseFilter="true" onSelect="fnSelectAAE140"/>
							</ta:box>
						</ta:panelToolBar>
						<ta:datagrid id="dgdold" rowColorfn="fnColor" enableColumnMove="false" onSelectChange="fnSelectChange" columnFilter="true" snWidth="30" haveSn="true" fit="true" selectType="checkbox">
							<ta:datagridItem id="aab001" key="单位ID" hiddenColumn="false"/>
							<ta:datagridItem id="aac001" key="人员ID" hiddenColumn="false"/>
							<ta:datagridItem id="aab033" key="征收方式" hiddenColumn="false"/>
							<ta:datagridItem id="aac013" key="用工形式" hiddenColumn="false"/>
							<ta:datagridItem id="aac066" key="参保身份" hiddenColumn="false"/>
							<ta:datagridItem id="aaz159" key="人员参保关系ID(工伤恢复参保的时候使用)" hiddenColumn="false"/>
							<ta:datagridItem id="aae044" key="单位名称" width="170" showDetailed="true"/>
							<ta:datagridItem id="aac003" key="姓名" width="90" showDetailed="true"/>
							<ta:datagridItem id="aac002" key="证件号码" width="150"/>
							<ta:datagridItem id="aac004" key="性别"  collection="AAC004" width="40"/>
							<ta:datagridItem id="aae140" key="险种类型"  collection="AAE140" width="180" showDetailed="true"/>
							<ta:datagridItem id="ykc005" key="特殊人员类型"  collection="YKC005" width="180" showDetailed="true"/>
							<ta:datagridItem id="ykc006" key="特殊人员类别"  collection="YKC006" width="180" showDetailed="true"/>
							<ta:datagridItem id="aae041" key="开始年月" align="center" dataAlign="center"/>
							<ta:datagridItem id="aae042" key="终止年月" align="center" dataAlign="center"/>
							<ta:datagridItem id="aac066" key="参保身份" collection="AAC066" showDetailed="true"/>
							<ta:datagridItem id="yae097" key="最大做账期号" align="center" dataAlign="center" width="100"/>
							<ta:datagridItem id="yab139" key="参保所属机构"  width="130" collection="YAB003" showDetailed="true"/>
							<ta:datagridItem id="aaz136" key="基数核定规则" hiddenColumn="false" showDetailed="true"/>
							<ta:datagridItem id="yaz289" key="征缴规则" hiddenColumn="false" showDetailed="true"/>
							<ta:datagridItem id="aac049" key="首次参保年月" hiddenColumn="false" />
							<ta:datagridItem id="aac030" key="个人参保日期" hiddenColumn="false" />
						</ta:datagrid>
					</ta:panel>
			   </ta:tab>
			   <ta:tab id="tabnewp" key="已变更内容">
				   <ta:panel id="p2" key="单位基本信息" fit="true" withToolBar="true">
					    <ta:panelToolBar>
							<ta:button id="btnDelete" key="删除变更信息" icon="xui-icon-spotDelete" asToolBarItem="true"  onClick="fn_DeleteError()"/>
						</ta:panelToolBar>
			            <ta:datagrid id="dgdnew" enableColumnMove="false" groupingBy="bglx" fit="true" selectType="checkbox">
						   	  <ta:datagridItem id="aab033" key="征收方式" hiddenColumn="false"/>
							  <ta:datagridItem id="aac013" key="用工形式" hiddenColumn="false"/>
							  <ta:datagridItem id="aac066" key="参保身份" hiddenColumn="false"/>
						      <ta:datagridItem id="aaz159" key="人员参保关系ID(工伤恢复参保的时候使用)" hiddenColumn="false"/>
						      <ta:datagridItem id="bglx" key="变更类型" width="80" collectionData="[{'id':'1','name':'暂停缴费','py':'ztjf'},{'id':'2','name':'恢复缴费','py':'hfjf'},{'id':'3','name':'终止缴费','py':'zzjf'}]"/>
						      <ta:datagridItem id="aab001" key="变更前单位" hiddenColumn="false"/>			     
						      <ta:datagridItem id="aab001_z" key="变更后单位" hiddenColumn="false"/>
						      <ta:datagridItem id="aae044" key="变更前单位名称"  width="150" showDetailed="true" hiddenColumn="false"/>			     
						      <ta:datagridItem id="aae044_z" key="变更后单位名称" width="150" showDetailed="true" hiddenColumn="false"/>
						      <ta:datagridItem id="aac001" key="个人编号"  hiddenColumn="false"/>
						      <ta:datagridItem id="aac003" key="姓名" width="100" showDetailed="true"/>
							  <ta:datagridItem id="aac002" key="证件号码"  width="150"/>
							  <ta:datagridItem id="aac004" key="性别"  collection="AAC004" width="40"/>
						      <ta:datagridItem id="aae140" key="险种类型" collection="AAE140" width="180" showDetailed="true"/>
						      <ta:datagridItem id="ykc005" key="特殊人员类型"  collection="YKC005" width="180" showDetailed="true"/>
							  <ta:datagridItem id="ykc006" key="特殊人员类别"  collection="YKC006" width="180" showDetailed="true"/>
						      <ta:datagridItem id="aaz136" key="基数规则" collection="AAZ136" width="150" showDetailed="true"/>
							  <ta:datagridItem id="yaz289" key="征缴规则" collection="yaz289" width="250" showDetailed="true"/>
							  <ta:datagridItem id="aac040" key="工资" dataAlign="right" align="right" dataType="Number"/>
							  <ta:datagridItem id="ajc050" key="本次参工日期" dataAlign="center" width="100" align="center" dataType="Date"/>
						      <ta:datagridItem id="aae035_z" key="变更日期" dataAlign="center" align="center" width="100"/>
						      <ta:datagridItem id="aae160_z" key="变更原因" collection="AAE160" showDetailed="true" width="150"/>
						      <ta:datagridItem id="aae013_z" key="备注" width="250" showDetailed="true"/>
						      <ta:datagridItem id="aac049" key="首次参保年月" hiddenColumn="false" />
							  <ta:datagridItem id="aac030" key="个人参保日期" hiddenColumn="false" />
						</ta:datagrid>
					</ta:panel>
			   </ta:tab>
			   <ta:tab id="tab_no" key="该单位不提供恢复缴费险种信息">
			   		<ta:datagrid id="dgdold_no" enableColumnMove="false" columnFilter="true" snWidth="30" haveSn="true" fit="true">
							<ta:datagridItem id="aab001" key="单位ID" hiddenColumn="false"/>
							<ta:datagridItem id="aac001" key="人员ID" hiddenColumn="false"/>
							<ta:datagridItem id="aab033" key="征收方式" hiddenColumn="false"/>
							<ta:datagridItem id="aac013" key="用工形式" hiddenColumn="false"/>
							<ta:datagridItem id="aac066" key="参保身份" hiddenColumn="false"/>
							<ta:datagridItem id="aaz159" key="人员参保关系ID(工伤恢复参保的时候使用)" hiddenColumn="false"/>
							<ta:datagridItem id="aae044" key="单位名称" width="170" showDetailed="true"/>
							<ta:datagridItem id="aac003" key="姓名" width="90"/>
							<ta:datagridItem id="aac002" key="证件号码" width="150"/>
							<ta:datagridItem id="aac004" key="性别"  collection="AAC004" width="40"/>
							<ta:datagridItem id="aae140" key="险种类型"  collection="AAE140" width="180" showDetailed="true"/>
							<ta:datagridItem id="ykc005" key="特殊人员类型"  collection="YKC005" width="180" showDetailed="true"/>
							<ta:datagridItem id="ykc006" key="特殊人员类别"  collection="YKC006" width="180" showDetailed="true"/>
							<ta:datagridItem id="aae041" key="开始年月" align="center" dataAlign="center"/>
							<ta:datagridItem id="aae042" key="终止年月" align="center" dataAlign="center"/>
							<ta:datagridItem id="aac066" key="参保身份" collection="AAC066" showDetailed="true"/>
							<ta:datagridItem id="yae097" key="最大做账期号" align="center" dataAlign="center" width="100"/>
							<ta:datagridItem id="yab139" key="参保所属机构"  width="130" collection="YAB003" showDetailed="true"/>
							<ta:datagridItem id="aaz136" key="基数核定规则" hiddenColumn="false"/>
							<ta:datagridItem id="yaz289" key="征缴规则" hiddenColumn="false"/>
							<ta:datagridItem id="aac049" key="首次参保年月" hiddenColumn="false" />
							<ta:datagridItem id="aac030" key="个人参保日期" hiddenColumn="false" />
						</ta:datagrid>
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
		$('#aab001').keydown(function(event){
			if(event.keyCode == 13){
				$('#aab001').blur();
				$('#aab001').focus();
			}
		});
		Base.focus("aab001");
		Base.hideObj("fldh,fldz,tabold,taboldp,tabnewp,tabsjlc,tabs_aae140All");
        Base.setValue("aae035_z",Base.getValue("mySysDate"));		
		initializeSuggestFramework(2, '', 'aab001', 900, 300, 7, fn_queryAb01, 0, false); 
		initializeSuggestFramework(8, 'ab01', 'aab001_z', 900, 300, 7, fn_queryAb01_8, 0, false); 
	});
	
	//回调函数，查询单位基本信息
	function fn_queryAb01(){
		if(g_Suggest!=""){
			Base.setValue("aab001",g_Suggest[1]);
			Base.submit("fldbase","employerAae140ManageAction!queryUnitInfo.do");
   		}
	}
	
	//新单位回调函数
	function fn_queryAb01_8(){
		if(g_Suggest!=""){
			Base.setValue("aab001_z",g_Suggest[1]);
			Base.submit("fldbase,fldcheck,fldz","employerAae140ManageAction!queryNewUnitInfo.do");
   		}
	}
	
	//回调渲染
	function fnSelect(tabid){
		if(tabid == 'taboldp'){
			var rows = Base.getGridData('dgdold');
			var param = {};
			param.AllList = Ta.util.obj2string(rows);
			Base.submit('','employerAae140ManageAction!setColor.do',param);
		}
	}
	
	//颜色控制
	function fnColor(data){
		var rows = Base.getGridData('dgdnew');
		var checkStr;
		for(var i=0;i<rows.length;i++){
			var aae140 = rows[i].aae140;
			var aac001 = rows[i].aac001;
			if(typeof(checkStr) == 'undefined'){
				checkStr = '[' + aac001 + aae140 + ']';
			}else{
				checkStr = checkStr + '[' + aac001 + aae140 + ']';;
			}
		}
		if(typeof(checkStr) != 'undefined'){
			var matchStr = data.aac001 + data.aae140;
			if (checkStr.indexOf(matchStr) >= 0 ){
				return 'lightgray';
			} 
		}
	}
	function fn_Del(){
	    var list = Base.getGridSelectedRows("dgdold");
	    if(list.length==0){
	        alert("请选择需要删除的信息！");
	        return;
	    }else{
	        Base.deleteGridSelectedRows("dgdold");
	    }
	}
	//控制险种tab的显示问题
	function fnSelectChange(rowsData,n){
	    var bglx = Base.getValue('bglx');
 	    if(bglx == '2'){
			var selectRows = Base.getGridSelectedRows('dgdold');
			var len = selectRows.length;
			var aae140Str;
			var aae140Array = ['110','120','210','310','320','330','340','350','370','410','510'];
			for(var i=0;i<len;i++){
				var aae140 = selectRows[i].aae140;
				if(typeof(aae140Str) == 'undefined'){
					aae140Str = aae140;
				}else{
					aae140Str = aae140Str + ',' + aae140;
				}
			}
			if(typeof(aae140Str) != 'undefined'){
				Base.showObj('tabs_aae140All');
				for(var i=0;i<aae140Array.length;i++){
					var aae140 = aae140Array[i];
					if(aae140Str.indexOf(aae140) >= 0){
						Base.showObj('tab_'+aae140);
						Base.activeTab('tab_'+aae140);
					}else{
						Base.hideObj('tab_'+aae140);
					}
				}
			}else{
				Base.hideObj('tabs_aae140All');
				for(var i=0;i<aae140Array.length;i++){
					var aae140 = aae140Array[i];
					Base.hideObj('tab_'+aae140);
				}
			}
		}
	}
	//公用界面控制
	function fn_myClear(value){
		Base.hideObj("fldz,aac040,aac066,aab033,aac013,ajc050,tabs_aae140All");
		Base.hideObj("tab_110,tab_120,tab_210,tab_310,tab_320,tab_330,tab_340,tab_350,tab_370,tab_410,tab_510");
		Base.showObj("tabold,taboldp");
		Base.activeTab("taboldp");
		Base.resetForm("fldbgxx");
		Base.setValue("aae160_z","");
		Base.setValue("aae013_z","");
		Base.setValue("aac040,aac066,aac013,ajc050","");
		Base.clearGridData("dgdold");
		Base.setTabTitle("taboldp", value);
		
	}
	
	//变更选择控制
	function fn_bglx(value,key){
		if(key == '1'){
			fn_myClear(value);
			Base.clearGridData("dgdold");
			Base.submit("form1","employerAae140ManageAction!queryUnitInsInfo.do");
		}else if(key == '2' ){
			if($("#fldz").attr("style").indexOf("display:none;") >= 0 ){
				Base.setValue("aab001_z","");
				Base.setValue("aae044_z","");
				Base.setValue("aab999_z","");
				Base.setValue("aab019_z","");
				Base.setValue("yab019_z","");
			}
			fn_myClear(value);
			Base.setValue("aae160_z","");
			Base.setValue("aae013_z","");
			Base.resetForm("fldz");
			Base.showObj("fldz,aac040,aac066,aac013,ajc050");
			Base.clearGridData("dgdold");
			Base.setTabTitle("taboldp", value);
			Base.clearGridData("dgdold");
			Base.submit("fldbase,fldcheck,fldz","employerAae140ManageAction!queryRecoverInfo.do");
		}else if(key == '3' ){
			fn_myClear(value);
			Base.clearGridData("dgdold");
			Base.submit("form1","employerAae140ManageAction!queryUnitInsInfo.do");
		}	
	}
	
	//判断依赖绑定相关信息  正向 
	function fnCkBind(gridId){
		var selectRows = Base.getGridSelectedRows(gridId);//获取勾选行数据
		var allRows = Base.getGridData(gridId);//获取所有数据
		if(selectRows.length == allRows.length){ //全选，不去判断绑定
			return;
		}
		var aae140Str;
		var aac001Str;
		var ckBind = false;
		//判断选中数据中是否包含绑定依赖父级险种，也就是基本医疗和大病救助险种
		for(var i=0;i<selectRows.length;i++){
			var aac001 = selectRows[i].aac001;
			var aae140 = selectRows[i].aae140;
			if((aae140=='310') || (aae140=='330')){
				ckBind = true;
			}
			if(typeof(aae140Str)=='undefined'){
				aae140Str = aae140;
			}else{
				aae140Str = aae140Str + ',' + aae140;
			}
			if(typeof(aac001Str)=='undefined'){
				aac001Str = aac001;
			}else{
				aac001Str = aac001Str + ',' + aac001;
			}
		}
		//如果选择基本医疗或者大病救助险种，要进行其他险种相应控制
		var aae140StrAll;
		var aac001StrAll;
		if(ckBind){
			//遍历当前grid中是否包含其他存在绑定依赖的险种信息，默认选中
			for(var i=0;i<allRows.length;i++){
				var aae140 = allRows[i].aae140;
				var aac001 = allRows[i].aac001;
				if(aac001Str.indexOf(aac001) >= 0){
					if((aae140=='310') || (aae140=='320') || (aae140=='330') || (aae140=='370')){
						aae140Str = aae140Str + ',' + aae140;
						aac001Str = aac001Str + ',' + aac001;
					}
				}
			}
			//选择控制
			var aae140Array = new Array();
			var aac001Array = new Array();
			if(aae140Str.indexOf(',') >= 0){
				aae140Array = aae140Str.split(',');
			}else{
				aae140Array[0] = aae140Str;
			}
			if(aac001Str.indexOf(',') >= 0){
				aac001Array = aac001Str.split(',');
			}else{
				aac001Array[0] = aac001Str;
			}
			var aae140Aac001Json = "[";
			for(var i=0;i<aae140Array.length;i++){
				aae140Aac001Json = aae140Aac001Json + '{aae140:' + aae140Array[i] + ',aac001:' + aac001Array[i] + '},';
			}
			aae140Aac001Json = aae140Aac001Json + ']';
			Base.setSelectRowsByData(gridId,aae140Aac001Json);
		}
	}
	
	
	//向datagrid中添加数据控制
	function fn_Add2dgdnew(){
		var obj = Base.getObj('dgdold');
		var myData = Base.getGridSelectedRows("dgdold");
		var bglx = Base.getValue('bglx');
		if(myData.length == 0){
			Base.alert("请至少选择一条数据再做添加,谢谢！","warn");
		}else {
			if(bglx == '2'){
				backBind('dgdold');
			}else{
				fnCkBind('dgdold');
			}
			if(bglx == '2'){
				var param = {};
				myData = Base.getGridSelectedRows("dgdold");
				param.selectRows = Ta.util.obj2string(myData);
				Base.clearGridData('dgdold_no');
				Base.submit('fldbase,fldz,ajc050','employerAae140ManageAction!checkRecover.do',param,null,false,fnConfirm,null);
			}else{
				fnConfirm();
			}
		}
	}
	
	//返回成功信息
	function fnConfirm(){
		var errData = Base.getGridData('dgdold_no');
		if(errData != ''){
			Base.alert('存在恢复缴费单位不提供新增险种信息，请核实！','warn');
			return false;
		}
		var myData = Base.getGridSelectedRows("dgdold");
		var myNewData = Base.getGridData("dgdnew");
		var ts = "";
		ts = '变更类型：<span style="color:#ff0000;">'+Base.getValue("bglx_desc")+'</span>,数据行数：<span style="color:#ff0000;">'+myData.length+"</span>行.确认提交？"
			Base.confirm(ts, function(btn, callback) {
				if (btn) {
					if(myNewData.length == 0){
						fn_Add2dgdnew_e(myData);
					}else{
						fn_Add2dgdnew_d(myData,myNewData);
					}
					
				} else {
					Base.alert("请求已取消，谢谢！","success");
				}
			});
	}
	
	//当变更项中没有数据的时候直接添加
	function fn_Add2dgdnew_e(myData){
		for (var i = 0; i < myData.length; i++ ) { 
			 			var row = {}; 
						 var bglx = Base.getValue("bglx");
						 if (bglx == '1'){
						 		row.aab001 = myData[i].aab001;
						 		row.aab001_z = myData[i].aab001;
						 		row.aae044 = myData[i].aae044;
						 		row.aae044_z = myData[i].aae044;
						 		row.aaz136 = myData[i].aaz136;
						 		row.yaz289 = myData[i].yaz289;
						 		row.aab033 = myData[i].aab033;
							 	row.aac013 = myData[i].aac013;
							 	row.aac066 = myData[i].aac066;
							 	row.ajc050 = myData[i].ajc050;
						 } else if(bglx == '2'){
						 		if(Base.getValue("aac040") == ""){
						 			Base.alert('变更类型：恢复缴费,缴费工资不可为空！');
						 			return;
						 		}
						 		if(Base.getValue("aac066") == ""){
						 			Base.alert('变更类型：恢复缴费,参保身份不可为空！');
						 			return;
						 		}
						 		/*if(Base.getValue("aab033") == ""){
						 			Base.alert('变更类型：恢复缴费,征收方式不可为空！');
						 			return;
						 		}*/
						 		if(Base.getValue("aac013") == ""){
						 			Base.alert('变更类型：恢复缴费,用工形式不可为空！');
						 			return;
						 		}
						 		if(Base.getValue("ajc050") == ""){
						 			Base.alert('变更类型：恢复缴费,本次参工日期不可为空！');
						 			return;
						 		}
						 		row.aac040 = Base.getValue("aac040");
						 		var yaz289 = Base.getValue("yaz289_"+myData[i].aae140);
						 		if(yaz289 == ''){
						 			Base.alert('变更类型：恢复缴费,征缴规则不可为空！');
						 			Base.activeTab('tab_'+myData[i].aae140);
						 			return;
						 		}
						 		row.yaz289 = yaz289;
						 		var aaz136 = Base.getValue("aaz136_"+myData[i].aae140);
						 		if(aaz136 == ''){
						 			Base.alert('变更类型：恢复缴费,基数规则不可为空！');
						 			Base.activeTab('tab_'+myData[i].aae140);
						 			return;
						 		}
						 		row.aaz136 = aaz136;
						 		row.ajc050 = Base.getValue("ajc050");
						 		row.aab001 = myData[i].aab001;
						 		row.aab001_z = Base.getValue("aab001_z");
						 		row.aae044 = myData[i].aae044;
						 		row.aae044_z = Base.getValue("aae044_z");
						 		row.aab033 = Base.getValue("aab033");
							 	row.aac013 = Base.getValue("aac013");
							 	row.aac066 = Base.getValue("aac066");
							 	row.ajc050 = Base.getValue("ajc050");
						 } else if(bglx == '3'){
						 		row.aab001 = myData[i].aab001;
						 		row.aab001_z = myData[i].aab001;
						 		row.aae044 = myData[i].aae044;
						 		row.aae044_z = myData[i].aae044;
						 		row.aaz136 = myData[i].aaz136;
						 		row.yaz289 = myData[i].yaz289;
						 		row.aab033 = myData[i].aab033;
							 	row.aac013 = myData[i].aac013;
							 	row.aac066 = myData[i].aac066;
							 	row.ajc050 = myData[i].ajc050;
						 }
						 	row.bglx = bglx; 
						 	row.aac002 = myData[i].aac002;
						 	
						 	row.aaz159 = myData[i].aaz159; 
						 	row.aac001 = myData[i].aac001; 
						 	row.aac003 = myData[i].aac003; 
						 	row.aae140 = myData[i].aae140; 
						 	row.aac004 = myData[i].aac004; 
						 	row.aac049 = myData[i].aac049;
						 	row.aac030 = myData[i].aac030;
						 	//恢复缴费 险种为基本医疗时取akc022
						 	if("2"==bglx &&"310" == myData[i].aae140){
						 	   row.ykc005 = Base.getValue("akc022_310"); 
						 	}else{
						 	   row.ykc005 = myData[i].ykc005; 
						 	}
						 	row.ykc006 = myData[i].ykc006;
						 	row.aae035_z = Base.getValue("aae035_z");
						 	row.aae160_z = Base.getValue("aae160_z");
						 	row.aae013_z = Base.getValue("aae013_z");
							Base.addGridRowDown("dgdnew", row);
			 	}
			 Base.showObj("tabnewp");
			 Base.activeTab("tabnewp");
	
	} 
	
	//当变更项中有数据的时候，判断数据是否重复	
	function fn_Add2dgdnew_d(myData,myNewData){
			 var cf = "";
			 var js = 0;
			 var mylength = myNewData.length;
			 for (var j = 0; j < mylength; j ++ ) { 
			 	for (var i = 0; i < myData.length; i++ ) { 
			 		if((myData[i].aac001 == myNewData[j].aac001) && (myData[i].aae140 == myNewData[j].aae140)){
			 			js = js + 1;
			 			var oldrow = {};
			 			oldrow.aab001  = myData[i].aab001;
						oldrow.aac001  = myData[i].aac001;
						oldrow.aae044  = myData[i].aae044;
						oldrow.aac003  = myData[i].aac003;
						oldrow.aac002  = myData[i].aac002;
						oldrow.aac004  = myData[i].aac004;
						oldrow.aae140  = myData[i].aae140;
						oldrow.aae041  = myData[i].aae041;
						oldrow.aae042  = myData[i].aae042;
						oldrow.aac066  = myData[i].aac066;
						oldrow.yae097  = myData[i].yae097;
						oldrow.yab139  = myData[i].yab139;
						oldrow.aab033  = myData[i].aab033;
						oldrow.aac013  = myData[i].aac013;
						oldrow.aac066  = myData[i].aac066;
						oldrow.aaz159  = myData[i].aaz159;
			 			cf = cf+"编号："+myData[i].aac001+",姓名："+myData[i].aac003+";";
			 			myData.splice(i,1) ;
			 			break;
			 		}
			 	}
			 }
			 for (var i = 0; i < myData.length; i++ ) {
			 			var row = {}; 
						 var bglx = Base.getValue("bglx");
						 if (bglx == '1'){
						 		row.aab001 = myData[i].aab001;
						 		row.aab001_z = myData[i].aab001;
						 		row.aae044 = myData[i].aae044;
						 		row.aae044_z = myData[i].aae044;
						 		row.aaz136 = myData[i].aaz136;
						 		row.yaz289 = myData[i].yaz289;
						 		row.aab033 = myData[i].aab033;
							 	row.aac013 = myData[i].aac013;
							 	row.aac066 = myData[i].aac066;
							 	row.ajc050 = myData[i].ajc050;
						 } else if(bglx == '2'){
						 		if(Base.getValue("aac040") == ""){
						 			Base.alert('变更类型：恢复缴费,缴费工资不可为空！');
						 			return;
						 		}
						 		if(Base.getValue("aac066") == ""){
						 			Base.alert('变更类型：恢复缴费,参保身份不可为空！');
						 			return;
						 		}
						 		/*if(Base.getValue("aab033") == ""){
						 			Base.alert('变更类型：恢复缴费,征收方式不可为空！');
						 			return;
						 		}*/
						 		if(Base.getValue("aac013") == ""){
						 			Base.alert('变更类型：恢复缴费,用工形式不可为空！');
						 			return;
						 		}
						 		if(Base.getValue("ajc050") == ""){
						 			Base.alert('变更类型：恢复缴费,本次参工日期不可为空！');
						 			return;
						 		}
						 		row.aac040 = Base.getValue("aac040");
						 		var yaz289 = Base.getValue("yaz289_"+myData[i].aae140);
						 		if(yaz289 == ''){
						 			Base.alert('变更类型：恢复缴费,征缴规则不可为空！');
						 			Base.activeTab('tab_'+myData[i].aae140);
						 			return;
						 		}
						 		row.yaz289 = yaz289;
						 		var aaz136 = Base.getValue("aaz136_"+myData[i].aae140);
						 		if(aaz136 == ''){
						 			Base.alert('变更类型：恢复缴费,基数规则不可为空！');
						 			Base.activeTab('tab_'+myData[i].aae140);
						 			return;
						 		}
						 		row.aaz136 = aaz136;
						 		row.ajc050 = Base.getValue("ajc050");
						 		row.aab001 = myData[i].aab001;
						 		row.aab001_z =Base.getValue("aab001_z");
						 		row.aae044 = myData[i].aae044;
						 		row.aae044_z = Base.getValue("aae044_z");
						 		row.aab033 = Base.getValue("aab033");
							 	row.aac013 = Base.getValue("aac013");
							 	row.aac066 = Base.getValue("aac066");
							 	row.ajc050 = Base.getValue("ajc050");
						 } else if(bglx == '3'){
						 		row.aab001 = myData[i].aab001;
						 		row.aab001_z = myData[i].aab001;
						 		row.aae044 = myData[i].aae044;
						 		row.aae044_z = myData[i].aae044;
						 		row.aaz136 = myData[i].aaz136;
						 		row.yaz289 = myData[i].yaz289;
						 		row.aab033 = myData[i].aab033;
							 	row.aac013 = myData[i].aac013;
							 	row.aac066 = myData[i].aac066;
							 	row.ajc050 = myData[i].ajc050;
						 } 
						 	row.bglx = bglx; 
						 	row.aaz159 = myData[i].aaz159;
						 	row.aac002 = myData[i].aac002; 
						 	row.aac001 = myData[i].aac001; 
						 	row.aac003 = myData[i].aac003; 
						 	row.aae140 = myData[i].aae140; 
						 	row.aac004 = myData[i].aac004;
						 	if("2"==bglx&&"310"==myData[i].aae140){
						 	    row.ykc005 = Base.getValue("akc022_310"); 
						 	}else{
						 	    row.ykc005 = myData[i].ykc005; 
						 	}
						 	row.ykc006 = myData[i].ykc006; 
						 	row.aae035_z = Base.getValue("aae035_z");
						 	row.aae160_z = Base.getValue("aae160_z");
						 	row.aae013_z = Base.getValue("aae013_z");
							Base.addGridRowDown("dgdnew", row);
			 }
			 Base.showObj("tabnewp");
			 Base.activeTab("tabnewp");
			 cf = "【"+cf.substring(0,cf.length-1)+"】。如需重新处理，请删除已变更内容再做二次处理！谢谢";
			 if(js == 0){
			 	return null;
			 }else{
			 	Base.alert("共计"+js+"人已存在处理信息，如下"+cf,"warn");
			 }
	}
	
	//删除变更项中的数据
	function fn_DeleteError(){
		backBind('dgdnew');
		var myData = Base.getGridSelectedRows("dgdnew");
		var ts = "";
		if(myData.length == 0){
			Base.alert("请至少选择一条数据再做提交,谢谢！","warn");
		}else {
			ts = '处理类型：<span style="color:#ff0000;">删除变更信息</span>,数据行数：<span style="color:#ff0000;">'+myData.length+"</span>行.确认提交？"
			Base.confirm(ts, function(btn, callback) {
				if (btn) {
					Base.deleteGridSelectedRows("dgdnew");
					var getAllNewRows = Base.getGridData('dgdnew');
					var param = {};
					param.allNewList = Ta.util.obj2string(getAllNewRows);
					Base.submit('','employerAae140ManageAction!setNewData.do',param);
				} else {
					Base.alert("请求已取消，谢谢！","success");
				}
			});
		
		}
	
	}
	
	function fnSelectAAE140(key,value){
	    Base.submit("aab001,aae140,start,end,bglx", "employerAae140ManageAction!toSelectAAE140.do");
	}
	
	//反向绑定 
	function backBind(gridId){
		var selectRows = Base.getGridSelectedRows(gridId);//获取勾选行数据
		var allRows = Base.getGridData(gridId);//获取所有数据
		if(selectRows.length == allRows.length){ //全选，不去判断绑定
			return;
		}
		var bglx = Base.getValue('bglx');
		var aae140Str;
		var aac001Str;
		var ckBind = false;
		var rows;
		//判断选中数据中是否包含绑定依赖父级险种，也就是基本医疗和大病救助险种
		for(var i=0;i<selectRows.length;i++){
			var aac001 = selectRows[i].aac001;
			var aae140 = selectRows[i].aae140;
			var row = selectRows[i]._row_;
			if(typeof(rows)=='undefined'){
				rows = row;
			}else{
				rows = rows + ',' + row;
			}
			if((aae140=='310') || (aae140=='330') || (aae140=='320') || (aae140=='370')){
				ckBind = true;
			}
			if(typeof(aae140Str)=='undefined'){
				aae140Str = aae140;
			}else{
				aae140Str = aae140Str + ',' + aae140;
			}
			if(typeof(aac001Str)=='undefined'){
				aac001Str = aac001;
			}else{
				aac001Str = aac001Str + ',' + aac001;
			}
		}
		//如果选择基本医疗或者大病救助险种，要进行其他险种相应控制
		var aae140StrAll;
		var aac001StrAll;
		if(ckBind){
			//遍历当前grid中是否包含其他存在绑定依赖的险种信息，默认选中
			for(var i=0;i<allRows.length;i++){
				var aae140 = allRows[i].aae140;
				var aac001 = allRows[i].aac001;
				if(aac001Str.indexOf(aac001) >= 0){
					if((aae140=='310')  || (aae140=='330')){
						var row;
						if(bglx == '2'){
							row = parseInt(allRows[i].__id___);
						}else{
							row = parseInt(allRows[i].__id___) + 1;
						}
						rows = rows + ',' + row;
					}
				}
			}
			//选择控制
			var obj = Base.getObj(gridId);
			var rowArray = new Array();
			rows = rows + '';
			if(rows.indexOf(',') >= 0){
				rowArray = rows.split(',');
			}else{
				rowArray[0] = rows;
			}
			obj.setSelectedRows(rowArray);
		}
	}
	
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
				Base.submit("form1", "employerAae140ManageAction!toSave.do",param);
			} else {
				Base.alert("请求已取消，谢谢！","success");
			}
		});
		}
	}		
</script>
<%@ include file="/ta/incfooter.jsp"%>			