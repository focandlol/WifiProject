<%@ page import="org.example.wifiproject.service.HistoryService" %>
<%@ page import="org.example.wifiproject.dto.HistoryDto" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: 1
  Date: 2024-10-30
  Time: 오후 8:07
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
<h1>위치 히스토리 목록</h1>
<%@ include file="resource/header.jsp"%>
<br>
<div>
    <%
        HistoryService historyService = new HistoryService();
        List<HistoryDto> historyList = historyService.getHistoryList();
    %>
    <table>
        <thead>
        <tr>
            <th>ID</th>
            <th>x좌표</th>
            <th>y좌표</th>
            <th>조회일자</th>
            <th>비고</th>
        </tr>
        </thead>
        <tbody>
        <% if (historyList.isEmpty()) {%>
        <tr>
            <td colspan="5" style="text-align: center;">위치 정보를 조회하신 이력이 없습니다.</td>
        </tr>
        <% } else { %>
        <% for (HistoryDto historyDto : historyList) { %>
        <tr>
            <td><%=historyDto.getHistoryId()%></td>
            <td><%=historyDto.getLat()%></td>
            <td><%=historyDto.getLnt()%></td>
            <td><%=historyDto.getSelectDate()%></td>
            <td style="text-align: center;">
                <button onclick="location.href = 'deleteHistory.jsp?id=<%=historyDto.getHistoryId()%>'">삭제</button>
            </td>
        </tr>
        <% }} %>
        </tbody>
    </table>
</div>
</body>
</html>
