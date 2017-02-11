<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String user_id=(String)session.getAttribute("user_id");
	boolean isLogin = false;
	if(user_id!=null){
		isLogin=true;
	}
%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko_KR">
	<head>
		<title>WELCOM TO JQUERY</title>
		<meta http-equiv="Content-type" content="text/html; charset=utf-8" />
		<link rel="stylesheet" href="style.css" />
		<link rel="stylesheet" href="guest.css" type="text/css" media="screen" />
		<style type="text/css">
			input.error, textarea.error {
				border: 1px solid red;
			}
			label.error {
				margin-left: 10px;
				color: green;
			}
		</style>
		<script src="./js/jquery-1.11.1.js" type="text/javascript"></script>
		<script src="./js/jquery.validate.js" type="text/javascript"></script>
		<script src="./js/messages_ko.js" type="text/javascript"></script>
		<!--
		<script src="guest.js" type="text/javascript"></script>
		-->
		<script type="text/javascript">
			/***1.guest_list[HTML]****/
			function guest_list_html_function() {
				/*
				 * .load()
				 */
				$('#guest_list').load('guest/guest_list_html.jsp', function() {
				});
			}

			/***4.guest_insert_form[HTML]****/
			function guest_insert_form_load_function() {
				/*
				 * .load()
				 */
				$('#guest_list').load('guest_insert_form.html', function() {
				});
			}

			/***2.guest_list[JSON]****/
			function guest_list_json_function() {
				/*
				 * $.get();
				 * $.post();
				 */
				var url = 'guest/guest_list_json.jsp';

				$.post(url, {
					v1 : 'param1',
					v2 : 'param2'
				}, function(data, textStatus, jqXHR) {
					/*
					 [
					 {
					 guest_no: "1",
					 guest_name: "김경호1",
					 guest_date: "2016-12-30",
					 guest_email: "guard1@naver.com",
					 guest_title: "방명록 사용법1",
					 guest_content: "방명록처럼 사용하시면 됩니다1"
					 }...
					 ]
					 <div class="guest_item">
					 <h3 class="guest_title"  guest_no="1">방명록 사용법1[HTML]</h3>
					 </div>
					 */
					var html = "";
					for (var i = 0; i < data.length; i++) {
						html += " <div class='guest_item'>";
						html += " <h3 class='guest_title' guest_no='" + data[i].guest_no + "'>" + data[i].guest_title + "[JSON]</h3>";
						html += " </div>";
					}
					$('#guest_list').html(html);

				}, 'json');
			}

			/***3.guest_list[XML]****/
			function guest_list_xml_function() {
				var url = 'guest/guest_list_xml.jsp';
				$.ajax({
					url : url,
					method : 'GET',
					data : {
						v1 : 'param1',
						v2 : 'param2'
					},
					dataType : 'xml',
					success : function(xmlDoc, statusText, jqXHR) {
						var html = "";
						/*
						 <guest_list>
						 <guest>
						 <guest_no>1</guest_no>
						 <guest_name>김경호1</guest_name>
						 <guest_date>2016-12-30 14:26:45</guest_date>
						 <guest_email>guard1@naver.com</guest_email>
						 <guest_homepage>http://</guest_homepage>
						 <guest_title>방명록 사용법1</guest_title>
						 <guest_content>방명록처럼 사용하시면 됩니다1</guest_content>
						 </guest>
						 ...
						 </guest_list>
						 */
						var $jqXmlDoc = $(xmlDoc);
						var html = "";
						$jqXmlDoc.find('guest').each(function(index, guestE) {
							var guest_noStr = $(guestE).find('guest_no').text();
							var guest_titleStr = $(guestE).find('guest_title').text();
							html += " <div class='guest_item'>";
							html += " <h3 class='guest_title' guest_no='" + guest_noStr + "'>" + guest_titleStr + "[XML]</h3>";
							html += " </div>";
						});
						$('#guest_list').html(html);
					},
					error : function() {
						alert('guest_list_xml.jsp -->error');
					}
				});
			}

			/******* 5.방명록상세보기[HTML] **********/
			function guest_detail_html_function(e) {
				
				var url = "guest/guest_detail_html.jsp";
				var h3E = e.target;
				var $h3E = $(h3E);
				var guest_noStr = $h3E.attr('guest_no');
				if ($h3E.parent().children().length > 1) {
					$h3E.siblings().slideToggle({
						dutarion : 500
					});
				} else {
					$.ajax({
						url : url,
						method : 'POST',
						data : {
							guest_no : guest_noStr
						},
						dataType : 'html',
						success : function(htmlData) {
							$h3E.parent().append(htmlData);
							$h3E.siblings().slideToggle({
								dutarion : 500
							});
						},
						error : function() {
						}
					});
				}
			}

			/******* 5.방명록상세보기[JSON] **********/
			function guest_detail_json_function(e) {
			}

			/******* 5.방명록상세보기[XML] **********/
			function guest_detail_xml_function(e) {
			}

			/********6.방명록쓰기************/
			function guest_insert_action_function() {
				$.ajax({
					url : 'guest/guest_insert_action.jsp',
					method : 'POST',
					data : $('#guest_write_form').serialize(),
					dataType : 'text',
					success : function(data) {
						if (data.trim() == 'true') {
							guest_list_html_function();
						} else {
							//insert 실패
							alert('insert error!!!');
						}
					},
					error : function() {
						alert('ajax error!!!');
					}
				});
			}

			/********6.방명록쓰기[validation plugin]************/
			//jquery plugin==> https://jqueryvalidation.org/
			function guest_insert_action_validation_function() {
				/*<< .validate() >>
				 * 1. DOM tree loading시 미리 호출되어있어야한다.(이벤트...)
				 * 2. DOM Node 가 Inert 될때 호출(event)
				 */
				$('#guest_write_form').validate({
					rules : {
						guest_name : {
							required : true,
							minlength : 2,
							maxlength : 5
						},
						guest_title : {
							required : true
						},
						guest_content : {
							required : true,
							minlength : 6
						},
						guest_homepage : {
							required : true,
							url : true
						},
						guest_email : {
							required : true,
							email : true,
							remote : {
								url : 'guest/guest_email_check.jsp',
								type : 'GET',
								data : {
									guest_email :function(){
													return $('#guest_email').val();
												 }	
								}
							}
						}

					},
					messages : {
						/*
						guest_name : {
							required : '이름을 입력하세요',
							minlength : '{0} 글자이상입니다',
							maxlength : '{0} 글자이하입니다'
						},
						guest_title : {
							required : '제목을 입력하세요'
						},
						guest_content : {
							required : '내용을 입력하세요',
							minlength : '{0} 글자이상입니다'
						},
						*/
						guest_homepage : {
							required : '홈페이지를 입력하세요',
							url : '홈페이지 형식이 틀립니다'
						},
						guest_email : {
							required : '이메일을 입력하세요',
							email : '이메일 형식이 틀립니다',
							
							//remote : '중복된 이메일 입니다.'
							
							remote : $.validator.format('{0} 은 이미사용중인 이메일 입니다')
						}
					},
					submitHandler : function(formE) {
						//alert('ajax request');
						
						guest_insert_action_function();
					}
				});
			}
			/********7.로그인************/
			function guest_login_action_function(){
				$.ajax({
					url:'guest/guest_login_action.jsp',
					method:'POST',
					data:$('#guest_login_form').serialize(),
					dataType:'text',
					success:function(data){
						if(data.trim()=='success'){
							//login 성공
							/*
							$('#guest_login_form').slideUp();
							$('#guest_logout_form').slideDown();
							
							$('#guest_logout_form #idSpan')
								.html($('#guest_login_form #guest_id').val());
							*/
							//form reset
							$('#guest_login_form')[0].reset();
							//dom tree reload
							location.reload();
							
						}else if(data.trim()=='fail'){
							//login 실패
							$('#msg').html('로그인실패').css('color','red');
						}
					},
					error:function(){
						alert('ajax error!!!');
					}
					
					
				});
			}
			/********8.로그아웃************/
			function guest_logout_action_function(){
				$.ajax({
					url:'guest/guest_logout_action.jsp',
					method:'POST',
					success:function(){
						/*
						$('#guest_logout_form').slideUp();
						$('#guest_login_form').slideDown();
						*/
						//dom tree reload
						location.reload();
					},
					error:function(){
						
					}
					
				});
				
			}
			/*************login여부체크************************/
			function login_check(){
				var jsonResult=null;
				/********동기실행*********/
				$.ajax({
					async:false,
					url:'guest/guest_session_check.jsp',
					method:'POST',
					dataType:'json',
					success:function(data){
						jsonResult=data;
					}	
				});
				
				return jsonResult;
			}
			/*********로그인여부에따라 UI 보여주는 함수*******/
			
			
			
			/*######################################################*/
			$(function() {
				
				
				/******* 메뉴이벤트처리 **********/
				if(login_check().status=='success'){
					//로그인 한상태
					/***1.guest_list[HTML]****/
					$('#menu-a a').click(function(e) {
						guest_list_html_function();
						e.preventDefault();
					});
					/***2.guest_list[JSON]****/
					$('#menu-b a').click(function(e) {
						guest_list_json_function();
						e.preventDefault();
					});
					/***3.guest_list[XML]****/
					$('#menu-c a').click(function(e) {
						guest_list_xml_function();
						e.preventDefault();
					});
					/******* 5.방명록상세보기이벤트처리 **********/
					$(document).on('click', '.guest_title', function(e) {
						guest_detail_html_function(e);
						//guest_detail_json_function();
						//guest_detail_xml_function();
					});
				}else if(login_check().status.trim()=='fail'){
					//로그인 안한경우
					$('#menu-a a,#menu-b a,#menu-c a,.guest_title').click(function(e){
						alert('로그인하세요!!!');
						e.preventDefault();
					});
				}	
				/***4.guest_insert_form[HTML]****/
				$('#menu-d a').click(function(e) {
					guest_insert_form_load_function();
					e.preventDefault();
				});
				
				/********6.방명록쓰기폼 이벤트처리***********
				 $(document).on('submit','#guest_write_form',function(e){
				 guest_insert_action_function();
				 e.preventDefault();
				 });
				 */
				/********6.방명록쓰기폼 이벤트처리(validation)************/
				$(document).on('DOMNodeInserted', '#guest_write_form', function() {
					/*
					 * DOM Node insert시에 form.validate()호출
					 */
					guest_insert_action_validation_function();
				})
				/********7.로그인폼 이벤트처리************/
				$(document).on('submit','#guest_login_form',function(e){
					guest_login_action_function();
					e.preventDefault();
				});
				/********8.로그아웃폼 이벤트처리************/
				$(document).on('click','#guest_logout_form a',function(e){
					guest_logout_action_function();
					e.preventDefault();
				});
				
				

			});
			/*######################################################*/
			/**************ajax global event handler**********/
			$(document).ajaxStart(function() {
				$("<div id='loading'>loading...</div>").insertBefore('#guest_list').show();
			});
			$(document).ajaxComplete(function() {
				$('#loading').hide();
				$('#loading').remove();
			});
			$(document).ajaxSuccess(function(event, xhr, settings) {

			});
			$(document).ajaxError(function(event, xhr, settings, thrownError) {
				alert('ajax error!!!');
			});

		</script>
	</head>
	<body>
		<div id="container">
			<div id="header">
				<h1>WELCOM TO JQUERY</h1>
			</div>
			<div id="sidebar">

				<h2>회원관리메뉴</h2>
				<div class="menus">
					<div class="menu" id="menu-a">
						<h3><a href="test.jsp">방명록 리스트[html]</a></h3>
					</div>
					<div class="menu" id="menu-b">
						<h3><a href="#">방명록 리스트[json]</a></h3>
					</div>
					<div class="menu" id="menu-c">
						<h3><a href="#">방명록 리스트[xml]</a></h3>
					</div>
					<div class="menu" id="menu-d">
						<h3><a href="sddsds.jsp">방명록 쓰기</a></h3>
					</div>
					<%if(!isLogin){ %>
					<form id="guest_login_form" method="get" action="vfbfcv">
						<fieldset>
							<legend>
								로그인
							</legend>
							<p>
								<label for="guest_id">아이디:</label>
								<input type="text"
								id="guest_id" name="guest_id" />
							</p>
							<p>
								<label for="guest_pass">패쓰워드:</label>
								<input type="text"
								name="guest_pass" id="guest_pass" />
							</p>
							<p>
								<input type="submit" name="write" value="로그인" id="write" />
								<input type="reset" name="cancle" value="취소" id="cancle" />

							</p>
							<div id="msg"></div>
						</fieldset>
					</form>
					<%}else{%>
					<form id="guest_logout_form">
						<div>
							<span id="idSpan"><%=user_id%></span>님 로그인
							<br/>
							<a href='#'>로그아웃</a>
						</div>
					</form>
					<%}%>
				</div>
			</div>
			<div id="content">
				<div id="guest_list"></div>
			</div>
			<div id="footer">
				<p>
					This page was built for jquery demonstration purposes.
				</p>
			</div>

		</div>

	</body>
</html>
