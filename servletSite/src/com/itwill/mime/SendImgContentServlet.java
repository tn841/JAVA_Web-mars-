package com.itwill.mime;

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/SendImgServlet")
public class SendImgContentServlet extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("image/jpeg");
		
		OutputStream out = response.getOutputStream();	//이미지 데이터 전송을위해 PrintWriter대신 OutputStream사용
		
		String imgPath = "C:/GIT/JAVA_Web/servletSite/WebContent/img/img.JPG";

		FileInputStream fis = new FileInputStream(imgPath);	//서버에 있는 이미지를 읽는 FileInputStream
		
		/******
		 * 읽은 이미지를 동적으로 처리한 후에 변형된 파일을 클라이언트에 전송할 수 도 있다.
		 */
		
		while(true){
			int readByte = fis.read();
			if(readByte == -1){
				break;
			}
			out.write(readByte);
		}
		
		
		
	}
}
