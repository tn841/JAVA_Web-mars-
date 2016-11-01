package com.itwill.method;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class LoginHW
 */
@WebServlet("/join.do")
public class joinServlet extends HttpServlet {
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=euc-kr");
		
		PrintWriter out = response.getWriter();
		/*
		 * 0. ��û��ü�� ���� ���ڵ�
		 */
		request.setCharacterEncoding("EUC-KR");
		
		/*
		 * 1. request �Ķ���� �ޱ�
		 */
		String id=request.getParameter("id");
		String pass=request.getParameter("pass");
		String name=request.getParameter("name");
		String[] hobby=request.getParameterValues("hobby");
		

		
		/*
		 * 2. ȸ������ ��� ����
		 */
		
		/*
		 * 3. �������
		 */
		int hobbyCount = 0;
		if(hobby != null){
			hobbyCount = hobby.length;
		}
		System.out.println("hobbyCount : "+hobbyCount);
		out.println("<h3 align='center'>�ߡߡ� ȸ������ �����ߡߡ�</h3><table cellspacing='1' cellpadding='5' align='center'>   "
				+ "<tr id='first-tr'>    "
				+ "<th bgcolor='44ff44'><font size='2'>���̵�</font></th>    "
				+ "<td bgcolor='white' width='300'>    "+id+"    </td>   "
				+ "</tr>   "
				+ "<tr>    <th bgcolor='44ff44'><font size='2'>��й�ȣ</font></th>    "
				+ "<td bgcolor='white' width='300'>    "+pass+"    </td>   "
				+ "</tr>   "
				+ "<tr>    <th bgcolor='44ff44'><font size='2'>�̸�</font></th>    "
				+ "<td bgcolor='white' width='300'>     "+name+"    </td>  "
				+ " </tr>   ");
		
			if(hobbyCount > 0 ){
				out.println("<tr >    <th bgcolor='44ff44' rowspan='"+  hobbyCount+"' >      <font size='2'>���</font> </th>    "
					+ "<td>"+hobby[0]+"</td>   </tr>");
				for(int i=1; i<hobbyCount; i++){
					out.println("<tr>   <td>"+hobby[i]+"</td></tr>");
				}
			}
				out.println("<th colspan='2' bgcolor='ff8888'>    <h3 align='center'>��������</h3>   </th>    </table>");
	}

}
