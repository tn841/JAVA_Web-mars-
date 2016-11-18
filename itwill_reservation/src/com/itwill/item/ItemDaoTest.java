package com.itwill.item;

import java.util.ArrayList;

public class ItemDaoTest {

	public static void main(String[] args) {
		ItemDao.getInstance();
		Item item = new Item(5,"자리바꾸기2",50,"이미지경로","자리바꾸기2");
		try {
			
			boolean isSuccess=ItemDao.getInstance().createItem(item);
			System.out.println("1.인선트 성공??:"+isSuccess);
			
			System.out.println("2. 번호로 하나 찾기 성공??:"+ItemDao.getInstance().findItem(20));
			isSuccess=ItemDao.getInstance().removeItem(20);
			System.out.println("3. 삭제성공??:"+isSuccess);
			 
			ArrayList<Item> itemList =ItemDao.getInstance().findItemList(1, 4);
			for (Item item2 : itemList) {
				System.out.println("4. 전체출력:"+item2);
			}
			Item item3 = new Item(0, "자리빼앗기", 100, "이미지겅로", "자리빼앗기");
			isSuccess=ItemDao.getInstance().updateItem(item3);
			System.out.println("5. 수정하기성공?:"+isSuccess);
			
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}

}
