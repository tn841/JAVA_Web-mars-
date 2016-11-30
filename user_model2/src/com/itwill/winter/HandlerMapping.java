package com.itwill.winter;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Properties;
import java.util.Set;

public class HandlerMapping {
	/*
	 * 설정파일(*.properties)을 이용하여 
	 * Controller 객체 생성 및 유지, 관리해주는 객체
	 */
	
	private HashMap<String, Controller> controllerMap;
	

	public HandlerMapping(String propertiesPath) {
		/*
		 * controller_mapping.properties 파일을 읽어서
		 * controllerMap객체를 생성하는작업
		 */
		//System.out.println(">>>> controller_mapping.properties 파일을 읽어서 controllerMap객체를 생성하는작업");
		controllerMap = new HashMap<String, Controller>();
		
		try {
			FileInputStream in = new FileInputStream(propertiesPath);
			Properties prop = new Properties();
			prop.load(in);
			
			Set urikeySet = prop.keySet();
			
			Iterator uriKeyIter = urikeySet.iterator();
		
			while(uriKeyIter.hasNext()){
				String keyVal = (String) uriKeyIter.next();
				System.out.print(keyVal+"=");
				System.out.println(prop.getProperty(keyVal));
				Class controllerClass = Class.forName(prop.getProperty(keyVal));	//클래스 자체를 가져옴
				Controller controller = (Controller) controllerClass.newInstance();	//가져온 클래스의 기본 생성자 호출, 클래스 생성에 의존성이 발생하지 않는다.
				
				controllerMap.put(keyVal, controller);
			}
					
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public Controller getControllerMap(String command) {
		return controllerMap.get(command);
	}


}
