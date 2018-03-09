<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>社会保险费票据管理</title>
<%@ include file="/ta/inc.jsp"%>
</head>
   <body>
      <ta:pageloading/>
      <ta:form id="form1" fit="true">
	         <ta:toolbar id="tlb">
	           <ta:button id="queryBtn" key="查询[Q]" icon="xui-icon-query" hotKey="Q" onClick="fnQuery();"  asToolBarItem="true"/>
	           <ta:button id="printBtn" key="打印[P]" icon="xui-icon-spotPrint" hotKey="P" onClick="fnPrint();"  asToolBarItem="true"/>
			   <ta:button id="deleteBtn" key="票据作废[D]" icon="xui-icon-spotDelete" hotKey="D" onClick="fnDelete();"  asToolBarItem="true"/>
			   <ta:button id="resetBtn" key="重置[R]" icon="xui-icon-spotReset" hotKey="R" type="resetPage"  asToolBarItem="true"/>
		    </ta:toolbar>
			<ta:box id="procInc">
				<%@ include file="/yhsi3/comm/veritySuggestView1.jsp"%>
			</ta:box>
			<ta:panel id="pnlJS" key="查询条件" cols="3" expanded="false" scalable="false">
			    <ta:text id="aaz010" key="当事人ID" maxLength="20" onChange="sfwQueryUtil(1,'getDSRXX',Base.getValue('aaz010'))" bpopTipMsg="可输入人员ID、姓名、身份证、单位管理码、单位ID、单位名称查询"/> 
			    <ta:text id="yaa030" key="当事人名称" readOnly="true" span="2" onChange="changeUnit()"/>
			    <ta:text id="aae011" key="经办人" display="false"/>
			    <ta:text id="aaz288" key="征集单ID" onChange="sfwQueryUtil(2,'getAAZ288_PJ',Base.getValue('aaz288'))"  />
			</ta:panel>
			<ta:tabs id="pnlInfo" fit="true" onSelect="fnSelectTab" >
			    <ta:tab id="tab1"  key="待处理单据">
			        <ta:panel id="pnl_dcl" fit="true" expanded="false" scalable="false" heightDiff="77">
				    <ta:datagrid id="ad21Grid" fit="true" haveSn="true" selectType="radio" onRowDBClick="fnClick">
				       <ta:datagridItem id="yad012" key="登帐事件ID" align="center" maxChart="6"/>
				       <ta:datagridItem id="aaz010" key="当事人ID" align="center" maxChart="6"/>
				       <ta:datagridItem id="yaa030" key="当事人名称" showDetailed="true" align="center" maxChart="20"/>
				       <ta:datagridItem id="aae019" key="应处理金额" dataAlign="right" align="center" maxChart="8" totals="sum"/>
				       <ta:datagridItem id="aaz288" key="征集单ID" align="center" maxChart="10" showDetailed="true"/>
				       <ta:datagridItem id="yad011" key="登帐明细ID" align="center" maxChart="10" showDetailed="true"/>
				       <ta:datagridItem id="aae036" key="登帐时间" dataAlign="right" align="center" maxChart="7" dataType="date"/>
					</ta:datagrid>
					</ta:panel>
					<ta:panel cols="3" id="pnlPage" key="票据信息">
					    <ta:text id="pages" key="票据张数" required="true" readOnly="true" display="false"/> 
					    <ta:text id="yad166" key="票据编号前缀" maxLength="10" labelWidth="125"/>
					    <ta:text id="yad163" key="票据开始编号" required="true" maxLength="10" onChange="fnChangeYad163()" labelWidth="125"/>
					    <ta:text id="yad164" key="票据结束编号" required="true" maxLength="10" onChange="fnChangeYad164()" labelWidth="125"/>
					    <ta:text id="yad165" key="票据当前编号" required="true" maxLength="10" onChange="fnChangeYad165()" labelWidth="125"/>
					</ta:panel>
			    </ta:tab>
			    <ta:tab id="tab2"  key="已处理单据">
			        <ta:panel id="pnl_ycl" fit="true" heightDiff="57" expanded="false" scalable="false">
					<ta:datagrid id="ad13Grid"  enableColumnMove="false" haveSn="true" selectType="checkbox">
				       <ta:datagridItem id="yad012" key="登帐事件ID" align="center" maxChart="6"/>
				       <ta:datagridItem id="yad155" key="登帐事件ID" align="center" maxChart="6" hiddenColumn="false"/>
				       <ta:datagridItem id="aaz010" key="当事人ID" align="center" maxChart="6"/>
				       <ta:datagridItem id="yaa030" key="当事人名称" showDetailed="true" align="center" maxChart="20"/>
				       <ta:datagridItem id="aae019" key="应处理金额" dataAlign="right" align="center" maxChart="8" totals="sum"/>
				       <ta:datagridItem id="aaz288" key="征集单ID" align="center" maxChart="6" showDetailed="true"/>
				       <ta:datagridItem id="yad011" key="登帐明细ID" align="center" maxChart="6" showDetailed="true"/>
				       <ta:datagridItem id="aae036" key="登帐时间" dataAlign="right" align="center" maxChart="7" dataType="date"/>
					</ta:datagrid>
					</ta:panel>
					<ta:panel id="pnl2" key="处理意见" cols="3" expanded="false" scalable="false">		
					  <ta:text id="aae013" key="备注"  maxLength="100" span="2" />
	 			   </ta:panel>
				</ta:tab>
			</ta:tabs>
			<ta:text id="txt1" key="判断tab标志" value="1" display="false"/>
	</ta:form>
	<%@ include file="/yhsi3/comm/print.jsp"%>
