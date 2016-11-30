package com.itwill.user;

import java.util.List;

/*
 * - ȸ������ ����Ͻ�����(����ó��,Ʈ������,����,�α�)�� �����ϴ� Ŭ����
 * - ��������Ʈ(����,JSP)���� ��������(�޽��ȣ��)�ϴ� Ŭ����
 * - Dao�� �̿��ؼ� ����Ÿ���̽��� �����۾��ϴ� Ŭ����
 */
public class UserService {
	
	/*
	 * SingleTon
	 */
	private static UserService _instance;
	
	private UserService(){
		System.out.println("������ ��ü : "+this);
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
	 * ȸ������
	 */
	public int create(User user) throws Exception, ExistedUserException{
		/*
		 * 1. ���̵� ���� ����
		 */
		if(userDao.existedUser(user.getUserId())){
			//�̹� �����ϴ� ���̵�-> ����ó���� �ڵ鸵
			throw new ExistedUserException("["+user.getUserId()+"] �̹� �����ϴ� ���̵� �Դϴ�.");
			
			//return code <-�̰� ���� ����ó�������ν� ���������� �˷��ټ��� �ְ�. ��ư �� ����.
		}
		
		/*
		 * 2. ȸ������
		 */
		int result = userDao.create(user);

		return result;
	}
	
	
	/*
	 * �α���
	 */
	public User login(String userId, String pass) throws Exception{
		/*
		 * 1. ���̵� ���� ����
		 */
		User findUser = userDao.findUser(userId);
		if(findUser == null){
			throw new UserNotFoundException(userId+" �������� ����.");
		}
		
		/*
		 * 2. ��� ��ġ ����
		 */
		//System.out.println("��� ��ġ���� üũ ȣ�� ����");
		if(!findUser.isMatchPassword(pass)){
			throw new PasswordMismatchException("��й�ȣ�� ��ġ���� ����.");
		}
		
		return findUser;
	}
	
	/*
	 * ȸ����ü list
	 */
	public List<User> findUserList() throws Exception{
		return userDao.findUserList();
	}
	
	/*
	 * ȸ���Ѹ� ����
	 */
	public User findUserById(String id) throws Exception{
		return userDao.findUser(id);
	}
	
	/*
	 * ȸ�� ����
	 */
	public boolean removeUserById(String id) throws Exception{
		boolean isRemoved = false;
		int rows = userDao.remove(id);
		if(rows > 0 ){
			isRemoved = true;
		}
		System.out.println("������ �� : "+rows);
		return isRemoved;
	}
	
	/*
	 * ȸ�� ������Ʈ
	 */
	public int updateUser(User user) throws Exception{
		int rows = userDao.update(user);
		return rows;
	}
}













