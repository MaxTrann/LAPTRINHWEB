package vn.iotstar.controllers.session;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet(urlPatterns = {"/logout"})
public class LogoutServlet extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		// Lấy session hiện tại (nếu có)
		HttpSession session = req.getSession(false); // // false: không tạo mới nếu chưa có
		if (session != null) {
			session.invalidate(); // Hủy session
		}
		
		req.getRequestDispatcher("login-session.html").include(req, resp);
	}
	
}
