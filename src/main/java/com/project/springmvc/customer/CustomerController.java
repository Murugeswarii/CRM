package com.project.springmvc.customer;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.project.springmvc.common.MessageSourceResolver;

@Controller
@RequestMapping("/customer")
public class CustomerController {
	
	@Autowired
	private CustomerService customerService;
	
	@RequestMapping("/list")
	public String listCustomers(Model theModel){
		List<Customer> theCustomers = customerService.getCustomers();
		theModel.addAttribute("customers", theCustomers);
		return "customer/list-customer";
	}
	
	@GetMapping("/showFormForAdd")
	public String showFormForAdd(Model theModel){
		Customer theCustomer = new Customer();
		theModel.addAttribute("customer", theCustomer);
		return "customer/customer-form";
	}
	
	@PostMapping("/saveCustomer")
	public String saveCustomer(@Valid @ModelAttribute("customer") Customer customer, BindingResult bindingResult, RedirectAttributes redirectAttributes){
		validateCustomer(customer, bindingResult);
		if(!bindingResult.hasErrors()){
			Integer customerId = customer.getId();
			customerService.saveCustomer(customer);
			redirectAttributes.addFlashAttribute("SUCCESS_MESSAGE", getCustomerSaveSuccessMessage(customerId));
			return "redirect:/customer/list";
		} else {
			//redirectAttributes.addFlashAttribute("ERROR_MESSAGE", "Errors occured");
			return "customer/customer-form";
		}
		
	}

	private String getCustomerSaveSuccessMessage(Integer customerId) {
		return customerId == null ? MessageSourceResolver.getMessage("info.customeAddSuccess") : MessageSourceResolver.getMessage("info.customeUpdateSuccess");
	}

	private void validateCustomer(Customer customer, BindingResult bindingResult) {
		if(StringUtils.isEmpty(customer.getFirstName())){
			bindingResult.rejectValue("firstName","error.firstNameIsRequired");
		}
		if(StringUtils.isEmpty(customer.getEmail())){
			bindingResult.rejectValue("email","error.emailIsRequired");
		} else {
			Customer existingCustomer = customerService.getCustomerByEmail(customer.getEmail());
			if(existingCustomer != null){
				bindingResult.rejectValue("email","error.emailAlreadyExists");
			}
		}
	}

	@RequestMapping("/showFormForUpdate")
	public String showFormForUpdate(@RequestParam("customerId") int customerId, Model theModel){
		Customer customer = customerService.getCustomer(customerId);
		theModel.addAttribute("customer", customer);
		return "customer/customer-form";
	}

	@GetMapping("/deleteCustomer")
	public String showFormForUpdate(@RequestParam("customerId") int customerId){
		customerService.deleteCustomer(customerId);
		return "redirect:/customer/list";
	}

}
