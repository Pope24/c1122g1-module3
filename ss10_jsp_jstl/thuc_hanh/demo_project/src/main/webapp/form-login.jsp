<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 3/7/2023
  Time: 10:09 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Document</title>
  <link
          href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
          rel="stylesheet"
          integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
          crossorigin="anonymous"
  />
  <link rel="stylesheet" href="./form-login.css" />
</head>
<body>
<div class="container">
  <div class="header">
    <nav>
      <nav
              class="d-flex justify-content-between align-items-center pt-3 pb-3"
      >
        <img src="./assets/images/logo.png" class="logo" />
      </nav>
    </nav>
  </div>
  <div class="main">
    <div class="form-login">
      <form id="login" onsubmit="return false;">
        <h1>Đăng nhập</h1>
        <input
                type="text"
                name="username"
                class="username w-100"
                placeholder="Nhập tên người dùng"
        />
        <input
                type="password"
                name="password"
                class="password w-100"
                placeholder="Mật khẩu"
        />
        <input
                type="submit"
                class="submit-btn w-100 fw-bold"
                value="Đăng nhập"
        />
        <div class="modified">
          <div class="remember-me">
            <input type="checkbox" class="me-2" id="remember-me" /><label
                  for="remember-me"
          >Ghi nhớ tôi</label
          >
          </div>
          <a href="/">Bạn cần trợ giúp ?</a>
        </div>
        <div class="login-form-other">
          <p>
            Bạn mới tham gia Netflix?
            <b style="color: #fff; margin-left: 5px">Đăng kí ngay</b>
          </p>
          <p>
            Trang này được Google reCAPTCHA bảo vệ để đảm bảo bạn không phải
            là robot. Tìm hiểu thêm.
          </p>
        </div>
      </form>
    </div>
  </div>
  <div class="footer"></div>
</div>
</body>
<script
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
        crossorigin="anonymous"
></script>
</html>

