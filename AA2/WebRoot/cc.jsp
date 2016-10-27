<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
   <head>  
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />  
<title>ajax分页</title>  
</head>  
  
<body>  
<style>  
.pagination {font-family: Tahoma;font-size: 12px;height: 22px;margin: 5px 10px;text-align: right;}  
.pagination a,.page-cur,.page-start,.page-end,.page-disabled,.page-skip {  
height:22px;line-height:22px;margin:0 3px 0 0;text-align:center;vertical-align:middle;white-space:nowrap;}  
.pagination input {border-width: 1px;}  
.page-start, .pagination a, .page-end, .page-disabled {border: 1px solid #CCCCCC;padding: 0 5px;}  
.pagination a {text-decoration: none;}  
.page-cur {background-color: #FFEDE1;border: 1px solid #FD6D01;color: #FD6D01;font-weight: 700;padding: 0 5px;}  
.page-disabled {color: #CCCCCC;}  
.page-skip {color: #666666;padding: 0 3px;}  
</style>  
<div id="pageNav"></div>  
</body>  
  
</html>  
<script>  
testPage(1);  
function testPage(curPage){  
  
        supage('pageNav','testPage','',curPage,100,5);  
  
}  
  
  
/** 
 
 * @param {String} divName 分页导航渲染到的dom对象ID 
 * @param {String} funName 点击页码需要执行后台查询数据的JS函数 
 * @param {Object} params 后台查询数据函数的参数，参数顺序就是该对象的顺序，当前页面一定要设置在里面的 
 * @param {String} total 后台返回的总记录数 
 * @param {Boolean} pageSize 每页显示的记录数，默认是10 
 */  
function supage(divId, funName, params, curPage, total, pageSize){  
    var output = '<div class="pagination">';  
    var pageSize = parseInt(pageSize)>0 ? parseInt(pageSize) : 10;  
    if(parseInt(total) == 0 || parseInt(total) == 'NaN') return;  
    var totalPage = Math.ceil(total/pageSize);  
    var curPage = parseInt(curPage)>0 ? parseInt(curPage) : 1;  
      
    //从参数对象中解析出来各个参数  
    var param_str = '';  
    if(typeof params == 'object'){  
        for(o in params){  
            if(typeof params[o] == 'string'){  
               param_str += '\'' + params[o] + '\',';  
            }  
            else{  
               param_str += params[o] + ',';  
            }  
        }  
        //alert(111);  
    }  
    //设置起始页码  
    if (totalPage > 10) {  
        if ((curPage - 5) > 0 && curPage < totalPage - 5) {  
            var start = curPage - 5;  
            var end = curPage + 5;  
        }  
        else if (curPage >= (totalPage - 5)) {  
            var start = totalPage - 10;  
            var end = totalPage;  
        }  
        else {  
            var start = 1;  
            var end = 10;  
        }  
    }  
    else {  
        var start = 1;  
        var end = totalPage;  
    }  
      
    //首页控制  
    if(curPage>1){  
        output += '<a href="javascript:'+funName+'(' + param_str + '1);" title="第一页" class="page-first">«</a>';  
    }  
    else  
    {  
        output += '<span class="page-disabled">«</span> ';  
    }  
    //上一页菜单控制  
    if(curPage>1){  
        output += '<a href="javascript:'+funName+'(' + param_str + (curPage-1)+');" title="上一页" class="page-previous">‹</a>';  
    }  
    else{  
        output += '<span class="page-disabled">‹</span>';  
    }  
      
    //页码展示  
    for (i = start; i <= end; i++) {  
        if (i == curPage) {  
            output += '<a href="javascript:;" class="page-cur">' + curPage + '</a>';  
        }  
        else {  
            output += '<a href="javascript:'+funName+'(' + param_str + i + ');">' + i + '</a>';  
        }  
    }  
    //下一页菜单控制  
    if(totalPage>1 && curPage<totalPage){  
        output += '<a title="下一页" href="javascript:'+funName+'('+param_str + (curPage+1)+');" class="page-next">›</a>';  
    }  
    else{  
        output += '<span class="page-disabled">›</span>';  
    }  
    //最后页控制  
    if(curPage<totalPage){  
        output += '<a title="最后页" href="javascript:'+funName+'('+param_str + totalPage+');" class="page-end">»</a>';  
    }  
    else{  
        output += '<span class="page-disabled">»</span>';  
    }  
      
    output += '</div>';  
    //渲染到dom中  
    document.getElementById(divId).innerHTML = output;  
};  
</script>  
</html>
