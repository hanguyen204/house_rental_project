<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>User Management Application</title>
</head>
<body>
<div align="center">
    <form method="post">
        <table border="1" cellpadding="5">
            <caption>
                <h2>Add New House</h2>
            </caption>
            <tr>
                <th>Name:</th>
                <td>
                    <input type="text" name="houseName" id="houseName" size="45" required/>
                </td>
            </tr>
            <tr>
                <th>Address:</th>
                <td>
                    <input type="text" name="address" id="address" size="45" required/>
                </td>
            </tr>
            <tr>
                <th>NumberBath:</th>
                <td>
                    <input type="number" name="numberBath" id="numberBath" size="15" required min="1" max="3"/>
                </td>
            </tr>
            <tr>
                <th>NumberBed:</th>
                <td>
                    <input type="number" name="numberBed" id="numberBed" size="15" required min="1" max="10"/>
                </td>
            </tr>
            <tr>
                <th>DescribeHouse:</th>
                <td>
                    <input type="text" name="describeHouse" id="describeHouse" size="15"/>
                </td>
            </tr>
            <tr>
                <th>NumberHouseForRent:</th>
                <td>
                    <input type="number" name="numberHouseForRent" id="numberHouseForRent" size="15" required/>
                </td>
            </tr>
            <tr>
                <th>UrlImage:</th>
                <td>
                    <input type="file" name="image" accept="image/jpeg, image/png" size="15" />
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
