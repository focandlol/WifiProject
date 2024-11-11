<%@ page import="org.example.wifiproject.service.BookmarkGroupService" %>
<%@ page import="org.example.wifiproject.dto.BookmarkGroupDto" %><%--
  Created by IntelliJ IDEA.
  User: 1
  Date: 2024-11-02
  Time: 오전 11:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="resource/style.css">
    <title>wifiProject</title>
</head>
<body>
<h2>북마크 그룹 수정</h2>
<%@ include file="resource/header.jsp"%>
<%
    String groupId = request.getParameter("id");
    BookmarkGroupService bookmarkGroupService = new BookmarkGroupService();
    BookmarkGroupDto bookmarkGroupDto = bookmarkGroupService.getBookmarkGroupById(groupId);
%>
<br>
<form action="updateBookmarkGroupSubmit.jsp">
    <table>
        <tr>
            <th>북마크 이름</th>
            <td><input type="text" name="name" value="<%=bookmarkGroupDto.getGroupName()%>"></td>
        </tr>
        <tr>
            <th>순서</th>
            <td><input type="text" name="sequence" value="<%=bookmarkGroupDto.getSequence()%>"></td>
        </tr>
        <tr>
            <td style="text-align: center;" colspan="3">
                <a href="bookmarkGroup.jsp">돌아가기</a>
                <span>|</span>
                <button type="submit">수정</button>
            </td>
        </tr>
    </table>
    <input type="hidden" name="id" value="<%=groupId%>">
</form>
</body>
</html>