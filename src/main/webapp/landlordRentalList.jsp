<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: LENOVO
  Date: 15/11/2023
  Time: 4:00 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<c:forEach var="list" items="${list}">
    <div class="col-sm-6 col-md-4 p0" style="width: 285px;height: 380px;">
        <div class="box-two proerty-item">
            <div class="item-thumb">
                <a href="/view-house?idUser=${list.houseId}"><img src="${list.imgHouse}"></a>
            </div>
            <div class="item-entry overflow">
                <h5><a href="/view-house?idUser=${list.houseId}" style="letter-spacing: -1px;" id="content"> ${list.houseName}</a></h5>
                <div class="dot-hr"></div>
                <p><a>Address: </a>${list.address}</p>
                <p><a>Revenue: </a>${list.revenue}</p>
                <span class="pull-left" style="color: black"><b> Area :</b> ${list.width}m<sup>2</sup> </span>
                        <span class="proerty-price pull-right" style="color: black">${list.price}</span>
                <div class="property-icon" style="color: black">
                    <img src="assets/img/icon/bed.png">(${list.numberBed})|
                    <img src="assets/img/icon/shawer.png">(${list.numberBath})
                </div>
                <a hidden="hidden">${list.describeHouse}</a>
            </div>
        </div>
    </div>
</c:forEach>
</body>
</html>
