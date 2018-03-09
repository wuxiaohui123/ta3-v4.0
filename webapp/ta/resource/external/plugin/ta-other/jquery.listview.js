/**
 * Created by wuxiaohui on 2017/4/20.
 */
$.fn.ListView = function (options) {
    var defaults = {
        list: [],
        width: 520,
        height: 520,
        itemHeight: 35,
        hasSearch: true,
        isAutoSearch: false,
        searchKey: "name",
        isItemIcon: true,
        itemIcon: "icon",
        itemDisplayName: "name",
        itemDisplayTemplate: "",
        itemClickBgColor: "#d5ffbf",
        itemClick: function () {
            //TODO override this function
        },
        itemDbClick: function () {
            //TODO override this function
        }
    };

    var settings = $.extend(true, defaults, options);
    var _salf = $(this);
    //获取列表内容的高度
    function getContextHeight() {
        var h = {};
        if (typeof settings.height === 'string') {
            var s = settings.height;
            if (s.indexOf("%") >= 0) {
                h = (parseInt(s.substring(0, s.indexOf("%"))) - 3) + "%";
            }
            if (s.indexOf("px") >= 0) {
                h = parseInt(s.substring(0, s.indexOf("px"))) -10;
            }
        } else {
            h = settings.height - 10;
        }
        return h;
    }
    //列表外层容器
    _salf.addClass("list-view").width(settings.width).height(settings.height);
    //获取搜索框的宽度
    function getSearchBoxWidth() {
        var w = {};
        if (typeof settings.width === 'string') {
            var s = settings.width;
            if (s.indexOf("%") >= 0) {
                w = parseInt($(".list-view>.search-text").width());
            }
            if (s.indexOf("px") >= 0) {
                w = parseInt(s.substring(0, s.indexOf("px")));
            }
        } else {
            w = settings.width;
        }
        return w;
    }
  //解析显示模板
    String.prototype.applyTemplate = function (d) {
        try {
            if (d === '') return this;
            return this.replace(/{([^{}]*)}/g,
                function (a, b) {
                    var r;
                    if (b.indexOf('.') !== -1) { // handle dot notation in {}, such as {Thumbnail.Url}
                        var ary = b.split('.');
                        var obj = d;
                        for (var i = 0; i < ary.length; i++)
                            obj = obj[ary[i]];
                        r = obj;
                    }
                    else
                        r = d[b];
                    if (typeof r === 'string' || typeof r === 'number') return r; else throw (a);
                }
            );
        } catch (ex) {
            alert('Invalid JSON property ' + ex + ' found when trying to apply itemDisplayTemplate \nPlease check your spelling and try again.');
        }
    };
    //列表搜索部分
    if (settings.hasSearch) {
        var html = "<div class='search-text' style='width: 70%'>" +
            "   <input id='searchText' type='text' placeholder='请输入关键字搜索' style='width: 98%';border-radius: 4px;/>" +
            "</div> " +
            "<div class='search-btn' style='width: 20%'>" +
            "   <button id='searchBtn'>" +
            "       <span>搜索</span>" +
            "   </button> " +
            "</div>";
        var s = $("<div class='search-box'/>").html(html);
        _salf.append(s);
        if (settings.isAutoSearch) {
            $("#searchText").bind("input propertychange", function () {
                autoSearch();
            });
        }
        $("#searchBtn").click(function () {
            autoSearch();
        });
    }
    //自动搜索方法
    function autoSearch() {
    	var searchValue = $("#searchText").val();
        var data = settings.list,resultData = [],searchKeys = [];
        if (searchValue) {
            if (settings.searchKey.indexOf(",") > 0) {
                searchKeys = settings.searchKey.split(",");
            } else {
                searchKeys.push(settings.searchKey);
            }
            for (var i = 0; i < data.length; i++) {
                for (var j = 0; j < searchKeys.length; j++) {
                    var temp = data[i][searchKeys[j]] + "";
                    if (temp.indexOf(searchValue) >= 0) {
                        resultData.push(data[i]);
                    }
                }
            }
        } else {
            resultData = data;
        }
        //刷新列表
        refreshContext(resultData);
    }
    //列表内容
    var listContext = $("<div class='list-context' style='height:92%'/>");
    if ($.isArray(settings.list) && settings.list.length > 0) {
        addListItems(settings.list);
        _salf.append(listContext);
    }
    //单击事件
    function itemOnClick(e) {
        if ($(e.target).is("div")) {
            $(e.target).siblings().css("background-color", "");
            $(e.target).css("background-color", settings.itemClickBgColor);
        } else {
            $(e.target).parent("div").siblings().css("background-color", "");
            $(e.target).parent("div").css("background-color", settings.itemClickBgColor);
        }
        settings.itemClick(e.data);
    }

    //双击事件
    function itemOnDbClick(e) {
        settings.itemDbClick(e.data);
    }

    //添加每一项数据
    function addListItems(a) {
        for (var i = 0; i < a.length; i++) {
            var b = a[i];
            var c = $("<div class='list-item'/>").data(b).bind("click", b, itemOnClick).bind("dblclick", b, itemOnDbClick);
            var e = $("<span class='item-context'/>");
            if (settings.itemDisplayTemplate) {
                e.html(settings.itemDisplayTemplate.applyTemplate(b));
            } else {
                e.html(b[settings.itemDisplayName]);
            }
            if (settings.isItemIcon) {
                var d = $("<span class='item-icon' style='width: 35px;height: 35px'/>");
                if (settings.itemIcon) {
                    d.addClass(settings.itemIcon);
                } else {
                    d.addClass(b.icon);
                }
                c.append(d);
            }
            c.append(e);
            listContext.append(c);
        }
    }

    //刷新列表
    function refreshContext(data) {
        listContext.empty();
        if (data.length > 0) {
            addListItems(data);
        } else {
            listContext.append("<div style='width: 100%;text-align: center;font-style: italic;color: #83bdbd;'>没有相匹配的数据</div>");
        }
        _salf.append(listContext);
    }
    
    //对外API
    $.fn.listView = function(options, param){
        if (typeof options == "string") {
            switch(options) {
                case 'setListData':refreshContext(param);
            }
        }
    };
};