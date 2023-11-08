<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>User Management Application</title>
</head>
<body>
<center>
    <h1>User Management</h1>
    <h2>
        <a href="HomeownerPostedHouse?action=users">List All Users</a>
    </h2>
</center>
<div align="center">
    <form method="post">
        <table border="1" cellpadding="5">
            <c:if test="${list != null}">
                <input type="hidden" name="houseId" value="<c:out value='${list.houseId}' />"/>
            </c:if>
            <tr>
                <th> Name:</th>
                <td>
                    <input type="text" name="houseName" size="45"
                           value="<c:out value='${list.houseName}' />"
                    />
                </td>
            </tr>
            <tr>
                <th>Address:</th>
                <td>
                    <input type="text" name="address" size="45"
                           value="<c:out value='${list.address}' />"
                    />
                </td>
            </tr>
            <tr>
                <th>NumbBath:</th>
                <td>
                    <input type="number" name="numberBath" size="15"
                           value="<c:out value='${list.numberBath}' />"
                    />
                </td>
            </tr>
            <tr>
                <th>NumberBed:</th>
                <td>
                    <input type="number" name="numberBed" size="15"
                           value="<c:out value='${list.numberBed}' />"
                    />
                </td>
            </tr>
            <tr>
                <th>DescribeHouse:</th>
                <td>
                    <input type="text" name="describeHouse" size="15"
                           value="<c:out value='${list.describeHouse}' />"
                    />
                </td>
            </tr>
            <tr>
                <th>NumberHouseForRent:</th>
                <td>
                    <input type="number" name="numberHouseForRent" size="15"
                           value="<c:out value='${list.numberHouseForRent}' />"
                    />
                </td>
            </tr>
            <tr>
                <th>UrlImage:</th>
                <td>
                    <input type="file" name="image" accept="image/jpeg, image/png" size="15"
                           value="<c:out value='${list.urlImage}' />"
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
</div>
</body>
</html>
