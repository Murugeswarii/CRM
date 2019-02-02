package com.project.springmvc.common;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class BaseDAO {
	
	@Autowired
	private SessionFactory sessionFactory;
	
	public Session getCurrentSession() {
		Session currentSession = null;
		try {
		    currentSession = sessionFactory.getCurrentSession();
		} catch (HibernateException e) {
		    //currentSession = sessionFactory.openSession();
		}
		return currentSession;
	}
}
