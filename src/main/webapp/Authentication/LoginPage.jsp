<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Form login unitop.vn</title>
  </div>
  <style>
    .error-message {
      color: red;
    }
  </style>
</head>
<body>
<div id=" wrapper">
  <form action="/login" method="post">
    <h1 class="form-heading">Form đăng nhập</h1>
    <%
      Boolean loginFailed = (Boolean) session.getAttribute("loginFailed");
      if (loginFailed != null && loginFailed) {
    %>
    <p class="error-message">Đăng nhập thất bại</p>
    <%
      }
      session.removeAttribute("loginFailed");
    %>

    <input type="text" name="username" class="form-input" placeholder="Tên đăng nhập">

    <input type="password" name="password" class="form-input" placeholder="Mật khẩu">

    <input type="submit" value="Đăng nhập" class="form-submit">
  </form>
</div>
</body>
</html>
