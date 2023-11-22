<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
    <title>Title</title>
    <script>
        function confirmUpdate() {
            return confirm("Bạn có chắc chắn muốn cập nhật trạng thái?");
        }
    </script>
</head>
<body>
<div class="navbar-header">
    <a class="navbar-brand" href="/home-page"><img src="assets/img/logo.png" alt=""></a>
</div>
<div>
    <h2>
        <a href="/HouseForRentServlet?action=HouseForRentServlet">Quay lại danh sách</a>
    </h2>
</div>
<form method="post" onsubmit="return confirmUpdate()">
    <table border="1" cellpadding="5">
        <c:if test="${bill != null}">
            <input type="hidden" name="rentalId" value="<c:out value='${bill.rentalId}' />"/>
        </c:if>
        <tr>
            <th>HouseName:</th>
            <td>
                <input type="text" name="houseName" size="45"
                       value="<c:out value='${bill.houseName}' />"
                />
            </td>
        </tr>
        <tr>
            <th>Status :</th>
            <td><c:if test="${not empty mess}">
                <p>${mess}</p>
            </c:if>
                <input type="text" name="status" size="45"
                       value="<c:out value='${bill.status}' />"
                />
            </td>
        </tr>
        <tr>
            <td colspan="2" align="center">
                <input type="submit" value="Save"/>
            </td>
        </tr>
    </table>
</form>
</body>
</html>