<%@ page import="org.example.wifiproject.service.BookmarkGroupService" %>
<%@ page import="org.example.wifiproject.dto.BookmarkGroupDto" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: 1
  Date: 2024-11-01
  Time: 오후 5:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="resource/style.css">
    <title>wifiProject</title>
</head>
<body>
<h2>북마크 그룹 관리</h2>
<%@ include file="resource/header.jsp"%>
<br>
<button onclick="location.href = 'addBookmarkGroup.jsp'">북마크 그룹 이름 추가</button>
<br>
<table>
    <thead>
    <tr>
        <th>ID</th>
        <th>북마크 이름</th>
        <th>순서</th>
        <th>등록일자</th>
        <th>수정일자</th>
        <th>비고</th>
    </tr>
    </thead>
    <tbody>
    <%
        BookmarkGroupService bookmarkGroupService = new BookmarkGroupService();
        List<BookmarkGroupDto> bookmarkGroupList = bookmarkGroupService.getBookmarkGroupList();

        if (bookmarkGroupList.size() == 0) {
    %>
    <tr>
        <td colspan="6" style="text-align: center;"> 정보가 존재하지 않습니다.</td>
    </tr>
    <% } else {
        for (BookmarkGroupDto bookmarkGroupDto : bookmarkGroupList) {
    %>
    <tr>
        <td><%=bookmarkGroupDto.getGroupId()%></td>
        <td><%=bookmarkGroupDto.getGroupName()%></td>
        <td><%=bookmarkGroupDto.getSequence()%></td>
        <td><%=bookmarkGroupDto.getCreated()%></td>
        <%
            if(bookmarkGroupDto.getModified()!=null) {
        %>
                <td><%=bookmarkGroupDto.getModified()%></td>
        <% } else { %>
                <td></td>
        <% } %>
        <td style="text-align: center;">
            <a href="updateBookmarkGroup.jsp?id=<%=bookmarkGroupDto.getGroupId()%>">수정</a>
            <a href="deleteBookmarkGroup.jsp?id=<%=bookmarkGroupDto.getGroupId()%>">삭제</a>
        </td>
    </tr>
    <% } } %>
    </tbody>
</table>
</body>
</html>
