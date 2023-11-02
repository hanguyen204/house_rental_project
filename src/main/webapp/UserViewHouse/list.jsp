<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>House</title>
</head>
<body>

<div align="center">
    <table border="1" cellpadding="5">
        <caption><h2>List of Users</h2></caption>
        <tr>
            <th>Name</th>
            <th>address</th>
            <th>numbBath</th>
            <th>numberBed</th>
            <th>describeHouse</th>
            <th>numberHouseForRent</th>
            <th>urlImage</th>
        </tr>
        <c:forEach var="list" items="${list}">
            <tr>
                <td><c:out value="${list.houseName}"/></td>
                <td><c:out value="${list.address}"/></td>
                <td><c:out value="${list.numberBath}"/></td>
                <td><c:out value="${list.numberBed}"/></td>
                <td><c:out value="${list.describeHouse}"/></td>
                <td><c:out value="${list.numberHouseForRent}"/>VNĐ</td>
                <td><img class="img" src="${list.urlImage}"></td>
                <td>
                    <button><a href="/RentNow.jsp" style="text-decoration: none">Thuê ngay</a></button>
                </td>
            </tr>
        </c:forEach>
    </table>
</div>
</body>
</html>
