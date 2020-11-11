package test;

public class StudentVO {
	private String id; // id
	private String pw; // pw
	private String name; // 이름
	private int score; // 성적

	public StudentVO() {
		
	}

	public StudentVO(String id, String pw, String name, int score) {
		super();
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.score = score;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getScore() {
		return score;
	}

	public void setScore(int score) {
		this.score = score;
	}

	void printData() {
		System.out.println("id : " + id + " 비밀번호 : " + pw + "name : " + name + " 성적 : " + score);
	}

	@Override
	public String toString() {
		return "20104이유진 [id=" + id + ", pw=" + pw + ", name="+ name + ", score=" + score + "]";
	}
	
}