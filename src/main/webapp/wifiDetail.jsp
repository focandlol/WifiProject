<%@ page import="org.example.wifiproject.dto.WifiDto" %>
<%@ page import="java.util.List" %>
<%@ page import="org.example.wifiproject.service.WifiService" %>
<%@ page import="org.example.wifiproject.service.BookmarkGroupService" %>
<%@ page import="org.example.wifiproject.dto.BookmarkGroupDto" %><%--
  Created by IntelliJ IDEA.
  User: 1
  Date: 2024-10-31
  Time: 오후 5:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="resource/style.css">
    <title>wifiProject</title>
</head>
<body>
<%@include file="resource/header.jsp"%>
<%
    WifiService wifiService = new WifiService();
    String id = request.getParameter("id");
    String distance = request.getParameter("distance");
    WifiDto wifiDto = wifiService.getDetailWifi(id,distance);

    BookmarkGroupService bookmarkGroupService = new BookmarkGroupService();
    List<BookmarkGroupDto> bookmarkGroupList = bookmarkGroupService.getBookmarkGroupList();
%>
<form method="post" action="addBookmarkSubmit.jsp" id="bookmarkList">
    <select name="groupId">
        <option value="none" selected>북마크 그룹 이름 선택</option>
        <% for (BookmarkGroupDto bookmarkGroupDto : bookmarkGroupList) {%>
        <option value="<%=bookmarkGroupDto.getGroupId()%>">
            <%=bookmarkGroupDto.getGroupName()%>
        </option>
        <% } %>
    </select>
    <button type="submit">북마크 추가</button>
    <input type="hidden" name="wifiId" value="<%=id%>">
    <input type="hidden" name="distance" value="<%=distance%>">
</form>

<table>
    <tr>
        <th>거리(km)</th>
        <td><%=wifiDto.getDistance()%></td>
    </tr>
    <tr>
        <th>관리번호</th>
        <td><%=wifiDto.getXSwifiMgrNo()%></td>
    </tr>

    <tr>
        <th>자치구</th>
        <td><%=wifiDto.getXSwifiWrdofc()%></td>
    </tr>
    <tr>
        <th>와이파이명</th>
        <td><%=wifiDto.getXSwifiMainNm()%></td>
    </tr>

    <tr>
        <th>도로명 주소</th>
        <td><%=wifiDto.getXSwifiAdres1()%></td>
    </tr>
    <tr>
        <th>상세 주소</th>
        <td><%=wifiDto.getXSwifiAdres2()%></td>
    </tr>
    <tr>
        <th>설치 위치(층)</th>
        <td><%=wifiDto.getXSwifiInstlFloor()%></td>
    </tr>
    <tr>
        <th>설치 유형</th>
        <td><%=wifiDto.getXSwifiInstlTy()%></td>
    </tr>
    <tr>
        <th>설치 기관</th>
        <td><%=wifiDto.getXSwifiInstlMby()%></td>
    </tr>
    <tr>
        <th>서비스 구분</th>
        <td><%=wifiDto.getXSwifiSvcSe()%></td>
    </tr>
    <tr>
        <th>망 종류</th>
        <td><%=wifiDto.getXSwifiCmcwr()%></td>
    </tr>
    <tr>
        <th>설치 년도</th>
        <td><%=wifiDto.getXSwifiCnstcYear()%></td>
    </tr>
    <tr>
        <th>실내 외 구분</th>
        <td><%=wifiDto.getXSwifiInoutDoor()%></td>
    </tr>
    <tr>
        <th>wifi 접속 환경</th>
        <td><%=wifiDto.getXSwifiRemars3()%></td>
    </tr>
    <tr>
        <th>x좌표</th>
        <td><%=wifiDto.getLat()%></td>
    </tr>
    <tr>
        <th>y좌표</th>
        <td><%=wifiDto.getLnt()%></td>
    </tr>
    <tr>
        <th>작업일자</th>
        <td><%=wifiDto.getWorkDttm()%></td>
    </tr>
</table>
</body>
</html>
