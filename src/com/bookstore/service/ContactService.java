package com.bookstore.service;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bookstore.dao.ContactDAO;
import com.bookstore.entity.Contact;

public class ContactService {
	private ContactDAO contactDAO;
	private HttpServletRequest request;
	private HttpServletResponse response;
	
	public ContactService(HttpServletRequest request, HttpServletResponse response) {
		super();
		this.request = request;
		this.response = response;
		this.contactDAO = new ContactDAO();
	}
	
	public void listContact() throws ServletException, IOException {
		listContact(null);
	}

	public void listContact(String message) throws ServletException, IOException {
		List<Contact> listContact = contactDAO.listAll();
		
		if (message != null) {
			request.setAttribute("message", message);
		}
		
		request.setAttribute("listContact", listContact);
		
		String listPage = "contact_list.jsp";
		RequestDispatcher requestDispatcher = request.getRequestDispatcher(listPage);
		requestDispatcher.forward(request, response);
		
	}

	public void viewContactDetail() throws ServletException, IOException {
		int contactId = Integer.parseInt(request.getParameter("id"));
		
		Contact contact = contactDAO.get(contactId);
		request.setAttribute("contact", contact);
		
		String detailPage = "contact_detail.jsp";
		RequestDispatcher requestDispatcher = request.getRequestDispatcher(detailPage);
		requestDispatcher.forward(request, response);
	}

	public void deleteContact() throws ServletException, IOException {
		Integer contactId = Integer.parseInt(request.getParameter("id"));
		contactDAO.delete(contactId);
		
		String message = "The contact has been deleted successfully.";
		listContact(message);
	}
	
	private void updateContactFieldsFromFrom(Contact contact) {
		String email = request.getParameter("email");
		String name = request.getParameter("name");
		String title = request.getParameter("title");
		String description = request.getParameter("description");
		
		contact.setEmail(email);
		contact.setName(name);
		contact.setTitle(title);
		contact.setDescription(description);
	}

	public void createContact() throws ServletException, IOException {
		String message = "";
		Contact newContact = new Contact();
		updateContactFieldsFromFrom(newContact);
		contactDAO.create(newContact);
		message = "Thank you for your contact";
		String messagePage = "frontend/message.jsp";
		RequestDispatcher requestDispatcher = request.getRequestDispatcher(messagePage);
		request.setAttribute("message", message);
		requestDispatcher.forward(request, response);
	}
	
	
	
	
}
