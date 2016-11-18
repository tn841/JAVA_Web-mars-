<%@page import="java.util.ArrayList"%>
<%@page import="com.itwill.reservation.ReservationService"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!-- <head> -->
<%@include file="include_head.jsp"%>


<!-- 상단 메뉴 바 -->
<%@include file="include_common_header.jsp"%>

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
				
				<table  class="table table-bordered">
					<tr>
						<td colspan="3">
							<div width="100%" style="background-color:pink"> 
								<svg class="container" xmlns="http://www.w3.org/2000/svg"
									xmlns:xlink="http://www.w3.org/1999/xlink" width="400px"
									height="300px" viewBox="0 0 400 300"
									preserveAspectRatio="xMidYMid meet">
								<rect id="svgEditorBackground" x="0" y="0" width="400" height="300"
									style="fill: none; stroke: none;" />
								<rect x="17.1111" y="53.1111" stroke="black" id="e1_rectangle"
									style="stroke-width: 1px;" width="86" height="165" fill="khaki" rx="0"
									ry="0" />
								<rect x="106.11109924318907" y="53.11109924321093" stroke="black"
									id="e124_rectangle" style="stroke-width: 1px;" width="86" height="165"
									fill="khaki" rx="0" ry="0" />
								<rect x="195.11109924318907" y="53.111099243210944" stroke="black"
									id="e136_rectangle" style="stroke-width: 1px;" width="86" height="165"
									fill="khaki" rx="0" ry="0" />
								<rect x="284.1110839844" y="53.111099243210944" stroke="black"
									id="e208_rectangle" style="stroke-width: 1px;" width="86" height="165"
									fill="khaki" rx="0" ry="0" /></svg>
				 			</div>
			 			</td>
					</tr>
					<tr>
						<td>
							<div width="100%" style="background-color:orange"> <br><br><br>날짜<br><br><br> </div>
						</td>
						<td>
							<div width="100%" style="background-color:cyan"> <br><br><br>시간<br><br><br> </div>
						</td>
						<td>
							<div width="100%" style="background-color:silver"> <br><br><br>회원<br><br><br> </div>
						</td>
					</tr>
					
				</table>
				
			</div>
			<div role="tabpanel" class="tab-pane active" id="15floor">
				<br>
				<table  class="table table-bordered">
					<tr>
						<td colspan="3"><div width="100%" style="background-color:pink"> <br><br><br>15층 좌석 이미지 영역<br><br><br> </div></td>
					</tr>
					<tr>
						<td>
							<div width="100%" style="background-color:orange"> <br><br><br>날짜<br><br><br> </div>
						</td>
						<td>
							<div width="100%" style="background-color:cyan"> <br><br><br>시간<br><br><br> </div>
						</td>
						<td>
							<div width="100%" style="background-color:silver"> <br><br><br>회원<br><br><br> </div>
						</td>
					</tr>
					
				</table>

			</div>
		</div>

	</div>

</div>

<!-- 하단 -->
<%@include file="include_common_footer.jsp"%>

</body>
</html>