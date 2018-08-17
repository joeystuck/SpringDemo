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

    <button><a href="goInsert">新增</a><br></button>
    <p>
        排序：<button  id="asc" onclick="asc()">正序</button>
                <button  id="desc" onclick="desc()">倒序</button><br>
    </p>
    <button><a href="/goInsertdept">添加部门</a></button><br>

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
        <c:forEach items="${pageBean.list}" var="temp">
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

    <br>
    <%-- 构建分页导航 --%>
    共有${pageBean.totalRecord}条记录，共${pageBean.totalPage }页，当前为${pageBean.pageNum}页
    <br/>
    <a href="findAll?pageNum=1">首页</a>
    <%--如果当前页为第一页时，就没有上一页这个超链接显示 --%>
    <c:if test="${pageBean.pageNum ==1}">
    <c:forEach begin="${pageBean.start}" end="${pageBean.end}" step="1" var="i">
    <c:if test="${pageBean.pageNum == i}">
        ${i}
    </c:if>
    <c:if test="${pageBean.pageNum != i}">
    <a href="findAll?pageNum=${i}">${i}</a>
    </c:if>
    </c:forEach>
    <a href="findAll?pageNum=${pageBean.pageNum+1}">下一页</a>
    </c:if>

    <%--如果当前页不是第一页也不是最后一页，则有上一页和下一页这个超链接显示 --%>
    <c:if test="${pageBean.pageNum > 1 && pageBean.pageNum < pageBean.totalPage}">
    <a href="findAll?pageNum=${pageBean.pageNum-1}">上一页</a>
    <c:forEach begin="${pageBean.start}" end="${pageBean.end}" step="1" var="i">
    <c:if test="${pageBean.pageNum == i}">
        ${i}
    </c:if>
    <c:if test="${pageBean.pageNum != i}">
    <a href="findAll?pageNum=${i}">${i}</a>
    </c:if>
    </c:forEach>
    <a href="findAll?pageNum=${pageBean.pageNum+1}">下一页</a>
    </c:if>

    <%-- 如果当前页是最后一页，则只有上一页这个超链接显示，下一页没有 --%>
    <c:if test="${pageBean.pageNum == pageBean.totalPage}">
    <a href="findAll?pageNum=${pageBean.pageNum-1}">上一页</a>
    <c:forEach begin="${pageBean.start}" end="${pageBean.end}" step="1" var="i">
    <c:if test="${pageBean.pageNum == i}">
        ${i}
    </c:if>
    <c:if test="${pageBean.pageNum != i}">
    <a href="findAll?pageNum=${i}">${i}</a>
    </c:if>
    </c:forEach>
    </c:if>
    <%--尾页 --%>
    <a href="findAll?pageNum=${pageBean.totalPage}">尾页</a>
</div>


</body>
</html>
