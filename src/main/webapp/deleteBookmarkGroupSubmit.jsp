<%@ page import="org.example.wifiproject.service.BookmarkGroupService" %><%--
  Created by IntelliJ IDEA.
  User: 1
  Date: 2024-11-03
  Time: 오전 10:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<html>
<head>
    <title>wifiProject</title>
</head>
<body>
<%
    String groupId = request.getParameter("id");

    BookmarkGroupService bookmarkGroupService = new BookmarkGroupService();
    String content = bookmarkGroupService.deleteBookmarkGroup(groupId) > 0
            ? "북마크 그룹 정보를 삭제하였습니다." : "그룹 정보 삭제 실패";
%>
<script>
    <%

    %>
    alert("<%=content%>");
    location.href = "bookmarkGroup.jsp";
</script>
</body>
</html>