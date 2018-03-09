    //添加排序函数
	$.fn.sort = function(fun){ 
		var d = this;
		var dom = this.find('tr:gt(0)');
		dom.each(function(i){ 
		   dom.each(function(j){ 
		       if(j<=i){ 
		          return true; 
		       } 
		       var dom1 = dom.eq(i);
		       var dom2 = dom.eq(j);
		       if(fun(dom1,dom2)){ 
		          dom1.before(dom2); 
		          dom = d.find('tr:gt(0)');
		       } 
		   }); 
		}); 
	}; 
	// 设置点击表头排序
	$(function(){ 
		$('#report1 tr:nth-child(1)').find('td').each(function(i){ 
		   $(this).toggle(function(){ 
		   	  $(this).parent().parent().sort(function(dom1,dom2){ 
		           var value1 = parseInt(dom1.find('td:eq('+i+')').text()); 
		           var value2 = parseInt(dom2.find('td:eq('+i+')').text()); 
		           return value1<value2; 
		       });
		       init_table();
		       $(this).addClass('row-down');
		   },function(){ 
		       $(this).parent().parent().sort(function(dom1,dom2){ 
		           var value1 = parseInt(dom1.find('td:eq('+i+')').text()); 
		           var value2 = parseInt(dom2.find('td:eq('+i+')').text()); 
		           return value1>value2;
		       });
		       init_table();
		       $(this).addClass('row-up');
		   });
		}); 
	});