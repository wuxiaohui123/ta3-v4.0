<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>基金收款登帐（银行端）</title>
		<%@ include file="/ta/inc.jsp"%>
	</head>
	<body class="no-scrollbar">
		<ta:pageloading />
		<ta:form id="form1" fit="true">
			<ta:toolbar id="tlb1">
				<ta:button id="queryBtn" key="查询[Q]" icon="xui-icon-query" hotKey="Q" onClick="fnQuery();" asToolBarItem="true" />
				<ta:button id="saveBtn2" key="添加登帐信息[A]" icon="xui-icon-spotAdd" hotKey="A" onClick="fnSave2();" asToolBarItem="true" display="false" />
				<ta:button id="saveBtn" key="基金收款登帐[S]" icon="xui-icon-spotSave" hotKey="S" onClick="fnSave();" asToolBarItem="true" />
				<ta:button id="btnSave" icon="xui-icon-spotSave" key="抹账" hotKey="ctrl+S" onClick="submitData()" asToolBarItem="true" />
				<ta:button id="resetBtn" key="重置[R]" icon="xui-icon-spotReset" hotKey="R" type="resetPage" asToolBarItem="true" />
			</ta:toolbar>
			<ta:box id="procInc">
				<%@ include file="/yhsi3/comm/veritySuggestView1.jsp"%>
			</ta:box>
			<ta:panel id="pnlJS" key="查询条件" cols="3" expanded="false" scalable="false">
				<ta:text id="aaz010" key="当事人ID" labelWidth="160" maxLength="20" onChange="sfwQueryUtil(1,'getDSRXX',Base.getValue('aaz010'))"
					bpopTipMsg="可输入人员ID、姓名、身份证、单位管理码、单位ID、单位名称查询" />
				<ta:text id="yaa030" key="当事人名称" labelWidth="160" readOnly="true" span="2" />
				<ta:text id="aaz288" key="单据编号" labelWidth="160" onChange="sfwQueryUtil(2,'getAAZ288',Base.getValue('aaz288'))" />
				<ta:date id="ndate" key="当前时间" readOnly="true" display="false"/>
			</ta:panel>
			<ta:panel id="pnlFina" key="收款信息" cols="3" expanded="false" scalable="false" height="80">
				<ta:text id="yaf010" key="基金帐户ID" labelWidth="160" maxLength="40" />
				<ta:text id="yae597" key="基金帐户开户银行名称" labelWidth="160" span="2" readOnly="true" />
				<ta:text id="aae010" key="基金帐户银行账号" labelWidth="160" readOnly="true"/>
				<ta:text id="aae009" key="基金帐户名称" labelWidth="160" span="2" readOnly="true"/>
				<ta:selectInput id="aad005" key="收款类型" labelWidth="160" collection="AAD005" value="11" filter="10,11" reverseFilter="true"
					isAutoExtend="true" />
				<ta:date id="aad017" key="收款时间" showSelectPanel="true" labelWidth="160" required="true" validNowTime="left" onChange="changeAAD017()"/>
				<ta:number id="yad003" key="收款金额" alignLeft="true" readOnly="true" precision="2" labelWidth="160" max="999999999999.99" />
				<ta:text id="aad009" key="缴费凭证编号" labelWidth="140" maxLength="20" display="false" />
				<ta:selectInput id="yae819" key="是否立即实收分配" labelWidth="140" display="false" data="[{'id':'1','name':'立即分配','px':'1'}]" required="true" value="1" />
				<%--{'id':'0','name':'不立即分配','px':'0'}有需要再添加--%>
				<ta:text id="aae008" key="银行编号" display="false" />
				<ta:text id="aaz002" key="业务日志ID" display="false" />
				<ta:text id="heji" key="合计" display="false" />
				<ta:text id="yad158" key="征集套账类型——dataGrid" display="false" />
				<ta:text id="yad158_m" key="征集套账类型——rpc" display="false" />
			</ta:panel>
			<ta:tabs fit="true">
				<ta:tab id="tab1" key="单据信息">
					<ta:datagrid id="danjuGrid" fit="true" snWidth="30" haveSn="true" selectType="checkbox" forceFitColumns="true" onSelectChange="selectChage" onRowDBClick="fnClick">
						<ta:datagridItem id="aaz288" key="单据编号" align="center" maxChart="8" />
						<ta:datagridItem id="aaa028" key="当事人类别" align="center" collection="AAA028" maxChart="5" />
						<ta:datagridItem id="aaz010" key="当事人ID" align="center" maxChart="8" />
						<ta:datagridItem id="yaa030" key="当事人名称" showDetailed="true" align="center" maxChart="10" />
						<ta:datagridItem id="aae019" key="应收金额" dataAlign="right" align="center" maxChart="5" totals="sum" formatter="fnFormatter" tatalsTextShow="false" />
						<ta:datagridItem id="yad158" key="基金帐套" align="center" collection="yad158" maxChart="5" />
						<ta:datagridItem id="aae013" key="备注" align="center" maxChart="10" showDetailed="true" />
						<ta:datagridItem id="aae281" key="征集通知单据号" hiddenColumn="true" />
					</ta:datagrid>
				</ta:tab>
				<ta:tab id="tab2" key="已登帐未确认信息">
					<ta:datagrid id="querenGrid" fit="true" snWidth="30" haveSn="true" selectType="checkbox" forceFitColumns="true" onSelectChange="selectChage1" onRowDBClick="dbClick">
						<ta:datagridItem id="yad012" key="登帐事件ID" align="center" maxChart="7" dataAlign="center"/>
						<ta:datagridItem id="aad017" key="收款时间" align="center" dataAlign="center"/>
						<ta:datagridItem id="yad003" key="总金额"  align="center" dataAlign="center" totals="sum"/>
						<ta:datagridItem id="cnt" key="登帐笔数" align="center" dataAlign="center"/>
						<ta:datagridItem id="djxx" key="单据信息" align="center" dataAlign="center" showDetailed="true"/>
						<ta:datagridItem id="aae036" key="经办时间" align="center" dataAlign="center"/>
					</ta:datagrid>
				</ta:tab>
			</ta:tabs>
		</ta:form>
	</body>
