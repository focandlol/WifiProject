<%@ page import="org.example.wifiproject.service.HistoryService" %>
<%@ page import="org.example.wifiproject.dto.HistoryDto" %><%--
  Created by IntelliJ IDEA.
  User: 1
  Date: 2024-11-09
  Time: 오후 1:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="resource/style.css">
    <title>wifiProject</title>
</head>
<body>
<h2>히스토리 삭제</h2>
<%@ include file="resource/header.jsp"%>
<%
    String historyId = request.getParameter("id");
    HistoryService historyService = new HistoryService();
    HistoryDto historyDto = historyService.getHistoryById(historyId);
%>
<br>
<table>
    <tr>
        <th>x좌표</th>
        <td><input type="text" value="<%=historyDto.getLat()%>" readonly></td>
    </tr>
    <tr>
        <th>y좌표</th>
        <td><input type="text" value="<%=historyDto.getLnt()%>" readonly></td>
    </tr>
    <tr>
        <th>조회일자</th>
        <td><input type="text" value="<%=historyDto.getSelectDate()%>" readonly></td>
    </tr>
    <tr>
        <td style="text-align: center;" colspan="2">
            <a href="history.jsp">돌아가기</a>
            <span>|</span>
            <button onclick="location.href = 'deleteHistorySubmit.jsp?id=<%=historyDto.getHistoryId()%>'">삭제</button>
        </td>
    </tr>
</table>
</body>
</html>
