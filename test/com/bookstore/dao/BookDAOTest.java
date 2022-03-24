package com.bookstore.dao;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.persistence.EntityNotFoundException;

import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.junit.Test;

import com.bookstore.entity.Book;
import com.bookstore.entity.Category;

public class BookDAOTest  {
	private static BookDAO bookDAO;

	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
		bookDAO = new BookDAO();
	}

	@AfterClass
	public static void tearDownAfterClass() throws Exception {
		bookDAO.close();
	}

	@Test
	public void testCreateBook() throws ParseException, IOException {
		Book newBook = new Book();
		Category category = new Category("Advanced Java");
		category.setCategoryId(18);
		newBook.setCategory(category);
		newBook.setTitle("Effective Java (2nd Edition)");
		newBook.setAuthor("Joshua Bloch");
		newBook.setDescription("New coverage of generics, enums, annotations, autoboxing");
		newBook.setPrice(38.87f);
		newBook.setIsbn("0321356683");

		DateFormat dateFormat = new SimpleDateFormat("MM/dd/yyyy");
		Date publishDate = dateFormat.parse("05/28/2008");
		newBook.setPublishDate(publishDate);

		String imagePath = "C:\\Users\\Admin\\Downloads\\books\\Effective Java.jpg";
		byte[] imageBytes = Files.readAllBytes(Paths.get(imagePath));
		newBook.setImage(imageBytes);

		Book createdBook = bookDAO.create(newBook);

		assertTrue(createdBook.getBookId() > 0);
	}

	@Test
	public void testCreate2ndBook() throws ParseException, IOException {
		Book newBook = new Book();
		Category category = new Category("Core Java");
		category.setCategoryId(23);
		newBook.setCategory(category);
		newBook.setTitle("Java 8 in Action  ");
		newBook.setAuthor("Raoul-Gabriel Urma, Mario Fusco, Alan Mycroft");
		newBook.setDescription("The book covers lambdas, streams, and functional-style programming");
		newBook.setPrice(36.72f);
		newBook.setIsbn("1617291994");

		DateFormat dateFormat = new SimpleDateFormat("MM/dd/yyyy");
		Date publishDate = dateFormat.parse("08/28/2014");
		newBook.setPublishDate(publishDate);

		String imagePath = "C:\\Users\\Admin\\Downloads\\books\\Java 8 in Action.jpg";
		byte[] imageBytes = Files.readAllBytes(Paths.get(imagePath));
		newBook.setImage(imageBytes);

		Book createdBook = bookDAO.create(newBook);

		assertTrue(createdBook.getBookId() > 0);
	}

	@Test
	public void testUpdateBook() throws ParseException, IOException {
		Book existBook = new Book();

		existBook.setBookId(32);

		Category category = new Category("Spring Boot");
		category.setCategoryId(21);
		existBook.setCategory(category);
		existBook.setTitle("Effective Java (3rd Edition)");
		existBook.setAuthor("Joshua Bloch");
		existBook.setDescription("New coverage of generics, enums, annotations, autoboxing");
		existBook.setPrice(40f);
		existBook.setIsbn("0321356683");

		DateFormat dateFormat = new SimpleDateFormat("MM/dd/yyyy");
		Date publishDate = dateFormat.parse("05/28/2008");
		existBook.setPublishDate(publishDate);

		String imagePath = "C:\\Users\\Admin\\Downloads\\books\\Effective Java.jpg";
		byte[] imageBytes = Files.readAllBytes(Paths.get(imagePath));
		existBook.setImage(imageBytes);

		Book updatedBook = bookDAO.update(existBook);
		assertEquals(updatedBook.getTitle(), "Effective Java (3rd Edition)");
	}

	@Test()
	public void testGetBookFail() {
		Integer bookId = 69;
		Book book = bookDAO.get(bookId);
		assertNull(book);
	}

	@Test()
	public void testGetBookSuccess() {
		Integer bookId = 33;
		Book book = bookDAO.get(bookId);
		assertNotNull(book);
	}

	@Test(expected = EntityNotFoundException.class)
	public void testDeleteBookFail() {
		Integer bookId = 100;
		bookDAO.delete(bookId);
	}

	@Test()
	public void testDeleteBookSuccess() {
		Integer bookId = 32;
		bookDAO.delete(bookId);
		assertTrue(true);
	}

	@Test
	public void testListNewBook() {
		List<Book> listNewBooks = bookDAO.listNewBook();
		for(Book abook : listNewBooks) {
			System.out.println(abook.getTitle() + " " + abook.getPublishDate());
		}
		assertEquals(4, listNewBooks.size());
	}
	
	@Test
	public void testSearchBookInTitle() {
		String keyword = "Java";
		List<Book> result = bookDAO.search(keyword);
		for(Book aBook : result) {
			System.out.println(aBook.getTitle());
		}
		assertEquals(8, result.size());
	}
	
	@Test
	public void testSearchBookInAuthor() {
		String keyword = "Cay Horstmann";
		List<Book> result = bookDAO.search(keyword);
		for(Book aBook : result) {
			System.out.println(aBook.getAuthor());
		}
		assertEquals(2, result.size());
	}
	
	@Test
	public void testSearchBookInDescription() {
		String keyword = "SCWCD";
		List<Book> result = bookDAO.search(keyword);
		for(Book aBook : result) {
			System.out.println(aBook.getDescription());
		}
		assertEquals(1, result.size());
	}

	@Test
	public void testListByCategory() {
		int categoryId = 32;
		List<Book> listBooks = bookDAO.listByCategory(categoryId);
		assertTrue(listBooks.size() > 0);
	}

	@Test
	public void testListAll() {
		List<Book> listBooks = bookDAO.listAll();
		for (Book aBook : listBooks) {
			System.out.println(aBook.getTitle() + "-" + aBook.getAuthor());
		}
		assertFalse(listBooks.isEmpty());
	}

	@Test
	public void testFindByTitleNotExist() {
		String title = "Thinkin in Java";
		Book book = bookDAO.findByTitle(title);
		assertNull(book);
	}

	@Test
	public void testFindByTitleExist() {
		String title = "Java 8 in Action  ";
		Book book = bookDAO.findByTitle(title);
		System.out.println(book.getAuthor());
		System.out.println(book.getPrice());
		assertNotNull(book);
	}

	@Test
	public void testCount() {
		long totalBooks = bookDAO.count();
		assertEquals(2, totalBooks);
	}

	@Test
	public void testCountByCategory() {
		int categoryId = 13;
		long numOfBooks = bookDAO.countByCategory(categoryId);
		
		assertTrue(numOfBooks == 6);
		
		
	}
}
