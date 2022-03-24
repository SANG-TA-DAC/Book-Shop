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

import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.junit.Test;

import com.bookstore.entity.News;

public class NewsDAOTest {
	private static NewsDAO newsDao;

	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
		newsDao = new NewsDAO();
	}

	@AfterClass
	public static void tearDownAfterClass() throws Exception {
		newsDao.close();
	}

	@Test
	public void testCreateNews() throws ParseException, IOException {
		News newNews = new News();
		newNews.setAuthor("Ta Dac Sang");
		newNews.setTitle("Nhung cuon sach ban chay nhat");
		newNews.setContent("Hom nay chung toi se tong hop tat ca nhung cuon sach ban chay nhat the gioi");
		
		DateFormat dateFormat = new SimpleDateFormat("MM/dd/yyyy");
		Date publishDate = dateFormat.parse("09/14/2021");
		newNews.setPublishDate(publishDate);
		
		String imagePath = "C:\\Users\\dongi\\Desktop\\Book 01 - Effective Java.jpg";
		byte[] imageBytes = Files.readAllBytes(Paths.get(imagePath));
		newNews.setImage(imageBytes);
		
		News createdNews = newsDao.create(newNews);
		
		assertTrue(createdNews.getNewId() > 0);
		
	}
	
	@Test
	public void testUpdateNews() throws ParseException, IOException {
		News existNews = new News();
		
		existNews.setNewId(1);
		
		existNews.setAuthor("Phan Quynh Anh");
		existNews.setTitle("Nhung cuon sach ban chay nhat");
		existNews.setContent("Xin chao tat ca cac ban");
		
		DateFormat dateFormat = new SimpleDateFormat("MM/dd/yyyy");
		Date publishDate = dateFormat.parse("09/14/2021");
		existNews.setPublishDate(publishDate);
		
		String imagePath = "C:\\Users\\dongi\\Desktop\\Book 01 - Effective Java.jpg";
		byte[] imageBytes = Files.readAllBytes(Paths.get(imagePath));
		existNews.setImage(imageBytes);
		
		News updatedNews = newsDao.update(existNews);
		assertEquals(updatedNews.getAuthor(), "Phan Quynh Anh");
	}
	
	@Test
	public void testGet() {
		Integer newId = 1;
		News news = newsDao.get(newId);
		assertNotNull(news);
	}

	@Test
	public void testDeleteObject() {
		Integer newId = 1;
		newsDao.delete(newId);
		assertTrue(true);
	}

	@Test
	public void testListAll() {
		List<News> listNews = newsDao.listAll();
		for(News aNews : listNews) {
			System.out.println(aNews.getAuthor() + "-" + aNews.getTitle());
		}
		assertFalse(listNews.isEmpty());
	}
	
	@Test
	public void testFindByTitleNotExist() {
		String title = "Thank you";
		News news = newsDao.findByTitle(title);
		assertNull(news);
	}
	
	@Test
	public void testFindByTitleExist() {
		String title = "Nhung cuon sach ban chay nhat";
		News news = newsDao.findByTitle(title);
		
		System.out.println(news.getAuthor());
		System.out.println(news.getContent());
		
		assertNotNull(news);
		
	}

}
