package vn.maxtrann.controllers;

import java.io.File;


import java.io.IOException;
import java.nio.file.Paths;


import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import vn.maxtrann.constant.ConstrantCategory;
import vn.maxtrann.models.Category;
import vn.maxtrann.services.CategoryService;
import vn.maxtrann.services.impl.CategoryServiceImpl;


@WebServlet(urlPatterns = { "/admin/category/add" })
@MultipartConfig
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
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");

		Category category = new Category();
		category.setCatename(req.getParameter("name"));

		// Xử lý upload file icon
		Part filePart = req.getPart("icon"); // name="icon" trong form
		if (filePart != null && filePart.getSize() > 0) {
			String originalFileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
			String ext = originalFileName.substring(originalFileName.lastIndexOf(".") + 1);
			String newFileName = System.currentTimeMillis() + "." + ext;

			File uploadFile = new File(ConstrantCategory.DIR + "/category/" + newFileName);
			uploadFile.getParentFile().mkdirs();
			filePart.write(uploadFile.getAbsolutePath());

			category.setIcon("category/" + newFileName);
		}

		cateService.insert(category);
		resp.sendRedirect(req.getContextPath() + "/admin/category/list");
	}
}
