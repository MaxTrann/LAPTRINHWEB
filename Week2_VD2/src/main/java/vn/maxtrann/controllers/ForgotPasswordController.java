package vn.maxtrann.controllers;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.maxtrann.services.UserService;
import vn.maxtrann.services.impl.UserServiceImpl;

@WebServlet(urlPatterns = "/forgot-password")
public class ForgotPasswordController extends HttpServlet {

	private static final long serialVersionUID = 1L;
	private final UserService userService = new UserServiceImpl();
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/views/forgot-password.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String username = req.getParameter("username");

		if (userService.existsByUsername(username)) {
			req.setAttribute("username", username);
			req.getRequestDispatcher("/views/reset-password.jsp").forward(req, resp);
		} else {
			req.setAttribute("alert", "Tài khoản không tồn tại!");
			req.getRequestDispatcher("/views/forgot-password.jsp").forward(req, resp);
		}
	}
}
