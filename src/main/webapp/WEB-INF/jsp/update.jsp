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
		<form action="update" method="post" enctype="application/json">

			<h4>用户信息</h4>

			<table border="1" width="550" cellpadding="0" cellspacing="0"
				height="186" class="imagetable">



				<tr>
					<td width="100" align="center">姓名</td>
					<td width="356">
					<input type="hidden" name="empno" value="${employee.empno}">
					<input type="text" name="ename" value="${employee.ename}">
					</td>
				</tr>

				<tr>
					<td width="100" align="center">工作</td>
					<td width="356"><input type="text" name="job"
						value="${employee.job}">
					</td>
				</tr>
				<tr>
					<td width="100" align="center">上级</td>
					<td>
						<select name="mgr">
							<option value="${employee.mgrname}">${employee.mgrname}</option>
							<c:forEach items="${emplist}" varStatus="status">
								<c:set var="et" value="${status.current}"/>
								<option value="${et.empno}">${et.ename}</option>
							</c:forEach>

						</select>
					</td>
				</tr>
				<tr>
					<td width="100" align="center">薪金</td>
					<td width="356"><input type="text" name="sal"
										   value="${employee.sal}">
					</td>
				</tr>
				<tr>
					<td width="100" align="center">奖金</td>
					<td width="356"><input type="text" name="comm"
										   value="${employee.comm}">
					</td>
				</tr>
				<tr>
					<td width="100" align="center">所在部门</td>
					<td width="356">
						<select name="deptno">
							<option value="">${employee.dname}</option>
							<c:forEach items="${deptlist}" varStatus="status">
								<c:set var="et" value="${status.current}"/>
									<option value="${et.deptno}">${et.dname}</option>
							</c:forEach>
							<option >
						</select>
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
