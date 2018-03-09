<!-- 险种类型选择 -->
<%@ page language="java" pageEncoding="UTF-8"%>
<ta:panel id="xzlx_c" key="险种选择" expanded="true" scalable="false" >
	<ta:fieldset cssStyle="border:0px">
		<ta:checkboxgroup>
			<ta:box cols="8">
				<ta:box span="1">
					<ta:checkbox id="aae140_c_all" key="全选" onClick="checkAllAae140()"/>
				</ta:box>
				<ta:box span="1">
					<ta:checkbox id="aae140_c_110" key="企业养老"  />
				</ta:box>
				<ta:box span="1">
					<ta:checkbox id="aae140_c_210" key="失业"  />
				</ta:box>
				<ta:box span="1">
					<ta:checkbox id="aae140_c_310" key="基本医疗"  />
					<ta:checkbox id="aae140_c_330" key="大病补助"  />
					<ta:checkbox id="aae140_c_320" key="公务员补充"  />
					<ta:checkbox id="aae140_c_370" key="企业补充"  />
				</ta:box>
				<ta:box span="1">
					<ta:checkbox id="aae140_c_340" key="离休二乙"  />
				</ta:box>				
				<ta:box span="1">
					<ta:checkbox id="aae140_c_410" key="工伤"  />
				</ta:box>
				<ta:box span="1">
					<ta:checkbox id="aae140_c_510" key="生育"  />
				</ta:box>
			</ta:box>
		</ta:checkboxgroup>
	</ta:fieldset>
</ta:panel>
<script type="text/javascript">
	function checkAllAae140(){
		 var aae140Array = ['110','210','310','330','320','370','340','410','510'];
			if(Base.getObj("aae140_c_all").checked==true){
		     	for(var i=0;i<aae140Array.length;i++){
		     		Base.getObj("aae140_c_"+aae140Array[i]).checked=true; 
				}
			}else{
				for(var i=0;i<aae140Array.length;i++){
		     		Base.getObj("aae140_c_"+aae140Array[i]).checked=false;  
				}
			}
	}
</script>
