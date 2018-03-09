var ReportTreeManager = new function(){
	this.version = '1.0';
	this.map = {};
	this.ge = function(id){
		return document.getElementById(id);
	};
	this.get = function(id){
		if(this.map.hasOwnProperty(id)) return this.map[id];
		else return null;
	};
	this.put = function(id, tree){
		this.map[id] = tree;
	};
	/**
	 * 初始化报表树
	 */
	this.init = function(id){
		var t = this.ge(id);
		var tree = new ReportTree(t);
		tree.init();
		this.put(id, tree);
	};
};
/**
 * 报表树生成函数
 */
var ReportTree = function(t){
	this.table = t;
	this.nodes = null;

	this.init = function(){
		//iddata和piddata就是我们在报表里面定义的html事件
		$(this.table).find('td').each(function(){
			$(this).css('cursor', 'default');
			var id = $(this).attr('iddata');
			if(typeof(id)!='undefined') {
				$(this).parent().attr('iddata', id);
				$(this).parent().attr('keycell', $(this).prop('cellIndex'));
			}
			var pid = $(this).attr('piddata');
			if(typeof(pid)!='undefined' && id != null && id.length>0) {
				$(this).parent().attr('piddata', pid);
			}
			$(this).removeAttr('iddata');
			$(this).removeAttr('piddata');
		});
		this.nodes = new Array();
		this.travel('', 0);
	};

	this.travel = function(pid, lvl){
		var ns = new Array();
		var rs = $(this.table).find('tr[piddata='+pid+']').get();
		for(var i=0; i<rs.length; i+=1){
			var id = $(rs[i]).attr('iddata');
			if(typeof(id)=='undefined'){continue;}
			$(rs[i]).attr('treelvl',lvl);

			var n = new ReportTreeNode(rs[i]);
			n.id = id;
			n.level = lvl;
			ns.push(n);

			var kc = $(rs[i]).find('td').eq($(rs[i]).attr('keycell'));
			var subs = this.travel(id, lvl+1);
			if(subs!==null && subs.length>0){
				n.children = subs;
				kc.css('cursor','pointer');
				kc.addClass('button plus');
				kc.click(this.clickhandler);
			}
			else{
				$(rs[i]).removeAttr('iddata');
				$(rs[i]).removeAttr('treelvl');
			}
			$(rs[i]).removeAttr('keycell');
			$(rs[i]).removeAttr('piddata');

			if(lvl>0) {$(n.row).hide();}
		}
		if(ns.length > 0){
			this.nodes = this.nodes.concat(ns);
		}
		return ns;
	};
	
	this.getnode = function(id, lvl){
		var node = null;
		for(var i=0; i<this.nodes.length; i+=1){
			node = this.nodes[i];
			if(node.id==id && node.level==lvl) break;
		}
		return node;
	};

	this.clickhandler = function(evt){
		var tid = $(this).parents("table").attr('id');
		var tree = ReportTreeManager.get(tid);
		if(tree === null) return;

		var id = $(this).parent().attr('iddata');
		var lvl = $(this).parent().attr('treelvl');
		var node = tree.getnode(id, lvl);
		if(node.expand){
			$(this).removeClass('minus');
			$(this).addClass('plus');
			node.expand = false;
			tree.collapse(node);
		}
		else{
			$(this).removeClass('plus');
			$(this).addClass('minus');
			node.expand = true;
			tree.expand(node);
		}
	};

	this.collapse = function(node){
		var subs = node.children;
		for(var i=0; subs!==null && i<subs.length; i+=1){
			this.collapse(subs[i]);
			$(subs[i].row).hide();
		}
	};

	this.expand = function(node){
		if(!node.expand) return;
		var subs = node.children;
		for(var i=0; subs!==null && i<subs.length; i+=1){
			$(subs[i].row).show();
			this.expand(subs[i]);
		}
	};
};
var ReportTreeNode = function(r){
	this.row = r;
	this.id = null;
	this.level = NaN;
	this.children = null;
	this.expand = false;
};