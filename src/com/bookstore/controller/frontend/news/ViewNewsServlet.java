package com.bookstore.controller.frontend.news;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bookstore.dao.NewsDAO;
import com.bookstore.entity.News;

@WebServlet("/view_news")
public class ViewNewsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ViewNewsServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		NewsDAO newsDAO = new NewsDAO();
		
		List<News> listNews = newsDAO.listNewNews();
		
		request.setAttribute("listNews", listNews);
		
		String newsPage = "frontend/news.jsp";
		RequestDispatcher requestDispatcher = request.getRequestDispatcher(newsPage);
		requestDispatcher.forward(request, response);
	}

}
