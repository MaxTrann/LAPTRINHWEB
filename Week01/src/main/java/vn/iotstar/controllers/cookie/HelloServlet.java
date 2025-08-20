package vn.iotstar.controllers.cookie;

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


@WebServlet(urlPatterns = {"/hello", "/xin-chao"})
public class HelloServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html");
		PrintWriter printWriter = resp.getWriter();
		
		String name = "";
		
		// nhận cookie
		Cookie[] cookie = req.getCookies();
		for (Cookie c : cookie) {
			if (c.getName().equals("username")) {
				name = c.getValue();
			}
		}
		
		// Nếu không có cookie username -> quay lại trong login
		if (name.equals("")) {
			resp.sendRedirect(req.getContextPath() + "/login");
		} 
		// hiển thị lên trang bằng đối tượng PrintWriter()
		printWriter.println("Xin chao " + name);
				
	}
}
