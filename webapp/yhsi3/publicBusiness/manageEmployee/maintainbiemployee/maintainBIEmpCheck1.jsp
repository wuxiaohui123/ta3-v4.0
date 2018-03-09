<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>maintainBIEmpCheck1</title>
<%@ include file="/ta/inc.jsp"%>
</head>
<body>
    <ta:pageloading />
	<ta:toolbar id="tlb">
		<ta:button id="saveBtn" key="保存[S]" icon="xui-icon-spotSave" hotKey="alt+S" onClick="submitData();" asToolBarItem="true" />
		<ta:button id="closeBtn" key="关闭[C]" icon="xui-icon-spotClose" hotKey="alt+C" onClick="closeWin();" asToolBarItem="true"/>
	</ta:toolbar>
	<ta:form id="form1"  fit="true">
	 <ta:panel key="审核信息" height="85" >
		<ta:box id="procInc">
			<%@ include file="/yhsi3/comm/veritySuggestView1.jsp"%>
		</ta:box>
			<%@ include file="/yhsi3/comm/veritySuggestViewGg2.jsp"%>
		<ta:text id="fhjc" display="false" key="复核级次"/>
	 </ta:panel>
	 <ta:panel fit="true" hasBorder="false">	
		<ta:tabs id="tabsSI" fit="true">
			<ta:tab id="infoTb" key="个人基本信息" cssStyle="overflow:auto">
			 <ta:text id="unitChangeIds" key="个人基本信息变更项ID" value="0" display="false"/>
				<ta:panel id="fldryxx" key="人员信息" cols="3" >
					<ta:text id="isNew" display="false" value="0"/>
					<ta:text id="aaz002" key="业务日志ID" display="false" />
					<ta:text id="aac001" key="个人编号" readOnly="true" labelWidth="120" maxLength="15"/>
					<ta:selectInput id="aac058" key="证件类型" collection="aac058"  labelWidth="120" />
					<ta:text id="aac002" key="证件号码" validType="idcard"  maxLength="18" labelWidth="120" />
					<ta:text id="aac003" key="姓名" labelWidth="120" maxLength="60" />
					<ta:selectInput id="aac004" key="性别" readOnly="true" collection="aac004" labelWidth="120" />
					<ta:date id="aac006" key="出生日期" readOnly="true" labelWidth="120" showSelectPanel="true" />
					<ta:text id="age" key="年龄" labelWidth="120"  readOnly="true"/>
					<ta:date id="yac581" key="身份证有效开始时间" readOnly="true" labelWidth="120" showSelectPanel="true"  />
					<ta:date id="yac582" key="身份证有效截止时间" readOnly="true" labelWidth="120" showSelectPanel="true"  />
					<ta:date id="aac007" key="参加工作时间"  labelWidth="120" showSelectPanel="true"/>
					<ta:selectInput id="aac012" key="个人身份" collection="aac012" labelWidth="120" />
					<ta:selectInput id="aja004" key="农民工标示" collection="aja004" labelWidth="120"   />
					<ta:selectInput id="aac005" key="民族" collection="aac005" labelWidth="120"/>
					<ta:selectInput id="aac011" key="学历" collection="aac011" labelWidth="120"/>
					<ta:selectInput id="aac017" key="婚姻状况" collection="aac017" labelWidth="120"/>
					<ta:selectInput id="aac016" key="就业状态" collection="aac016" labelWidth="120"/>
					<ta:selectInput id="yac030" key="在编人员标识" collection="YAC030" labelWidth="120" />
					<ta:selectInput id="aac033" key="健康状况" collection="aac033" labelWidth="120"/>
					<ta:selectInput id="aab301" key="所属行政区代码" collection="aab301" labelWidth="120"/>
					<ta:text id="aae013_per" key="备注" span="3" labelWidth="120" maxLength="200"/>
				</ta:panel>
				<ta:panel id="fldry" key="荣誉信息" cols="3" >
					<ta:selectInput id="aac014" key="专业技术职务等级" collection="aac014" labelWidth="120"/>
					<ta:selectInput id="aac015" key="国家职业资格等级" collection="aac015" labelWidth="120"/>
					<ta:selectInput id="aac020" key="行政职务" collection="aac020" labelWidth="120"/>
				</ta:panel>
				<ta:panel id="fldlx" key="联系信息" cols="3" >
					<ta:text id="aae006" key="地址" labelWidth="120" span="2"  maxLength="200"/>
					<ta:text id="aae007" key="邮编" validType="zipcode" maxLength="6" labelWidth="120" />
					<ta:text id="aae004" key="联系人姓名" labelWidth="120"  maxLength="60"/>
					<ta:text id="aae005" key="联系人电话" labelWidth="120"  validType="mobile" maxLength="30"/>
					<ta:text id="yae107" key="移动电话" validType="mobile" labelWidth="120" maxLength="50"/>
					<ta:text id="aae159" key="联系电子邮箱" validType="email" labelWidth="120"  maxLength="50"/>
				</ta:panel>
				<ta:panel id="fldhj" key="户籍信息" cols="3" >
					<ta:selectInput id="aac009" key="户口性质" collection="aac009" labelWidth="120" />
					<ta:text id="aac010" key="户口所在地" labelWidth="120" maxLength="100" />
					<ta:text id="aab401" key="户口簿编号" labelWidth="120" validType="number" maxLength="20"/>
				</ta:panel>
			</ta:tab>
			
			<ta:tab id="Tabgrcb" key="个人参保信息" cssStyle="overflow:auto">
				<ta:panel id="fltUnit" key="单位基本信息" cols="3" >
					<ta:text id="aab001" key="单位编号" labelWidth="120"  maxLength="20" />
					<ta:text id="aae044" key="单位名称" readOnly="true" span="2" labelWidth="120"/>
					<ta:text id="aab999" key="单位管理码" readOnly="true"  labelWidth="120" />
					<ta:selectInput id="aab019" key="单位类型" labelWidth="120" readOnly="true"  collection="AAB019" maxVisibleRows="10" />
					<ta:selectInput id="yab019" key="单位管理类型" labelWidth="120" readOnly="true" collection="YAB019" />
				</ta:panel>
				
				<ta:text id="hideIds" key="存储变更项ID" display="false"/>
				
				<ta:text id="a110" display="false"/>
			    <ta:text id="a120" display="false"/>
				<ta:text id="a210" display="false"/>
				<ta:text id="a310" display="false"/>
				<ta:text id="a320" display="false"/>
				<ta:text id="a330" display="false"/>
				<ta:text id="a340" display="false"/>
				<ta:text id="a350" display="false"/>
				<ta:text id="a370" display="false"/>
				<ta:text id="a410" display="false"/>
				<ta:text id="a510" display="false"/>
                <%@ include file="/yhsi3/commonJSP/xzlx_gr.jsp"%>
				
				<ta:panel cols="3" id="fltCB" >
					<ta:number id="aac040" key="工资" labelWidth="120"  precision="2" max="99999999" asAamount="true" amountPre="￥"/>
					<ta:selectInput id="aac066" key="参保身份" collection="AAC066" labelWidth="120"/>
					<ta:selectInput id="aab033" key="征收方式"  collection="AAB033" labelWidth="120" display="false"/>
					<ta:selectInput id="aac013" key="用工形式" collection="AAC013" labelWidth="120"/>
					<ta:date id="aac049" key="首次参保年月" labelWidth="120" issue="true" />	                  
					<ta:date id="ajc050" key="本次参加工作日期" showSelectPanel="true" labelWidth="120"/>
				</ta:panel>
				
				<ta:tabs id="tbs_xzxx" fit="true">
					<ta:tab id="tb_cbxx" key="单位参保信息" cssStyle="overflow:auto">
		    		   <ta:datagrid id="cb_grid" fit="true">
	    				<ta:datagridItem id="aab001_cb" key="单位ID" width="100"/>
			    		<ta:datagridItem id="aae140_cb" key="险种类型" collection="AAE140" width="180"/>
						<ta:datagridItem id="aab050_cb" key="参保日期"  dataType="date" width="100"/>
						<ta:datagridItem id="aab051_cb" key="参保状态" collection="AAB051" width="100"/>
						<ta:datagridItem id="yae097_cb" key="最大做账期号" width="100"/>
						<ta:datagridItem id="yaz289_cb" key="征缴规则ID" collection="YAZ289" width="160"/>
						<ta:datagridItem id="aaz136_cb" key="基数核定规则ID" collection="AAZ136" width="160"/>
						<ta:datagridItem id="yab139_cb" key="参保所属机构"  collection="YAB003" width="260"/>
					   </ta:datagrid>
					</ta:tab>
                    <%@ include file="/yhsi3/commonJSP/xzlx_tab_gr_maintain.jsp"%>	
				</ta:tabs>
			</ta:tab>
			
			<ta:tab id="sjlcTb" key="事件流程记录" cssStyle="overflow:auto" >
				<%@ include file="/yhsi3/commonJSP/sjlcjl.jsp"%>
			</ta:tab>
		</ta:tabs>
	 </ta:panel>
	</ta:form>
