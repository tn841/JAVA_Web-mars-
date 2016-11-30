package com.itwill.user.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itwill.winter.Controller;

public class UserLoginFormController implements Controller{

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) {
		String forwardPath = "forward:user_login_form";
		
		return forwardPath;
	}

}


