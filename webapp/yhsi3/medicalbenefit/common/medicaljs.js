/**
 * 两定机构查询
 * @param datagrid 
 */ 
function getKb01Info(callbackFun)
{  
	var param = {"dto['akb020']":Base.getValue('akb020')};
	Base.getJson(myPath()+"/medicalbenefit/common/baseInfoAction!getHospitalInfo.do",param,
			function(data){
				if (data.errMsg != null && data.errMsg != ''){
					Base.alert(data.errMsg, 'warn');
					Base.setValue("akb020",'');
					return true;
				}
				if(data &&  data.hospitalInfoDto){
					Base.setValue("aaz269",data.hospitalInfoDto.aaz269); // 医疗机构及药店ID
					Base.setValue("akb021",data.hospitalInfoDto.akb021); // 医疗服务机构名称
					Base.setValue("akb022",data.hospitalInfoDto.akb022); // 医疗服务机构类型
					Base.setValue("aka101",data.hospitalInfoDto.aka101); // 医院等级
					Base.setValue("akb023",data.hospitalInfoDto.akb023); // 定点医疗服务机构类别
					Base.setValue("akb095",data.hospitalInfoDto.akb095); // 限价医院等级
					Base.setValue("akb096",data.hospitalInfoDto.akb096); // 起付线医院等级
					Base.setValue("akb097",data.hospitalInfoDto.akb097); // 基金支付比例医院等级
					Base.setValue("aaf003",data.hospitalInfoDto.aaf003); // 定点联网开通标志
					Base.setValue("aaz017",data.hospitalInfoDto.aaz017); // 组织登记事件ID
					Base.setValue("akf003",data.hospitalInfoDto.akf003); // 开通IP
					Base.setValue("aka086",data.hospitalInfoDto.aka086); // 服务类别
					Base.setValue("yka541",data.hospitalInfoDto.yka541); // 基本医疗保险基金报销比例类型
					Base.setValue("aaz107",data.hospitalInfoDto.aaz107); // 定点医疗机构ID
					Base.setValue("akd100",data.hospitalInfoDto.akd100); // 机构分类
					Base.setValue("akb301",data.hospitalInfoDto.akb301); // 主机构编码
					Base.setValue("aaa027",data.hospitalInfoDto.aaa027); // 统筹区编码
					callbackFun;
				}
		});
}
/**
 * 两定机构查询
 * @param datagrid 
 */ 
function getKb01InfoMore(callbackFun,id,typeValue)
{   
	var param = {"dto['akb020']":Base.getValue(id)}; 
	Base.getJson(myPath()+"/medicalbenefit/common/baseInfoAction!getHospitalInfo.do",param,
			function(data){
				if (data.errMsg != null && data.errMsg != ''){
					Base.alert(data.errMsg, 'warn');
					Base.setValue(id,'');
					return true;
				}
				if(data &&  data.hospitalInfoDto){
					if(1 == typeValue){
						Base.setValue("akb021",data.hospitalInfoDto.akb021); // 医疗服务机构名称
						Base.setValue("akb097",data.hospitalInfoDto.aka101); // 医院等级
						return true;
					}else if(2 == typeValue){
						Base.setValue("akc172",data.hospitalInfoDto.akb021); // 医疗服务机构名称
						Base.setValue("aka101",data.hospitalInfoDto.aka101); // 医院等级
						return true;
					}else{
						Base.setValue("aaz269",data.hospitalInfoDto.aaz269); // 医疗机构及药店ID
						Base.setValue("akb021",data.hospitalInfoDto.akb021); // 医疗服务机构名称
						Base.setValue("akb022",data.hospitalInfoDto.akb022); // 医疗服务机构类型
						Base.setValue("aka101",data.hospitalInfoDto.aka101); // 医院等级
						Base.setValue("akb023",data.hospitalInfoDto.akb023); // 定点医疗服务机构类别
						Base.setValue("akb095",data.hospitalInfoDto.akb095); // 限价医院等级
						Base.setValue("akb096",data.hospitalInfoDto.akb096); // 起付线医院等级
						Base.setValue("akb097",data.hospitalInfoDto.akb097); // 基金支付比例医院等级
						Base.setValue("aaf003",data.hospitalInfoDto.aaf003); // 定点联网开通标志
						Base.setValue("aaz017",data.hospitalInfoDto.aaz017); // 组织登记事件ID
						Base.setValue("akf003",data.hospitalInfoDto.akf003); // 开通IP
						Base.setValue("aka086",data.hospitalInfoDto.aka086); // 服务类别
						Base.setValue("yka541",data.hospitalInfoDto.yka541); // 基本医疗保险基金报销比例类型
						Base.setValue("aaz107",data.hospitalInfoDto.aaz107); // 定点医疗机构ID
						Base.setValue("akd100",data.hospitalInfoDto.akd100); // 机构分类
						Base.setValue("akb301",data.hospitalInfoDto.akb301); // 主机构编码
						Base.setValue("aaa027",data.hospitalInfoDto.aaa027); // 统筹区编码
					}
					callbackFun;
				}
		});
}
/**
 * 人员查询
 * @param datagrid 
 */ 
