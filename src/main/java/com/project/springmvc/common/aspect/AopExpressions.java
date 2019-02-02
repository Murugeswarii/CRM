package com.project.springmvc.common.aspect;

import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;

@Aspect
public class AopExpressions {
	@Pointcut("execution(* com.project.springmvc.*.get*(..))")
	public void getter() {}
	
	@Pointcut("execution(* com.project.springmvc.*.set*(..))")
	public void setter() {}
	
	@Pointcut("execution(* com.project.springmvc.*.*Controller*.*(..))")
	public void forController() {}
	
	@Pointcut("forController() && !(getter() || setter())")
	public void forControllerNoGetterAndSetter() {}
}
