package com.bookstore.controller.frontend.news;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bookstore.service.NewsService;

@WebServlet("/view_newsdt")
public class ViewDetailNewsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ViewDetailNewsServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		NewsService newsService = new NewsService(request, response);
		newsService.viewNewsDetail();
	}

}
