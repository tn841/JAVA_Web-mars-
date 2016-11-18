<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
    <% 
    String sUserId =  (String)session.getAttribute("sUserId");
    
    %>
<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#"><img src="img/logo.JPG" style="margin-top: -28px;
"></a>
    </div>
    <ul class="nav navbar-nav">
      <li class="active"><a href="#">����</a></li>
      <li><a href="seat_reserve_view.jsp">����</a></li>
      <li><a href="#">�Խ���</a></li> 
    </ul>
    <%if(sUserId!=null) {
    	
     %>
    <ul class="nav navbar-nav navbar-right">
      <li><a href=""><span class="glyphicon glyphicon-user"></span><%=sUserId+"�� ȯ���մϴ�"%></a></li>
      <li><a href="user_logout_action.jsp"><span class="glyphicon glyphicon-log-in"></span>�α׾ƿ�</a></li>
    </ul>
    <% }else{
            %>    	
      <ul class="nav navbar-nav navbar-right">
      <li><a href="user_write_form.jsp"><span class="glyphicon glyphicon-user"></span> ȸ������</a></li>
      <li><a href="user_login_form.jsp"><span class="glyphicon glyphicon-log-in"></span> �α���</a></li>
    </ul>
    
    <% 
    } 
    %>
  </div>
</nav>

