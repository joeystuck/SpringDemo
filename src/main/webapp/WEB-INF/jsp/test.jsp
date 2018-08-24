<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<html>
<body align="center">
    <div align="center">
        <h3><p>${empExist}</p></h3>
        <a href="/goInsert">重新添加</a>
        <a href="/findAll?pageNum=1">返回首页</a>
    </div>
</body>
</html>
