package vn.maxtrann.controller.admin;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.maxtrann.entity.Video;
import vn.maxtrann.service.VideoService;
import vn.maxtrann.service.impl.VideoServiceImpl;

@WebServlet(urlPatterns = { "/admin/videos", "/admin/video/add", "/admin/video/edit", "/admin/video/delete", 
		"/admin/video/insert", "/admin/video/update", "/admin/video/search" })
public class VideoController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	VideoService videoService = new VideoServiceImpl();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String url = req.getRequestURI();
		req.setCharacterEncoding("UTF-8");

		if (url.contains("add")) {
			// Hiển thị form thêm video
			RequestDispatcher dispatcher = req.getRequestDispatcher("/views/admin/add-video.jsp");
			dispatcher.forward(req, resp);
		} else if (url.contains("edit")) {
			// Hiển thị form sửa video
			String idParam = req.getParameter("id");
			int id = Integer.parseInt(idParam);
			Video video = videoService.getIdVideo(id);
			req.setAttribute("video", video);
			RequestDispatcher dispatcher = req.getRequestDispatcher("/views/admin/edit-video.jsp");
			dispatcher.forward(req, resp);
		} else if (url.contains("search")) {
			// Hiển thị trang tìm kiếm
			String keyword = req.getParameter("keyword");
			if (keyword != null && !keyword.trim().isEmpty()) {
				List<Video> searchResults = videoService.search(keyword);
				req.setAttribute("videos", searchResults);
				req.setAttribute("keyword", keyword);
			}
			RequestDispatcher dispatcher = req.getRequestDispatcher("/views/admin/search-video.jsp");
			dispatcher.forward(req, resp);
		} else if (url.contains("delete")) {
			// Xóa video
			String idParam = req.getParameter("id");
			int id = Integer.parseInt(idParam);
			try {
				videoService.delete(id);
				req.setAttribute("message", "Xóa thành công!");
			} catch (Exception e) {
				req.setAttribute("error", "Xóa thất bại!");
			}
			resp.sendRedirect(req.getContextPath() + "/admin/videos");
		} else {
			// Hiển thị danh sách videos
			List<Video> videoList = videoService.getAll();
			req.setAttribute("videos", videoList);
			RequestDispatcher dispatcher = req.getRequestDispatcher("/views/admin/list-video.jsp");
			dispatcher.forward(req, resp);
		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String url = req.getRequestURI();
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");

		if (url.contains("insert")) {
			// Thêm mới video
			insertVideo(req, resp);
		} else if (url.contains("update")) {
			// Cập nhật video
			updateVideo(req, resp);
		}
	}

	private void insertVideo(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			Video video = new Video();
			video.setTitle(req.getParameter("title"));
			video.setLink(req.getParameter("link"));

			videoService.insert(video);
			resp.sendRedirect(req.getContextPath() + "/admin/videos");
		} catch (Exception e) {
			req.setAttribute("error", "Thêm mới thất bại!");
			RequestDispatcher dispatcher = req.getRequestDispatcher("/views/admin/add-video.jsp");
			dispatcher.forward(req, resp);
		}
	}

	private void updateVideo(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int id = Integer.parseInt(req.getParameter("id"));
			Video video = videoService.getIdVideo(id);
			video.setTitle(req.getParameter("title"));
			video.setLink(req.getParameter("link"));

			videoService.edit(video);
			resp.sendRedirect(req.getContextPath() + "/admin/videos");
		} catch (Exception e) {
			req.setAttribute("error", "Cập nhật thất bại!");
			RequestDispatcher dispatcher = req.getRequestDispatcher("/views/admin/edit-video.jsp");
			dispatcher.forward(req, resp);
		}
	}	
}
