package com.itwill.guest.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
/*
 * ��û command�� ���� ����Ǵ� ��簴ü�� �����ؾ߸��ϴ� �ֻ��� �������̽�
 */
public interface Controller {

	public String handleRequest(HttpServletRequest request, HttpServletResponse response);

}