package com.bookstore.controller.admin.contact;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bookstore.service.ContactService;

@WebServlet("/admin/view_contact")
public class ViewContactDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ViewContactDetailServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ContactService contactService = new ContactService(request, response);
		contactService.viewContactDetail();
	}

}