function getAc01Info(callbackFun)
{
	var param = {"dto['aac001']":Base.getValue('aac001')};
	Base.getJson(myPath()+"/medicalbenefit/common/baseInfoAction!getPersonInfo.do",param,
			function(data){
				if (data.errMsg != null && data.errMsg != ''){
					Base.alert(data.errMsg, 'warn');
					Base.setValue("aac001",'');
					return true;
				}
				if(data &&  data.personInfoDto){
					Base.setValue("aae140",data.personInfoDto.aae140); // 险种
					Base.setValue("aac002",data.personInfoDto.aac002); // 身份证件号码
					Base.setValue("aac003",data.personInfoDto.aac003); // 姓名
					Base.setValue("aac004",data.personInfoDto.aac004); // 性别
					Base.setValue("aac005",data.personInfoDto.aac005); // 民族
					Base.setValue("aac006",data.personInfoDto.aac006); // 出生日期
					Base.setValue("aac007",data.personInfoDto.aac007); // 参加工作日期
					Base.setValue("yke112",data.personInfoDto.yke112); // 实足年龄
					Base.setValue("aab401",data.personInfoDto.aab401); // 户口簿编号
					Base.setValue("aac009",data.personInfoDto.aac009); // 户口性质
					Base.setValue("aac010",data.personInfoDto.aac010); // 户口所在地址
					Base.setValue("aac011",data.personInfoDto.aac011); // 学历
					Base.setValue("aac012",data.personInfoDto.aac012); // 个人身份
					Base.setValue("aac014",data.personInfoDto.aac014); // 专业技术职务等级
					Base.setValue("aac015",data.personInfoDto.aac015); // 国家职业资格等级（工人技术等级）
					Base.setValue("aac016",data.personInfoDto.aac016); // 就业状态
					Base.setValue("aac020",data.personInfoDto.aac020); // 行政职务
					Base.setValue("aac060",data.personInfoDto.aac060); // 生存状态
					Base.setValue("aja004",data.personInfoDto.aja004); // 农民工标识
					Base.setValue("aac058",data.personInfoDto.aac058); // 身份证件类型
					Base.setValue("yab139",data.personInfoDto.yab139); // 参保人所在分中心
					Base.setValue("aac049",data.personInfoDto.aac049); // 首次参保年月
					Base.setValue("aac008",data.personInfoDto.aac008); // 个人参保状态
					Base.setValue("aac031",data.personInfoDto.aac031); // 个人缴费状态
					Base.setValue("aac066",data.personInfoDto.aac066); // 医疗人员身份
					Base.setValue("yac299",data.personInfoDto.yac299); // 医疗人员类别
					Base.setValue("aab999",data.personInfoDto.aab999); // 单位管理码
					Base.setValue("aab001",data.personInfoDto.aab001); // 单位ID
					Base.setValue("aab003",data.personInfoDto.aab003); // 单位名称
					Base.setValue("aab019",data.personInfoDto.aab019); // 单位类型
					Base.setValue("aab020",data.personInfoDto.aab020); // 经济类型
					Base.setValue("aab021",data.personInfoDto.aab021); // 隶属关系
					Base.setValue("aab022",data.personInfoDto.aab022); // 行业代码
					Base.setValue("aab065",data.personInfoDto.aab065); // 特殊单位类别
					Base.setValue("yab019",data.personInfoDto.yab019); // 单位管理类型（财政类别）
					Base.setValue("yae097",data.personInfoDto.yae097); // 最大做账期
					Base.setValue("aae240",data.personInfoDto.aae240); // 账户余额
					Base.setValue("sfsqmxb",data.personInfoDto.sfsqmxb); // 是否申请慢性病
					callbackFun;
				}
		});
}

