package com.bookstore.dao;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.junit.Test;

import com.bookstore.entity.Book;
import com.bookstore.entity.BookOrder;
import com.bookstore.entity.Customer;
import com.bookstore.entity.OrderDetail;

public class OrderDAOTest {
	private static OrderDAO orderDAO;

	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
		orderDAO = new OrderDAO();
	}

	@AfterClass
	public static void tearDownAfterClass() throws Exception {
		orderDAO.close();
	}

	@Test
	public void testCreateBookOrder() {
		BookOrder order = new BookOrder();
		Customer customer = new Customer();
		customer.setCustomerId(12);

		order.setCustomer(customer);
		order.setRecipientName("Ta Dac Sang");
		order.setRecipientPhone("0986776507");
		order.setShippingAddress("86 mieu dam, nam tu liem, ha noi");

		Set<OrderDetail> orderDetails = new HashSet<>();
		OrderDetail orderDetail = new OrderDetail();

		Book book = new Book(50);
		orderDetail.setBook(book);
		orderDetail.setQuantity(2);
		orderDetail.setSubtotal(73.44f);
		orderDetail.setBookOrder(order);

		orderDetails.add(orderDetail);

		order.setOrderDetails(orderDetails);

		orderDAO.create(order);

		assertTrue(order.getOrderId() > 0);
	}

	@Test
	public void testCreateBookOrder2() {
		BookOrder order = new BookOrder();
		Customer customer = new Customer();
		customer.setCustomerId(15);

		order.setCustomer(customer);
		order.setRecipientName("Nguyen Thi Thao");
		order.setRecipientPhone("0123456789");
		order.setShippingAddress("58 xom ngang, phuong dai mo");

		Set<OrderDetail> orderDetails = new HashSet<>();

		OrderDetail orderDetail1 = new OrderDetail();
		Book book1 = new Book(51);
		orderDetail1.setBook(book1);
		orderDetail1.setQuantity(1);
		orderDetail1.setSubtotal(84.44f);
		orderDetail1.setBookOrder(order);

		orderDetails.add(orderDetail1);

		OrderDetail orderDetail2 = new OrderDetail();
		Book book2 = new Book(52);
		orderDetail2.setBook(book2);
		orderDetail2.setQuantity(2);
		orderDetail2.setSubtotal(23.98f);
		orderDetail2.setBookOrder(order);

		orderDetails.add(orderDetail2);

		order.setOrderDetails(orderDetails);

		orderDAO.create(order);

		assertTrue(order.getOrderId() > 0 && order.getOrderDetails().size() == 2);
	}

	@Test
	public void testUpdateBookOrderShippingAddress() {
		Integer orderId = 26;
		BookOrder order = orderDAO.get(orderId);
		order.setShippingAddress("A New Shipping Address");

		orderDAO.update(order);

		BookOrder updatedOrder = orderDAO.get(orderId);

		assertEquals(order.getShippingAddress(), updatedOrder.getShippingAddress());
	}

	@Test
	public void testUpdateBookOrderDetail() {
		Integer orderId = 26;
		BookOrder order = orderDAO.get(orderId);

		Iterator<OrderDetail> iterator = order.getOrderDetails().iterator();

		while (iterator.hasNext()) {
			OrderDetail orderDetail = iterator.next();
			if (orderDetail.getBook().getBookId() == 50) {
				orderDetail.setQuantity(10);
				orderDetail.setSubtotal(150);
			}
		}

		orderDAO.update(order);

		BookOrder updatedOrder = orderDAO.get(orderId);

		iterator = order.getOrderDetails().iterator();
		
		int expectedQuantity = 10;
		float expectedSubtotal = 150;
		int actualQuantity = 0;
		float actualSubtotal = 0;
		
		while (iterator.hasNext()) {
			OrderDetail orderDetail = iterator.next();
			if (orderDetail.getBook().getBookId() == 50) {
				actualQuantity = orderDetail.getQuantity();
				actualSubtotal = orderDetail.getSubtotal();
			}
		}

		assertEquals(expectedQuantity,actualQuantity);
		assertEquals(expectedSubtotal,actualSubtotal, 0.0f);
	}

	@Test
	public void testGet() {
		Integer orderId = 26;
		BookOrder order = orderDAO.get(orderId);
		System.out.println(order.getRecipientName());
		System.out.println(order.getRecipientPhone());
		System.out.println(order.getShippingAddress());
		System.out.println(order.getStatus());
		System.out.println(order.getTotal());
		System.out.println(order.getPaymentMethod());

		assertEquals(1, order.getOrderDetails().size());
	}
	
	@Test
	public void testGetByIdAndCustomerNull() {
		Integer orderId = 10;
		Integer customerId = 99;
		
		BookOrder order = orderDAO.get(orderId, customerId);
		
		assertNull(order);
	}
	
	@Test
	public void testGetByIdAndCustomerNotNull() {
		Integer orderId = 33;
		Integer customerId = 12;
		
		BookOrder order = orderDAO.get(orderId, customerId);
		
		assertNotNull(order);
	}

	@Test
	public void testDeleteOrder() {
		int orderId = 27;
		orderDAO.delete(orderId);
		
		BookOrder order = orderDAO.get(orderId);
		
		assertNull(order);
	}

	@Test
	public void testListAll() {
		List<BookOrder> listOrders = orderDAO.listAll();

		for (BookOrder order : listOrders) {
			System.out.println(order.getOrderId() + " - " + order.getCustomer().getFullname() + " - " + order.getTotal()
					+ " - " + order.getStatus());
			for (OrderDetail detail : order.getOrderDetails()) {
				Book book = detail.getBook();
				int quantity = detail.getQuantity();
				float subtotal = detail.getSubtotal();
				System.out.println("\t" + book.getTitle() + " - " + quantity + " - " + subtotal);
			}
		}

		assertTrue(listOrders.size() > 0);
	}
	
	@Test
	public void testListByCustomerNoOrder() {
		Integer customerId = 99;
		List<BookOrder> listOrders = orderDAO.listByCustomer(customerId);
		
		assertTrue(listOrders.isEmpty());
	}
	
	@Test
	public void testListByCustomerHaveOrder() {
		Integer customerId = 12;
		List<BookOrder> listOrders = orderDAO.listByCustomer(customerId);
		
		assertTrue(listOrders.size() > 0);
	}

	@Test
	public void testCount() {
		long totalOrders = orderDAO.count();
		assertEquals(2, totalOrders);
	}

}
