<%@ page language="java" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" uri="/ta3"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>拨款凭证打印预览</title>
<%@ include file="/ta/inc.jsp"%>
</head>
   <body>
      <ta:pageloading/>
      <ta:form id="form1" fit="true" layout="border" heightDiff="150">
	         <ta:toolbar id="tlb">
	           <ta:button id="printBtn" key="打印[P]" icon="xui-icon-spotPrint" hotKey="P" onClick="fnPrint();"  asToolBarItem="true"/>
			   <ta:button id="closeBtn" key="关闭[C]" icon="xui-icon-spotClose" hotKey="C" onClick="fnClose();" asToolBarItem="true"/>
		    </ta:toolbar>
			<ta:panel id="pnlInfo" key="票据信息" cols="3" expanded="false" scalable="false" position="top">
			    <ta:text id="pages" key="票据张数" required="true" readOnly="true" display="false"/> 
			    <ta:text id="yad166" key="票据编号前缀" maxLength="10" labelWidth="125"/>
			    <ta:text id="yad163" key="票据开始编号" required="true" maxLength="10" onChange="fnChangeYad163()" labelWidth="125"/>
			    <ta:text id="yad164" key="票据结束编号" required="true" maxLength="10" onChange="fnChangeYad164()" labelWidth="125"/>
			    <ta:text id="yad165" key="票据当前编号" required="true" maxLength="10" onChange="fnChangeYad165()" labelWidth="125"/>
			</ta:panel>
			<ta:panel id="pnl_dcl" fit="true" expanded="false" scalable="false" position="center">
			    <ta:datagrid id="ad21Grid"  haveSn="true" fit="true" forceFitColumns="true">
				    <ta:datagridItem id="aaz288" key="征集单ID" align="center" dataAlign="left" maxChart="8"/>
				    <ta:datagridItem id="yad165" key="票据编号" align="center" dataAlign="left" maxChart="8" hiddenColumn="false"/>
				    <ta:datagridItem id="aaz010" key="当事人ID" align="center" dataAlign="left" maxChart="8"/>
				    <ta:datagridItem id="yaa030" key="当事人名称" showDetailed="true" align="center" dataAlign="right" maxChart="10"/>
				    <ta:datagridItem id="aae019" key="应处理金额" dataAlign="right" align="center" maxChart="10" totals="sum"/>
				    <ta:datagridItem id="yad158" key="征集帐套类型" align="center" collection="yad158" maxChart="6"/>
				    <ta:datagridItem id="yaf011" key="银行同城异地标志" align="center" collection="yaf011" maxChart="8"/>
				    <ta:datagridItem id="aae013" key="备注" align="center" maxChart="20" showDetailed="true"/>
				</ta:datagrid>
			</ta:panel>
			<ta:panel id="pnlFina" key="登帐信息" cols="2"  expanded="false" scalable="false" position="bottom" >		
		 	    <ta:text id="yaf010" key="社保机构银行帐号ID" required="true" labelWidth="140" maxLength="40" onChange="fnBankXX()"/>
				<ta:text id="yae597" key="开户银行名称" labelWidth="140" readOnly="true" />
				<ta:text id="aae010" key="社保机构银行账号" labelWidth="140" maxLength="60" readOnly="true" />
				<ta:text id="aae009" key="社保机构银行户名" labelWidth="140" maxLength="60" readOnly="true" />	    
		 		<ta:selectInput id="aaa158" key="支付结算类型" labelWidth="140" collection="aaa158" required="true"/>
		 		<ta:date id="aad017" key="支付时间" showSelectPanel="true" labelWidth="140" required="true" validNowTime="left" display="false"/>
		 		<ta:number id="yad003" key="支付金额" alignLeft="true" required="true" precision="2" labelWidth="140" max="999999999999.99"/>				
		 		<ta:text id="aad009" key="支付票据编号" labelWidth="140" maxLength="20" required="true"/>
		 		<ta:text id="aae008" key="银行编号" display="false"/>
		 		<ta:text id="aaz002" key="业务日志ID" display="false"/>
		 		<ta:text id="heji" key="合计" display="false"/>
				<ta:text id="yad158" key="征集套账类型——dataGrid" display="false"/>
				<ta:text id="yad158_m" key="征集套账类型——rpc" display="false"/>
		 	</ta:panel>
			<iframe id="report1_printIFrame" name="report1_printIFrame" width="50" height="50" style="position:absolute;left:-100px;top:-100px"></iframe>
	</ta:form>
