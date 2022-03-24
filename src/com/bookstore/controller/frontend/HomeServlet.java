package com.bookstore.controller.frontend;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bookstore.dao.BannerDao;
import com.bookstore.dao.BookDAO;
import com.bookstore.dao.NewsDAO;
import com.bookstore.entity.Banner;
import com.bookstore.entity.Book;
import com.bookstore.entity.News;

@WebServlet("")
public class HomeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public HomeServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		BookDAO bookDAO = new BookDAO();
		NewsDAO newsDAO = new NewsDAO();
		BannerDao bannerDao = new BannerDao();

		List<Banner> listBanner = bannerDao.listAll();

		List<News> listIndexNews = newsDAO.listIndexNews();

		List<Book> listNewBooks = bookDAO.listNewBook();

		request.setAttribute("listNewBooks", listNewBooks);
		request.setAttribute("listIndexNews", listIndexNews);
		request.setAttribute("listBanner", listBanner);

		String homepage = "frontend/index.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(homepage);
		dispatcher.forward(request, response);
	}

}
