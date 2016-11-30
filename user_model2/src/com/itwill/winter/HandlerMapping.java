package com.itwill.winter;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Properties;
import java.util.Set;

public class HandlerMapping {
	/*
	 * ��������(*.properties)�� �̿��Ͽ� 
	 * Controller ��ü ���� �� ����, �������ִ� ��ü
	 */
	
	private HashMap<String, Controller> controllerMap;
	

	public HandlerMapping(String propertiesPath) {
		/*
		 * controller_mapping.properties ������ �о
		 * controllerMap��ü�� �����ϴ��۾�
		 */
		//System.out.println(">>>> controller_mapping.properties ������ �о controllerMap��ü�� �����ϴ��۾�");
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
				Class controllerClass = Class.forName(prop.getProperty(keyVal));	//Ŭ���� ��ü�� ������
				Controller controller = (Controller) controllerClass.newInstance();	//������ Ŭ������ �⺻ ������ ȣ��, Ŭ���� ������ �������� �߻����� �ʴ´�.
				
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
