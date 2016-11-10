package com.itwill.user;

import java.util.List;

/*
 * - ȸ������ ����Ͻ�����(����ó��,Ʈ������,����,�α�)�� �����ϴ� Ŭ����
 * - ��������Ʈ(����,JSP)���� ��������(�޽��ȣ��)�ϴ� Ŭ����
 * - Dao�� �̿��ؼ� ����Ÿ���̽��� �����۾��ϴ� Ŭ����
 */
public class UserService {
	
	/*
	 * singleton
	 */
	private static UserService _instance;
	
	private UserService() {
		System.out.println("UserService������:"+this);
		this.userDao=new UserDao();
	}
	public static UserService getInstance(){
		if(_instance==null){
			_instance=new UserService();
		}
		return _instance;
	}
	private UserDao userDao;
	
	
	/*
	 * ȸ������
	 */
	public int create(User user)throws Exception,ExistedUserException{
		/*
		 * 1.���̵����翩��üũ
		 */
		if(userDao.existedUser(user.getUserId())){
			//�̹������ϴ¾��̵�
			throw new ExistedUserException(user.getUserId()+" �� �̹� �����ϴ� ���̵��Դϴ�.");
		}
		/*
		 * 2.ȸ������
		 */
		int result=userDao.create(user);
		return result;
	}
	/*
	 *�α���
	 */
	public User login(String userId,String password)throws Exception,UserNotFoundException,PasswordMismatchException{
		/*
		 * 1. ���̵����翩��
		 */
		User findUser=userDao.findUser(userId);
		if(findUser==null){
			throw new UserNotFoundException(userId+" �� ���������ʴ� ���̵��Դϴ�."); 
		}
		/*
		 * 2. �о����� ��ġ����
		 */
		if(!findUser.isMatchPassword(password)){
			throw new PasswordMismatchException("�о����尡 ��ġ�����ʽ��ϴ�.");
		}
		return findUser;
		
	}
	/*
	 * ȸ����ü����Ʈ
	 */
	
	public List<User> findUserList()throws Exception{
		return userDao.findUserList();
	}
	
	/*
	 * ȸ���Ѹ� ����
	 */
	public User findUser(String userId) throws Exception{
		User findUser=userDao.findUser(userId);
		return findUser;
		
	}
	
	
}













