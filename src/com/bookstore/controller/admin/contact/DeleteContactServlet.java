package com.bookstore.controller.admin.contact;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bookstore.service.ContactService;

@WebServlet("/admin/delete_contact")
public class DeleteContactServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public DeleteContactServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ContactService contactService = new ContactService(request, response);
		contactService.deleteContact();
	}

}
