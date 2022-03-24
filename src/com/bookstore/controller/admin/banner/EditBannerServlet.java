package com.bookstore.controller.admin.banner;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bookstore.service.BannerService;

@WebServlet("/admin/edit_banner")
public class EditBannerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public EditBannerServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		BannerService bannerService = new BannerService(request, response);
		bannerService.editBanner();
	}

}
