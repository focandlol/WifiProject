<%@ page import="org.example.wifiproject.service.BookmarkService" %><%--
  Created by IntelliJ IDEA.
  User: 1
  Date: 2024-11-06
  Time: 오후 6:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<html>
<head>
    <title>wifiProject</title>
</head>
<body>
<%
    String bookmarkId = request.getParameter("id");

    BookmarkService bookmarkService = new BookmarkService();
    String content = bookmarkService.deleteBookmark(bookmarkId) > 0 ? "북마크 정보를 삭제하였습니다." : "북마크 정보 삭제 실패";
%>
<script>
    alert("<%=content%>");
    location.href = "bookmark.jsp";
</script>
</body>
</html>
