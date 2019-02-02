package com.project.springmvc.rest;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.project.springmvc.customer.Customer;
import com.project.springmvc.customer.CustomerService;
import com.project.springmvc.rest.exceptionhandlers.CustomerNotFoundException;

@RestController
@RequestMapping("/api")
public class RestCustomerController {
	@Autowired
	private CustomerService customerService;
	
	@RequestMapping(value="/customers", method=RequestMethod.GET)
	public List<Customer> listCusotmers(){
		return customerService.getCustomers();
	}
	
	//Endpoint
	@GetMapping("/customers/{customerId}")
	public Customer viewCusotmer(@PathVariable Integer customerId){
		Customer customerSelected = customerService.getCustomer(customerId);
		if(customerSelected == null){
			throw new CustomerNotFoundException("Customer with id "+ customerId +" is not found.");
		} 
		return customerSelected;
	}
	
	@RequestMapping(value="/customers", method=RequestMethod.POST)
	public Customer addCustomer(@RequestBody Customer theCustomer){
		customerService.saveCustomer(theCustomer);
		return theCustomer;
	}
	
	@RequestMapping(value="/customers", method=RequestMethod.PUT)
	public String updateCustomer(@RequestBody Customer theCustomer){
		customerService.saveCustomer(theCustomer);
		return "Customer id "+ theCustomer.getId() +" is updated";
	}
	
	@RequestMapping(value="/customers/{customerId}", method=RequestMethod.DELETE)
	public String deleteCusotmer(@PathVariable Integer customerId){
		Customer customerSelected = customerService.getCustomer(customerId);
		if(customerSelected == null){
			throw new CustomerNotFoundException("Customer with id "+ customerId +" is not found.");
		} 
		customerService.deleteCustomer(customerId);
		return "Customer id "+ customerId +" is deleted";
	}
	
	//Below part is moved to global exception handler since these handlers can not be reused by other controllers
	/*
	//Catch the custom Exception
	@ExceptionHandler
	public ResponseEntity<CustomerErrorResponse> handleException (CustomerNotFoundException exc){
		CustomerErrorResponse error = new CustomerErrorResponse();
		error.setStatus(HttpStatus.NOT_FOUND.value());
		error.setMessage(exc.getMessage());
		error.setTimeStamp(System.currentTimeMillis());
		return new ResponseEntity<>(error, HttpStatus.NOT_FOUND);
	}
	
	//Catch all generic Exceptions
	@ExceptionHandler
	public ResponseEntity<CustomerErrorResponse> handleGenericException (Exception exc){
		CustomerErrorResponse error = new CustomerErrorResponse();
		error.setStatus(HttpStatus.BAD_REQUEST.value());
		error.setMessage(exc.getMessage());
		error.setTimeStamp(System.currentTimeMillis());
		return new ResponseEntity<>(error, HttpStatus.BAD_REQUEST);
	}*/
}
