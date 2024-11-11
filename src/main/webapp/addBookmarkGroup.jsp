<%--
  Created by IntelliJ IDEA.
  User: 1
  Date: 2024-11-01
  Time: 오후 6:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="resource/style.css">
    <title>wifiProject</title>
</head>
<body>
<h2>북마크 그룹 추가</h2>
<%@ include file="resource/header.jsp"%>
<br>
<form action="addBookmarkGroupSubmit.jsp">
    <table>
        <tr tyle="height:5px">
            <th>북마크 이름</th>
            <td><input type="text" name="name"></td>
        </tr>
        <tr>
            <th>순서</th>
            <td><input type="text" name="sequence"></td>
        </tr>
        <tr style="height:5px">
            <td colspan="2" style="height:1px; text-align: center;">
                <button type="submit">추가</button>
            </td>
        </tr>
    </table>
</form>
</body>
</html>