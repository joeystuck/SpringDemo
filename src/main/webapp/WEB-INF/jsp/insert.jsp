<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page isELIgnored="false" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");//设置日期格式
    String now = df.format(new Date());// new Date()为获取当前系统时间
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <base href="<%=basePath%>">

    <title>新增客户信息</title>

    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <!--
    <link rel="stylesheet" type="text/css" href="styles.css">
    -->

</head>
<style type="text/css">
    table.imagetable {
        font-family: verdana,arial,sans-serif;
        font-size:11px;
        color:#333333;
        border-width: 1px;
        border-color: #999999;
        border-collapse: collapse;
    }
    table.imagetable th {
        background:#b5cfd2 ;
        border-width: 1px;
        padding: 8px;
        border-style: solid;
        border-color: #999999;
    }
    table.imagetable td {
        background:#dcddc0 ;
        border-width: 1px;
        padding: 8px;
        border-style: solid;
        border-color: #999999;
    }
</style>
<body bgcolor="#99999" >
<center>
    <form action="insert" method="post" enctype="application/json">
        <h2>
            新增客户信息
        </h2>
        <table width="500" border="1" cellpadding="0" cellspacing="0" class="imagetable">

            <tr>
                <td>编号</td>
                <td> <input type="text"  name="empno"></td>
            </tr>
            <tr>
                <td>姓名</td>
                <td> <input type="text"  name="ename"></td>
            </tr>
            <tr>
                <td>工作</td>
                <td> <input type="text" name="job"></td>
            </tr>
            <tr>
                <td>上级</td>
                <td>
                    <select name="mgr">
                        <option value="">选择上级领导</option>
                        <option value="1000"></option>
                        <c:forEach items="${insertlist}" varStatus="status">
                            <c:set var="et" value="${status.current}"/>
                            <option value="${et.empno}">${et.ename}</option>
                        </c:forEach>
                    </select>
                </td>
            </tr>
            <tr>
                <td>入职时间</td>
                <td><input type="text" name="hiredate" value="<%=now%>"></td>
            </tr>
            <tr>
                <td>薪金</td>
                <td> <input type="text" name="sal"></td>
            </tr>
            <tr>
                <td>奖金</td>
                <td> <input type="text" name="comm"></td>
            </tr>
            <tr>
                <td>所在部门</td>
                <td>
                    <select name="deptno">
                        <option value="">选择部门</option>
                        <c:forEach items="${dlist}" varStatus="status">
                            <c:set var="et" value="${status.current}"/>
                            <option value="${et.deptno}">${et.dname}</option>
                        </c:forEach>
                    </select>
                </td>
            </tr>
            <tr>
                <td width="200" align="right"><input type="submit"
                                                     name="button" value="新增">
                </td>
                <td><input type="reset" value="重置"/>
                </td>
            </tr>
        </table>
    </form>
</center>
</body>
</html>
