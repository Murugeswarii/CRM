package com.project.springmvc.login;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class LoginController {
	
	@GetMapping({"/","/home"})
	public String home(){
		return "home";
	}
	
	@GetMapping("/showLoginPage")
	public String showLoginPage(){
		return "fancy-login";
	}
	
	@GetMapping("/accessDenied")
	public String accessDenied(){
		return "accessDenied";
	}
	
	public static void main(String[] args) {
		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		System.out.println(passwordEncoder.encode("Abcd1234"));
	}
	
}
