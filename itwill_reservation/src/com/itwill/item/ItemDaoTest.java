package com.itwill.item;

import java.util.ArrayList;

public class ItemDaoTest {

	public static void main(String[] args) {
		ItemDao.getInstance();
		Item item = new Item(5,"�ڸ��ٲٱ�2",50,"�̹������","�ڸ��ٲٱ�2");
		try {
			
			boolean isSuccess=ItemDao.getInstance().createItem(item);
			System.out.println("1.�μ�Ʈ ����??:"+isSuccess);
			
			System.out.println("2. ��ȣ�� �ϳ� ã�� ����??:"+ItemDao.getInstance().findItem(20));
			isSuccess=ItemDao.getInstance().removeItem(20);
			System.out.println("3. ��������??:"+isSuccess);
			 
			ArrayList<Item> itemList =ItemDao.getInstance().findItemList(1, 4);
			for (Item item2 : itemList) {
				System.out.println("4. ��ü���:"+item2);
			}
			Item item3 = new Item(0, "�ڸ����ѱ�", 100, "�̹����Ϸ�", "�ڸ����ѱ�");
			isSuccess=ItemDao.getInstance().updateItem(item3);
			System.out.println("5. �����ϱ⼺��?:"+isSuccess);
			
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}

}
