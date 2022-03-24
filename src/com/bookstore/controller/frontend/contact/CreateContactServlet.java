package com.bookstore.controller.frontend.contact;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bookstore.service.ContactService;

@WebServlet("/create_contact")
public class CreateContactServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public CreateContactServlet() {
		super();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ContactService contactService = new ContactService(request, response);
		contactService.createContact();
	}

}
