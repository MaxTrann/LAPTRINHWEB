package vn.maxtrann.controllers;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.maxtrann.services.UserService;
import vn.maxtrann.services.impl.UserServiceImpl;

@WebServlet(urlPatterns = "/reset-password")
public class ResetPasswordController extends HttpServlet {

	private static final long serialVersionUID = 1L;
	private final UserService userService = new UserServiceImpl();

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String username = req.getParameter("username");
		String newPassword = req.getParameter("newPassword");

		boolean ok = userService.updatePasswordByUsername(username, newPassword);
		if (ok) {
			resp.sendRedirect(req.getContextPath() + "/login?msg=reset_success");
		} else {
			req.setAttribute("alert", "Cập nhật mật khẩu thất bại!");
			req.setAttribute("username", username);
			req.getRequestDispatcher("/views/reset-password.jsp").forward(req, resp);
		}
	}
}
