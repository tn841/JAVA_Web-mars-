package com.itwill.i18n;

import java.util.Locale;
import java.util.ResourceBundle;

public class InternationalizationMain {

	public static void main(String[] args) {
		Locale currentLocale = Locale.getDefault();
		String language = currentLocale.getLanguage();
		String contury = currentLocale.getCountry();
		System.out.println(contury+"_"+language);
		
		Locale usLocale = new Locale("en", "US");
		Locale jpLocale = new Locale("ja", "JP");
		Locale krLocale = new Locale("ko", "KR");
		Locale cnLocale = new Locale("zh", "CN");
		
		
		/*
		 * Locale정보를 이용해서
		 * guest.properties 중 하나를 읽어서
		 * ResourceBundle객체 생성
		 */
		ResourceBundle bundle = ResourceBundle.getBundle("com/itwill/i18n/guest",jpLocale            );
		System.out.println(bundle.getString("title.main"));
		System.out.println(bundle.getString("title.list"));
		System.out.println(bundle.getString("title.view"));
		System.out.println(bundle.getString("title.write"));
	}

}
