package com.itwill.winter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
/*
 * 요청 command에 의해 실행되는 모든객체가 구현해야만하는 최상위 인터페이스
 */
public interface Controller {

	public String handleRequest(HttpServletRequest request, HttpServletResponse response);

}