/**
 * 单位查询
 * @param datagrid 
 */ 
function getAb01Info(callbackFun)
{
	var param = {"dto['aab001']":Base.getValue('aab001')};
	Base.getJson(myPath()+"/medicalbenefit/common/baseInfoAction!getAb01Info.do",param,
			function(data){
		if (data.errMsg != null && data.errMsg != ''){
			Base.alert(data.errMsg, 'warn');
			Base.setValue("aab001",'');
			return true;
		}
		if(data){
			Base.setValue("aab019",data.aae140); // 单位类型
			Base.setValue("aab020",data.aac002); // 经济类型
			Base.setValue("aab021",data.aab021); // 隶属关系
			Base.setValue("aab065",data.aab065); // 特殊单位类别
			Base.setValue("aab999",data.aab999); // 单位管理码
			Base.setValue("yab019",data.yab019); // 单位管理类型
			Base.setValue("aab003",data.aab003); // 单位名称
			callbackFun;
		}
	});
}

/**
 * 药品查询
 * @param datagrid 
 */ 
function getKa02Ka20Info(callbackFun)
{
	var param = {"dto['aaz231']":Base.getValue('aaz231')};
	Base.getJson(myPath()+"/medicalbenefit/common/baseInfoAction!getKa02Ka20Info.do",param,
			function(data){
				if (data.errMsg != null && data.errMsg != ''){
					Base.alert(data.errMsg, 'warn');
					Base.setValue("aac001",'');
					return true;
				}
				if(data){
					Base.setValue("ake001",data.ake001); // 社保三大目录统一编码
					Base.setValue("ake002",data.ake002); // 社保三大目录名称
					Base.setValue("aae030",data.aae030); // 开始日期 
					Base.setValue("aae031",data.aae031); // 终止日期 
					Base.setValue("aka063",data.aka063); // 医疗发票项目类别
					Base.setValue("aka065",data.aka065); // 收费项目等级
					Base.setValue("ake004",data.ake004); // 生产地类别
					Base.setValue("aka036",data.aka036); // 限制使用标志
					Base.setValue("aka061",data.aka061); // 通用中文名称
					Base.setValue("aka062",data.aka062); // 英文化学名
					Base.setValue("aka064",data.aka064); // 处方药标志
					Base.setValue("ake103",data.ake103); // 价格定比例标志
					Base.setValue("aka070",data.aka070); // 剂型
					callbackFun;
				}
		});
}	

/**
 * 非药品查询
 * @param datagrid 
 */ 
