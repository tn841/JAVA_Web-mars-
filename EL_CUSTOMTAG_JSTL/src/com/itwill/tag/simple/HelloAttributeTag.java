package com.itwill.tag.simple;

import java.io.IOException;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.TagSupport;

public class HelloAttributeTag extends TagSupport{
	private String name;
	private int age;
	
	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		System.out.println("�ڵ����� setNameȣ�� : "+name);
		this.name = name;
	}

	public HelloAttributeTag() {
	}
	
	@Override
	public int doStartTag() throws JspException {
		
		try {
			if(name.equals("����1")){
				pageContext.getOut().print("�� "+name+"�� �ݰ����ϴ�.(����:"+age+")");
			}else{
				pageContext.getOut().print(name+"�� �ݰ����ϴ�.(����:"+age+")");
			}
		} catch (IOException e) {
			throw new JspException(e.getMessage());
		}
		
		return super.doStartTag();
	}
	
	@Override
	public int doEndTag() throws JspException {
		try {
			pageContext.getOut().println("<br>");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return super.doEndTag();
	}
}
