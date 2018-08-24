<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<title>修改页面</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

</head>

<script>
	function a() {
		window.location.href = "index.jsp"

	}
</script>
<style type="text/css">
table.imagetable {
	font-family: verdana, arial, sans-serif;
	font-size: 11px;
	color: #333333;
	border-width: 1px;
	border-color: #999999;
	border-collapse: collapse;
}

table.imagetable th {
	background: #b5cfd2;
	border-width: 1px;
	padding: 8px;
	border-style: solid;
	border-color: #999999;
}

table.imagetable td {
	background: #dcddc0;
	border-width: 1px;
	padding: 8px;
	border-style: solid;
	border-color: #999999;
}
</style>
<body bgcolor="#99999">
	<center>
		<form action="updateDept" method="post" enctype="application/json">

			<h4>部门信息</h4>

			<table border="1" width="550" cellpadding="0" cellspacing="0"
				height="186" class="imagetable">

				<tr>
					<td width="100" align="center">名称</td>
					<td width="356">
						<input type="hidden" name="empno" value="${department.deptno}">
						<input type="text" name="dname" value="${department.dname}">
					</td>
				</tr>
				<tr>
					<td width="100" align="center">地址</td>
					<td><input type="text" name="loc"
							   value="${department.loc}">
					</td>
				</tr>

				<tr>
					<td width="200" align="right"><input type="submit"
						name="button" value="保存">
					</td>
					<td><input type="reset" value="重置"/>
					</td>
				</tr>
			</table>

		</form>

	</center>
</body>
</html>
