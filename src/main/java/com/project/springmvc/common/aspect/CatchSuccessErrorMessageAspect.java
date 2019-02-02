package com.project.springmvc.common.aspect;

import java.util.Map;
import java.util.logging.Logger;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

@Aspect
@Component
@Order(1)
public class CatchSuccessErrorMessageAspect {
	
	//Setup logger
	private Logger myLogger = Logger.getLogger(getClass().getName());
	
	@Before("com.project.springmvc.common.aspect.AopExpressions.forControllerNoGetterAndSetter()")
	public void beforeCallingControllerMethod(JoinPoint joinPoint) {
		String methodSignature = joinPoint.getSignature().toShortString();
		myLogger.info(joinPoint.getClass().getName()+ methodSignature);
		//HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.currentRequestAttributes()).getRequest();
	}
	
	@AfterReturning(pointcut="com.project.springmvc.common.aspect.AopExpressions.forControllerNoGetterAndSetter()", returning="result")
	public void afterCallingControllerMethod(JoinPoint joinPoint, Object result) {
		String methodSignature = joinPoint.getSignature().toShortString();
		
		if(result instanceof String){
			myLogger.info(joinPoint.getClass().getName()+ methodSignature + " returns "+result.toString());
		} else if(result instanceof ModelAndView){
			ModelAndView resultModelAndVeiw = (ModelAndView)result;
			myLogger.info(joinPoint.getClass().getName()+ methodSignature + " returns "+resultModelAndVeiw.getViewName());
			Map<String, Object> valueMap = resultModelAndVeiw.getModel();
			for (String key : valueMap.keySet()) {
				myLogger.info(key+": "+valueMap.get(key));
			}
		}
		
	}

}
