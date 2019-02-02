package com.project.springmvc.rest;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api")
public class HelloWordRestController {

	@GetMapping("/test")
	public String helloWorld(){
		return "Hello World!!!";
	}
	
}
