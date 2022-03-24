package com.bookstore.service;

import java.io.IOException;
import java.io.InputStream;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.bookstore.dao.NewsDAO;
import com.bookstore.entity.News;

public class NewsService {
	private NewsDAO newsDAO;
	private HttpServletRequest request;
	private HttpServletResponse response;
	
	public NewsService(HttpServletRequest request, HttpServletResponse response) {
		super();
		this.request = request;
		this.response = response;
		newsDAO = new NewsDAO();
	}
	
	public void listNews() throws ServletException, IOException {
		listNews(null);
	}

	public void listNews(String message) throws ServletException, IOException {
		List<News> listNews = newsDAO.listAll();
		request.setAttribute("listNews", listNews);
		
		if (message != null) {
			request.setAttribute("message", message);
		}
		
		String listPage = "news_list.jsp";
		RequestDispatcher requestDispatcher = request.getRequestDispatcher(listPage);
		requestDispatcher.forward(request, response);
	}

	public void showNewsForm() throws ServletException, IOException {
		String newPage = "news_form.jsp";
		RequestDispatcher requestDispatcher = request.getRequestDispatcher(newPage);
		requestDispatcher.forward(request, response);
	}
	
	public void readNewsField(News news) throws ServletException, IOException {
		String title = request.getParameter("title");
		String author = request.getParameter("author");
		String content = request.getParameter("description");
		
		DateFormat dateFormat = new SimpleDateFormat("MM/dd/yyyy");
		Date publishDate = null;
		try {
			publishDate = dateFormat.parse(request.getParameter("publishDate"));
		} catch (ParseException ex) {
			ex.printStackTrace();
			throw new ServletException("error parsing publish date (format is MM/dd/yyyy)");
		}
		
		news.setTitle(title);
		news.setAuthor(author);
		news.setContent(content);
		news.setPublishDate(publishDate);
		
		Part part = request.getPart("newsImage");

		if (part != null && part.getSize() > 0) {
			long size = part.getSize();
			byte[] imageBytes = new byte[(int) size];

			InputStream inputStream = part.getInputStream();
			inputStream.read(imageBytes);
			inputStream.close();

			news.setImage(imageBytes);
		}
		
	}

	public void createNews() throws ServletException, IOException {
		String title = request.getParameter("title");
		
		News existNews = newsDAO.findByTitle(title);
		
		if (existNews != null) {
			String message = "Could not create News because the title | " + title + " | already exists!";
			listNews(message);
		}
		
		News newNews = new News();
		readNewsField(newNews);
		News createdNews = newsDAO.create(newNews);
		
		if (createdNews.getNewId() > 0) {
			String message = "A News has been created successfully.";
			listNews(message);
		}
	}

	public void editNews() throws ServletException, IOException {
		Integer newId = Integer.parseInt(request.getParameter("id"));
		News news = newsDAO.get(newId);
		
		request.setAttribute("news", news);
		
		String editPage = "news_form.jsp";
		RequestDispatcher requestDispatcher = request.getRequestDispatcher(editPage);
		requestDispatcher.forward(request, response);
		
	}

	public void updateNews() throws ServletException, IOException {
		Integer newId = Integer.parseInt(request.getParameter("newId"));
		String title = request.getParameter("title");
		
		News exsitNews = newsDAO.get(newId);
		News newsByTitle = newsDAO.findByTitle(title);
		
		if (newsByTitle != null && !exsitNews.equals(newsByTitle)) {
			String message = "Could not update News there's another blog having same title.";
			listNews(message);
			return;
		}
		
		readNewsField(exsitNews);
		
		newsDAO.update(exsitNews);
		
		String message = "The blog has been updated successfully.";
		listNews(message);
		
	}

	public void deleteNews() throws ServletException, IOException {
		Integer newId = Integer.parseInt(request.getParameter("id"));
		newsDAO.delete(newId);
		
		String message = "The blog has been deleted successfully.";
		listNews(message);
	}

	public void viewNewsDetail() throws ServletException, IOException {
		Integer newId = Integer.parseInt(request.getParameter("id"));
		News news = newsDAO.get(newId);
		List<News> listDetailNews = newsDAO.listDetailNews();
		
		request.setAttribute("listDetailNews", listDetailNews);
		request.setAttribute("news", news);
		
		String detailPage = "frontend/news_detail.jsp";
		RequestDispatcher requestDispatcher = request.getRequestDispatcher(detailPage);
		requestDispatcher.forward(request, response);
	}

	
	
	
	
	
	
	
	
}
