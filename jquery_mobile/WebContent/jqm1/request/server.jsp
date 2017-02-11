<%
  String name = request.getParameter("name");
  String description = request.getParameter("description");
%>
<div data-role="page">
  <div data-role="header">
    <h1>Form</h1>
  </div>
  <div data-role="content">
    <p>name : <strong><%=name %></strong><p>
    <p>description: <strong><%=description %></strong></p>
  </div>
</div>

