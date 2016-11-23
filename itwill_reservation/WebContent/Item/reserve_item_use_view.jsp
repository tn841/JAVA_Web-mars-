<%@page import="com.itwill.item.Item"%>
<%@page import="com.itwill.item.ItemService"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.itwill.reservation.Reservation"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.itwill.reservation.ReservationService"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!-- <head> -->
<%@include file="../include_head.jsp"%>


<!-- 상단 메뉴 바 -->
<%@include file="../include_common_header_other.jsp"%>
<%!String inserted_s_no = null; //자리 고유 번호
	String inserted_m_no = null; //회원 고유 번호
	String error_msg = null; //에러 메시지%>
<%
	//get방식 방지
	/* if(request.getMethod().equalsIgnoreCase("get")){
		out.println("<script>alert('잘못된 접근입니다.');");
		out.println("location.href='main.jsp';</script>");
		return;
	} */
	//세션체크
	if (sUserId == null || sUserId.equalsIgnoreCase("")) {
		out.println("<script>alert('예약을 하려면 먼저 로그인을 해주세요.');");
		out.println("location.href='../main.jsp';</script>");
		return;
	}
	/*
	아이템 타입을 세션적용
	*/
		String type=request.getParameter("type");
		session.setAttribute("type", type);
	
	//회원의 예약 정보 가져오기
	ReservationService rService = new ReservationService();
	ArrayList<HashMap<String, Object>> rList = new ArrayList<HashMap<String, Object>>();
	System.out.println("현재 회원의 no : " + sUser.getM_no());

	rList = rService.getR_by_MemberId(sUser.getM_no());

	//예약된 자리 정보 가져오기
	ArrayList<String> reservedSeats = rService.selectAllSeat();

	//자리 insert_action에서 forwarding된 데이터
	HashMap<String, String> msgMap = (HashMap<String, String>) request.getAttribute("msg");
	System.out.println("hashMap : " + msgMap);
	if (msgMap != null) {
		inserted_s_no = (String) msgMap.get("inserted_s_no");
		inserted_m_no = (String) msgMap.get("inserted_m_no");
		error_msg = (String) msgMap.get("error");
		if (error_msg != null) {
%>
<script>alert('<%=error_msg%>');</script>
<%
	} else {
			System.out.println("예약 정보 forwarding 성공");
		}
	}
	
	
