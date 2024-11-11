<%@ page import="org.example.wifiproject.service.BookmarkService" %>
<%@ page import="org.example.wifiproject.dto.BookmarkDto" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: 1
  Date: 2024-11-05
  Time: 오후 4:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<html>
<head>
    <title>wifiProject</title>
    <meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="resource/style.css">
</head>
<body>
<h1>북마크 보기</h1>
<%@ include file="resource/header.jsp"%>
<br>
<div>
    <%
        BookmarkService bookmarkService = new BookmarkService();
        List<BookmarkDto> bookmarkList = bookmarkService.getBookmarkList();
    %>
    <table>
        <thead>
        <tr>
            <th>ID</th>
            <th>북마크 이름</th>
            <th>와이파이명</th>
            <th>등록일자</th>
            <th>비고</th>
        </tr>
        </thead>
        <tbody>
        <% if(bookmarkList.size() != 0) {
            for (BookmarkDto bookmarkDto : bookmarkList) { %>
        <tr>
            <td><%=bookmarkDto.getBookmarkId()%></td>
            <td><%=bookmarkDto.getGroupName()%></td>
            <td><a href="wifiDetail.jsp?id=<%=bookmarkDto.getWifiId()%>"><%=bookmarkDto.getWifiName()%></a></td>
            <td><%=bookmarkDto.getCreated()%></td>
            <td style="text-align: center;"><a href="deleteBookmark.jsp?id=<%=bookmarkDto.getBookmarkId()%>">삭제</a></td>
        </tr>
        <% } } else { %>
        <tr>
            <td colspan="5" style="text-align: center;"> 정보가 존재하지 않습니다.</td>
        </tr>
        <% } %>
        </tbody>
    </table>
</div>
</body>
</html>
