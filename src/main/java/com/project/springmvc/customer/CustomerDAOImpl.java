package com.project.springmvc.customer;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.query.Query;
import org.springframework.stereotype.Repository;

import com.project.springmvc.common.BaseDAO;

@Repository
public class CustomerDAOImpl extends BaseDAO implements CustomerDAO {

	@Override
	public List<Customer> getCustomers() {
		Session currentSession = getCurrentSession();
		Query<Customer> theQuery = currentSession.createQuery("from Customer order by firstName ", Customer.class);
		List<Customer> customers = theQuery.getResultList();
		return customers;
	}

	@Override
	public void saveCustomer(Customer customer) {
		Session currentSession = getCurrentSession();
		currentSession.saveOrUpdate(customer);
	}

	@Override
	public Customer getCustomer(int customerId) {
		Session currentSession = getCurrentSession();
		Customer customer = currentSession.get(Customer.class, customerId);
		return customer;
	}

	@Override
	public void deleteCustomer(int customerId) {
		Session currentSession = getCurrentSession();
		Query<?> query = currentSession.createQuery("delete from Customer where id=:customerId");
		query.setParameter("customerId", customerId);
		query.executeUpdate();
	}

	@Override
	public Customer getCustomerByEmail(String email) {
		Session currentSession = getCurrentSession();
		try{
			return currentSession.createQuery("from Customer where UPPER(email) = upper('"+email.trim()+"')", Customer.class).getSingleResult();
		} catch (Exception e){
			return null;
		}
	}

}
