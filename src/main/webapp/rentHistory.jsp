<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: LENOVO
  Date: 17/11/2023
  Time: 1:17 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>

</head>
<body>
<c:forEach items="${rentHistory}" var="list">
<div class="card">
    <div class="card-body">
        <a hidden="hidden">${list.rentalId}</a>
        <h5 class="card-title">${list.houseName}</h5>
        <p class="card-text">Ngày Thuê: ${list.rentalDate}</p>
        <p class="card-text">Tổng đơn: ${list.price}</p>
        <p class="card-text">Địa chỉ: ${list.address}</p>
        <p class="card-text">Trạng thái đơn: ${list.status}</p>

        <c:choose>
            <c:when test="${list.status eq 'Đang cho thuê'}">
                <input type="hidden" name="action" value="cancel">
                <input type="hidden" name="rentalId" value="${list.rentalId}">
                <button style="background-color: red; color: white;"><a href="rentalHistory?action=cancel&rentalId=${list.rentalId}" style="text-decoration: none; ">Hủy thuê</a></button>
            </c:when>
            <c:otherwise>
                <input type="hidden" name="action" value="rentAgain">
                <input type="hidden" name="rentalId" value="${list.rentalId}">
                <button style="background-color: #0C9C14; color: black"><a href="rentalHistory?action=rentAgain&rentalId=${list.rentalId}" style="text-decoration: none;">Thuê lại</a></button>
            </c:otherwise>
        </c:choose>

<%--        <button class="btn btn-danger" id="cancel-btn" ><a href="rentalHistory?action=cancel&rentalId=${list.rentalId}" style="text-decoration: none;">Hủy thuê</a></button>--%>
    </div>
</div>
</c:forEach>

</body>
</html>
