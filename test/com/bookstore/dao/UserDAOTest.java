package com.bookstore.dao;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import java.util.List;

import javax.persistence.EntityNotFoundException;
import javax.persistence.PersistenceException;

import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.junit.Test;

import com.bookstore.entity.Users;

public class UserDAOTest {

	private static UserDAO userDAO;

	@BeforeClass
	public static void setUpClass() throws Exception {

		userDAO = new UserDAO();
	}

	@Test
	public void testCreateUsers() {
		Users user1 = new Users();
		user1.setEmail("ronando@gmail.com");
		user1.setFullName("Ronando");
		user1.setPassword("opdfopsdif");

		user1 = userDAO.create(user1);

		assertTrue(user1.getUserId() > 0);

	}

	@Test(expected = PersistenceException.class)
	public void testCreateUsersFieldsNotSet() {
		Users user1 = new Users();

		user1 = userDAO.create(user1);

	}

	@Test
	public void testUpdateUsers() {
		Users user = new Users();
		user.setUserId(59);
		user.setEmail("david@gmail.com");
		user.setFullName("David Beckham");
		user.setPassword("sangvjp5");

		user = userDAO.update(user);
		assertEquals("sangvjp5", user.getPassword());
	}

	@Test
	public void testGetUsersFound() {
		Integer userId = 60;
		Users user = userDAO.get(userId);
		if (user != null) {
			System.out.println(user.getEmail());
		}
		assertNotNull(user);
	}

	@Test
	public void testGetUsersNotFound() {
		Integer userId = 99;
		Users user = userDAO.get(userId);
		assertNull(user);
	}

	@Test
	public void testDeleteUser() {
		Integer userId = 59;
		userDAO.delete(userId);
		Users user = userDAO.get(userId);
		assertNull(user);
	}

	@Test(expected = EntityNotFoundException.class)
	public void testDeleteNonExistUsers() {
		Integer userId = 59;
		userDAO.delete(userId);
	}

	@Test
	public void testListAll() {
		List<Users> listUsers = userDAO.listAll();
		for (Users user : listUsers) {
			System.out.println(user.getEmail());
		}
		assertTrue(listUsers.size() > 0);
	}

	@Test
	public void testCount() {
		long totalUsers = userDAO.count();
		assertEquals(11, totalUsers);
	}

	@Test
	public void testCheckLoginSuccess() {
		String email = "admin@gmail.com";
		String password = "43857d";
		boolean loginResult = userDAO.checkLogin(email, password);
		assertTrue(loginResult);
	}
	
	@Test
	public void testCheckLoginFailed() {
		String email = "admin@gmail.com";
		String password = "4385d";
		boolean loginResult = userDAO.checkLogin(email, password);
		assertFalse(loginResult);
	}
	
	@Test
	public void testFindByEmail() {
		String email = "admin@gmail.com";
		Users users = userDAO.findByEmail(email);
		assertNotNull(users);
	}

	@AfterClass
	public static void tearDownClass() throws Exception {
		userDAO.close();
	}
}
