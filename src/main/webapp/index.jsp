<%@ page import="org.example.wifiproject.service.WifiService" %>
<%@ page import="org.example.wifiproject.dto.WifiDto" %>
<%@ page import="java.util.List" %>
<%@ page import="org.example.wifiproject.dto.PositionDto" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>wifiProject</title>
    <meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="resource/style.css">
</head>
<body>
<h1>와이파이 정보 구하기</h1>
<%@include file="resource/header.jsp"%>
<br>
<%
    String lat = request.getParameter("lat");
    String lnt = request.getParameter("lnt");

    lat = lat == null ? "0.0" : lat;
    lnt = lnt == null ? "0.0" : lnt;
%>

<div>
    <span>LAT:</span>
    <input type="text" id="lat" value="<%=lat%>">
    <span>LNT:</span>
    <input type="text" id="lnt" value="<%=lnt%>">
    <button onclick="getPosition()"><span>내 위치 가져오기</span></button>
    <button onclick="getWifiList()"><span>근처 Wifi 정보 보기</span></button>
</div>

<div>
    <table>
        <thead>
        <tr>
            <th>거리(km)</th>
            <th>관리번호</th>
            <th>자치구</th>
            <th>와이파이명</th>
            <th>도로명 주소</th>
            <th>상세 주소</th>
            <th>설치 위치(층)</th>
            <th>설치 유형</th>
            <th>설치 기관</th>
            <th>서비스 구분</th>
            <th>망 종류</th>
            <th>설치 년도</th>
            <th>실내 외 구분</th>
            <th>wifi 접속 환경</th>
            <th>x좌표</th>
            <th>y좌표</th>
            <th>작업일자</th>
        </tr>
        </thead>
        <tbody>
        <%
            if (request.getParameter("lat") != null && request.getParameter("lnt") != null) {
                WifiService wifiService = new WifiService();
                List<WifiDto> wifiList = wifiService.getWifiListByPosition(new PositionDto(Double.parseDouble(lat),Double.parseDouble(lnt)));
                if (wifiList != null) {
                    for (WifiDto wifiDto : wifiList) {
        %>
        <tr>
            <td><%=wifiDto.getDistance()%></td>
            <td><%=wifiDto.getXSwifiMgrNo()%></td>
            <td><%=wifiDto.getXSwifiWrdofc()%></td>
            <td><a href="wifiDetail.jsp?id=<%= wifiDto.getWifiId() %>&distance=<%=wifiDto.getDistance()%>"><%=wifiDto.getXSwifiMainNm()%></a></td>
            <td><%=wifiDto.getXSwifiAdres1()%></td>
            <td><%=wifiDto.getXSwifiAdres2()%></td>
            <td><%=wifiDto.getXSwifiInstlFloor()%></td>
            <td><%=wifiDto.getXSwifiInstlTy()%></td>
            <td><%=wifiDto.getXSwifiInstlMby()%></td>
            <td><%=wifiDto.getXSwifiSvcSe()%></td>
            <td><%=wifiDto.getXSwifiCmcwr()%></td>
            <td><%=wifiDto.getXSwifiCnstcYear()%></td>
            <td><%=wifiDto.getXSwifiInoutDoor()%></td>
            <td><%=wifiDto.getXSwifiRemars3()%></td>
            <td><%=wifiDto.getLat()%></td>
            <td><%=wifiDto.getLnt()%></td>
            <td><%=wifiDto.getWorkDttm()%></td>
        </tr>
        <% } %>
        <% } %>
        <% } else { %>
        <td colspan='17' style="text-align: center;">위치 정보를 입력하신 후에 조회해 주세요.</td>
        <% } %>
        </tbody>
    </table>
</div>
<script>
    function success(position){
        let latitude = position.coords.latitude;
        let longitude = position.coords.longitude;
        document.getElementById("lat").value = latitude;
        document.getElementById("lnt").value = longitude;
    }

    function error() {
        alert("위치 조회 실패");
    }

    var op = {
        enableHighAccuracy: true,
        maximumAge: 0,
        timeout: 10000
    };

    function getPosition(){
        if ('geolocation' in navigator) {
            navigator.geolocation.getCurrentPosition(success,error,op);
        } else{
            alert("위치 조회 실패")
        }
    }

    function getWifiList(){
        let lat = document.getElementById("lat").value;
        let lnt = document.getElementById("lnt").value;

        if (lat != "" && lnt != "") {
            if (isNaN(lat) || isNaN(lnt)) {
                alert("위치 정보는 숫자로 입력해 주세요.");
            } else {
                location.href = "index.jsp?lat=" + lat + "&lnt=" + lnt;
            }
        } else {
            alert("위치 정보를 입력하신 후 조회해주세요.")
        }
    }
</script>
</body>
</html>