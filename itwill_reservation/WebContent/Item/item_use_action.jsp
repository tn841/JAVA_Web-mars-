<%@page import="javax.sound.midi.SysexMessage"%>
<%@page import="com.itwill.item.Item"%>
<%@page import="com.itwill.user.MemberDaoService"%>
<%@page import="com.itwill.user.Member"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.itwill.reservation.Reservation"%>
<%@page import="com.itwill.reservation.ReservationService"%>
<%@page import="com.itwill.item.ItemService"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	if(request.getMethod().equalsIgnoreCase("GET")){

		out.println("<script>alert('겟방식으로 접근하셨습니다. 메인으로 가세요.');");
		out.println("location.href='../main.jsp';</script>");
		System.out.println("아이템액션 겟방지!!!");
 
		//response.sendRedirect("../main.jsp");
		return;
	}
		
	//아이템 타입 세션받아오기
	String sType=(String)session.getAttribute("type");
	if(sType==null){
		out.println("<script>alert('아이템을 사용하려면 아이템이 있어야 합니다.');");
		out.println("location.href='../User/user_modify_form.jsp';</script>");
		System.out.println("세션타입 널방지");

		//response.sendRedirect("../User/user_modify_form.jsp");
		return;	
	}
	int itemType=Integer.parseInt(sType);
	//Item item=ItemService.getInstance().findItem(itemType);
	
	//예약 파라메타 받아오기
	String s_no = request.getParameter("s_no");
	String m_no = request.getParameter("m_no");
	String r_date = request.getParameter("r_date");
	String s_time = request.getParameter("s_time");
	String e_time = request.getParameter("e_time");
	String mlist = request.getParameter("mlist");

	System.out.println("insert_action에 전달된 데이터 : "+s_no+", "+m_no+", "+r_date+", "+s_time+"~"+e_time+", "+mlist);
	
	HashMap<String, String> msgMap = new HashMap<String, String>();
	String forwardPath = "";
	
	try{
		MemberDaoService mService = MemberDaoService.getInstance();
		//mlist : String --> ArrayList
		ArrayList<Member> memberlist = new ArrayList<Member>();
		String[] sArr = mlist.split(",");
		System.out.println("동반 유저 확인");
		for(int i =0; i< sArr.length-1; i++){
			System.out.println("검색하는 유저 id : "+sArr[i+1]);
			Member findM = mService.findMember(sArr[i+1]);
			memberlist.add(findM);
			System.out.println(findM.getM_id()+", "+findM.getM_no());
		}
		
		
		//예약 객체 생성
		Reservation r = new Reservation(r_date, s_time, e_time, Integer.parseInt(s_no), Integer.parseInt(m_no), memberlist);
		//********************아이템 적용*********************//
		if(ItemService.TAKE_AWAY_SEAT == itemType ) {
			System.out.println("아이템사용 가능");
			ItemService.getInstance().takeAwaySeat(r);
		}
		
		
		
		//****************************************************//
		forwardPath="reserve_item_use_view.jsp";
	}catch(Exception e){
		System.out.println(e.getMessage());
		System.out.println("익셉션 젠장젠장 망할");
		e.getStackTrace();
		msgMap.put("error", "오류가 발생했습니다.");
		request.setAttribute("msg", msgMap);
		forwardPath = "../main.jsp";
	}finally{
		RequestDispatcher rd = request.getRequestDispatcher(forwardPath);
		rd.forward(request, response);	
	}


%>