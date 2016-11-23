<%@page import="com.itwill.user.MemberDaoService"%>
<%@page import="com.itwill.user.Member"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
    <% 
    String sUserId =  (String)session.getAttribute("sUserId");
    Member sUser = (Member)session.getAttribute("sUser");
    Member User = MemberDaoService.getInstance().findMember(sUserId);
    %>
    <img src="img/banner05.png" width="100%">
<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="main.jsp"><img src="img/logo.JPG" style="margin-top: -28px;
"></a>
    </div>
    <ul class="nav navbar-nav">
      <li class='<%=request.getRequestURI().contains("main") ? "active" : "" %>'><a href="main.jsp">메인</a></li>
      <li class='<%=request.getRequestURI().contains("reserve") ? "active" : "" %>'><a href="reservation/seat_reserve_view.jsp">예약</a></li>
      <li class='<%=request.getRequestURI().contains("board") ? "active" : "" %>'><a href="Board/board_list.jsp">게시판</a></li> 
      <li class='<%=request.getRequestURI().contains("cart") ? "active" : "" %>'><a href="cart/shop_view_cart.jsp">장바구니</a></li> 
      <li class='<%=request.getRequestURI().contains("item") ? "active" : "" %>'><a href="Item/item_list.jsp">아이템 구입</a></li> 
    </ul>
    <%if(sUserId!=null) {
    	
     %>
    <ul class="nav navbar-nav navbar-right">
      <li><a href=""><span class="glyphicon glyphicon-user"></span><%=sUserId+"님 환영합니다 현재 포인트는"%><span class="badge"><%=User.getM_point()%></span>입니다</a></li>
      <li><a href="User/user_modify_form.jsp"><span class="glyphicon glyphicon-user"></span>마이페이지</a></li>
      <li><a href="User/user_logout_action.jsp"><span class="glyphicon glyphicon-log-in"></span>로그아웃</a></li>
    </ul>
    <% }else{
            %>    	
      <ul class="nav navbar-nav navbar-right">
      <li><a href="User/user_write_form.jsp"><span class="glyphicon glyphicon-user"></span> 회원가입</a></li>
      <li><a href="User/user_login_form.jsp"><span class="glyphicon glyphicon-log-in"></span> 로그인</a></li>
    </ul>
    
    <% 
    } 
    %>
  </div>
</nav>

