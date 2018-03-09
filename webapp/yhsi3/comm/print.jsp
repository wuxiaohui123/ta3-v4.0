<%@ page language="java" pageEncoding="UTF-8"%>
<ta:text id="aae011_jybz" display="false"/>
<iframe id="report1_printIFrame" name="report1_printIFrame" width="50" height="50" style="position:absolute;left:-100px;top:-100px"></iframe>

<script type="text/javascript">
    
	function fnPrintComm(fileName,prm){	
        if(prm.length==0){
        	alert("请选择需要打印的数据！");
        	return;
        }        
        //先校验是直接打印还是需要预览后才打印
	    Base.getJson(myPath()+"/process/publicBusiness/comm/publicPrintQXAction!toQueryTmp_report_aae011.do",null,function(data){
	        var aae011_jybz = data.fieldData.aae011_jybz;
	        if(aae011_jybz==""||aae011_jybz==null||aae011_jybz=="1"){//需要预览
	            $("#report1_printIFrame").attr("src",myPath()+"/reportServlet?action=2&name=report1&reportFileName="+fileName+"&"+
					"srcType=file&savePrintSetup=no&appletJarName=runqian/runqianReport4Applet.jar%2Crunqian/dmGraphApplet.jar&"+
					"serverPagedPrint=no&mirror=no&"+
					"paramString="+prm				
					);   
	        }else if(aae011_jybz=="0"){//无需预览
	            $("#report1_printIFrame").attr("src",myPath()+"/reportServlet?action=30&name=report1&reportFileName="+fileName+"&"+
					"srcType=file&savePrintSetup=no&appletJarName=runqian/runqianReport4Applet.jar%2Crunqian/dmGraphApplet.jar&"+
					"serverPagedPrint=no&mirror=no&"+
					"paramString="+prm				
					);
	        }	
	    }); 
     }
     
     function fnSetWindow(gridid){
      
	   var rowdata = Base.getGridSelectedRows(gridid);
	    var param={};	    	
		if(rowdata==''||rowdata==null){
			Base.alert("请勾选需要打印的信息！");
			return ;
		}
	   for (var i= 0 ;i<rowdata.length;i++){
	      for (var j= 0 ;j<rowdata.length;j++){
	          if(rowdata[i].aae140!=rowdata[j].aae140
	          ||rowdata[i].aab033!=rowdata[j].aab033
	          ||rowdata[i].yad009!=rowdata[j].yad009	          
	          ){
	             Base.alert("需要打印的各征集信息的征收方式,险种类型,收支类型不一致");
	             return;
	          }
	      }
	   }
	   
	   
	   param.zjList = Ta.util.obj2string(rowdata);		
	   Base.openWindow('userwin', "打印设置", "process/publicBusiness/comm/publicPrintAction!toSetWindow.do",
                    param,"30%", "30%",null,function(){
                        Base.submit("aab001","refundBillPrintAction!toQueryAd21.do",{ "dto['gridid']":gridid});                    
                    },true);
	}     	
</script>	