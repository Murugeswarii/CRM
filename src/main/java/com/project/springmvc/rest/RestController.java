package com.project.springmvc.rest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/view/restapi")
public class RestController {
	
	@GetMapping("/list")
	public String showAllApiURL(){
		return "rest/list-api-url";
	}
}
