package com.bookstore.dao;

import java.util.Date;
import java.util.List;

import com.bookstore.entity.Contact;

public class ContactDAO extends JpaDAO<Contact> implements GenericDAO<Contact> {
	
	public Contact create(Contact contact) {
		contact.setContactDate(new Date());
		return super.create(contact);
	}

	@Override
	public Contact get(Object id) {
		return super.find(Contact.class, id);
	}

	@Override
	public void delete(Object id) {
		super.delete(Contact.class, id);
	}

	@Override
	public List<Contact> listAll() {
		return super.findWithNamedQuery("Contact.findAll");
	}

	@Override
	public long count() {
		return 0;
	}


}
