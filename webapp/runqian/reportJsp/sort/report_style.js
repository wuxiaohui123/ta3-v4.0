function init_table(){
	var t = 'report1';
	// 清空所有表格样式
	$('#'+t).get()[0].style.cssText = '';
	// 设置整体表格样式
	$('#'+t).addClass('report-table');
	// 设置奇数行样式
	$('#report1  tr:nth-child(odd)').find('td').removeClass().addClass('row-odd');
	// 设置偶数行样式
	$('#report1  tr:nth-child(even)').find('td').removeClass().addClass('row-even');
	// 设置表头样式
	$('#report1  tr:nth-child(1)').find('td').removeClass().addClass('row-header');
	// 设置高亮
	$('#report1  tr:gt(0)').hover(function(){
		$(this).find('td').addClass('row-highlight');
	},function(){
		$(this).find('td').removeClass('row-highlight');
	});
}
$(function(){init_table()});