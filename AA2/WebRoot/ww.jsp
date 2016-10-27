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
<script src="http://libs.baidu.com/jquery/1.9.0/jquery.js"></script>
<script type="text/javascript">
$(function(){
    var i=0,current=1,sum=0;
    count=function(){
        var pj=0;
        sum=sum+i;
        pj=sum/current;
        $("div").append(i+",");
        $("span").empty().append("平均数："+pj);
        i++;
        current++;
    }
    setInterval(count,1000);
})
</script>
</head>
<body>
    <div>输出的数字：</div>
    <span>平均数：</span>
</body>  
</html>
