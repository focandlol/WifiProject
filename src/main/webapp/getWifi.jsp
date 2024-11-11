<%@ page import="org.example.wifiproject.service.APIService" %><%--
  Created by IntelliJ IDEA.
  User: 1
  Date: 2024-10-28
  Time: 오후 6:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>wifiProject</title>
</head>
<body>
<%
    APIService apiService = new APIService();
    int count = apiService.getWifi();
    String text = count > 0 ? count + "건의 테이터를 성공적으로 저장했습니다." : "데이터 저장 실패";
    if(count > 0) {%>
        <div style="text-align: center;">
            <h1><%=text%></h1>
            <a href="index.jsp">홈으로 돌아가기</a>
        </div>
<% } %>
</body>
</html>
