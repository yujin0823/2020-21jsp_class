package test;

import java.util.ArrayList;
import java.util.Random;

public class TestDAO {
	// 싱글톤 패턴
	public static TestDAO instance = new TestDAO();
	
	public static TestDAO getInstance() {
		return instance;
	}
	
	public ArrayList<TestVO> jumsuList = new ArrayList<TestVO>();
	TestVO vo = new TestVO();
	Random ran = new Random();
	
	private TestDAO() {
		setJumsu();
	}
	
	public void setJumsu() {
		int com = ran.nextInt(70) + 30;
		vo.setComNum(com);
		int excel = ran.nextInt(70) + 30;
		vo.setExcelNum(excel);
		
		jumsuList.add(vo);
	}
	
	public int checkResult(int comNum, int excelNum) {
		int result = 0;
		
		int sum = comNum + excelNum;
		int avg = sum / 2;
		
		if (comNum >= 40 || excelNum >= 40) { // 40점 이상이면
			if (avg >= 60) { // 60점 이상이면
				result = 1; // 합격
			} else { // 60점 이하이면
				result = 0; // 불합격
			}
		} else { // 40점 이하이면
			result = 0; // 불합격
		}
		
		return result;
	}
}
