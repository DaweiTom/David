<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default2.aspx.cs" Inherits="Default2" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"  
 "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">  
<html xmlns="http://www.w3.org/1999/xhtml">  
<head runat="server">  
    <title>无标题页</title>  
    <style type="text/css">  
     .hover  
        {  
            cursor: pointer; /*小手*/  
            background: #ffc; /*背景*/  
        }  
    </style>  
    <script type="text/javascript" src="js/jquery-1.3.2-vsdoc2.js"></script>  
     <script type="text/javascript">  
        //无参数调用  
        $(document).ready(function() {  
            $('#btn1').click(function() {  
                $.ajax({  
                    type: "POST",   //访问WebService使用Post方式请求  
                    contentType: "application/json",   
                    url: "Default2.aspx/HelloWorld", //调用WebService的地址和方法名称组合 ---- WsURL/方法名  
                    data: "{}",  //这里是要传递的参数，格式为 data: "{paraName:paraValue}",下面将会看到         
                    dataType: 'json',   //WebService 会返回Json类型  
  
                    success: function(result) {     //回调函数，result，返回值  
                        alert(result.d);  
                    }  
                });  
            });  
        });  
        //有参数调用  
        $(document).ready(function() {  
            $("#btn2").click(function() {  
                $.ajax({  
                    type: "POST",  
                    contentType: "application/json",  
                    url: "Default2.aspx/GetWish",  
                    data: "{value1:'心想事成',value2:'万事如意',value3:'牛牛牛',value4:2009}",  
                    dataType: 'json',  
                    success: function(result) {  
                        alert(result.d);  
                    }  
                });  
            });  
        });           
        //返回集合（引用自网络，很说明问题）  
        $(document).ready(function() {  
            $("#btn3").click(function() {  
                $.ajax({  
                    type: "POST",  
                    contentType: "application/json",  
                    url: "Default2.aspx/GetArray",  
                    data: "{i:10}",  
                    dataType: 'json',  
                    success: function(result) {  
                        $(result.d).each(function() {  
                            alert(this);  
                            $('#dictionary').append(this.toString() + " ");  
                            //alert(result.d.join(" | "));  
                        });  
                    }  
                });  
            });  
        });  
        //返回复合类型，如{"result":{"ID":1,"Value":2}}即返回的结果中数据是对象或者json格式的数据  
        $(document).ready(function() {  
            $('#btn4').click(function() {  
                $.ajax({  
                    type: "POST",  
                    contentType: "application/json",  
                    url: "Default2.aspx/GetClass",  
                    data: "{}",  
                    dataType: 'json',  
                    success: function(result) {  
                        $(result.d).each(function() {  
                            //alert(this);  
                            $('#dictionary').append(this['ID'] + " " + this['Value']);  
                            //alert(result.d.join(" | "));  
                        });  
  
                    }  
                });  
            });  
        });  
    //Ajax 为用户提供反馈，他们两个方法可以添加给jQuery对象在Ajax前后回调  
        //但对与Ajax的监控，本身是全局性的  
        $(document).ready(function() {  
            $('#loading').ajaxStart(function() {  
                $(this).show();  
            }).ajaxStop(function() {  
                $(this).hide();  
            });  
        });  
        // 鼠标移入移出效果，多个元素的时候，可以使用“，”隔开  
        $(document).ready(function() {  
            $('btn').hover(function() {  
                $(this).addClass('hover');  
            }, function() {  
                $(this).removeClass('hover');  
            });  
        });  
    </script>  
</head>  
<body>  
    <form id="form1" runat="server">  
    <div>  
    <input type="button" id="btn1" value="HelloWorld"/>   
    <input type="button" id="btn2" value="传入参数"/>   
    <input type="button" id="btn3" value="返回集合"/>   
    <input type="button" id="btn4" value=" 返回复合类型"/>   
    </div>  
    <div id="dictionary">dictionary  
    </div>  
    </form>  
</body>  
</html> 