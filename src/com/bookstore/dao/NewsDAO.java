package com.bookstore.dao;

import java.util.List;

import com.bookstore.entity.News;

public class NewsDAO extends JpaDAO<News> implements GenericDAO<News> {
	
	public News create(News news) {
		return super.create(news);
	}
	
	public News update(News news) {
		return super.update(news);
	}

	@Override
	public News get(Object newId) {
		return super.find(News.class, newId);
	}

	@Override
	public void delete(Object newId) {
		super.delete(News.class, newId);
	}

	@Override
	public List<News> listAll() {
		return super.findWithNamedQuery("News.findAll");
	}
	
	public News findByTitle(String title) {
		List<News> result = super.findWithNamedQuery("News.findByTitle", "title", title);
		if (!result.isEmpty()) {
			return result.get(0);
		}
		return null;
	}
	
	public List<News> listNewNews(){
		return super.findWithNamedQuery("News.listNew",0,6);
	}
	
	public List<News> listDetailNews(){
		return super.findWithNamedQuery("News.listNew",0,5);
	}
	
	public List<News> listIndexNews(){
		return super.findWithNamedQuery("News.indexNew",0,3);
	}

	@Override
	public long count() {
		return super.countWithNamedQuery("News.countAll");
	}

	

}
