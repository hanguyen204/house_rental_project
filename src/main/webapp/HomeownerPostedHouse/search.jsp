<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<div align="center">
        <form action="/HomeownerPostedHouse?action=search" method="post">
            <input type="text" name="houseName" placeholder="Nhập tên cần tìm kiếm">
            <input type="submit" value="Search">
        </form>
        <form action="/HomeownerPostedHouse?action=onRoom" method="post">
            <label>con hang</label>
            <input type="checkbox" name="houseName">
            <input type="submit" value="Submit">
        </form>
        <form action="/HomeownerPostedHouse?action=offRoom" method="post">
            <label>Het hang</label>
            <input type="checkbox"  name="houseName">
            <input type="submit" value="Submit">
        </form>
    <table border="1" cellpadding="5">
        <c:forEach var="list" items="${list}">
            <div>
                <td><c:out value="${list.houseName}"/></td>
                <td><c:out value="${list.address}"/></td>
                <td><c:out value="${list.numberBath}"/></td>
                <td><c:out value="${list.numberBed}"/></td>
                <td><c:out value="${list.describeHouse}"/></td>
                <td><c:out value="${list.numberHouseForRent}"/>VNĐ</td>
                <td><img class="img" src="${list.urlImage}"></td>
            </div>
        </c:forEach>
    </table>
    <div class="pagination">
        <c:if test="${currentPage > 1}">
            <a href="?page=${currentPage - 1}">Previous</a>
        </c:if>
        <c:forEach begin="1" end="${totalPages}" var="page">
            <c:choose>
                <c:when test="${page == currentPage}">
                    <a href="?page=${page}" class="active">${page}</a>
                </c:when>
                <c:otherwise>
                    <a href="?page=${page}">${page}</a>
                </c:otherwise>
            </c:choose>
        </c:forEach>
        <c:if test="${currentPage < totalPages}">
            <a href="?page=${currentPage + 1}">Next</a>
        </c:if>
    </div>
</div>
</body>
</html>
