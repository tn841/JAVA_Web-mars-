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
     * 1. ȸ�� ����
     */
	public int create(Member member)throws Exception,ExistedUserException{
		/*
		 * 1-1: ȸ�� ���Խ� �ߺ��� ���̵��� ��� ȸ������ �Ұ�
		 */
		
		if(md.existedId(member.getM_id())){
			throw new ExistedUserException(member.getM_id()+" �� �̹� �����ϴ� ���̵��Դϴ�.");
		}
		
		int result=md.create(member);
		return result;
	}
	
	/*
	 * 2. �α��� ����
	 */
	public Member login(String memberId,String password)throws Exception,UserNotFoundException,PasswordMismatchException{
	
		/*
		 * 2-1: �α��� �� ���̵� ������ �α��� �Ұ�
		 */
		Member findMember=md.findMember(memberId);
		if(findMember==null){
			throw new UserNotFoundException(memberId+" �� ���������ʴ� ���̵��Դϴ�."); 
		}
		
		/*
		 * 2-2: ���̵�� �н����� ����ġ �� 
		 */
		if(!findMember.isMatchPassword(password)){
			throw new PasswordMismatchException("�н����尡 ��ġ�����ʽ��ϴ�.");
		}
		return findMember;
		
	}
	
	/*
	 *3. ��ü ȸ�� ���� 
	 */
	
	public List<Member> findMemberList()throws Exception{
		return md.findMemberList();
	}
	
	
	/*
	 * 4. ���̵�� ȸ�� ã��
	 */
	public Member findMember(String memberId) throws Exception{
		Member findMember=md.findMember(memberId);
		return findMember;
		
	}
	
	/*
	 * 5. ȸ�� ����
	 */
	public int remove(String memberId)throws Exception{
		return md.remove(memberId);
	}
	
	/*
	 * 6. ȸ������ ����
	 */
	public int update(Member updateMember)throws Exception{
		return md.update(updateMember);
	}
	
	/*
	 * 7.����Ʈ 
	 */
	public void modifyPoint(int m_no, int m_point) throws Exception {
		Member mb = md.findMemberByNo(m_no);
		mb.setM_point(mb.getM_point()+m_point);
		md.update(mb);
		
		
	}
	
 Member member = new Member(-97, "1", "2", "4", "4", "5", null, "4", "4", 100);
	
}
