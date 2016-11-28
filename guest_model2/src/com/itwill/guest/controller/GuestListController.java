package com.itwill.guest.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itwill.guest.Guest;
import com.itwill.guest.GuestDao;
import com.itwill.winter.Controller;

public class GuestListController implements Controller {
	public String handleRequest(HttpServletRequest request, HttpServletResponse response){
		String forwardPath = "";
		try {
			
			GuestDao guestDao=new GuestDao();
			ArrayList<Guest> guestList=guestDao.selectAll();
			request.setAttribute("guestList", guestList);
			forwardPath="forward:guest_list";
		} catch (Exception e) {
			//e.printStackTrace();
			request.setAttribute("error_msg", e.getMessage());
			forwardPath="forward:guest_error";
			
		}
		return forwardPath;
	}
}
