package com.itwill.reservation;

import java.util.ArrayList;
import java.util.HashMap;

import com.itwill.user.Member;

public class ReservationService {
	/*
	 * 1. ��� �¼��� ���� ���� ���
	 */
	public ArrayList<String> selectAllSeat() throws Exception{
		ArrayList<String> reservedSeatList = new ArrayList<String>();
		ReservationDao rDao = ReservationDao.getInstance();
		return rDao.selectAllSeat();
	}
	
	/*
	 * 2. Ư�� ������� �������� ���
	 */
	public ArrayList<HashMap<String, Object>> getR_by_MemberId(int m_no) throws Exception{
		ArrayList<HashMap<String, Object>> rlist = new ArrayList<HashMap<String, Object>>();
		ReservationDao rDao = ReservationDao.getInstance();
		rlist =  rDao.selectByRmno(m_no);
		if(rlist.size() >0){ 
			System.out.println(m_no+"�� ȸ���� ���� ���� : "+rlist.get(0));
		}else{
			System.out.println(m_no+"�� ȸ���� ���� ������ �������� ����.. ");			
		}
		return rlist;
	}
	
	
	/*
	 * 3. ���ο� ���� �߰� (���� ������ �ʼ�)
	 */
	public int createReservation(Reservation r){
		int result = 0;
		ArrayList<Member> mList = new ArrayList<Member>();
		int r_no = 0;
		
		mList = r.getMemberList();
		ReservationDao rDao = ReservationDao.getInstance();
		try{
			result = rDao.create(r);
			
			//���� ������ ���� ��ȣ�� ���� �;��Ѵ�.
			r_no = rDao.selectByRmnoNojoin(r.getR_m_no());
			System.out.println(r_no);
		
			
			result = result + rDao.insertRDetail(r_no, r.getR_m_no(), 1);
			for(Member m : mList){
				System.out.println("�����ȣ : "+r_no+"   ����ȸ�� ���� : "+m.getM_no());
				result = result + rDao.insertRDetail(r_no, m.getM_no(), 0);				
			}
			System.out.println("Dao���� insert 3�� ����� Ȯ�� : "+result);
		}catch(Exception e){
			e.printStackTrace();
			return -1;
		}
		
		return result;
	}
	
	
	/*
	 * 4. ���� �ð� ����
	 */
	
	
	/*
	 * 5. ���� �ڸ� ����
	 */
	
	
	/*
	 * 6. ���� ���
	 */
	public int deleteByRno(int r_no) throws Exception{
		ReservationDao rDao = ReservationDao.getInstance();
		return rDao.deleteByRno(r_no);
	}
	
	
	/*
	 * 7. 
	 */
}
