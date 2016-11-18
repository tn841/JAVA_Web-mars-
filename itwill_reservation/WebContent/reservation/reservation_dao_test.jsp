
<%@page import="com.itwill.reservation.ReservationService"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.itwill.reservation.Reservation"%>
<%@page import="com.itwill.reservation.ReservationDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%
		 ReservationDao rDao = ReservationDao.getInstance();
		int temp = 0;
		ArrayList<HashMap<String, Object>> rList = rDao.selectByRmno(1);
	%>
	<h1>updated rows : <%=temp %></h1><hr>
	
	
	<h1>list </h1>
	<hr>
	<table border="1px">
		<tr>		
			<th>no</th>
			<th>r_no</th>
			<th>r_date</th>
			<th>enroll_time</th>
			<th>modify_time</th>
			<th>r_s_time</th>
			<th>r_e_time</th>
			<th>s_no</th>
			<th>r_m_no</th>
			<th>r_detail_no</th>
			<th>r_no_1</th>
			<th>m_no</th>
			<th>master</th>
		</tr>
		
		<% int no = 1; for(HashMap<String, Object> row : rList){%>
		<tr>
			<td><%=no++%></td>
			<td><%=row.get("r_no")%></td>
			<td><%=row.get("r_date")%></td>
			<td><%=row.get("enroll_time")%></td>
			<td><%=row.get("modify_time")%></td>
			<td><%=row.get("r_s_time")%></td>
			<td><%=row.get("r_e_time")%></td>
			<td><%=row.get("s_no")%></td>
			<td><%=row.get("r_m_no")%></td>
			<td><%=row.get("r_detail_no")%></td>
			<td><%=row.get("r_no_1")%></td>
			<td><%=row.get("m_no")%></td>
			<td><%=row.get("master")%></td>			
		</tr>
		<%}%>
	</table>
	<br>
	<br>
	<br>
	<hr>
	<form name="temp_form" method="post">
		회원 번호 : <input type="text" name="m_no">
		<input type="hidden" name="s_no" value="">
	</form>
	<br>
	<%
		ReservationService rService = new ReservationService();
		ArrayList<String> reservedSeats = rService.selectAllSeat();
	%>
	<h1>테이블 예약 현황</h1>

	<svg  xmlns="http://www.w3.org/2000/svg"
		xmlns:xlink="http://www.w3.org/1999/xlink" width="1300px"
		height="630px" viewBox="0 0 1300 630"
		preserveAspectRatio="xMidYMid meet">

		<circle onclick="object_click(evt)" id='1' cx='170.1999969482' cy='146.1999969482'
			stroke='black' style='stroke-width: 1px; cursor:pointer;' r='40.7062648741'
			fill='<%=(reservedSeats.contains("1")? "pink":"khaki") %>' />
		<circle onclick="object_click(evt)" id='2' cx='173.1999969482' cy='252.20001220698907'
			stroke='black' style='stroke-width: 1px; cursor:pointer;' r='40.7062648741'
			fill='<%=(reservedSeats.contains("2")? "pink":"khaki") %>' />
		<circle onclick="object_click(evt)" id='3' cx='453.2000122069891' cy='254.20001220698907'
			stroke='black' style='stroke-width: 1px; cursor:pointer;' r='40.7062648741'
			fill='<%=(reservedSeats.contains("3")? "pink":"khaki") %>' />
		<circle onclick="object_click(evt)" id='4' cx='451.2000122069891' cy='144.20001220698907'
			stroke='black' style='stroke-width: 1px; cursor:pointer;' r='40.7062648741'
			fill='<%=(reservedSeats.contains("4")? "pink":"khaki") %>' />
		<ellipse onclick="object_click(evt)" id='5' cx='309.2000122069891' cy='142.1999969482'
			stroke='black' style='stroke-width: 1px; cursor:pointer;' rx='82'
			ry='38.000000000000014' fill='<%=(reservedSeats.contains("5")? "pink":"khaki") %>' />
		<ellipse onclick="object_click(evt)" id='6' cx='317.2000122069891' cy='252.1999969482'
			stroke='black' style='stroke-width: 1px; cursor:pointer;' rx='82'
			ry='38.000000000000014' fill='<%=(reservedSeats.contains("6")? "pink":"khaki") %>' />
		<polyline stroke="black" id="e169_polyline"
			style="fill: none; stroke-width: 1px;"
			points="94.2 105.2 95.2 290.2 95.2 196.2 520.2 193.2 518.2 92.2 523.2 297.2 519.2 194.2 399.2 194.2 398.2 92.2 402.2 294.2 399.2 194.2 223.2 194.2 222.2 94.2 226.2 297.2" />
			
	</svg>
	
	<script>

		function object_click(evt){
			var svg_object = evt.target;
			console.log(svg_object);
			if(svg_object.getAttribute("fill")=="pink"){
				alert("이미 예약된 자리 입니다.");
	
			}else{
				var temp = confirm("예약하시겠습니까?");
				if(temp == true){
					if(temp_form.m_no.value == ""){
						alert("회원 번호를 입력하세요.");
						return;
					}
					temp_form.s_no.setAttribute("value", svg_object.getAttribute("id"));
					temp_form.action = action="reservation_create_action.jsp";
					temp_form.submit();
				}
			}			
			var info = document.getElementById("info");
			info.innerHTML = '선택한 객체 정보 : '+svg_object.getAttribute("id");
		}
		
		
	</script>
	

</body>
</html>