function getKa03Ka20Info(callbackFun)
{
	var param = {"dto['aaz231']":Base.getValue('aaz231')};
	Base.getJson(myPath()+"/medicalbenefit/common/baseInfoAction!getKa03Ka20Info.do",param,
			function(data){
				if (data.errMsg != null && data.errMsg != ''){
					Base.alert(data.errMsg, 'warn');
					Base.setValue("aac001",'');
					return true;
				}
				if(data){
					Base.setValue("ake001",data.ake001); // 社保三大目录统一编码
					Base.setValue("ake002",data.ake002); // 社保三大目录名称
					Base.setValue("aae030",data.aae030); // 开始日期 
					Base.setValue("aae031",data.aae031); // 终止日期 
					Base.setValue("aka063",data.aka063); // 医疗发票项目类别
					Base.setValue("aka065",data.aka065); // 收费项目等级
					Base.setValue("ake004",data.ake004); // 生产地类别
					Base.setValue("aka052",data.aka052); // 使用单位
					Base.setValue("ake103",data.ake103); // 价格定比例标志
					Base.setValue("aka070",data.aka070); // 剂型
					callbackFun;
				}
		});
}	

/**
 * 新RPC小按钮两定机构查询
 */
function showHosWindow() {
	Base.openWindow("hoswindow","两定机构小按钮",myPath()+"/medicalbenefit/common/commonFunctionAction!showHosWindow.do",null,1000,450,null,null,true);
}

/**
 * 新RPC小按钮两定机构查询
 */
function showHosWindowMore(typeValue) {
	var parameter = {};
  	parameter["dto['typeValue']"] = typeValue;
	Base.openWindow("hoswindow","两定机构小按钮",myPath()+"/medicalbenefit/common/commonFunctionAction!showHosWindow.do",parameter,1000,450,null,null,true);
}

/**
 * 新RPC小按钮人员查询
 */
function showPersonWindow() {
	Base.openWindow("personwindow","人员信息小按钮",myPath()+"/medicalbenefit/common/commonFunctionAction!showPersonWindow.do",null,1000,450,null,null,true);
}

/**
 * 新RPC小按钮药品信息查询
 */
function showDrugWindow() {
	Base.openWindow("drugwindow","药品信息小按钮",myPath()+"/medicalbenefit/common/commonFunctionAction!showDrugWindow.do",null,1000,450,null,null,true);
}

/**
 * 新RPC小按钮非药品信息查询
 */
function showClinicWindow() {
	Base.openWindow("clinicwindow","非药品信息小按钮",myPath()+"/medicalbenefit/common/commonFunctionAction!showClinicWindow.do",null,1000,450,null,null,true);
}

/**
 * 新RPC小按钮单位信息查询
 */
function showOgniWindow() {
	Base.openWindow("ogniwindow","单位信息小按钮",myPath()+"/medicalbenefit/common/commonFunctionAction!showOgniWindow.do",null,1000,450,null,null,true);
}

/**
 * 至少录入一个查询条件
 */
function checkLastOne(arry) {
   var maxlength = arry.length;
   var ids;
   var con = 0;
   for(var i=0;i<maxlength;i++){
	   ids = Base.getValue(arry[i]);
	   if(!("" == ids || null == ids)){		   
		   con = con + 1;
	   }
   }
   if(con == 0){
	  return true;
   }
   return false;
}

/**
 * 获取助记码
 * @param datagrid 
 * id:输入字符串
 * typeValue:1拼音 2五笔
 * leng:长度
 */ 
function getZjm(id,typeValue,leng)
{
	var param = {"dto['yzz002']":Base.getValue(id),"dto['yzz001']":typeValue,"dto['leng']":leng};
	Base.getJson(myPath()+"/medicalbenefit/common/baseInfoAction!getZjm.do",param,
			function(data){
		if (data.errMsg != null && data.errMsg != ''){
			Base.alert(data.errMsg, 'warn');
			Base.setValue(id,'');
			return true;
		}
		if(data){
			Base.setValue("aka020",data.zjmDto.aka020); // 拼音助记码
			Base.setValue("aka021",data.zjmDto.aka021); // 五笔助记码 
		}
	});
}