package com.itwill.tag.simple;

import java.io.IOException;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.TagSupport;

public class HelloTag extends TagSupport {
	public HelloTag() {
		System.out.println("HelloTag ������");
	}
	
	@Override
	public int doStartTag() throws JspException {
		System.out.println("doStartTag()");
		try {
			pageContext.getOut().print("hello");//TagSupport�� ���� �ִ� pageContext��ü
		} catch (IOException e) {
			throw new JspException(e.getMessage());
		}	
		return SKIP_BODY;
	}
	
	@Override
	public int doEndTag() throws JspException {
		System.out.println("doEndTag()");
		try {
			pageContext.getOut().print("<hr>");
		} catch (IOException e) {
			throw new JspException(e.getMessage());
		}	
		return EVAL_PAGE;
	}
}