</body>
</html>
<script type="text/javascript">
	$(document).ready(function() {
		$("body").taLayout();
        initializeSuggestFramework(3, null, 'yaf010', 600, 100, 4, fnSelect3, 0, false);    
	});
	//银行信息
	function fnSelect3(){
	    Base.setValue("yaf010",g_Suggest[5]);
		Base.setValue("yae597",g_Suggest[0]);
		Base.setValue("aae009",g_Suggest[1]);
		Base.setValue("aae010",g_Suggest[2]);
		Base.setValue("yad158_m",g_Suggest[4]);
		Base.setValue("aae008",g_Suggest[6]);
		Base.focus("aaa158");
	}
    //统计待处理金额总计
	function selectChage(rowsdata,n){
	    var rows=Base.getGridSelectedRows("danjuGrid");
		if("0"!=n){
		    var aae019=0;
			for(var i in rowsdata){
				aae019 += rowsdata[i].aae019;
			}
			Base.setValue("heji",aae019);
		}else{
            Base.setValue("heji","0");
		}
	}	
	//保存
	function fnPrint(){
	    var yad163 = Base.getValue("yad163");
	    if(yad163==''||yad163==null){
	        alert("请输入开始编号！");
	        return;
	    }
	    var yad164 = Base.getValue("yad164");
	    if(yad164==''||yad164==null){
	        alert("请输入结束编号！");
	        return;
	    }
		var rows = Base.getGridData("ad21Grid");
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
		    }else if(Number(Base.getValue("yad003"))!=Base.getValue("heji")){
		       Base.alert("处理金额不一致！","warn");
		       Base.setValue("yad003","");
		       Base.focus("yad003");
		       return;
		    }else if(Base.getValue("yad158")!=Base.getValue("yad158_m")){
		       Base.alert("银行信息套账类型和征集单据的套账类型不一致","warn");
		       Base.setValue("yad158","");
	           Base.setValue("yaf010","");
	           //Base.setValue("yae597","");
	           //Base.setValue("aae010","");
	           //Base.setValue("aae009","");
		       Base.focus("yaf010");
		       return;
		    }else{
				var param={};
				var yaf011 = rows[0].yaf011;
				param.gridList = Ta.util.obj2string(rows);
				Base.submit("form1","proofPrintAction!toSave.do",param,null,false,function(){
				    var aaz002 = Base.getValue("aaz002");
				    if(yaf011==''||yaf011==null||yaf011=='0'){
					    $("#report1_printIFrame").attr("src",myPath()+"/reportServlet?action=2&name=report1&reportFileName=payment_tc.raq&"+
						"srcType=file&savePrintSetup=yes&appletJarName=runqian/runqianReport4Applet.jar%2Crunqian/dmGraphApplet.jar&"+
						"serverPagedPrint=no&mirror=no&"+
						"paramString=prm_aaz002=" + aaz002);
					}else if(yaf011=='1'){
					    $("#report1_printIFrame").attr("src",myPath()+"/reportServlet?action=2&name=report1&reportFileName=payment_yd.raq&"+
						"srcType=file&savePrintSetup=yes&appletJarName=runqian/runqianReport4Applet.jar%2Crunqian/dmGraphApplet.jar&"+
						"serverPagedPrint=no&mirror=no&"+
						"paramString=prm_aaz002=" + aaz002);
					}
				});
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
	            Base.setValue("aad009",yad163);
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
	            Base.setValue("aad009",yad163);
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
	        Base.setValue("aad009",(yad165.toString()).substring(1,(yad165.toString()).length));
	    }
	}
	//多参数检索下拉框数据
	function fnBankXX(){
	  suggestQuery(3,myPath()+"/process/comm/suggestFrameworkAction!getBankInjb_JJSZ.do",{"dto['jstj']":Base.getValue('yaf010'),"dto['yad158']":Base.getValue('yad158'),"dto['aaa082']":"2"});
	  //suggestQuery(3,myPath()+"/process/comm/suggestFrameworkAction!getBankIn_FK.do",{"dto['jstj']":Base.getValue('yaf010'),"dto['yad158']":Base.getValue('yad158')});
	}
	
	//银行信息
	function fnSelect3(){
	    Base.setValue("yaf010",g_Suggest[5]);
		Base.setValue("yae597",g_Suggest[0]);
		Base.setValue("aae009",g_Suggest[1]);
		Base.setValue("aae010",g_Suggest[2]);
		Base.setValue("yad158_m",g_Suggest[4]);
		Base.setValue("aae008",g_Suggest[6]);
		Base.focus("aaa158");
	}
	
	//关闭
	function fnClose(){
	    parent.Base.closeWindow("ourwin");
	}	
</script>
<%@ include file="/ta/incfooter.jsp"%>