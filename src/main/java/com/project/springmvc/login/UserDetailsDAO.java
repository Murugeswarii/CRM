package com.project.springmvc.login;

import org.hibernate.Session;
import org.springframework.stereotype.Repository;

import com.project.springmvc.common.BaseDAO;

@Repository
public class UserDetailsDAO extends BaseDAO {
	
	public User findUserByName(String name){
		Session currentSession = getCurrentSession();
		return currentSession.get(User.class, name);
	}
}
