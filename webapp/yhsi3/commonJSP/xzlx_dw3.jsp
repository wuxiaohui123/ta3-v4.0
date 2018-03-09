<!-- 险种类型选择 -->
<%@ page language="java" pageEncoding="UTF-8"%>
<ta:panel id="xzlx" key="险种选择" expanded="true" scalable="false">
	<ta:fieldset cssStyle="border:0px">
		<ta:checkboxgroup id="xzlxcheckbox" >
			<ta:box cols="8">
				<ta:box span="1">
					<ta:checkbox id="aae140_all" value="aae140_all" key="全选" onClick="checkedAae140All()" />
				</ta:box>
				<ta:box span="1">
					<ta:checkbox id="aae140_110" value="aae140_110" key="企业养老" onClick="checkedAae140('110')" />				 
					<ta:checkbox id="aae140_120" value="aae140_120" key="机关养老" onClick="checkedAae140('120')" />
				</ta:box>
				<ta:box span="1">
					<ta:checkbox id="aae140_210" value="aae140_210" key="失业" onClick="checkedAae140('210')" />
				</ta:box>
				<ta:box span="1">
					<ta:checkbox id="aae140_310" value="aae140_310" key="基本医疗" onClick="checkedAae140('310')" />
					<ta:checkbox id="aae140_311" value="aae140_311" key="个帐补充" onClick="checkedAae140('311')" />
					<ta:checkbox id="aae140_330" value="aae140_330" key="大额医疗" onClick="checkedAae140('330')" />
				</ta:box>
				<ta:box span="1">
				    <ta:checkbox id="aae140_320" value="aae140_320" key="公务员补充" onClick="checkedAae140('320')" />
					<ta:checkbox id="aae140_370" value="aae140_370" key="企业补充" onClick="checkedAae140('370')" />
				</ta:box>
				<ta:box span="1">
					<ta:checkbox id="aae140_340" value="aae140_340" key="离休二乙" onClick="checkedAae140('340')" />
				</ta:box>				
				<ta:box span="1">
					<ta:checkbox id="aae140_410" value="aae140_410" key="工伤" onClick="checkedAae140('410')" />
				</ta:box>
				<ta:box span="1">
					<ta:checkbox id="aae140_510" value="aae140_510" key="生育" onClick="checkedAae140('510')" />
				</ta:box>
			</ta:box>
		</ta:checkboxgroup>
	</ta:fieldset>
</ta:panel>
<script type="text/javascript">
	
	//获取所有险种状态
	function getAllStatus(){
		var aae140Array = ['110','120','210','310','320','330','340','350','370','410','510'];
		var aae140Vals;
		for(var i=0;i<aae140Array.length;i++){
			var aae140 = aae140Array[i];
			var display = $('#aae140_' + aae140).parent('div').css('display');//可见性
		    var disable = $('#aae140_' + aae140).attr('disabled');//可用性
		    var readonly = $('#aae140_' + aae140).attr('readonly');//可读性
		    if(typeof(aae140Vals) == 'undefined'){
		    	aae140Vals = aae140 + '-' + display + '-' + disable + '-' + readonly;
		    }else{
		    	aae140Vals = aae140Vals + ',' + aae140 + '-' + display + '-' + disable + '-' + readonly;
		    }
		}
		if(typeof(aae140Vals) == 'undefined'){
			aae140Vals = 'nothing';
		}
		return aae140Vals;
	}

	// 选择所有险种
	function checkedAae140All(){
		var flag;
		var aae140Vals = getAllStatus();
		// 是否被选择
	    if(Base.getObj("aae140_all").checked){
	    	flag = '1';  // 选择		
		}else{
			flag = '0';  // 未选择			
		}
		
		Base.submit("xzlx",myPath()+"/process/publicBusiness/comm/publicBusinessAction!checkbox_aae140_all_dw.do",{"dto['flag']":flag,"dto['aae140Vals']":aae140Vals});
	}
	// 选择单一险种
	function checkedAae140(id){
	    var flag;
	    var aae140Vals = getAllStatus();
		// 是否被选择
	    if(Base.getObj("aae140_"+id).checked){
	    	flag = '1';  // 选择		
		}else{
			flag = '0';  // 未选择			
		}
		Base.submit("xzlx",myPath()+"/process/publicBusiness/comm/publicBusinessAction!checkbox_aae140_dw.do",{"dto['aae140']":id,"dto['flag']":flag,"dto['aae140Vals']":aae140Vals});		
	}
	
</script>
