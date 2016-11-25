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
		//System.out.println("0.EncodingFilter 생성자호출");
	}
	/**
	  - 필터객체생성이후 최초한번 호출되는메쏘드
	  - 객체초기화작업(리소스획득..)
	  << web.xml에서 전달된 인코딩 값을 초기화하는 메써드.>>
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
		//System.out.println("1.EncodingFilter init()메쏘드호출-->파라메타:"+this.encoding);
		
		this.filterConfig = filterConfig;
	}

	/**
	 * 요청시마다 호출되는메쏘드
	 * 
	 * ServletRequest객체에 web.xml에서 전달된 인코딩을 설정하는 메써드.
	 */
	public void doFilter(
		ServletRequest request,
		ServletResponse response,
		FilterChain chain)
		throws IOException, ServletException {
		HttpServletRequest requestTemp=(HttpServletRequest)request;
		String requestURI = requestTemp.getRequestURI();
		//System.out.println("2.EncodingFilter.doFilter()메쏘드실행:"+requestURI);

		
		if (request.getCharacterEncoding() == null) {
			if (this.encoding != null) {
				request.setCharacterEncoding(this.encoding);
			}
		}
		
		//request.setCharacterEncoding(encoding);
		chain.doFilter(request, response);
	}
	public void destroy() {
		//System.out.println("3.EncodingFilter.destroy()메쏘드호출");
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