</html>
<script type="text/javascript">
	$(document).ready(function() {
		$("body").taLayout();
        Base.setDisabled("saveBtn,saveBtn2");
        Base.setReadOnly("yaf010,aae009,aae010,aad005,aad017,yad003,aad009,aad127,yae819");
        initializeSuggestFramework(1, 'ae10', 'aaz010', 500, 200, 4, fnSelect1, 0, false);
	    initializeSuggestFramework(2, 'ad21', 'aaz288', 230, 200, 1, fnSelect2, 0, false);
	    initializeSuggestFramework(3, 'af07', 'yaf010', 600, 100, 4, fnSelect3, 0, false);    
	});
	function fnSelect1(){
	    Base.setValue("aaz010",g_Suggest[1]);
		Base.setValue("yaa030",g_Suggest[2]);
        Base.submit("pnlJS","receivablesyhAction!toCheckAAZ010.do");
        Base.clearGridData("danjuGrid");
        //Base.clearData("pnlFina");
        Base.clearGridData("ae02Grid");
	    Base.setValue("aae016","");
	    Base.setValue("aae416","");
	    Base.setValue("aae419","");
	}
	//查询
	function fnSelect2(){
	    Base.clearGridData("danjuGrid");
	    //Base.clearData("pnlFina");
	    Base.clearGridData("ae02Grid");
	    Base.setValue("aae016","");
	    Base.setValue("aae416","");
	    Base.setValue("aae419","");
	    Base.submit("pnlJS","receivablesyhAction!toCheckAAZ010.do");
	}
	//查询
	function fnQuery(){
	    Base.clearGridData("danjuGrid");
	    Base.clearGridData("infoGrid");
	    Base.clearGridData("ae02Grid");
	    Base.setValue("aae016","");
	    Base.setValue("aae416","");
	    Base.setValue("aae419","");
	    Base.setValue("yae819","1");
	    Base.submit("pnlJS","receivablesyhAction!toCheckAAZ010.do");
	}
	//机关养老 社保机构账号信息
	function fnSelect3(){
		Base.setValue("yaf010",g_Suggest[5]);
		Base.setValue("yae597",g_Suggest[0]);
		Base.setValue("aae009",g_Suggest[1]);
		Base.setValue("aae010",g_Suggest[2]);
		Base.setValue("yad158_m",g_Suggest[4]);
		Base.setValue("aae008",g_Suggest[6]);
		Base.focus("aad005");
	}
	//保存
	function fnSave(){
		var rows = Base.getGridSelectedRows("danjuGrid"); //获取表格选中行
		var infoGrid = Base.getGridData("infoGrid");
		if(rows.length==0){
			alert("请勾选要处理的单据！");
		}else{
		    //判断处理单据是否为同一当事人
		    var aaz010=rows[0].aaz010;//当事人ID
		    var yad158=rows[0].yad158;//征集帐套类型
		    var isTrue=true;
		    var isyad158=true;
		    for(var i=0;i<rows.length;i++){
		       if(aaz010!=rows[i].aaz010){
		           isTrue=false;		          
		       }
		       if(yad158!=rows[i].yad158){
		           isyad158=false;
		       }
		    }
		    if(!isTrue){
		       Base.alert("处理单据不属于同一当事人！","warn");
		       return;
		    }else if(!isyad158){
		       Base.alert("征集帐套类型不一致！","warn");
		       return;
		    }else if(Base.getValue("yad158")!=Base.getValue("yad158_m")){
		       Base.alert("银行信息套账类型和征集单据的套账类型不一致","warn");
		       Base.setValue("yad158","");
	           Base.setValue("yaf010","");
	           Base.setValue("yae597","");
	           Base.setValue("aae010","");
	           Base.setValue("aae009","");
		       Base.focus("yaf010");
		       return;
		    }else if(infoGrid.length==0){
		       var param={};
		       param.gridList = Ta.util.obj2string(rows);
		       Base.submit("pnlFina,pnlJS","receivablesyhAction!toSave.do",param);			    
		    }else if(infoGrid.length!=0){
		       var param={};
		       param.infoGrid = Ta.util.obj2string(infoGrid);
		       param.gridList = Ta.util.obj2string(rows);
		       var aae019=Number(0);
			   for(var i =0;i<rows.length;i++){
				aae019 = parseFloat(rows[i].aae019) + aae019;
			   }
			   aae019 = aae019.toFixed(2)*100/100;
			   var yad003=Number(0);
			   for(var i =0;i<infoGrid.length;i++){
				yad003 = parseFloat(infoGrid[i].yad003) + yad003;
			   }
			   yad003 = yad003.toFixed(2)*100/100;
			   if(aae019!=yad003){
			       alert("应处理总金额(" + aae019 + ")与收款总金额不一致(" + yad003 + ")!");
			       return;
			   }else{
			       Base.submit("","receivablesyhAction!toSaveInfo.do",param); 
			   }	
		    }
		}

	}
	//刪除
	function fnDelete(data,e){
	     Base.confirm("确认删除收款信息？",function(yes){
		     if (yes) {
		         Base.deleteGridRow("infoGrid",data.row);
		     }
		 });
	}
	//保存
	function fnSave2(){
	    var infoGrid = Base.getGridData("infoGrid");
	    var param={};
	    param.infoGrid = Ta.util.obj2string(infoGrid);
	    var yaf010 = Base.getValue("yaf010");
	    if(yaf010==null||yaf010==''){
	        alert('带红星的为必填项,不能为空!');
	        return;
	    }
	    var aad005 = Base.getValue("aad005");
	    if(aad005==null||aad005==''){
	        alert('带红星的为必填项,不能为空!');
	        return;
	    }
	    var aad017 = Base.getValue("aad017");
	    if(aad017==null||aad017==''){
	        alert('带红星的为必填项,不能为空!');
	        return;
	    }
	    var yad003 = Base.getValue("yad003");
	    if(yad003==null||yad003==''){
	        alert('带红星的为必填项,不能为空!');
	        return;
	    }
	    var aad009 = Base.getValue("aad009");
	    if(aad009==null||aad009==''){
	        alert('带红星的为必填项,不能为空!');
	        return;
	    }
	    var yae819 = Base.getValue("yae819");
	    if(yae819==null||yae819==''){
	        alert('带红星的为必填项,不能为空!');
	        return;
	    }
		Base.submit("pnlFina","receivablesyhAction!toSave2.do",param,null,false,function(){
	        Base.setValue("aad005","");
	        Base.setValue("aad017","");
	        Base.setValue("yad003","");
	        Base.setValue("aad009","");
	        Base.setValue("yae819","");
		    Base.setValue("aae008","");
		});	
	}
	//根据当事人类别选择填写单位管理码或则身份证
    function fnSelect(value,key){
       if(key==1){
          Base.showObj("aab999");
          Base.hideObj("aac002");
          Base.setValue("aac001","");
          Base.setValue("aac002",""); 
       }else if(key==2){
          Base.showObj("aac002");
          Base.hideObj("aab999"); 
          Base.setValue("aab001","");
          Base.setValue("aab999","");     
       }else{
          Base.hideObj("aac002");
          Base.hideObj("aab999");
          Base.setValue("aab001","");  
          Base.setValue("aac001",""); 
          Base.setValue("aab999","");  
          Base.setValue("aac002",""); 
       }
    }
	//根据征集ID和当事人ID查询单据
    function queryByAaz288(){
       var aaz010="";
       var aab001=Base.getValue("aab001");
       var aac001=Base.getValue("aac001");
       if(""!=Base.getValue("aab001")){
          aaz010=aab001;
       }else if(""!=Base.getValue("aac001")){
          aaz010=aac001;
       }
       Base.submit("aaz288","receivablesyhAction!queryByAaz288.do",{"dto['aaz010']":aaz010});
    }
    //统计待处理金额总计
	function selectChage(rowsdata,n){
	    var rows=Base.getGridSelectedRows("danjuGrid");
	    if(rows.length != 0){
		    var yad158=rows[0].yad158;//征集帐套类型
		    var isyad158=true;
		    //迭代比较征集帐套类型
		    for(var i=0;i<rows.length;i++){
		       if(yad158!=rows[i].yad158){
		           isyad158=false;//征集帐套类型不一致 
		       }
		    }
		    if(!isyad158){
		       Base.alert("征集帐套类型不一致！","warn");
		       Base.setValue("yad158","");
		       Base.setValue("yaf010","");
	           Base.setValue("yae597","");
	           Base.setValue("aae010","");
	           Base.setValue("aae009","");
	           Base.setValue("yae819","");
		       Base.setDisabled("saveBtn");
		       Base.setReadOnly("aad005,aad017,aad009,aad127");
		       return;
		    }else{
		       Base.setValue("yad158",yad158);
		       Base.setEnable("saveBtn,aad017,aad009,aad127,yae819,saveBtn2");
		       Base.focus("aad005");
		    }
	    }else{
	      Base.setDisabled("saveBtn");
	      Base.setReadOnly("yaf010,aad005,aad017,yad003,aad009,aad127,yae819");
	    }
	    
	    if("0"!=n){
		    var aae019=Number(0);
			for(var i in rowsdata){
				aae019 = aae019 + Number(rowsdata[i].aae019);
			}
			aae019 = Math.round(aae019*100)/100;
			Base.setValue("heji",aae019);
			Base.setValue("yad003",aae019);
		}else{
            Base.setValue("heji","0");
            Base.setValue("yad003",0);
		}
	}
	
	//统计待处理金额总计
	function selectChage1(rowsdata,n){
		var rows=Base.getGridSelectedRows("querenGrid");
		if(rows.length != 0){
			Base.setEnable("btnSave");
		}else{
			Base.setDisabled("btnSave");
		}
	}
	
	function fnFormatter(row, cell, value, columnDef, dataContext){
             return "<span style='color:red;'>"+dataContext.aae019+"</span>";
        }	
	//多参数检索下拉框数据
	function fnBankXX(){
	  suggestQuery(3,myPath()+"/process/comm/suggestFrameworkAction!getBankInjb_nxs.do",{"dto['jstj']":Base.getValue('yaf010'),"dto['yad158']":Base.getValue('yad158'),"dto['aaa082']":"1"});
	}		
	
	function fnFormatter(row, cell, value, columnDef, dataContext){
             return "<span style='color:red;'>"+dataContext.aae019+"</span>";
    }	
    
    function submitData() {
		var selectRows = Base.getGridSelectedRows("querenGrid");
		var prm = {};
		prm.d2List = Ta.util.obj2string(selectRows);
		if (selectRows == null || selectRows == ''){
			alert("请勾选要抹账的数据");
			return;
		}
		Base.submit("pnlJS", "receivablesyhAction!toMZ.do", prm, null, null,
				function() {
				});
	}
	
	function changeAAD017(){
		var aad017 = Base.getValue("aad017");
		var ndate = Base.getValue("ndate");
		var sdate = new Date(ndate);
		sdate=sdate.valueOf() - 7*24*60*60*1000;
		
		var aad017d = new Date(aad017);
		aad017d = aad017d.valueOf();
		if (aad017d < sdate){
			Base.setValue("aad017","");
			alert("登帐时间不能早于当前日期前7天,请确认!");
		}
	}
	
	function dbClick(e,row){
		var yad012 = row.yad012;
		Base.openWindow('userwin',"单据详细信息",myPath()
				+ "/process/publicBusiness/manageFinancial/billQuery/billQueryAction!dbClickbyYAD012.do",
						{"dto['yad012']" : yad012}, "95%", "90%", null, null, true);
	}
	
	function fnClick(e,rowdata){
	    var aaz288 = rowdata.aaz288;
		var sfxxgrmx = '1'; //显示个人征集明细
		Base.openWindow('userwin',"单据详细信息",myPath()
				+ "/process/publicBusiness/manageFinancial/billQuery/billQueryAction!dbClick.do",
						{"dto['aaz288']" : aaz288,"dto['sfxxgrmx']":sfxxgrmx}, "95%", "90%", null, null, true);
	}
</script>
<%@ include file="/ta/incfooter.jsp"%>