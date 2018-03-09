<!-- 险种类型选择 -->
<%@ page language="java" pageEncoding="UTF-8"%>
<ta:panel id="xzlx" key="险种选择" expanded="false" scalable="false" height="80px" >
	<ta:checkboxgroup id="ckbxAae140">
			<ta:box cols="8">
				<ta:box span="1">
					<ta:checkbox id="aae140_all" key="全选" value="all" onClick="checkedAae140All()" />
				</ta:box>
				<ta:box span="1">
					<ta:checkbox id="aae140_110" key="企业养老" value="110" onClick="checkedAae140('110')" />
					<ta:checkbox id="aae140_120" key="机关养老" value="120" onClick="checkedAae140('120')" />
				</ta:box>
				<ta:box span="1">
					<ta:checkbox id="aae140_210" key="失业" value="210" onClick="checkedAae140('210')" />
				</ta:box>
				<ta:box span="1">
					<ta:checkbox id="aae140_310" key="基本医疗" value="310" onClick="checkedAae140('310')" />
					<ta:checkbox id="aae140_330" key="大病补助" value="330" onClick="checkedAae140('330')" />
					<ta:checkbox id="aae140_311" key="个帐补充" value="311" onClick="checkedAae140('311')" />
				</ta:box>
				<ta:box span="1">
					<ta:checkbox id="aae140_320" key="公务员补充" value="320" onClick="checkedAae140('320')" />
					<ta:checkbox id="aae140_370" key="企业补充" value="370" onClick="checkedAae140('370')" />
				</ta:box>
				
				<ta:box span="1">
					<ta:checkbox id="aae140_340" key="离休" value="340" onClick="checkedAae140('340')" />
					<ta:checkbox id="aae140_350" key="二乙" value="350" onClick="checkedAae140('350')" />
				</ta:box>
				<ta:box span="1">
					<ta:checkbox id="aae140_410" key="工伤" value="410" onClick="checkedAae140('410')" />
				</ta:box>
				<ta:box span="1">
					<ta:checkbox id="aae140_510" key="生育" value="510" onClick="checkedAae140('510')" />
				</ta:box>
			</ta:box>
		</ta:checkboxgroup>
</ta:panel>
<script type="text/javascript">	
    var arr = new Array('110','120','210','310','311','320','330','340','350','370','410','510');	 
    
	// 险种：单选
	function checkedAae140(id) {
		var flag = true;
		for(var x in arr){
		   if(!Base.getObj("aae140_" + arr[x]).checked){
			   flag = false; 
		   }
		}
		if(flag){
		   Base.setValue("aae140_all","all");	
		}else{
		   Base.setValue("aae140_all","");
		}	
	}	
	// 险种：全选
	function checkedAae140All() {
	    if(Base.getObj("aae140_all").checked){	    	
			for ( var x in arr ) {
				Base.setValue("aae140_" +arr[x],arr[x]);
			}
	    } else {
	    	for ( var x in arr ) {
	    		Base.setValue("aae140_" +arr[x],"");
			}
	    }	    
	}
	
</script>
