package com.bookstore.service;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.bookstore.dao.BannerDao;
import com.bookstore.entity.Banner;

public class BannerService {
	
	private BannerDao bannerDao;
	private HttpServletRequest request;
	private HttpServletResponse response;
	
	public BannerService(HttpServletRequest request, HttpServletResponse response) {
		super();
		this.request = request;
		this.response = response;
		bannerDao = new BannerDao();
	}
	
	public void listBanner() throws ServletException, IOException {
		listBanner(null);
	}

	public void listBanner(String message) throws ServletException, IOException {
		List<Banner> listBanner = bannerDao.listAll();
		request.setAttribute("listBanner", listBanner);
		
		if (message != null) {
			request.setAttribute("message", message);
		}
		
		String listPage = "banner_list.jsp";
		RequestDispatcher requestDispatcher = request.getRequestDispatcher(listPage);
		requestDispatcher.forward(request, response);
		
	}

	public void showBannerForm() throws ServletException, IOException {
		String newPage = "banner_form.jsp";
		RequestDispatcher requestDispatcher = request.getRequestDispatcher(newPage);
		requestDispatcher.forward(request, response);
	}
	
	public void readBannerField(Banner banner) throws ServletException, IOException {
		Part part = request.getPart("bannerImage");

		if (part != null && part.getSize() > 0) {
			long size = part.getSize();
			byte[] imageBytes = new byte[(int) size];

			InputStream inputStream = part.getInputStream();
			inputStream.read(imageBytes);
			inputStream.close();

			banner.setImage(imageBytes);
		}
		
	}


	public void createBanner() throws ServletException, IOException {
		Banner newBanner = new Banner();
		readBannerField(newBanner);
		Banner createdBanner = bannerDao.create(newBanner);
		
		if (createdBanner.getBannerId() > 0) {
			String message = "A News has been created successfully.";
			listBanner(message);
		}
	}

	public void editBanner() throws ServletException, IOException {
		Integer bannerId = Integer.parseInt(request.getParameter("id"));
		Banner banner = bannerDao.get(bannerId);
		
		request.setAttribute("banner", banner);
		
		String editPage = "banner_form.jsp";
		RequestDispatcher requestDispatcher = request.getRequestDispatcher(editPage);
		requestDispatcher.forward(request, response);
	}

	public void updateBanner() throws ServletException, IOException {
		Integer bannerId = Integer.parseInt(request.getParameter("bannerId"));
		
		Banner exsitBanner = bannerDao.get(bannerId);
		
		readBannerField(exsitBanner);
		
		bannerDao.update(exsitBanner);
		
		String message = "The banner has been updated successfully.";
		listBanner(message);
	}

	public void deleteBanner() throws ServletException, IOException {
		Integer bannerId = Integer.parseInt(request.getParameter("id"));
		bannerDao.delete(bannerId);
		
		String message = "The banner has been deleted successfully.";
		listBanner(message);
	}
	
	
}
