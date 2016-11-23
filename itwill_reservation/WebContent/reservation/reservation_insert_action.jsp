<%@page import="com.itwill.user.MemberDaoService"%>
<%@page import="com.itwill.user.Member"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.itwill.reservation.Reservation"%>
<%@page import="com.itwill.reservation.ReservationService"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body onload="myFunc()">
	<%
	if(request.getMethod().equalsIgnoreCase("GET")){
		response.sendRedirect("main.jsp");
		return;
	}
	
		String s_no = request.getParameter("s_no");
		String m_no = request.getParameter("m_no");
		String r_date = request.getParameter("r_date");
		String s_time = request.getParameter("s_time");
		String e_time = request.getParameter("e_time");
		String mlist = request.getParameter("mlist");
		
		MemberDaoService mService = MemberDaoService.getInstance();
		
		System.out.println("insert_action에 전달된 데이터 : "+s_no+", "+m_no+", "+r_date+", "+s_time+"~"+e_time+", "+mlist);
		ArrayList<Member> memberlist = new ArrayList<Member>();
		String[] sArr = mlist.split(",");
		System.out.println("동반 유저 확인");
		for(int i =0; i< sArr.length-1; i++){
			System.out.println("검색하는 유저 id : "+sArr[i+1]);
			Member findM = mService.findMember(sArr[i+1]);
			memberlist.add(findM);
			System.out.println(findM.getM_id()+", "+findM.getM_no());
		}
		
		
		HashMap<String, String> msgMap = new HashMap<String, String>();
		String forwardPath = "";
	
		
		ReservationService rService = new ReservationService();
		
		try{
			//(RESERVE_R_NO_SEQ.nextval,current_timestamp, current_timestamp, ?r_date, ?s_time, ?e_time, ?s_no, ?r_m_no)
			int row = rService.createReservation(
					new Reservation(r_date, s_time, e_time, Integer.parseInt(s_no), Integer.parseInt(m_no), memberlist));
			
			if(row == -1){
				msgMap.put("error", "sql 오류가 발생했습니다. 관리자에게 연락바랍니다.");
				request.setAttribute("msg", msgMap);
				forwardPath = "seat_reserve_view.jsp";
			}
	
			msgMap.put("inserted_s_no", s_no);
			msgMap.put("inserted_m_no", m_no);
			request.setAttribute("msg", msgMap);

			forwardPath="seat_reserve_view.jsp";
			
			
		}catch(Exception e){
			e.getStackTrace();
			msgMap.put("error", "오류가 발생했습니다.");
			request.setAttribute("msg", msgMap);
			forwardPath = "main.jsp";
		}finally{
			RequestDispatcher rd = request.getRequestDispatcher(forwardPath);
			rd.forward(request, response);	
		}
		
		
	%>	
	<h1>예약 수행 페이지</h1><hr>
	<p> 예약 정보 : <%=s_no %>, <%=m_no %></p>
	<br>
	<br>
	<br>
	<p> 2초후 이전 페이지로 이동..</p>
	
	<script>
	function myFunc(){
		setTimeout(function(){
			location.href="reservation_dao_test.jsp";
		}, 2000);
	};
	</script>
</body>
</html>