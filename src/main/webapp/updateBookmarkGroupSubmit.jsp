<%@ page import="org.example.wifiproject.service.BookmarkGroupService" %>
<%@ page import="org.example.wifiproject.dto.BookmarkGroupUpdateDto" %><%--
  Created by IntelliJ IDEA.
  User: 1
  Date: 2024-11-02
  Time: 오전 11:19
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
    String groupId = request.getParameter("id");

    BookmarkGroupUpdateDto bookmarkGroupUpdateDto = BookmarkGroupUpdateDto.builder()
            .groupId(Integer.parseInt(groupId))
            .groupName(name)
            .sequence(Integer.parseInt(sequence)).build();

    BookmarkGroupService bookmarkGroupService = new BookmarkGroupService();
    String content = bookmarkGroupService.updateBookmarkGroup(bookmarkGroupUpdateDto) > 0
            ? "북마크 그룹 정보를 수정하였습니다." : "그룹 정보 수정 실패";
%>
<script>
    alert("<%=content%>");
    location.href = "bookmarkGroup.jsp";
</script>
</body>
</html>

