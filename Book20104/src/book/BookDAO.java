package book;

import java.sql.*;
import java.util.ArrayList;

public class BookDAO {
	// 싱글톤 패턴
	// 클래스 안에 있는 변수와 메서드를 여러 곳에서 공유하기 위해서 사용, 값 1개 저장
	private static BookDAO instance = new BookDAO();
	private BookDAO() {}
	public static BookDAO getInstance() {
		return instance;
	}
	
	// 오라클 연동하는 객체들
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	public Connection getConnection() {
		// 데이터베이스 접속 정보
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String id = "hr";
		String pw = "hr";
		try {
			// JDBC 드라이버 로드
			Class.forName("oracle.jdbc.driver.OracleDriver");
			// 오라클 드라이버OracleDriver.class 경로 제시 ojdbc6.jar안에 있다.
			conn = DriverManager.getConnection(url, id, pw);
			System.out.println("오라클 접속 성공");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return conn;
	}
	
	// 가장 큰 bcode를 가져와 +1
	public int getMaxCode() {
		int bcode = 0;
		try {
			conn = instance.getConnection();
			String sql = "select max(bcode) from BOOK_TBL";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				bcode = rs.getInt(1) + 1;
				// 최대값을 가져와서 +1 해준다.
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("getMaxCode()에서 오류");
		}
		return bcode;
	}
	
	// 모든 책 정보를 가져오는 매서드
	public ArrayList<BookVO> getBookList() {
		ArrayList<BookVO> bookList = new ArrayList<BookVO>();
		try {
			conn = instance.getConnection();
			String sql = "select * from book_tbl order by bcode asc";
			// order by bcode asc :  bcode를 오름차순으로 정렬
			pstmt = conn.prepareStatement(sql);
			// select는 executeQuery()로 실행해서 결과를 rs로 받는다.
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				BookVO vo = new BookVO();
				vo.setBcode(rs.getInt("bcode"));
				vo.setBtitle(rs.getString("btitle"));
				vo.setBwriter(rs.getString("bwriter"));
				vo.setBpub(rs.getInt("bpub"));
				vo.setBprice(rs.getInt("bprice"));
				vo.setBdate(rs.getDate("bdate"));
				
				bookList.add(vo);
			}
			System.out.println("책List 출력 완료");
		}catch (Exception e) {
			System.out.println("getBookList() 오류");
			e.printStackTrace();
		} finally {
			close(rs, pstmt, conn);
		}
		return bookList;
	}
	
	// 책 추가 : form의 input으로 받아온 정보를 vo에 넣어 받은 후 오라클에 넣어준다.
	public int insertBook(BookVO vo) {
		int cnt = 0;
		try {
			conn = instance.getConnection();
			String sql = "INSERT into book_tbl values(?, ?, ?, ?, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, vo.getBcode());
			pstmt.setString(2, vo.getBtitle());
			pstmt.setString(3, vo.getBwriter());
			pstmt.setInt(4, vo.getBpub());
			pstmt.setInt(5, vo.getBprice());
			pstmt.setDate(6, vo.getBdate());
			cnt = pstmt.executeUpdate();
			// insert는 executeUpdate()로 실행해서 결과를 int로 받는다.
			System.out.println("책 추가 완료");
		} catch (Exception e) {
			System.out.println("insertBook() 오류");
			e.printStackTrace();
		} finally {
			close(null, pstmt, conn);
		}
		return cnt;
	}
	
	// 책 삭제 매서드
	public int deleteBook(int bcode) {
		int cnt = 0;
		try {
			conn = instance.getConnection();
			String deleteSql = "DELETE FROM book_tbl WHERE bcode = ?";
			pstmt = conn.prepareStatement(deleteSql);
			pstmt.setInt(1, bcode);
			// delete는 executeUpdate()로 실행해서 결과를 int로 받는다.
			cnt = pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("deleteBook() 오류");
			e.printStackTrace();
		} finally {
			close(null, pstmt, conn);
		}
		return cnt;
	}
	
	// 정보 수정 매서드
	public int updateBook(BookVO vo) {
		int cnt = 0;
		try {
			conn = instance.getConnection();
			String updateSql = "update book_tbl set btitle = ?, bwriter = ?, bpub = ?, "
					+ "bprice = ?, bdate = ? where bcode = ?";
			pstmt = conn.prepareStatement(updateSql);
			
			pstmt.setString(1, vo.getBtitle());
			pstmt.setString(2, vo.getBwriter());
			pstmt.setInt(3, vo.getBpub());
			pstmt.setInt(4, vo.getBprice());
			pstmt.setDate(5, vo.getBdate());
			pstmt.setInt(6, vo.getBcode());
			// update는 executeUpdate()로 실행해서 결과를 int로 받는다.
			cnt = pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("updateBook() 오류");
			e.printStackTrace();
		} finally {
			close(null, pstmt, conn);
		}
		return cnt;
	}
	
	// bcode를 받아와서 그 한명의 정보를 받아와 리턴해주는 매서드
	public BookVO getABook(int bcode) {
		BookVO vo = new BookVO();
		try {
			conn = instance.getConnection();
			String sql = "select * from book_tbl where bcode = ? ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bcode);
			// select는 executeQuery()로 실행해서 결과를 rs로 받는다.
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				vo.setBcode(rs.getInt("bcode"));
				vo.setBtitle(rs.getString("btitle"));
				vo.setBwriter(rs.getString("bwriter"));
				vo.setBpub(rs.getInt("bpub"));
				vo.setBprice(rs.getInt("bprice"));
				vo.setBdate(rs.getDate("bdate"));
			}
		} catch (Exception e) {
			System.out.println("getABook() 오류");
			e.printStackTrace();
		} finally {
			close(rs, pstmt, conn);
		}
		return vo;
	}
	
	// 객체 생성한 순서의 반대로 close시켜준다 
	// -> last in first out 나중에 생성한 객체부터 close를 해준다. 즉 rs -> pstmt -> conn
	public void close(ResultSet rs, PreparedStatement pstmt, Connection conn) {
		if (rs != null) try {rs.close();} catch (Exception e) {e.printStackTrace();}
		if (pstmt != null) try {pstmt.close();} catch (Exception e) {e.printStackTrace();}
		if (conn != null) try {conn.close();} catch (Exception e) {e.printStackTrace();}
	}
}
