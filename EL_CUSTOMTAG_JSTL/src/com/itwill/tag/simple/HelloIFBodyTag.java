package com.itwill.tag.simple;

import java.io.IOException;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.TagSupport;

public class HelloIFBodyTag extends TagSupport{
	private boolean test;
		
	public boolean isTest() {
		return test;
	}

	public void setTest(boolean test) {
		this.test = test;
	}

	public HelloIFBodyTag() {
		// TODO Auto-generated constructor stub
	}
	
	@Override
	public int doStartTag() throws JspException {
		if(test){
			return EVAL_BODY_INCLUDE;			
		}else{
			return SKIP_BODY;
		}
		
	}
	
	@Override
	public int doEndTag() throws JspException {
		if(!test){
			try {
				pageContext.getOut().println("<h3>∞≈¡˛¿‘¥œ¥Ÿ.</h3>");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return EVAL_PAGE;
	}
	
}
