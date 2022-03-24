package com.bookstore.dao;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import java.util.List;

import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.junit.Test;

import com.bookstore.entity.Book;
import com.bookstore.entity.Customer;
import com.bookstore.entity.Review;

public class ReviewDAOTest {
	
	private static ReviewDAO reviewDao;

	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
		reviewDao = new ReviewDAO();
	}

	@AfterClass
	public static void tearDownAfterClass() throws Exception {
		reviewDao.close();
	}

	@Test
	public void testCreateReview() {
		Review review = new Review();
		
		Book book = new Book();
		book.setBookId(52);
		
		Customer customer = new Customer();
		customer.setCustomerId(15);
		
		review.setBook(book);
		review.setCustomer(customer);
		review.setHeadline(" Don�t buy this edition");
		review.setRating(1);
		review.setComment("Get 4th edition instead. 5th edition is so weird and there is no explanation of how everything works. Only implementation. "
				+ "In my opinion, 4th edition is a classic and great for anyone new to spring.");
		
		Review savedReview = reviewDao.create(review);
		
		assertTrue(savedReview.getReviewId() > 0);
	}

	@Test
	public void testGet() {
		Integer reviewId = 15;
		Review review = reviewDao.get(reviewId);
		
		assertNotNull(review);
	}
	
	@Test
	public void testUpdateReview() {
		Integer reviewId = 15;
		Review review = reviewDao.get(reviewId);
		review.setHeadline("Exellent book");
		
		Review updateReview = reviewDao.update(review);
		assertEquals(review.getHeadline(), updateReview.getHeadline());
	}

	@Test
	public void testDeleteReview() {
		int reviewId = 15;
		reviewDao.delete(reviewId);
		
		Review review = reviewDao.get(reviewId);
		assertNull(review);
	}

	@Test
	public void testListAll() {
		List<Review> listReview = reviewDao.listAll();
		
		for(Review review : listReview) {
			System.out.println(review.getReviewId() + " - " + review.getBook().getTitle()
					+ " - " + review.getCustomer().getFullname() 
					+ " - " + review.getHeadline() + " - " + review.getRating());
		}
		
		assertTrue(listReview.size() > 0);
	}

	@Test
	public void testCount() {
		long totalReviews = reviewDao.count();
		System.out.println("Total Review : " + totalReviews);
		assertTrue(totalReviews > 0);
	}
	
	@Test
	public void testFindByCustomerAndBookNotFound() {
		Integer customerId = 100;
		Integer bookId = 99;
		
		Review result = reviewDao.findByCustomerAndBook(customerId, bookId);
		
		assertNull(result);
	}
	
	@Test
	public void testFindByCustomerAndBookFound() {
		Integer customerId = 12;
		Integer bookId = 50;
		
		Review result = reviewDao.findByCustomerAndBook(customerId, bookId);
		
		assertNotNull(result);
	}

}
