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

@WebServlet("/SendAudioServlet")
public class SendAudioContentServlet extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("audio/mpeg");
		
		OutputStream out = response.getOutputStream();	//이미지 데이터 전송을위해 PrintWriter대신 OutputStream사용
		
		String audioPath = "C:/GIT/JAVA_Web/servletSite/WebContent/audio/001. TWICE -TT.mp3";

		FileInputStream fis = new FileInputStream(audioPath);	//서버에 있는 mp3파일을 읽는 FileInputStream
		
		/******
		 * 읽은 데이터를 동적으로 처리한 후에 변형된 파일을 클라이언트에 전송할 수 도 있다.
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
