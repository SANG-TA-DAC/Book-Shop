package com.bookstore.controller.admin.news;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bookstore.service.NewsService;

@WebServlet("/admin/create_news")
@MultipartConfig(
		fileSizeThreshold = 10 * 1024 * 1024, // 10mb
	    maxFileSize = 50 * 1024 * 1024, // 50mb
	    maxRequestSize = 100 * 1024 * 1024 // 100 mb
)
public class CreateNewsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public CreateNewsServlet() {
		super();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		NewsService newsService = new NewsService(request, response);
		newsService.createNews();
	}

}
