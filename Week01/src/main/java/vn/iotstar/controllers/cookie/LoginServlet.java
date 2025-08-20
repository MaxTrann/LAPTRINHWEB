package vn.iotstar.controllers.cookie;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = {"/login"})
public class LoginServlet extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// KHi gọi GET ./login -> mở lại form login
		resp.sendRedirect(req.getContextPath() + "/login-cookie.html");
	}
	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html");
		
		// lấy dữ liệu từ tham số của form
		String user = req.getParameter("username");
		String pass = req.getParameter("password");
		
		if (user.equals("dai") && pass.equals("2704")) {
			// Khởi tạo cookie với tên "username" và giá trị là user
			Cookie cookie = new Cookie("username", user);
			
			// Thiết lập thời gian tồn tại của cookie là 30s
			cookie.setMaxAge(30);
			
			// Thêm cookie vào response để gửi về client
			resp.addCookie(cookie);
			
			// Chuyển hướng sang trang
			resp.sendRedirect(req.getContextPath() + "/hello");
		} else {
			// Nếu sai user hoặc pass thì quay lại trang LoginServlet
			resp.sendRedirect(req.getContextPath() + "/login");
		}
	}
}
