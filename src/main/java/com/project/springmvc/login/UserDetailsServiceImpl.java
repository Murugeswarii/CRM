package com.project.springmvc.login;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class UserDetailsServiceImpl implements UserDetailsService{
	
	@Autowired
	private UserDetailsDAO userDetailsDAO;

	@Override
	@Transactional
	public UserDetails loadUserByUsername(String name) throws UsernameNotFoundException {
		return userDetailsDAO.findUserByName(name);
	}

	public UserDetailsDAO getUserDetailsDAO() {
		return userDetailsDAO;
	}

	public void setUserDetailsDAO(UserDetailsDAO userDetailsDAO) {
		this.userDetailsDAO = userDetailsDAO;
	}
	
	

}
