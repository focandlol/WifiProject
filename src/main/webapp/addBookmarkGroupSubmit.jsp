<%@ page import="org.example.wifiproject.service.BookmarkGroupService" %>
<%@ page import="org.example.wifiproject.dto.AddBookmarkGroupSubmitDto" %><%--
  Created by IntelliJ IDEA.
  User: 1
  Date: 2024-11-01
  Time: 오후 6:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<html>
<head>
    <title>wifiProject</title>
</head>
<body>
<%
    String name = request.getParameter("name");
    String sequence = request.getParameter("sequence");

    BookmarkGroupService bookmarkGroupService = new BookmarkGroupService();
    String content = bookmarkGroupService.addBookmarkGroup(new AddBookmarkGroupSubmitDto(name,Integer.parseInt(sequence))) > 0
            ? "북마크 그룹 데이터를 추가하였습니다." : "그룹 추가 실패";
%>
<script>
    alert("<%=content%>");
    location.href = "bookmarkGroup.jsp";
</script>
</body>
</html>