</body>
</html>
<script type="text/javascript">
	$(document).ready(function() {
		$("body").taLayout();
		$("caption.tableView-title").css("margin-bottom","10px");
		$("div.slick-pager-nav-dis").hide();
		$("span.slick-pager-settings").css("float","left");
		$("body").css("overflow","hidden");
		fnSuccess();
		controlAae140;
	});
	
	//保存经办信息
	function submitData(){
		Base.submit("form1","maintainBIEmpCheck1Action!toSave.do");
		Base.setDisabled('saveBtn');
	}
	
	//关闭窗口
	function closeWin(){
	    parent.Base.closeWindow('userwin');
	}
	
	//回调函数   主要用于控制修改过的值的颜色 
	function fnSuccess(){
		var par = Base.getValue('hideIds');
		if((par != '')){
			cssControl(par,'red');
		}
		var par1 = Base.getValue('unitChangeIds');
		if((par1 !=='0')){
			cssControl(par1,'red');
		}	
		
		var strs = new Array();
		strs = par.split(",");
		for(i=0;i<strs.length;i++)  
		    {   
		    	var newAae140 = strs[i].substring(4,strs[i].length);
		    	if(newAae140 == 'new1'){
		    		var cb_xx = '#aae140_'+strs[i].substring(0,3)+'+label';
					var oldValue = $(cb_xx).html();
					$(cb_xx).html('');
					$(cb_xx).html("<label style='color:red;'>新增</label>"+oldValue);
		    	}
	    	} 
	}
	

	
	//颜色控制
	function cssControl(par,color){
	
		par = par.substring(0,par.length-1);
		var strs = new Array();
		strs = par.split(",");
		for(i=0;i<strs.length ;i++ ){   
	    	var obj = $('#'+strs[i]).attr('type');  //jquery '#' 表示id ，'.'表示類，
	    	if(obj == 'text'){
				$("#"+strs[i]).parent().prev().css("color",color);
			}else{
				$("#"+strs[i]+"_desc").parent().parent().prev().css("color",color);
			}
	    } 
	}
	
	//回调函数 控制险种及险种对应tab框
	function controlAae140(){
	    var aae140Arr = ['110','120','210','310','320','330','340','350','370','410','510'];
	    var len = aae140Arr.length;
	    for(i = 0; i < len; i++){
	        if(!Base.getObj("aae140_" + aae140Arr[i]).checked){
	           Base.hideObj("tab_" + aae140Arr[i]);
	           Base.hideObj("aae140_" + aae140Arr[i]);
	        }
	        Base.hideObj("yae097_" + aae140Arr[i]);
	    }		
	}	
</script>
<%@ include file="/ta/incfooter.jsp"%>