</body>
</html>
<script type="text/javascript">
	$(document).ready(function() {
		$("body").taLayout();
        Base.setDisabled("printBtn,deleteBtn");
        initializeSuggestFramework(1, 'ae10', 'aaz010', 500, 200, 4, fnSelect1, 0, false);
	    initializeSuggestFramework(2, 'ad21', 'aaz288', 230, 200, 1, null, 0, false); 
	});
	//当事人ID 回调
	function fnSelect1(){
	    Base.setValue("aaz010",g_Suggest[1]);
		Base.setValue("yaa030",g_Suggest[2]);
        Base.clearGridData("ad21Grid");
	    Base.clearGridData("ad13Grid");
	    Base.clearData("pnl2");
	    Base.setValue("aae013","");
	    Base.submit("pnlJS","receiptSuperviseDGAction!QueryTab1.do");
	}
	//tab选中判断
	function fnSelectTab(data){
	    if(data == 'tab1'){
	      Base.setValue('txt1','1');
	      Base.setEnable("printBtn");
	      Base.setDisabled("deleteBtn");
	    }else 
	    if(data == 'tab2'){
	      Base.setValue('txt1','2');
	      Base.setEnable("deleteBtn");
	      Base.setDisabled("printBtn");
	    }
	}
	
	function fnClick(e,rowdata){
	    var yad012 = rowdata.yad012;
		Base.openWindow('userwin',"单据详细信息",myPath()
				+ "/process/publicBusiness/manageFinancial/billQuery/billQueryAction!dbClickbyYAD012.do",
						{"dto['yad012']" : yad012}, "95%", "90%", null, null, true);
	}
	
	//查询
	function fnQuery(){
	    var aaz010 = Base.getValue("aaz010");
	    var aaz288 = Base.getValue("aaz288");
	    if(aaz010==''&&aaz288==''){
	        Base.confirm("没有输入任何条件进行查询会因为数据量特别大而导致其他业务办理速度变慢，是否继续查询？", function(yes,callback){
			        if(yes){
			            Base.clearGridData("ad21Grid");
	                    Base.clearGridData("ad13Grid");
	                    Base.clearData("pnl2");
	                    Base.setValue("aae013","");
	                    Base.submit("pnlJS","receiptSuperviseDGAction!QueryTab1.do");
			        }
			    });
	    }else{
	        Base.clearGridData("ad21Grid");
	        Base.clearGridData("ad13Grid");
	        Base.clearData("pnl2");
	        Base.setValue("aae013","");
	        Base.submit("pnlJS","receiptSuperviseDGAction!QueryTab1.do");
	    }
	    
	}
	//作废票据
	function fnZF(){
	    Base.submit("pnlPages","receiptSuperviseDGAction!toZF.do");
	}
	//打印预览
	function fnPrint(){
	    var rows = Base.getGridSelectedRows("ad21Grid");
	    var aae011 = Base.getValue("aae011");
	    if(rows.length==0){
	        alert("请选择需要打印的票据信息！");
	        return;
	    }
	    var yad165 = Base.getValue("yad165");
	    if(yad165==''||yad165==null){
	        alert("请填写票据编号！");
	        return;
	    }
		var param={};
		param.gridList = Ta.util.obj2string(rows);
		var fileName='receivables_bill.raq';
		Base.submit("form1","receiptSuperviseDGAction!toSave.do",param,null,null,function fnSuccess(){
					      var prm = "yad012=" + rows[0].yad012 + ";aae011=" + aae011;
			    		  fnPrintComm(fileName,prm);
			         },function fnFail(){
			       		Base.alert("打印有误，请联系管理员");
		});
	}
	//删除
	function fnDelete(){
		var rows=Base.getGridSelectedRows("ad13Grid"); //获取表格选中行
		if(rows.length==0){
		    Base.activeTab("ad13Grid");
			alert("请勾选要作废的单据！");
		}else{
		    //判断处理单据是否为同一当事人
		    var aaz010=rows[0].aaz010;//
		    var isTrue=true;
		    for(var i=0;i<rows.length;i++){
		       if(aaz010!=rows[i].aaz010){
		           isTrue=false;		          
		       }
		    }
		    if(!isTrue){
		       Base.alert("处理单据不属于同一当事人！","warn");
		       return;
		    }else{
		       var param={};
		       param.gridList = Ta.util.obj2string(rows);
		       Base.submit("form1","receiptSuperviseDGAction!toDelete.do",param,null,null,
		       function fnSuccess(){
		         Base.submit("pnlJS","receiptSuperviseDGAction!QueryHD.do");
		         Base.setValue("aae013","");},
		       function fnFail(){Base.clearGridData("ad13Grid");});			    	    
		    }
		}
	}
	//开始编号变更事件
	function fnChangeYad163(){
	    var yad163 = Base.getValue("yad163");
	    var yad164 = Base.getValue("yad164");
	    if(yad164!=''&&yad164!=null){
	        if(yad163>yad164){
	            alert("开始编号不能大于结束编号");
	            Base.setValue("yad163","");
	            Base.focus("yad163");
	            return;
	        }else{
	            Base.setValue("yad165",yad163);
	        }
	    }
	}
	//结束编号变更事件
	function fnChangeYad164(){
	    var yad163 = Base.getValue("yad163");
	    var yad164 = Base.getValue("yad164");
	    if(yad163!=''&&yad163!=null){
	        if(yad163>yad164){
	            alert("结束编号不能小于开始编号");
	            Base.setValue("yad164","");
	            Base.focus("yad164");
	            return;
	        }else{
	            Base.setValue("yad165",yad163);
	        }
	    }
	}
	//现在编号变更事件
	function fnChangeYad165(){
	    var yad163 = "9" + Base.getValue("yad163");
	    var yad164 = "9" + Base.getValue("yad164");
	    var yad165 = "9" + Base.getValue("yad165");
	    if(yad163!=''&&yad163!=null&&yad164!=''&&yad164!=null&&yad165!=''&&yad165!=null){
	        if(yad165<yad163){
	           alert("现在编号必须大于等于开始编号！");
	           Base.setValue("yad165","");
	           Base.focus("yad165");
	           return;
	        }
	        if(yad165>yad164){
	           alert("现在编号必须小于等于结束编号！");
	           Base.setValue("yad165","");
	           Base.focus("yad165");
	           return;
	        }
	    }
	}	
</script>
<%@ include file="/ta/incfooter.jsp"%>