%>
<div class="container">
	<div class="page-header">
		<h1>
			예약하기 <small>예약 현황</small>
		</h1>
	</div>

	<div>

		<!-- Nav tabs -->
		<ul class="nav nav-tabs" role="tablist">
			<li role="presentation"><a href="#10floor"
				aria-controls="10floor" role="tab" data-toggle="tab">10층</a></li>
			<li role="presentation" class="active"><a href="#15floor"
				aria-controls="15floor" role="tab" data-toggle="tab">15층</a></li>
		</ul>

		<!-- Tab panes -->
		<div class="tab-content">
			<div role="tabpanel" class="tab-pane " id="10floor">
				<br>

				<div></div>

				<table class="table table-bordered" onload="fillcolor();">
					<tr>
						<td colspan="3">
							<div width="100%" style="background-color: pink">
								<svg id="f15" class="container"
									xmlns="http://www.w3.org/2000/svg"
									xmlns:xlink="http://www.w3.org/1999/xlink" width="400px"
									height="300px" viewBox="0 0 400 300"
									preserveAspectRatio="xMidYMid meet">
								<rect id="svgEditorBackground" x="0" y="0" width="400"
										height="300" style="fill: none; stroke: none;" />
								<rect x="17.1111" y="53.1111" stroke="black" id="e1_rectangle"
										style="stroke-width: 1px;" width="86" height="165"
										fill="khaki" rx="0" ry="0" />
								<rect x="106.11109924318907" y="53.11109924321093"
										stroke="black" id="e124_rectangle" style="stroke-width: 1px;"
										width="86" height="165" fill="khaki" rx="0" ry="0" />
								<rect x="195.11109924318907" y="53.111099243210944"
										stroke="black" id="e136_rectangle" style="stroke-width: 1px;"
										width="86" height="165" fill="khaki" rx="0" ry="0" />
								<rect x="284.1110839844" y="53.111099243210944" stroke="black"
										id="e208_rectangle" style="stroke-width: 1px;" width="86"
										height="165" fill="khaki" rx="0" ry="0" /></svg>
							</div>
						</td>
					</tr>
					<tr>
						<td>
							<div width="100%" style="background-color: rgb(231, 144, 174)">
								<br>
								<br>
								<br>날짜<br>
								<br>
								<br>
							</div>
						</td>
						<td>
							<div width="100%" style="background-color: cyan">
								<br>
								<br>
								<br>시간<br>
								<br>
								<br>
							</div>
						</td>
						<td>
							<div width="100%" style="background-color: silver">
								<br>
								<br>
								<br>회원<br>
								<br>
								<br>
							</div>
						</td>
					</tr>

				</table>

			</div>
			<div role="tabpanel" class="tab-pane active" id="15floor">
				<br>
				<div class="row">
					<div class="col-md-8 well well-lg active" id="seat_div"
						style="background-color: rgb(231, 144, 174);">
						<H3>Step1. 자리 선택</H3>
						<svg id="f10svg" xmlns="http://www.w3.org/2000/svg"
							xmlns:xlink="http://www.w3.org/1999/xlink" width="500px"
							height="300px" viewBox="0 0 500 300"
							preserveAspectRatio="xMidYMid meet">
						<rect onclick="object_click(evt)" id="svgEditorBackground" x="0"
								y="0" width="500" height="300" style="fill: none; " />
						<circle onclick="object_click(evt)" id="1" cx="75.2" cy="81.2"
								stroke="black" style="cursor:pointer; stroke-width: 1px;"
								r="40.7663"
								fill='<%=(reservedSeats.contains("1") ? "rgb(119, 144, 174)" : "rgb(168, 65, 145)")%>' />
						<rect onclick="object_click(evt)" x="154.11923217770058"
								y="29.19991302485675" stroke="black" id="2"
								style="cursor:pointer; stroke-width: 1px;" width="207"
								height="91"
								fill='<%=(reservedSeats.contains("2") ? "rgb(119, 144, 174)" : "rgb(168, 65, 145)")%>'
								transform="matrix(0.925262 0 0 0.925262 10.8519 9.73084)" />
						<circle onclick="object_click(evt)" id="3" cx="77.19999694821094"
								cy="208.1999969482" stroke="black"
								style="cursor:pointer; stroke-width: 1px;" r="40.7663"
								fill='<%=(reservedSeats.contains("3") ? "rgb(119, 144, 174)" : "rgb(168, 65, 145)")%>' />
						<circle onclick="object_click(evt)" id="4" cx="426.200012207"
								cy="208.1999969482" stroke="black"
								style="cursor:pointer; stroke-width: 1px;" r="40.7663"
								fill='<%=(reservedSeats.contains("4") ? "rgb(119, 144, 174)" : "rgb(168, 65, 145)")%>' />
						<circle onclick="object_click(evt)" id="5" cx="424.200012207"
								cy="78.1999969482" stroke="black"
								style="cursor:pointer; stroke-width: 1px;" r="40.7663"
								fill='<%=(reservedSeats.contains("5") ? "rgb(119, 144, 174)" : "rgb(168, 65, 145)")%>' />
						<rect onclick="object_click(evt)" x="156.5538330077787"
								y="171.05442810054035" stroke="black" id="6"
								style="cursor:pointer; stroke-width: 1px;" width="207"
								height="91"
								fill='<%=(reservedSeats.contains("6") ? "rgb(119, 144, 174)" : "rgb(168, 65, 145)")%>'
								transform="matrix(0.925262 0 0 0.925262 10.8519 9.73084)" />
						<path d="M35.99999946498892,-3.3333332808812433h2l-4,4l-4,-4h2v-4h4Z"
							stroke="black" id="e21_shape"
							style="vector-effect: non-scaling-stroke; stroke-width: 1px;"
							fill="khaki" transform="matrix(2.51467 0 0 2.51467 336.593 18.8647)" />
						<text fill="fuchsia" x="378.923" y="22.2175" id="e136_texte"
							style="font-family: Arial; font-size: 20px;">입구</text>
						<rect x="0.8847923278808594" y="38.143783569335945" stroke="black"
							id="e187_rectangle" style="stroke-width: 1px;"
							width="12.573344509639561" height="65.38139145012576" fill="khaki" />
						<rect x="0.8847927451133728" y="118.57347106933594" stroke="black"
							id="e202_rectangle" style="stroke-width: 1px;"
							width="12.573344509639561" height="65.38139145012576" fill="khaki" />
						<rect x="2.142127275466919" y="198.66351318359375" stroke="black"
							id="e214_rectangle" style="stroke-width: 1px;"
							width="12.573344509639561" height="65.38139145012576" fill="khaki" />
						<rect x="37.92779541015625" y="205.17037963867188" stroke="black"
							id="e226_rectangle" style="stroke-width: 1px;" width="12.5733"
							height="65.3814" fill="khaki"
							transform="matrix(0.00275544 0.999996 -0.999996 0.00275544 334.805 246.931)" />
						<rect x="38.47200012207031" y="11.311264038085938" stroke="black"
							id="e279_rectangle" style="stroke-width: 1px;" width="12.5733"
							height="65.3814" fill="khaki"
							transform="matrix(0.00275544 0.999996 -0.999996 0.00275544 334.805 246.931)" />
						<text fill="fuchsia" x="1.75546" y="78.4472" id="e305_texte"
							style="font-family: Arial; font-size: 20px;">1반</text>
						<text fill="fuchsia" x="7.23144" y="238.711" id="e347_texte"
							style="font-family: Arial; font-size: 20px;">2반</text>
						<text fill="fuchsia" x="78.4193" y="286.169" id="e374_texte"
							style="font-family: Arial; font-size: 20px;">3반</text>
						<text fill="fuchsia" x="268.253" y="285.439" id="e386_texte"
							style="font-family: Arial; font-size: 20px;">4반</text>
						<text fill="fuchsia" x="3.94585" y="157.301" id="e440_texte"
							style="font-family: Arial; font-size: 20px;">서버</text>
					</svg>
					</div>

					<div class="col-md-4 well well-lg" id="date_div">
						<div width="70%">
							<H3>Step2. 날짜 선택</H3>
							<input type="date" id="date" name="date" disabled> <input
								type="button" id="date_btn" value="확인"
								onclick="dateForm_click()" disabled> <br>
							<br>
							<br>
						</div>
						<div width="30%">
							<img id="s_img" src="" width="100%">
						</div>


					</div>

				</div>
				<!-- row1 -->

				<div class="row">
					<div class="col-md-4 well well-lg" id="time_div">
						<div width="100%">
							<H3>Step3. 시간 선택</H3>
							<br>
							<div id="time_btn_parent">
								<a class="btn btn-default" id="time_btn0" value="11:00"
									onclick="time_btn(this.id)">11:00~11:30</a> <a
									class="btn btn-default" id="time_btn1" value="11:30"
									onclick="time_btn(this.id)">11:30~12:00</a> <a
									class="btn btn-default" id="time_btn2" value="12:00"
									onclick="time_btn(this.id)">12:00~12:30</a> <a
									class="btn btn-default" id="time_btn3" value="12:30"
									onclick="time_btn(this.id)">12:30~13:00</a> <a
									class="btn btn-default" id="time_btn4" value="13:00"
									onclick="time_btn(this.id)">13:00~13:30</a> <a
									class="btn btn-default" id="time_btn5" value="13:30"
									onclick="time_btn(this.id)">13:30~14:00</a> <a
									class="btn btn-default" id="time_btn6" value="14:00"
									onclick="time_btn(this.id)">14:00~14:30</a> <a
									class="btn btn-default" id="time_btn7" value="14:30"
									onclick="time_btn(this.id)">14:30~15:00</a> <a
									class="btn btn-default" id="time_btn8" value="15:00"
									onclick="time_btn(this.id)">15:00~15:30</a> <a
									class="btn btn-default" id="time_btn9" value="15:30"
									onclick="time_btn(this.id)">15:30~16:00</a> <a
									class="btn btn-default" id="time_btn10" value="16:00"
									onclick="time_btn(this.id)">16:00~16:30</a> <a
									class="btn btn-default" id="time_btn11" value="16:30"
									onclick="time_btn(this.id)">16:30~17:00</a> <a
									class="btn btn-default" id="time_btn12" value="17:00"
									onclick="time_btn(this.id)">17:00~17:30</a> <a
									class="btn btn-default" id="time_btn13" value="17:30"
									onclick="time_btn(this.id)">17:30~18:00</a> <a
									class="btn btn-default" id="time_btn14" value="18:00"
									onclick="time_btn(this.id)">18:00~18:30</a> <a
									class="btn btn-default" id="time_btn15" value="18:30"
									onclick="time_btn(this.id)">18:30~19:00</a> <a
									class="btn btn-default" id="time_btn16" value="19:00"
									onclick="time_btn(this.id)">19:00~19:30</a> <a
									class="btn btn-default" id="time_btn17" value="19:30"
									onclick="time_btn(this.id)">19:30~20:00</a> <a
									class="btn btn-default" id="time_btn18" value="20:00"
									onclick="time_btn(this.id)">20:00~20:30</a> <a
									class="btn btn-default" id="time_btn19" value="20:30"
									onclick="time_btn(this.id)">20:30~21:00</a> <a
									class="btn btn-default" id="time_btn20" value="21:00"
									onclick="time_btn(this.id)">21:00~21:30</a>
							</div>
							<input type="button" id="time_btn" value="확인"
								onclick="timeForm_click()" disabled> <br>
							<br>
							<br>
						</div>
					</div>
					<div class="col-md-4 well well-lg" id="member_div">
						<div width="100%">
							<H3>Step4. 동반회원 추가</H3>
							<div id="myList">
								<input id="member1" type="text" name="member1" disabled><input
									id="m_search_btn1" type="button" value="검색" disabled> <br>
							</div>
							<input id="addbtn" class="addbtn" type="button" value="+"
								onclick="addbtnFunc()" disabled> <input type="button"
								id="member_confirm" value="확인" onclick="m_confirm_btn()"
								disabled>
						</div>
					</div>

					<div class="col-md-4 well well-lg" id="info_div">
						<h3>
							Step5.
							<%=sUser.getM_name()%>님의 최종 예약정보
						</h3>
						<ul>
							<li id="selected_seat">좌석 : <%=inserted_s_no == null ? "" : inserted_s_no%></li>
							<li id="selected_date">날짜 : <%=inserted_s_no == null ? "" : inserted_s_no%></li>
							<li id="selected_time">시간 : <%=inserted_s_no == null ? "" : inserted_s_no + "~" + inserted_s_no == null ? "" : inserted_s_no%></li>
							<li id="selected_members">인원 : <%=inserted_s_no == null ? "" : inserted_s_no%></li>
						</ul>
						<input type="button" value="아이템 사용하기" method="post"  id="r_action"
							onclick="r_action_func()" disabled>
					</div>

				</div>
				<!-- row2 -->



				<form name="seat_form" method="post">
					<input type="hidden" name="m_no"> <input type="hidden"
						name="s_no"> <input type="hidden" name="r_date"> <input
						type="hidden" name="s_time"> <input type="hidden"
						name="e_time"> <input type="hidden" name="mlist">
				</form>


			</div>
		</div>

	</div>

