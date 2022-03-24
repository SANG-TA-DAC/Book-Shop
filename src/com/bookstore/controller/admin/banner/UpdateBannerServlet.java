package com.bookstore.controller.admin.banner;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bookstore.service.BannerService;

@WebServlet("/admin/update_banner")
@MultipartConfig(
		fileSizeThreshold = 10 * 1024 * 1024, // 10mb
	    maxFileSize = 50 * 1024 * 1024, // 50mb
	    maxRequestSize = 100 * 1024 * 1024 // 100 mb
)
public class UpdateBannerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public UpdateBannerServlet() {
		super();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		BannerService bannerService = new BannerService(request, response);
		bannerService.updateBanner();
	}

}
