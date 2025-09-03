package vn.maxtrann.controllers;

import java.io.File;
import java.io.IOException;
import java.util.List;

import org.apache.tomcat.util.http.fileupload.FileItem;
import org.apache.tomcat.util.http.fileupload.FileUploadException;
import org.apache.tomcat.util.http.fileupload.disk.DiskFileItemFactory;

import org.apache.commons.fileupload2.jakarta.JakartaServletFileUpload;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.maxtrann.constant.Constant;
import vn.maxtrann.models.Category;
import vn.maxtrann.services.CategoryService;
import vn.maxtrann.services.impl.CategoryServiceImpl;

@WebServlet(urlPatterns = { "/admin/category/add" })
public class CategoryAddController extends HttpServlet {

	private static final long serialVersionUID = 1L;
	CategoryService cateService = new CategoryServiceImpl();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		RequestDispatcher dispatcher = req.getRequestDispatcher("/views/add-category.jsp");
		dispatcher.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Category category = new Category();
		DiskFileItemFactory diskFileItemFactory = new DiskFileItemFactory();
		ServletFileUpload servletFileUpload = new ServletFileUpload(diskFileItemFactory);
		servletFileUpload.setHeaderEncoding("UTF-8");

		try {
		    resp.setContentType("text/html");
		    resp.setCharacterEncoding("UTF-8");
		    req.setCharacterEncoding("UTF-8");

		    List<FileItem> items = servletFileUpload.parseRequest(req);
		    for (FileItem item : items) {
		        if (item.getFieldName().equals("name")) {
		            category.setCatename(item.getString("UTF-8"));
		        } else if (item.getFieldName().equals("icon")) {
		            String originalFileName = item.getName();
		            int index = originalFileName.lastIndexOf(".");
		            String ext = originalFileName.substring(index + 1);
		            String fileName = System.currentTimeMillis() + "." + ext;

		            File file = new File(Constant.DIR + "/category/" + fileName);
		            item.write(file);
		            category.setIcon("category/" + fileName);
		        }
		    }

		    cateService.insert(category);
		    resp.sendRedirect(req.getContextPath() + "/admin/category/list");
		} catch (FileUploadException e) {
		    e.printStackTrace();
		} catch (Exception e) {
		    e.printStackTrace();
		}
	}
}
