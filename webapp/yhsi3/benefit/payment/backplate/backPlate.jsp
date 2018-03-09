<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<%@ taglib prefix="ta" tagdir="/WEB-INF/tags/tatags" %>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
	<title>银行回盘</title>
	<%@ include file="/ta/inc.jsp"%>
	</head>
	<body style="margin:0px;padding:0px">
		<ta:pageloading />
		<ta:form id="form1" cssStyle="overflow:auto;" fit="true" enctype="multipart/form-data" methord="post">
		<%@ include file="/yhsi3/benefit/common/treatmentTypes.jsp"%> 
		 <!-- *********************************回盘界面****************************-->
		<ta:fieldset id="fieldset1" key="上传文件："  >
		  <ta:box cols="3">
			<input id="theFile" type="file" name="theFile" />
	        <ta:submit id="btn_input" key="导入信息[D]" hotKey="d" icon="icon-arrow_up" submitIds="form1"  url="backPlateAction!upfile.do" isSyncSubmit="true"/>
		   <div  style="width:15%;padding-left:150px"  >
				<a onmouseover="this.style.color = 'RED';"  
				    onmouseout="this.style.color = 'rgb(161,161,161)';"  id="dto(xzmb)_label" 
                    href="backPlateAction!downFile.do" 
                    style="color:rgb(161,161,161);width:200px;" >
						<strong>
						   <pre>   >>下载EXCEL模板<<</pre>
						</strong>
				 </a>
		   </div> 
		   <div  style="width:15%;padding-left:150px"  >
				<a onmouseover="this.style.color = 'RED';"  
				    onmouseout="this.style.color = 'rgb(161,161,161)';"  id="dto(xzmbtxt)_label" 
                    href="backPlateAction!downFileTxt.do" 
                    style="color:rgb(161,161,161);width:200px;" >
						<strong>
						   <pre>   >>下载TXT模板<<</pre>
						</strong>
				 </a>
		   </div> 
          </ta:box>					 		
		</ta:fieldset>
		<ta:tabs id="tabs1" fit="true" height="300">  
			<ta:tab id="tab1" key="导入正确信息"  > 
			    <ta:buttonLayout>
			  	    <ta:button id="saveBtn" icon="xui-icon-spotSave" hotKey="ctrl+S" key="回盘处理[S]"  onClick="save()" />
			    </ta:buttonLayout>
			     <ta:panel id="okid" key="正确信息" height="270">
			      <ta:datagrid id="oklist" fit="true"  haveSn="true" heightDiff="60" forceFitColumns="true" >
			            <ta:datagridItem id="aaz031" key="拨付单编号" /> 
						<ta:datagridItem id="aac001" key="个人编号"  />
			            <ta:datagridItem id="aac003" key="姓名"  />
						<ta:datagridItem id="aae019" key="金额" dataAlign="right"/>
			            <ta:datagridItem id="aae010" key="银行帐号"  />
						<ta:datagridItem id="aae117" key="成功标志"  collection="AAE117"/>
			            <ta:datagridItem id="aae357" key="失败原因"  collection="AAE357"/>
	              </ta:datagrid> 
	           </ta:panel>  
		   </ta:tab>
		   <ta:tab id="tab2" key="导入错误信息"  > 
		   	   <ta:panel id="errid" key="错误信息" height="300">
		          <ta:datagrid id="errlist"   haveSn="true"  forceFitColumns="true" heightDiff="70"> 
						<ta:datagridItem id="aac001" key="个人编号"  width="235"/>
						<ta:datagridItem id="aac002" key="公民身份号码" width="255" />
						<ta:datagridItem id="aac003" key="姓名"  width="235"/>
						<ta:datagridItem id="aae013" key="备注" showDetailed="true" width="340"/>
			      </ta:datagrid> 
			   </ta:panel>
		   </ta:tab>
		 </ta:tabs>
		 <!-- *********************************回盘结束****************************-->
		</ta:form>
	</body>
</html>
<script type="text/javascript">

//查询抛盘信息
function query(){
	Base.submit("form1","backPlateAction!query.do");
}

//导入信息
function save(){
	var mp = Base.getGridData('oklist');
	/*
    var aae002 =Base.getValue('aae002_1')
	    if(aae002 == 0){
	       Base.alert('请输入支付期号','error');
	    } */
		if(mp.length == 0){
			Base.alert('请选择列表数据','error');
		}else{
			Base.submit("form1","backPlateAction!toSave.do",{"selectedMP":Ta.util.obj2string(mp)});
		}
}

//导出报盘文件
function bp(){ 
    var aae002=$("#aae002").val();
    var aae140=$("#aae140").val();
    var aaf002=$("#aaf002").val();
    var aaz031=$("#aaz031").val();
	location.href="<%=path%>/process/pensionbenefit/payment/backPlate/backPlateAction!bp.do?dto.aae002="+aae002+"&dto.aae140="+aae140+"&dto.aaf002="+aaf002+"&dto.aaz031="+aaz031;   
}

function showlist2(e, rowdata){
	Base.submit("fieldset2","<%=path%>/process/pensionbenefit/payment/backPlate/backPlateAction!queryList.do",{"dto['aae140']":rowdata.aae140,"dto['aaz031']":rowdata.aaz031},null,function(data){
		null;
		});
}
	
$(document).ready(function() {
		$("body").taLayout();
		$("body").css("overflow","hidden");
        // 全局控制界面展示
		//parent.Base.setDisabled("startprocess");
		//parent.Base.setEnable("startprocess");
		//parent.Base.showObj("startprocess");
		//parent.Base.hideObj("startprocess");
	});
</script>
<%@ include file="/ta/incfooter.jsp"%>