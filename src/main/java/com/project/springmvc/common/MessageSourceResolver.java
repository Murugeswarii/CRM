package com.project.springmvc.common;

import org.springframework.context.MessageSource;

public class MessageSourceResolver {

	private static MessageSource messageSource;
	
	public static String getMessage(String code){
		return messageSource.getMessage(code, null, null);
	}
	
	public static String getMessage(String code, Object[] args){
		return messageSource.getMessage(code, args, null);
	}

	public static MessageSource getMessageSource() {
		return messageSource;
	}

	public static void setMessageSource(MessageSource messageSource) {
		MessageSourceResolver.messageSource = messageSource;
	}
	
	
}
