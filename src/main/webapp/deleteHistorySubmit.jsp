<%@ page import="org.example.wifiproject.service.HistoryService" %><%--
  Created by IntelliJ IDEA.
  User: 1
  Date: 2024-11-05
  Time: 오후 5:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<html>
<head>
    <title>wifiProject</title>
</head>
<body>
<%
    String historyId = request.getParameter("id");

    HistoryService historyService = new HistoryService();
    String content = historyService.deleteHistory(historyId) > 0 ? "히스토리를 삭제하였습니다." : "히스토리 삭제 실패";
%>
<script>
    alert("<%=content%>");
    location.href = "history.jsp";
</script>
</body>
</html>
