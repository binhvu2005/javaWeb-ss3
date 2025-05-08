<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    // Lấy dữ liệu từ form gửi lên (nếu có)
    String name = request.getParameter("name");
    String email = request.getParameter("email");

    if (name != null && email != null) {
        // Lưu vào ServletContext
        ServletContext context = getServletContext();
        context.setAttribute("userName", name);
        context.setAttribute("userEmail", email);
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Lưu thông tin người dùng</title>
</head>
<body>
<h2>Nhập thông tin người dùng</h2>
<form method="post">
    Họ tên: <input type="text" name="name" required /><br/><br/>
    Email: <input type="email" name="email" required /><br/><br/>
    <input type="submit" value="Lưu thông tin" />
</form>

<hr/>
<h2>Thông tin người dùng đã lưu</h2>
<%
    // Lấy thông tin người dùng đã lưu từ ServletContext
    ServletContext context = pageContext.getServletContext();
    String savedName = (String) context.getAttribute("userName");
    String savedEmail = (String) context.getAttribute("userEmail");
%>
<%
    if (savedName != null && savedEmail != null) {
%>
<p><strong>Họ tên:</strong> <%= savedName %></p>
<p><strong>Email:</strong> <%= savedEmail %></p>
<%
} else {
%>
<p>Chưa có thông tin người dùng nào được lưu.</p>
<%
    }
%>
</body>
</html>
