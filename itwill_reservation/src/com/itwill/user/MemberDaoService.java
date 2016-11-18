package com.itwill.user;

import java.util.List;

public class MemberDaoService {

	/*
	 * Singleton
	 */
	private static MemberDaoService _instance;
	private MemberDao md;
	private MemberDaoService() {
		md=MemberDao.getInstance();
	}
	
	public static MemberDaoService getInstance() {
		if(_instance==null); {
			_instance = new MemberDaoService();
		}
		return _instance;
	}
	
	
    /*
     * 1. 회원 가입
     */
	public int create(Member member)throws Exception,ExistedUserException{
		/*
		 * 1-1: 회원 가입시 중복된 아이디의 경우 회원가입 불가
		 */
		
		if(md.existedId(member.getM_id())){
			throw new ExistedUserException(member.getM_id()+" 는 이미 존재하는 아이디입니다.");
		}
		
		int result=md.create(member);
		return result;
	}
	
	/*
	 * 2. 로그인 실행
	 */
	public Member login(String memberId,String password)throws Exception,UserNotFoundException,PasswordMismatchException{
	
		/*
		 * 2-1: 로그인 시 아이디 없으면 로그인 불가
		 */
		Member findMember=md.findMember(memberId);
		if(findMember==null){
			throw new UserNotFoundException(memberId+" 는 존재하지않는 아이디입니다."); 
		}
		
		/*
		 * 2-2: 아이디와 패스워드 불일치 시 
		 */
		if(!findMember.isMatchPassword(password)){
			throw new PasswordMismatchException("패스워드가 일치하지않습니다.");
		}
		return findMember;
		
	}
	
	/*
	 *3. 전체 회원 보기 
	 */
	
	public List<Member> findMemberList()throws Exception{
		return md.findMemberList();
	}
	
	
	/*
	 * 4. 아이디로 회원 찾기
	 */
	public Member findMember(String memberId) throws Exception{
		Member findMember=md.findMember(memberId);
		return findMember;
		
	}
	
	/*
	 * 5. 회원 삭제
	 */
	public int remove(String memberId)throws Exception{
		return md.remove(memberId);
	}
	
	/*
	 * 6. 회원정보 수정
	 */
	public int update(Member updateMember)throws Exception{
		return md.update(updateMember);
	}
	
	/*
	 * 7.포인트 
	 */
	public void modifyPoint(int m_no, int m_point) throws Exception {
		Member mb = md.findMemberByNo(m_no);
		mb.setM_point(mb.getM_point()+m_point);
		md.update(mb);
		
		
	}
	
 Member member = new Member(-97, "1", "2", "4", "4", "5", null, "4", "4", 100);
	
}
