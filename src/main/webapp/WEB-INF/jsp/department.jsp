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
    function asc() {

        // var btn_x=document.getElementById("asc");

        $.ajax({
            async:true,
            type: "GET",
            data:{"pageNum":${pageBean.pageNum} ,"pageSize":${pageBean.pageSize}},
            url: "asc",
            dataType: "json",
            success: function (data) {
                debugger
                // var jsonData = JSON.parse(data);
                var tbody = document.getElementById("tbody");
                tbody.innerHTML = "";

                //var list = data.list;
                for (var i = 0; i < data.length; i++) {
                    tbody.innerHTML += "<tr onmouseover=\"this.style.backgroundColor='#ffa3ea';\" onmouseout=\"this.style.backgroundColor='#4cffd8';\">" +
                        "<td>" + data[i].empno + "</td>" +
                        "<td>" + data[i].ename + "</td>" +
                        "<td>" + data[i].job + "</td>"+
                        "<td>" + data[i].mgrname + "</td>"+
                        "<td>" + data[i].hiredate + "</td>"+
                        "<td>" + data[i].sal + "</td>"+
                        "<td>" + data[i].grade + "</td>"+
                        "<td>" + data[i].comm + "</td>"+
                        "<td>" + data[i].dname + "</td>"+
                        "<td>" + "<a href=\"getOne?empno=" + data[i].empno + "\">修改</a>" +"  "+
                        "<a href=\"delete?empno=" + data[i].empno + "\">删除</a>" +
                        "</td>" +
                        "</tr>";
                }
            }
        });
    }
    function desc() {

        $.ajax({
            async:true,
            type: "GET",
            data:{"pageNum":${pageBean.pageNum} ,"pageSize":${pageBean.pageSize}},
            url: "desc",
            dataType: "json",
            success: function (data) {

                //debugger
                // var jsonData = JSON.parse(data);
                var tbody = document.getElementById("tbody");
                tbody.innerHTML = "";

                //var list = data.list;
                for (var i = 0; i < data.length; i++) {
                    tbody.innerHTML += "<tr onmouseover=\"this.style.backgroundColor='#ffa3ea';\" onmouseout=\"this.style.backgroundColor='#4cffd8';\">" +
                        "<td>" + data[i].empno + "</td>" +
                        "<td>" + data[i].ename + "</td>" +
                        "<td>" + data[i].job + "</td>"+
                        "<td>" + data[i].mgrname + "</td>"+
                        "<td>" + data[i].hiredate + "</td>"+
                        "<td>" + data[i].sal + "</td>"+
                        "<td>" + data[i].grade + "</td>"+
                        "<td>" + data[i].comm + "</td>"+
                        "<td>" + data[i].dname + "</td>"+
                        "<td>" + "<a href=\"getOne?empno=" + data[i].empno + "\">修改</a>" +"  "+
                        "<a href=\"delete?empno=" + data[i].empno + "\">删除</a>" +
                        "</td>" +
                        "</tr>";
                }
            }
        });
    }


</script>

<body class='parent'>

<div  align="center"><br>

    <p>${isNotMgr}</p><<a href="/findAll?pageNum=1">返回首页</a>>

    <table id="order" width="1000" border="1" class="hovertable">
        <td>
            雇员编号
        </td>
        <td>
            雇员姓名
        </td>
        <td>
            雇员工作
        </td>
        <td>
            上级
        </td>
        <td id="hirtime">
            入职时间
        </td>
        <td>
            薪金
        </td>
        <td>
            薪金等级
        </td>
        <td>
            奖金
        </td>
        <td>
            所在部门
        </td>
        <td>
            操作
        </td>
        </tr>
        <tbody id="tbody">
        <c:forEach items="${mgrlist}" var="temp">
            <tr onmouseover="this.style.backgroundColor='#ffa3ea';" onmouseout="this.style.backgroundColor='#4cffd8';">
                <td>
                        ${temp.empno}
                </td>
                <td>
                        ${temp.ename}
                </td>
                <td>
                        ${temp.job}
                </td>
                <td>
                        ${temp.mgrname}
                </td>
                <td>
                        ${temp.hiredate}
                </td>
                <td>
                        ${temp.sal}
                </td>
                <td>
                        ${temp.grade}
                </td>
                <td>
                        ${temp.comm}
                </td>
                <td>
                        ${temp.dname}
                </td>
                <td>
                    <a href="/getOne?empno=${temp.empno }">修改</a>
                    <a href="delete?empno=${temp.empno}">删除</a>
                </td>

            </tr>
        </c:forEach>
        </tbody>
        <br>

    </table>

</div>


</body>
</html>
