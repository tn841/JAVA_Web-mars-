package com.itwill.guest;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;

/*
@WebFilter("*.jsp")
*/
public class EncodingFilter implements Filter {
	private String encoding = null;
	protected FilterConfig filterConfig = null;
	
	public EncodingFilter() {
		//System.out.println("0.EncodingFilter ������ȣ��");
	}
	/**
	  - ���Ͱ�ü�������� �����ѹ� ȣ��Ǵ¸޽��
	  - ��ü�ʱ�ȭ�۾�(���ҽ�ȹ��..)
	  << web.xml���� ���޵� ���ڵ� ���� �ʱ�ȭ�ϴ� �޽��.>>
	 	<filter>
			<filter-name>Encoding Filter</filter-name>
			<filter-class>com.itwill.guest.EncodingFilter</filter-class>
			<init-param>
				<param-name>encoding</param-name>
				<param-value>EUC-KR</param-value>
			</init-param>
	  	</filter>
	 */
	public void init(FilterConfig filterConfig) throws ServletException {
		
		this.encoding = filterConfig.getInitParameter("encoding");
		//System.out.println("1.EncodingFilter init()�޽��ȣ��-->�Ķ��Ÿ:"+this.encoding);
		
		this.filterConfig = filterConfig;
	}

	/**
	 * ��û�ø��� ȣ��Ǵ¸޽��
	 * 
	 * ServletRequest��ü�� web.xml���� ���޵� ���ڵ��� �����ϴ� �޽��.
	 */
	public void doFilter(
		ServletRequest request,
		ServletResponse response,
		FilterChain chain)
		throws IOException, ServletException {
		HttpServletRequest requestTemp=(HttpServletRequest)request;
		String requestURI = requestTemp.getRequestURI();
		//System.out.println("2.EncodingFilter.doFilter()�޽�����:"+requestURI);

		
		if (request.getCharacterEncoding() == null) {
			if (this.encoding != null) {
				request.setCharacterEncoding(this.encoding);
			}
		}
		
		//request.setCharacterEncoding(encoding);
		chain.doFilter(request, response);
	}
	public void destroy() {
		//System.out.println("3.EncodingFilter.destroy()�޽��ȣ��");
		this.encoding = null;
		this.filterConfig = null;

	}
	public FilterConfig getFilterConfig() {
		return filterConfig;
	}

	public void setFilterConfig(FilterConfig cfg) {
		filterConfig = cfg;
	}
}