</div>






<script>
	var timearray = [];

	function time_btn(id) {
		var btn = document.getElementById(id);
		if (timearray.length > 3) {
			alert('2시간 이상 예약할 수 없습니다.');
			return;
		}
		timearray.push(id);
		console.log(timearray);
		if (btn.classList.contains('btn-default')) {
			btn.classList.remove('btn-default');
			btn.classList.add('btn-danger');
		}
	}

	Date.prototype.toDateInputValue = (function() {
		var local = new Date(this);
		local.setMinutes(this.getMinutes() - this.getTimezoneOffset());
		return local.toJSON().slice(0, 10);
	});

	function object_click(evt) {
		var svg_object = evt.target;
		console.log(svg_object);
		if (svg_object.getAttribute("fill") == "rgb(119, 144, 174)") {
			var val = confirm("아이템을 사용하시겠습니까?");
			if(val == true){
				alert('아이템을 사용합니다.');
				svg_object.setAttribute("fill","rgb(168, 65, 145)");
			}else{
				return;
			}
		} else {
			alert("날짜를 선택하세요.");

			document.getElementById("seat_div").style.backgroundColor = "";
			document.getElementById("date_div").style.backgroundColor = "rgb(231, 144, 174)";

			//좌석 선택 정보 보여주기
			var selected_seat = document.getElementById("selected_seat");
			svg_object.style.fill = "red";
			document.getElementById("f10svg").style.cursor = "no-drop";

			selected_seat.innerHTML = "좌석 : " + svg_object.getAttribute("id");
			document.getElementById("date").disabled = false;
			document.getElementById("date_btn").disabled = false;

			document.getElementById('date').focus();
			document.getElementById('date').value = new Date()
					.toDateInputValue();
			console.log(new Date().toDateInputValue());

			seat_form.s_no.setAttribute("value", svg_object.getAttribute("id"));
			var s_no = svg_object.getAttribute("id");
			document.getElementById("s_img").setAttribute("src",
					"../img/s_no" + s_no + ".jpg");
		}

	}

	function dateForm_click() {
		//날짜 선택

		document.getElementById("date_div").style.backgroundColor = "";
		document.getElementById("time_div").style.backgroundColor = "rgb(231, 144, 174)";

		alert("예약 시간을 선택하세요.");
		var date = document.getElementById("date");
		console.log(date.value);
		if (date.value == "") {
			alert("날짜를 선택하세요.");
			return;
		}
		var selected_date = document.getElementById("selected_date");
		selected_date.innerHTML = "날짜 : " + date.value;
		document.getElementById("date").disabled = true;
		document.getElementById("date_btn").disabled = true;

		document.getElementById("time_btn").disabled = false;

		//document.getElementById("s_time").focus();

		seat_form.r_date.setAttribute("value", date.value);
	}

	function timeForm_click() {
		//시간 form

		document.getElementById("time_div").style.backgroundColor = "";
		document.getElementById("member_div").style.backgroundColor = "rgb(231, 144, 174)";
		alert("함께 예약할 회원을 추가하세요.");

		console.log(timearray);

		var stime = document.getElementById(timearray[0]).getAttribute("value");//document.getElementById("s_time");
		var etime = document.getElementById(timearray[timearray.length - 1])
				.getAttribute("value");//document.getElementById("e_time");
		if (etime.slice(3, 4) == "3") {
			etime = (parseInt(etime.slice(0, 2)) + 1) + ":00";
		} else {
			etime = etime.slice(0, 3) + "30";
		}

		console.log(stime + " ~ " + etime);
		//console.log(s_time.value+" ~ "+e_time.value);
		/* if(s_time.value == "" || e_time.value == ""){
			alert("시간을 지정하세요.");
			return;
		} */
		var selected_time = document.getElementById("selected_time");
		selected_time.innerHTML = "시간 : " + stime + " ~ " + etime;
		document.getElementById("time_btn").disabled = true;

		document.getElementById("member1").disabled = false;
		document.getElementById("m_search_btn1").disabled = false;
		document.getElementById("addbtn").disabled = false;
		document.getElementById("member_confirm").disabled = false;

		document.getElementById("member1").focus();

		seat_form.s_time.setAttribute("value", stime);
		seat_form.e_time.setAttribute("value", etime);
	}

	function addbtnFunc() {
		//회원 추가 버튼
		var c = document.getElementById("myList").childElementCount;

		if (c > 9) {
			$("#addbtn").remove();
		}
		console.log(c);

		var node = document.createElement("input");
		node.setAttribute("type", "text");
		node.setAttribute("name", "member" + ((c / 3) + 1));
		node.setAttribute("id", "member" + ((c / 3) + 1));

		var btn = document.createElement("input");
		btn.setAttribute("id", "member_text" + ((c / 3) + 1))
		btn.setAttribute("type", "button");
		btn.setAttribute("value", "검색");
		btn.setAttribute("onclick", "m_search_func(" + btn + ")");

		var br = document.createElement("br");

		document.getElementById("myList").appendChild(node);
		document.getElementById("myList").appendChild(btn);
		document.getElementById("myList").appendChild(br);
	}

	function m_confirm_btn() {
		var m_list = "";
		for (var i = 1; i <= (document.getElementById("myList").childElementCount) / 3; i++) {
			if (document.getElementById("member" + i).value == "") {
				alert(i + "번째 빈칸을 채워주세요.");
				return;
			}
			m_list = m_list + "," + document.getElementById("member" + i).value;
		}

		document.getElementById("member_div").style.backgroundColor = "";
		document.getElementById("info_div").style.backgroundColor = "rgb(231, 144, 174)";

		alert("예약정보를 확인하고 최종 예약을 해주세요.");
		var selected_members = document.getElementById("selected_members");
		selected_members.innerHTML = "인원 : "
				+ (((document.getElementById("myList").childElementCount) / 3) + 1);
		document.getElementById("r_action").disabled = false;
		document.getElementById("r_action").focus();

		seat_form.mlist.setAttribute("value", m_list);
	}

	function m_search_func() {
		
	}

	function r_action_func() {
		seat_form.m_no.setAttribute("value",<%=sUser.getM_no()%>);

		console.log("submit 실행");

		seat_form.action = "../Item/item_use_action.jsp";
		seat_form.method = "post";
		seat_form.submit();
	}
</script>



<!-- 하단 -->
<%@include file="../include_common_footer.jsp"%>

</body>
</html>