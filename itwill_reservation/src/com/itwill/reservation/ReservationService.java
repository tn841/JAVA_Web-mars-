package com.itwill.reservation;

import java.util.ArrayList;
import java.util.HashMap;

import com.itwill.user.Member;

public class ReservationService {
	/*
	 * 1. 모든 좌석의 예약 정보 출력
	 */
	public ArrayList<String> selectAllSeat() throws Exception{
		ArrayList<String> reservedSeatList = new ArrayList<String>();
		ReservationDao rDao = ReservationDao.getInstance();
		return rDao.selectAllSeat();
	}
	
	/*
	 * 2. 특정 사용자의 예약정보 출력
	 */
	public ArrayList<HashMap<String, Object>> getR_by_MemberId(int m_no) throws Exception{
		ArrayList<HashMap<String, Object>> rlist = new ArrayList<HashMap<String, Object>>();
		ReservationDao rDao = ReservationDao.getInstance();
		rlist =  rDao.selectByRmno(m_no);
		if(rlist.size() >0){ 
			System.out.println(m_no+"번 회원의 예약 정보 : "+rlist.get(0));
		}else{
			System.out.println(m_no+"번 회원의 예약 정보를 가져오지 못함.. ");			
		}
		return rlist;
	}
	
	
	/*
	 * 3. 새로운 예약 추가 (동반 예약자 필수)
	 */
	public int createReservation(Reservation r){
		int result = 0;
		ArrayList<Member> mList = new ArrayList<Member>();
		int r_no = 0;
		
		mList = r.getMemberList();
		ReservationDao rDao = ReservationDao.getInstance();
		try{
			result = rDao.create(r);
			
			//새로 생성된 예약 번호를 갖고 와야한다.
			r_no = rDao.selectByRmnoNojoin(r.getR_m_no());
			System.out.println(r_no);
		
			
			result = result + rDao.insertRDetail(r_no, r.getR_m_no(), 1);
			for(Member m : mList){
				System.out.println("예약번호 : "+r_no+"   동반회원 정보 : "+m.getM_no());
				result = result + rDao.insertRDetail(r_no, m.getM_no(), 0);				
			}
			System.out.println("Dao에서 insert 3번 됬는지 확인 : "+result);
		}catch(Exception e){
			e.printStackTrace();
			return -1;
		}
		
		return result;
	}
	
	
	/*
	 * 4. 예약 시간 변경
	 */
	
	
	/*
	 * 5. 예약 자리 변경
	 */
	
	
	/*
	 * 6. 예약 취소
	 */
	public int deleteByRno(int r_no) throws Exception{
		ReservationDao rDao = ReservationDao.getInstance();
		return rDao.deleteByRno(r_no);
	}
	
	
	/*
	 * 7. 
	 */
}
