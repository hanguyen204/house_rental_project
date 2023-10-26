<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
</head>
<body>
<div align="center">
    <table border="1" cellpadding="5">
        <caption><h2>List of Users</h2></caption>
        <tr>
            <th>Username</th>
            <th>Ảnh</th>
            <th>Họ và tên</th>
            <th>Địa chỉ</th>
            <th>Số điện thoại</th>
        </tr>
        <c:forEach var="product" items="${product}">
            <tr>
                <td><c:out value="${product.username}"/></td>
                <td><c:out value="${product.urlImage}"/></td>
                <td><c:out value="${product.fullName}"/></td>
                <td><c:out value="${product.address}"/></td>
                <td><c:out value="${product.phone}"/></td>
                <td>
                    <a href="/profileUser?action=edit&id=${product.id}">Edit</a>
                </td>
            </tr>
        </c:forEach>
    </table>
</div>
</body>
</html>