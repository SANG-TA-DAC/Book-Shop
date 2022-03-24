package com.bookstore.service;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;

import com.bookstore.dao.BookDAO;
import com.bookstore.dao.CustomerDAO;
import com.bookstore.entity.Book;
import com.bookstore.entity.Customer;

public class CustomerService {
	private CustomerDAO customerDAO;
	private HttpServletRequest request;
	private HttpServletResponse response;
	
	public CustomerService(HttpServletRequest request, HttpServletResponse response) {
		super();
		this.request = request;
		this.response = response;
		this.customerDAO = new CustomerDAO();
	}
	
	public void listCustomer(String message) throws ServletException, IOException {
		List<Customer> listCustomer = customerDAO.listAll();
		
		if (message != null) {
			request.setAttribute("message", message);
		}
		
		request.setAttribute("listCustomer", listCustomer);
		
		String listPage = "customer_list.jsp";
		RequestDispatcher requestDispatcher = request.getRequestDispatcher(listPage);
		requestDispatcher.forward(request, response);
	}
	
	public void listCustomer() throws ServletException, IOException {
		listCustomer(null);
	}
	
	public void createCustomer() throws ServletException, IOException {
		String email = request.getParameter("email");
		Customer exitsCustomer = customerDAO.findByEmail(email);
		if (exitsCustomer != null) {
			String message = "Could not create customer: the email " 
				+ email + "is already registed by another customer.";
			listCustomer(message);
		}else {
			Customer newCustomer = new Customer();
			updateCustomerFieldsFromFrom(newCustomer);
			customerDAO.create(newCustomer);
			
			String message = "New customer has been created successfully";
			listCustomer(message);
		}
	}
	
	private void updateCustomerFieldsFromFrom(Customer customer) {
		String email = request.getParameter("email");
		String fullName = request.getParameter("fullName");
		String password = request.getParameter("password");
		String phone = request.getParameter("phone");
		String address = request.getParameter("address");
		String city = request.getParameter("city");
		String country = request.getParameter("country");
		String zipCode = request.getParameter("zipCode");
		
		if (email != null && !email.equals("")) {
			customer.setEmail(email);
		}
		
		if (password != null && !password.equals("")) {
			customer.setPassword(password);
		}
		
		customer.setFullname(fullName);
		customer.setPhone(phone);
		customer.setCity(city);
		customer.setCountry(country);
		customer.setZipcode(zipCode);
		customer.setAddress(address);
	}
	
	public void registerCustomer() throws ServletException, IOException {
		String email = request.getParameter("email");
		Customer exitsCustomer = customerDAO.findByEmail(email);
		String message = "";
		
		if (exitsCustomer != null) {
			 message = "Could not register. The email " 
				+ email + "is already registed by another customer.";
		}else {
			Customer newCustomer = new Customer();
			updateCustomerFieldsFromFrom(newCustomer);
			customerDAO.create(newCustomer);
			
			 message = "You have registered successfully.<br/>"
			 		+ "<a href = 'login' >Click here to login</a>";
		}
		String messagePage = "frontend/message.jsp";
		RequestDispatcher requestDispatcher = request.getRequestDispatcher(messagePage);
		request.setAttribute("message", message);
		requestDispatcher.forward(request, response);
	}
	
	public void editCustomer() throws ServletException, IOException {
		Integer customerId = Integer.parseInt(request.getParameter("id"));
		Customer customer = customerDAO.get(customerId);
		
		if (customer == null) {
				String message ="Could not find customer with ID " + customerId;
				CommonUtitlity.showMessageBackend(message, request, response);
		} else {
			request.setAttribute("customer", customer);		
			CommonUtitlity.forwardToPage("customer_form.jsp", request, response);		
		}
	}
	
	public void updateCustomer() throws ServletException, IOException {
		Integer customerId = Integer.parseInt(request.getParameter("customerId"));
		String email = request.getParameter("email");
		String message = null;
		Customer customerByEmail = customerDAO.findByEmail(email);
		
		if (customerByEmail != null && customerByEmail.getCustomerId() != customerId) {
			 message = "Could not update the customer ID " + customerId + 
					" because there's an existing customer having the same email.";
		} else {
			Customer customerById = customerDAO.get(customerId);
			updateCustomerFieldsFromFrom(customerById);
			customerDAO.update(customerById);
			
			 message = "The customer has been updated successfully.";
		}
			listCustomer(message);
	}
	
	public void deleteCustomer() throws ServletException, IOException {
		Integer customerId = Integer.parseInt(request.getParameter("id"));
		Customer customer = customerDAO.get(customerId);
		
		if (customer != null) {
		customerDAO.delete(customerId);
		String message = "The customer has been deleted successfully";
		listCustomer(message);
		} else {
			String message = "Could not find customer with ID " + customerId + ", "
					+ "or it has been deleted by another admin";
			CommonUtitlity.showMessageBackend(message, request, response);
		}
	}

	public void showLogin() throws ServletException, IOException {
		String loginPage = "frontend/login.jsp";
		RequestDispatcher requestDispatcher = request.getRequestDispatcher(loginPage);
		requestDispatcher.forward(request, response);
	}

	public void doLogin() throws ServletException, IOException {
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		
		Customer customer = customerDAO.checkLogin(email, password);
		
		if (customer == null) {
			String message = "Login fail, Please check your email and password.";
			request.setAttribute("message", message);
			showLogin();
		} else {
			HttpSession session = request.getSession();
			session.setAttribute("loggedCustomer", customer);
			
			Object objRedirectURL = session.getAttribute("redirectURL");
			
			if (objRedirectURL != null) {
				String redirectURL = (String) objRedirectURL;
				session.removeAttribute("redirectURL");
				response.sendRedirect(redirectURL);
			}else {
				showHomePage();
			}
		}
	}
	
	public void showCustomerProfile() throws ServletException, IOException {
		String profilePage = "frontend/customer_profile.jsp";
		RequestDispatcher requestDispatcher = request.getRequestDispatcher(profilePage);
		requestDispatcher.forward(request, response);
	}

	public void showCustomerProfileEditForm() throws ServletException, IOException {
		String editPage = "frontend/edit_profile.jsp";
		RequestDispatcher requestDispatcher = request.getRequestDispatcher(editPage);
		requestDispatcher.forward(request, response);
	}

	public void updateCustomerProfile() throws ServletException, IOException {
		Customer customer = (Customer) request.getSession().getAttribute("loggedCustomer");
		updateCustomerFieldsFromFrom(customer);
		customerDAO.update(customer);
		showCustomerProfile();
	}
	
	public void showHomePage() throws ServletException, IOException {
		BookDAO bookDAO = new BookDAO();
		
		List<Book> listNewBooks = bookDAO.listNewBook();
		
		request.setAttribute("listNewBooks", listNewBooks);
		
		String homepage = "frontend/index.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(homepage);
		dispatcher.forward(request, response);
	}
	
	
}
