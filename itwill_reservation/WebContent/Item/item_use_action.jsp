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

		out.println("<script>alert('�ٹ������ �����ϼ̽��ϴ�. �������� ������.');");
		out.println("location.href='../main.jsp';</script>");
		System.out.println("�����۾׼� �ٹ���!!!");
 
		//response.sendRedirect("../main.jsp");
		return;
	}
		
	//������ Ÿ�� ���ǹ޾ƿ���
	String sType=(String)session.getAttribute("type");
	if(sType==null){
		out.println("<script>alert('�������� ����Ϸ��� �������� �־�� �մϴ�.');");
		out.println("location.href='../User/user_modify_form.jsp';</script>");
		System.out.println("����Ÿ�� �ι���");

		//response.sendRedirect("../User/user_modify_form.jsp");
		return;	
	}
	int itemType=Integer.parseInt(sType);
	//Item item=ItemService.getInstance().findItem(itemType);
	
	//���� �Ķ��Ÿ �޾ƿ���
	String s_no = request.getParameter("s_no");
	String m_no = request.getParameter("m_no");
	String r_date = request.getParameter("r_date");
	String s_time = request.getParameter("s_time");
	String e_time = request.getParameter("e_time");
	String mlist = request.getParameter("mlist");

	System.out.println("insert_action�� ���޵� ������ : "+s_no+", "+m_no+", "+r_date+", "+s_time+"~"+e_time+", "+mlist);
	
	HashMap<String, String> msgMap = new HashMap<String, String>();
	String forwardPath = "";
	
	try{
		MemberDaoService mService = MemberDaoService.getInstance();
		//mlist : String --> ArrayList
		ArrayList<Member> memberlist = new ArrayList<Member>();
		String[] sArr = mlist.split(",");
		System.out.println("���� ���� Ȯ��");
		for(int i =0; i< sArr.length-1; i++){
			System.out.println("�˻��ϴ� ���� id : "+sArr[i+1]);
			Member findM = mService.findMember(sArr[i+1]);
			memberlist.add(findM);
			System.out.println(findM.getM_id()+", "+findM.getM_no());
		}
		
		
		//���� ��ü ����
		Reservation r = new Reservation(r_date, s_time, e_time, Integer.parseInt(s_no), Integer.parseInt(m_no), memberlist);
		//********************������ ����*********************//
		if(ItemService.TAKE_AWAY_SEAT == itemType ) {
			System.out.println("�����ۻ�� ����");
			ItemService.getInstance().takeAwaySeat(r);
		}
		
		
		
		//****************************************************//
		forwardPath="reserve_item_use_view.jsp";
	}catch(Exception e){
		System.out.println(e.getMessage());
		System.out.println("�ͼ��� �������� ����");
		e.getStackTrace();
		msgMap.put("error", "������ �߻��߽��ϴ�.");
		request.setAttribute("msg", msgMap);
		forwardPath = "../main.jsp";
	}finally{
		RequestDispatcher rd = request.getRequestDispatcher(forwardPath);
		rd.forward(request, response);	
	}


%>