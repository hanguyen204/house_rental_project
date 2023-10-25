<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>User Management Application</title>
    <style>
        table {
            border-collapse: collapse;
            width: 100%;
        }

        th, td {
            padding: 8px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        caption {
            font-size: 20px;
            font-weight: bold;
            margin-bottom: 10px;
        }

        button {
            padding: 5px 10px;
            border: none;
            background-color: #4CAF50;
            color: white;
            cursor: pointer;
        }

        button a {
            color: white;
            text-decoration: none;
        }

        button:hover {
            background-color: #45a049;
        }

        th {
            background-color: #4CAF50;
            color: white;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        div {
            margin-top: 20px;
        }
    </style>
</head>
<body>
<div align="center">
    <table border="1" cellpadding="5">
        <caption><h2>List of Users</h2></caption>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Phone</th>
            <th>Status</th>
            <th>Action</th>
        </tr>
        <c:forEach var="user" items="${list}">
            <tr>
                <td><c:out value="${user.id}"/></td>
                <td><c:out value="${user.fullName}"/></td>
                <td><c:out value="${user.phone}"/></td>
                <td><c:out value="${user.status}"/></td>
                <td>
                    <c:choose>
                        <c:when test="${user.getStatus() == 'Đang hoạt động'}">
                            <input type="hidden" name="action" value="inactive">
                            <input type="hidden" name="userId" value="${user.id}">
                            <button><a href="toggleStatus?action=unActive&userId=${user.id}" style="text-decoration: none">Khóa</a></button>

                        </c:when>
                        <c:otherwise>
                            <input type="hidden" name="action" value="active">
                            <input type="hidden" name="userId" value="${user.id}">
                            <button><a href="toggleStatus?action=active&userId=${user.id}" style="text-decoration: none">Kích hoạt</a></button>
                        </c:otherwise>
                    </c:choose>
                </td>
            </tr>
        </c:forEach>
    </table>
</div>
</body>
</html>