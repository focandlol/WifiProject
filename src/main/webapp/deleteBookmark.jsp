<%@ page import="org.example.wifiproject.service.BookmarkService" %>
<%@ page import="org.example.wifiproject.dto.BookmarkDto" %><%--
  Created by IntelliJ IDEA.
  User: 1
  Date: 2024-11-06
  Time: 오후 6:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="resource/style.css">
    <title>wifiProject</title>
</head>
<body>
<h2>북마크 삭제</h2>
<%@include file="resource/header.jsp"%>
<%
    BookmarkService bookmarkService = new BookmarkService();
    String id = request.getParameter("id");
    BookmarkDto bookmarkDto = bookmarkService.getBookmarkById(id);
%>
<h3>북마크를 삭제하시겠습니까?</h3>
<table>
    <tr>
        <th>북마크 이름</th>
        <td><%=bookmarkDto.getGroupName()%></td>
    </tr>
    <tr>
        <th>와이파이명</th>
        <td><a href="wifiDetail.jsp?id=<%=bookmarkDto.getWifiId()%>"><%=bookmarkDto.getWifiName()%></a></td>
    </tr>
    <tr>
        <th>등록일자</th>
        <td><%=bookmarkDto.getCreated()%></td>
    </tr>
    <tr>
        <td style="text-align: center;" colspan="2">
            <a href="bookmark.jsp">돌아가기</a>
            <span>|</span>
            <button onclick="location.href = 'deleteBookmarkSubmit.jsp?id=<%=bookmarkDto.getBookmarkId()%>'">삭제</button>
        </td>
    </tr>
</table>
</body>
</html>
