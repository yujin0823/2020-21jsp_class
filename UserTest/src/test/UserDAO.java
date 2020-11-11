package test;

import java.util.ArrayList;

public class UserDAO {
	// 싱글톤 패턴
	public static UserDAO instance = new UserDAO();

	public static UserDAO getInstance() {
		return instance;
	}
	
	public ArrayList<UserVO> list = new ArrayList<UserVO>();

	private UserDAO() {

	}

	public int getMaxNo() {
		return list.size();
	}

	public int CheckLogin(String name, int grade) {
		int check = -1;
		
		for (int i = 0; i < list.size(); i++) {
			if (name.equals(list.get(i).getName()) && grade == list.get(i).getGrade()) {
				check = i;
			} else {
				check = -1;
			}
		}

		return check;
	}

	public void addUser(UserVO user) {
		list.add(user);
	}
	
//	public UserVO getAName(String name) {
//		
//		return null;
//	}
	
	public ArrayList<UserVO> getAllList() {
		return list;
	}
	
	public void checkResult(int one, int two, int three, int idx) {
		int jumsu = 0;
		
		if (one == 2) {
			jumsu = jumsu + 10;
		} 
		
		if (two == 2) {
			jumsu = jumsu + 10;
		}
		
		if (three == 3) {
			jumsu = jumsu + 10;
		}
		
		list.get(idx).setJumsu(jumsu);
	}
	
//	public UserVO getAUSer(int a) {
//		
//		return null;
//	}

}
