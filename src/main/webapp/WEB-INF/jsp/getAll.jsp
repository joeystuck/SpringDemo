<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<html>
<head>
    <title>查询所有</title>
</head>
<style type="text/css">
    table.hovertable {
        margin-top: 100px;
        font-family: verdana, arial, sans-serif;
        font-size: 15px;
        color: #333333; /*字体颜色*/
        border-width: 1px;
        border-color: aqua;/*边框颜色*/
        border-collapse: collapse;
    }

    table.hovertable th {
        background-color: #D676FF;
        border-width: 1px;
        padding: 8px;
        border-style: solid;
        border-color: #D676FF;
    }

    table.hovertable tr {
        background-color: #d4e5b3;/*背景颜色*/
    }

    table.hovertable td {
        border-width: 1px;
        padding: 8px;
        border-style: solid;
        border-color: aqua;
        width: 100px;
        height: 30px;
    }
    #hirtime{
        width: 150px;
    }
</style>

<script type="text/javascript">

</script>

<%--<body bgcolor="aqua">--%>
<body style="background-repeat: no-repeat;background-image: url('../image/sky.jpg')">

<div align="center"><br>

    <table width="1050" border="1" class="hovertable">

        <tr><a href="/goInsert">新增</a>
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

        <c:forEach items="${list}" var="temp">
            <tr onmouseover="this.style.backgroundColor='#D676FF';" onmouseout="this.style.backgroundColor='#d4e5b3';">
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
    </table>

</div>

</body>
</html>
