<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<head>
    <title>Edit House</title>
</head>
<body>
<h1>Edit House</h1>
<form method="POST" >
    <input type="hidden" name="houseId" value="${house.houseId}">
    <input type="hidden" name="userId" value="${house.userId}">
    <label>Image URL:</label>
    <input type="text" name="imgHouse" value="${house.imgHouse}">
    <br>
    <label>House Name:</label>
    <input type="text" name="housename" value="${house.houseName}">
    <br>
    <label>Price:</label>
    <input type="text" name="price" value="${house.price}">
    <br>
    <label>Time Rental:</label>
    <input type="text" name="timeRental" value="${house.timeRental}">
    <br>
    <label>Address:</label>
    <input type="text" name="address" value="${house.address}">
    <br>
    <label>Revenue:</label>
    <input type="text" name="revenue" value="${house.revenue}">
    <br>
    <label>Number of Bathrooms:</label>
    <input type="text" name="numberBath" value="${house.numberBath}">
    <br>
    <label>Number of Bedrooms:</label>
    <input type="text" name="numberBed" value="${house.numberBed}">
    <br>
    <input type="submit" value="Save Changes">
</form>
</body>
</html>
