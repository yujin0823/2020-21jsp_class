package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import book.BookDAO;
import book.BookVO;

// 어노테이션을 확인하여 해당 Servlet으로 접근하기 위해서는 URL에 /BookList로 접근하면 된다는 매핑
@WebServlet("/BookList.do")
// 서블릿 만들 때 HttpServlet를 무조건 상속받아야 한다!
public class BookListController extends HttpServlet {
	// 만든 서블릿 클래스명 이하에 get방식일 때와 post방식에 따른 각각의 메서드가 다르다.
	// get, post둘 중 어느 방식으로 들어올지 모른다. 그래서 두 방식으로 처리해준다.
	// 매개변수로는 HttpServletReqeust, HttpServletResponse 클래스를 정의
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		selectBooks(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		selectBooks(req, resp);
	}
	
	public void selectBooks(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		BookDAO instance = BookDAO.getInstance();
		// getInstance()메서드를 통해서 instance가져온다.
		// 따라서 안에 있는 메서드 사용할 수 있다.
		ArrayList<BookVO> list = instance.getBookList();
		// getBookList()로 모든 책 정보를 리턴 받는다.
		
		// 정보 공유하기 위해서 list라는 이름에 list를 넣어준다.
		req.setAttribute("list", list);
		// selectBook.jsp로 이동
		RequestDispatcher rd = req.getRequestDispatcher("selectBook.jsp");
		rd.forward(req, resp);
	}
}
