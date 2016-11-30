package com.itwill.user;

import java.util.List;

/*
 * - 회원관리 비즈니스로직(예외처리,트랜젝션,보안,로깅)을 수행하는 클래스
 * - 웹콤포넌트(서블릿,JSP)에서 직접접근(메쏘드호출)하는 클래스
 * - Dao를 이용해서 데이타베이스를 조작작업하는 클래스
 */
public class UserService {
	
	/*
	 * SingleTon
	 */
	private static UserService _instance;
	
	private UserService(){
		System.out.println("생성된 객체 : "+this);
		this.userDao = UserDao.getUserDao();
	}
	
	public static UserService getInstance(){
		if(_instance == null){
			_instance = new UserService();
		}
		return _instance;
	}
	
	
	private UserDao userDao;
	
	/*
	 * 회원가입
	 */
	public int create(User user) throws Exception, ExistedUserException{
		/*
		 * 1. 아이디 존재 여부
		 */
		if(userDao.existedUser(user.getUserId())){
			//이미 존재하는 아이디-> 예외처리로 핸들링
			throw new ExistedUserException("["+user.getUserId()+"] 이미 존재하는 아이디 입니다.");
			
			//return code <-이것 보다 예외처리함으로써 세부정보를 알려줄수도 있고. 무튼 더 낫다.
		}
		
		/*
		 * 2. 회원가입
		 */
		int result = userDao.create(user);

		return result;
	}
	
	
	/*
	 * 로그인
	 */
	public User login(String userId, String pass) throws Exception{
		/*
		 * 1. 아이디 존재 여부
		 */
		User findUser = userDao.findUser(userId);
		if(findUser == null){
			throw new UserNotFoundException(userId+" 존재하지 않음.");
		}
		
		/*
		 * 2. 비번 일치 여부
		 */
		//System.out.println("비번 일치여부 체크 호출 직전");
		if(!findUser.isMatchPassword(pass)){
			throw new PasswordMismatchException("비밀번호가 일치하지 않음.");
		}
		
		return findUser;
	}
	
	/*
	 * 회원전체 list
	 */
	public List<User> findUserList() throws Exception{
		return userDao.findUserList();
	}
	
	/*
	 * 회원한명 보기
	 */
	public User findUserById(String id) throws Exception{
		return userDao.findUser(id);
	}
	
	/*
	 * 회원 삭제
	 */
	public boolean removeUserById(String id) throws Exception{
		boolean isRemoved = false;
		int rows = userDao.remove(id);
		if(rows > 0 ){
			isRemoved = true;
		}
		System.out.println("삭제된 행 : "+rows);
		return isRemoved;
	}
	
	/*
	 * 회원 업데이트
	 */
	public int updateUser(User user) throws Exception{
		int rows = userDao.update(user);
		return rows;
	}
}













