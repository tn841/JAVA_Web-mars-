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
		
		OutputStream out = response.getOutputStream();	//�̹��� ������ ���������� PrintWriter��� OutputStream���
		
		String audioPath = "C:/GIT/JAVA_Web/servletSite/WebContent/audio/001. TWICE -TT.mp3";

		FileInputStream fis = new FileInputStream(audioPath);	//������ �ִ� mp3������ �д� FileInputStream
		
		/******
		 * ���� �����͸� �������� ó���� �Ŀ� ������ ������ Ŭ���̾�Ʈ�� ������ �� �� �ִ�.
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
