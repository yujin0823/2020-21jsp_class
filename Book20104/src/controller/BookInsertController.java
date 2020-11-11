package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import book.BookDAO;
import book.BookVO;

// 어노테이션을 확인하여 해당 Servlet으로 접근하기 위해서는 URL에 /BookList로 접근하면 된다는 매핑
@WebServlet("/BookInsert.do")
// 서블릿 만들 때 HttpServlet를 무조건 상속받아야 한다!
public class BookInsertController extends HttpServlet {
	// 만든 서블릿 클래스명 이하에 get방식일 때와 post방식에 따른 각각의 메서드가 다르다.
	// get, post둘 중 어느 방식으로 들어올지 모른다. 그래서 두 방식으로 처리해준다.
	// 매개변수로는 HttpServletReqeust, HttpServletResponse 클래스를 정의
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		insertBook(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		insertBook(req, resp);
	}
	
	public void insertBook(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// post로 값 넘겨 받을 때 항상 한글 깨짐 방지를 위해서 입력!
		req.setCharacterEncoding("UTF-8");
		BookDAO instance = BookDAO.getInstance();
		// getInstance()메서드를 통해서 instance가져온다. -> 안에 있는 메서드 사용할 수 있다.
		// insertBook.jsp의 form태그에서 input으로 사용자에거 받은 정보 얻기
		// <파라미터 작업> insertBook.jsp에서 넘겨받은 bcode, btitle, bwriter, bpub, bprice, bdate
		// bcode, bpub, bprice  => 정수로 반환 Integer.parseInt(request.getParameter("bcode"));
		// btitle, bwriter, bdate 스트링 값 가져오는 방법 => request.getParameter("파라미터 이름");
		int bcode = Integer.parseInt(req.getParameter("bcode"));
		String btitle = req.getParameter("btitle");
		String bwriter = req.getParameter("bwriter");
		int bpub = Integer.parseInt(req.getParameter("bpub"));
		int bprice = Integer.parseInt(req.getParameter("bprice"));
		String bdate = req.getParameter("bdate");
		Date passDate = Date.valueOf(bdate);
		
		// 한 번에 vo객체에 사용자가 입력한 정보를 넣어준다.
		BookVO vo = new BookVO(bcode, btitle, bwriter, bpub, bprice, passDate);
		// 결과값 : executeUpdate()로 실행 => 결과 int -> 성공한 레코드 수  > 0
		int cnt = instance.insertBook(vo);
		String msg = ""; // 등록 성공의 여부를 알 수 있게 하는 메시지 변수
		
		if (cnt > 0) { // 성공한 레코드의 수가 0이상이면
			msg = "도서 등록 성공";
			popup(req, resp, msg);
		} else { // 성공한 레코드의 수가 0이상이 아니면
			msg = "도서 등록 실패";
			popup(req, resp, msg);
		}
		
//		RequestDispatcher rd = req.getRequestDispatcher("/BookList.do");
//		rd.forward(req, resp);
	}
	
	// msg와 함께 받아 성공 여부를 알 수 있다. 
	public void popup(HttpServletRequest req, HttpServletResponse resp, String msg) throws ServletException, IOException {
		resp.setContentType("text/html; charset=utf-8"); // 한글 깨짐 방지
		// 자바코드에서 웹으로 데이터를 출력하기 위해서 사용
		PrintWriter out = resp.getWriter();
		out.println("<script>");
		// alert창 띄우고 BookList.do코드로 이동
		out.println("alert('"+ msg +"');");
		out.println("location.href='BookList.do';");
		out.println("</script>");
	}
}
