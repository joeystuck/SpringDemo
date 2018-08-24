<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>

<html>
<head>
    <title>分页查询</title>
</head>

<style type="text/css">
    table.hovertable {
        font-family: verdana, arial, sans-serif;
        font-size: 11px;
        color: #f73549;
        align-items: center;
        border-width: 1px;
        border-color: #999999;
        border-collapse: collapse;
    }

    table.hovertable th {
        background-color: #4df763;
        border-width: 1px;
        padding: 8px;
        border-style: solid;
        border-color: #a9c6c9;
    }

    table.hovertable tr {
        background-color: #4cffd8;
    }

    table.hovertable td {
        border-width: 1px;
        padding: 8px;
        border-style: solid;
        border-color: #00707d;
        width: 100px;
        height: 30px;
    }
    .parent{
        /* 以下属性垂直居中 */
        position: relative;
        top: 0;
        bottom: 0;
        left: 0;
        right: 0;
        margin: auto;
        background-color: #ba998e;
        background-image: url('../image/sky.jpg');
        background-repeat: no-repeat;
    }
</style>

<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript">




</script>

<body class='parent'>

<div  align="center"><br>

   <a href="/findAll?pageNum=1">返回首页</a><<br>
   <a href="/insertDept">添加部门</a>

    <table id="order" width="1000" border="1" class="hovertable">
        <tr>
            <td>编号</td>
        </tr>
        <tr>
            <td>名称</td>
        </tr>
        <tr>
            <td>地址</td>
        </tr>
        <tr>
            <td>操作</td>
        </tr>
        <tbody id="tbody">
        <c:forEach items="${deptlist}" var="temp">
            <tr onmouseover="this.style.backgroundColor='#ffa3ea';" onmouseout="this.style.backgroundColor='#4cffd8';">
                <td>
                        ${temp.deptno}
                </td>
                <td>
                        ${temp.dname}
                </td>
                <td>
                        ${temp.loc}
                </td>
                <td>
                    <a href="/getOneByDeptno?deptno=${temp.deptno }">修改</a>
                    <a href="deleteByDeptno?deptno=${temp.deptno}">删除</a>
                </td>

            </tr>
        </c:forEach>
        </tbody>
        <br>

    </table>

</div>


</body>
</html>
