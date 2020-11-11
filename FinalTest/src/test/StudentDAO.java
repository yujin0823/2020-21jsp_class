package test;

import java.util.ArrayList;

public class StudentDAO {

	private static StudentDAO instance = new StudentDAO();

	public ArrayList<StudentVO> list = new ArrayList<StudentVO>();
	public int sum = 0;

	public StudentDAO() {
		StudentVO temp = new StudentVO("qwer", "1111", "김세모", 100);
		list.add(temp);
		temp = new StudentVO("abcd", "2222", "박네모", 87);
		list.add(temp);
		temp = new StudentVO("javaking", "3333", "이둥글", 42);
		list.add(temp);
	}

	public static StudentDAO getInstance() {
		return instance;
	}

	public void addStudent(StudentVO st) { // 추가
		list.add(st);
	}

	public StudentVO removeStudent(int index) { // 삭제
		StudentVO delSt = list.get(index);
		list.remove(index);
		return delSt;
	}
	
	public void updateStudent(StudentVO st, int idx) { // 삽입
		int check = checkId(st);
		
		for (int i = 0; i < list.size(); i++) {
			if (check == -1 || check == idx) {
				list.set(idx, st);
				
//				list.get(i).setId(st.getId());
//				list.get(i).setPw(st.getPw());
//				list.get(i).setScore(st.getScore());
			}
		}
	}

	public int checkId(StudentVO st) { // id 중복체크
		int check = -1;
		for (int i = 0; i < list.size(); i++) {
			if (list.get(i).getId().equals(st.getId())) {
				check = i;
				break;
			}
		}
		return check;
	}
	
	public int checkName(StudentVO st) { // 이름 존재 여부
		int check = -1;
		for (int i = 0; i < list.size(); i++) {
			if (list.get(i).getName().equals(st.getName())) {
				check = i;
				break;
			}
		}
		return check;
	}

	public void printStudent() {
		for (int i = 0; i < list.size(); i++) {
			list.get(i).printData();
		}
	}

	public void sortData() { // 정렬
		for (int i = 0; i < list.size(); i++) {
			int maxScore = list.get(i).getScore();
			int maxIdx = i;
			for (int j = i; j < list.size(); j++) {
				if (maxScore < list.get(j).getScore()) {
					maxScore = list.get(j).getScore();
					maxIdx = j;
				}
			}

			StudentVO temp = list.get(i);
			list.set(i, list.get(maxIdx));
			list.set(maxIdx, temp);
		}
	}
	
	public int printSum() { // 합계
		sum = 0;
		
		for (int i = 0; i < list.size(); i++) { // list의 size만큼 for문을 돌려 sum에 점수를 더해준다.
			sum += list.get(i).getScore();
		}
		
		return sum;
	}
	
	public int printAvg() { // 평균
		int avg = sum / list.size();
		return avg;
	}
	
	public int printMax() { // 최대값
		int maxNum = 0;
		int maxIdx = 0;
		
		for (int i = 0; i < list.size(); i++) {
			if (maxNum < list.get(i).getScore()) { // list.get(i).getScore()이 maxNum보다 크면
				maxNum = list.get(i).getScore(); // max를 list.get(i).getScore()로 넣어준다.
				maxIdx = i; // 그리고 idx를 i로 넣어준다.
			}
		}
		
		return maxIdx; // idx 리턴
	}

	public int getSize() {
		return list.size();
	}
}