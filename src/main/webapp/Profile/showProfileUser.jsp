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
    <c:forEach var="user" items="${user}">
      <tr>
        <td><c:out value="${user.username}"/></td>
        <td><c:out value="${user.urlImage}"/></td>
        <td><c:out value="${user.fullName}"/></td>
        <td><c:out value="${user.address}"/></td>
        <td><c:out value="${user.phone}"/></td>
        <td>
          <a href="/profileUser?action=edit&id=${user.id}">Edit</a>
        </td>
      </tr>
    </c:forEach>
  </table>
</div>
</body>
</html>