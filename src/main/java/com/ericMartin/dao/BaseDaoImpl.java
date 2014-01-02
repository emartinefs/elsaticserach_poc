package com.ericMartin.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

public class BaseDaoImpl implements BaseDao{

	public Session session;
	
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.session = sessionFactory.openSession();
		
	}

}
