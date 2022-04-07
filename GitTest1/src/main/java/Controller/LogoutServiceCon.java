package Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/LogoutServiceCon")
public class LogoutServiceCon extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("LogoutServiceCon");
		
		// 로그아웃 = 로그인 한 session 정보 삭제
		// 1. session 객체 호출
		HttpSession session = request.getSession();
		
		// 2. session 종료
		// 2-1 특정 session 삭제
		session.removeAttribute("info");
		// 2-2 session 종료
		session.invalidate();
		
		System.out.println("로그아웃 성공");
		// 3. miin.jsp로 페이지 이동
		response.sendRedirect("./index.jsp");
	}

}
