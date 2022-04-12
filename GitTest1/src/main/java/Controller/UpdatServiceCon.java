package Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Model.CheckingDAO;
import Model.CheckingDTO;
import Model.MemberDAO;
import Model.MemberDTO;

@WebServlet("/UpdatServiceCon")
public class UpdatServiceCon extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
System.out.println("UpdatServiceCon");
		
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		
		MemberDTO user = (MemberDTO)session.getAttribute("info");
		String nick = request.getParameter("nick");
		String pw = request.getParameter("pw");

		System.out.println("nick : "+nick);
		System.out.println("pw : "+pw);

		MemberDTO info = new MemberDTO(user.getId(), pw,nick);
		MemberDAO dao = new MemberDAO();
	      
		int cnt = dao.updata(info);
		
		if(cnt>0) {
			System.out.println("회원정보수정 성공");
			// 로그인 정보가 담긴 session 업데이트, 갱신 
			// ->같은 session이름에 다른 값 담아주기(덮어쓰기)
			
			session.setAttribute("info", info);
			
			
		}else {
			System.out.println("회원정보수정 실패");
		}
		response.sendRedirect("./page-edit.jsp");


	}

}
