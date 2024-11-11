<%@ page import="org.example.wifiproject.dto.AddBookmarkSubmitDto" %>
<%@ page import="org.example.wifiproject.service.BookmarkService" %><%--
  Created by IntelliJ IDEA.
  User: 1
  Date: 2024-11-04
  Time: 오후 5:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<html>
<head>
    <title>wifiProject</title>
</head>
<body>
<%
    String wifiId = request.getParameter("wifiId");
    String groupId = request.getParameter("groupId");
    String distance = request.getParameter("distance");

    AddBookmarkSubmitDto addBookmarkSubmitDto = AddBookmarkSubmitDto.builder()
            .bookmarkId(Integer.parseInt(groupId))
            .wifiId(Integer.parseInt(wifiId)).build();

    BookmarkService bookmarkService = new BookmarkService();
    int count = bookmarkService.addBookmark(addBookmarkSubmitDto);
    String content = count > 0 ? "북마크 정보를 추가하였습니다." : "북마크 추가 실패";
    String url = count > 0 ? "bookmark.jsp" : "wifiDetail.jsp?id=" + wifiId + "&distance=" + distance;
%>
<script>
    alert("<%=content%>");
    location.href = "<%=url%>";
</script>
</body>
</html>
