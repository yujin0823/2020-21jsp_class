package test;

public class TestVO {
	private String name = "rose"; // 이름
	private int regNum = 123456; // 수험번호
	private int comNum; // 1과목
	private int excelNum; // 2과목
	
	public TestVO() {
		
	}
	
	public void setComNum(int comNum) {
		this.comNum = comNum;
	}
	
	public void setExcelNum(int excelNum) {
		this.excelNum = excelNum;
	}

	public String getName() {
		return name;
	}
	
	public int getRegNum() {
		return regNum;
	}
	
	public int getComNum() {
		return comNum;
	}

	public int getExcelNum() {
		return excelNum;
	}

}
