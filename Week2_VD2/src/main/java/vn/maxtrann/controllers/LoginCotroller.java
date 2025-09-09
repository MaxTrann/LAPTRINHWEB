package vn.maxtrann.controllers;

import java.io.IOException;



import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import vn.maxtrann.models.UserModel;
import vn.maxtrann.services.UserService;
import vn.maxtrann.services.impl.UserServiceImpl;

@WebServlet(urlPatterns = "/login")
public class LoginCotroller extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private final UserService userService = new UserServiceImpl();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String msg = req.getParameter("msg");
		if ("logout_success".equals(msg)) {
			req.setAttribute("alert", "Bạn đã đăng xuất thành công");
		} else if ("reset_success".equals(msg)) {
			req.setAttribute("alert", "Đặt lại mật khẩu thành công. Vui lòng đăng nhập lại");
		}
		req.getRequestDispatcher("/index.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String username = req.getParameter("username");
		String password = req.getParameter("password");
		
		// debug tạm
        System.out.println("[LOGIN] username=" + username + ", password=" + password);
        
		UserModel u = userService.authenticate(username, password);
		if (u != null) {
			HttpSession session = req.getSession();
			session.setAttribute("currentUser", u.getUserName());
			resp.sendRedirect(req.getContextPath() + "/views/admin/list-category.jsp");
		} else {
			req.setAttribute("alert", "Sai tên đăng nhập hoặc mật khẩu!");
			req.getRequestDispatcher("/index.jsp").forward(req, resp);
		}
	}
}
