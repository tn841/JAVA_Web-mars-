package com.itwill.winter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
/*
 * ��û command�� ���� ����Ǵ� ��簴ü�� �����ؾ߸��ϴ� �ֻ��� �������̽�
 */
public interface Controller {

	public String handleRequest(HttpServletRequest request, HttpServletResponse response);

}