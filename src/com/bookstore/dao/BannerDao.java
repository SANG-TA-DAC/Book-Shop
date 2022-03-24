package com.bookstore.dao;

import java.util.Date;
import java.util.List;

import com.bookstore.entity.Banner;

public class BannerDao extends JpaDAO<Banner> implements GenericDAO<Banner> {

	public Banner create(Banner banner) {
		banner.setLastUpdateTime(new Date());
		return super.create(banner);
	}
	
	public Banner update(Banner banner) {
		banner.setLastUpdateTime(new Date());
		return super.update(banner);
	}
	
	@Override
	public Banner get(Object bannerId) {
		return super.find(Banner.class, bannerId);
	}

	@Override
	public void delete(Object bannerId) {
		super.delete(Banner.class, bannerId);
	}

	@Override
	public List<Banner> listAll() {
		return super.findWithNamedQuery("Banner.findAll");
	}

	@Override
	public long count() {
		return 0;
	}

}
