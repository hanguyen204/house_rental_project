<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div align="center">
    <form method="post">
        <input type="hidden" name="username" value="${user.username}">
        <table border="1" cellpadding="5">
            <caption>
                <h2>
                    Edit User
                </h2>
            </caption>
            <c:if test="${user != null}">
                <input type="hidden" name="id" value="<c:out value='${user.id}'/>"/>
            </c:if>
            <tr>
                <th>Username:</th>
                <td>
                    <p><c:out value='${user.username}'/></p>
                </td>
            </tr>
            <tr>
                <th>Ảnh:</th>
                <td>
                    <input type="text" name="urlImage" size="45"
                           value="<c:out value='${user.urlImage}'/>" pattern="^[a-zA-Z0-9]+$"/>
                </td>
            </tr>
            <tr>
                <th>Họ và tên:</th>
                <td>
                    <input type="text" name="fullName" size="15"
                           value="<c:out value='${user.fullName}' />" pattern="^[a-zA-Z0-9]+$" required/>
                </td>
            </tr>
            <tr>
                <th>Địa chỉ:</th>
                <td>
                    <input type="text" name="address" size="15"
                           value="<c:out value='${user.address}' />" pattern="^[a-zA-Z0-9]+$"/>
                </td>
            </tr>
            <tr>
                <th>Số điện thoại:</th>
                <td>
                    <input type="text" name="phone" size="15"
                           value="<c:out value='${user.phone}' />"pattern="^[a-zA-Z0-9]+$" required/>
                </td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <input type="submit" value="Save"/>
                </td>
            </tr>
        </table>
    </form>
</div>

</body>
</html>
