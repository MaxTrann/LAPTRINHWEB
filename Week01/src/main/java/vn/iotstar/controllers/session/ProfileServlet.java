package vn.iotstar.controllers.session;

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


@WebServlet(urlPatterns = {"/profile"})
public class ProfileServlet extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html");
		PrintWriter out = resp.getWriter();
		
		HttpSession session = req.getSession(false); // khong tao moi
		if (session != null) {
			String name = (String)session.getAttribute("name");
			out.print("Chào bạn, "+name+" đến với trang quản lý tài khoản");
		}
		else {
			out.print("Xin vui lòng đăng nhập");
			resp.sendRedirect(req.getContextPath() + "/login-session.html");
		}
	}
}
