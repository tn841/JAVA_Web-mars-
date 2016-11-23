<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<!-- <head> -->
<%@include file="include_head.jsp"%>


<!-- 상단 메뉴 바 -->
<%@include file="include_common_header_main.jsp"%>

<!-- 컨텐츠 영역 -->

<div class="container">
	<img src="https://www.itwill.co.kr:47809/new/images/banner03.png"
		style="width: 100%;">

	<div class="row">
		<div class="col-sm-6 col-md-6">
			<div class="thumbnail">
				<img src="img/3in.jpg" alt="3인석">
				<div class="caption">
					<h2>3인석 사진</h2>
					<ul>
						<li><h4>혼자 밥먹는 것은 더이상 창피한 일이 아닙니다.</h4></li>
						<li><h4>친구를 구해 함께 3인석을 예약을 해보세요!</h4></li>
						<li><h4>친구가 없나요? 아래 친구 구하기 버튼을 눌러보세요!</h4></li>
					</ul>
					<p>
						<a href="reservation/seat_reserve_view.jsp"
							class="btn btn-primary" role="button">예약하러가기</a> <a href="Board/board_list.jsp"
							class="btn btn-default" role="button">친구구하러가기</a>
					</p>
				</div>
			</div>
		</div>
		<div class="col-sm-6 col-md-6">
			<div class="thumbnail">
				<img src="img/6in.jpg" alt="3인석">
				<div class="caption">
					<h2>6인석 사진</h2>
					<ul>
						<li><h4>친구들이 너무 많아 밥먹을 곳이 없나요?</h4></li>
						<li><h4>당신을 위해 쾌적한 6인석을 준비했습니다.</h4></li>
						<li><h4>화목한 분위기에서 고급스러운 식사를 즐겨보세요</h4></li>
					</ul>
					<p>
						<a href="reservation/seat_reserve_view.jsp" class="btn btn-primary" role="button">예약하러가기</a>
					</p>
				</div>
			</div>
		</div>
	</div>


</div>



<!-- 하단 -->
<%@include file="include_common_footer.jsp"%>

</body>
</html>