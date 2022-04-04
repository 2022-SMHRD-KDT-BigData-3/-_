package Controller;

import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.MemberDAO;
import Model.MemberDTO;

@WebServlet("/JoinServiceCon")
public class JoinServiceCon extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	      System.out.println("[JoinServiceCon]");
	      
	      // 1. post방식 인코딩
	      // 인코딩 방식은 데이터를 보낸 main.jsp의 페이지 인코딩 방식을 따라감
	      request.setCharacterEncoding("UTF-8");
	      
	      //2. request객체에서 보낸 데이터 4가지 받아오기
	      String id = request.getParameter("id");
	      String pw = request.getParameter("pw");
	       String nick = request.getParameter("pw");
	       
	       System.out.println("id : " + id);
	       System.out.println("pw : " + pw);
	       System.out.println("nick : "+ nick);
	       
	       // 3. DTO 가방으로 데이터 묶기
	       MemberDTO dto = new MemberDTO(id,pw,nick);
	       
	       // 4. join메소드 호출
	       MemberDAO dao = new MemberDAO();
	       int cnt = dao.join(dto);
	       
	       // 5. 실행 결과값에 따라서 페이지 이동
	       // cnt가 0이면 변화가 없다는 뜻 
	       if(cnt > 0) {
	          System.out.println("회원가입 성공");
	          
	          // url에 얹어서 보내는 방법 - 쿼리스트링방식
	          // ?로 시작하고 변수형태 email보내야하니까 +로 연결
	          // 한글을 보낼때는 URLEncoder.encode(인코딩 할 값, "인코딩 방식")
	          response.sendRedirect("quixlab-master/index.html");
	       }else {
	          System.out.println("회원가입 실패");
	          response.sendRedirect("quixlab-master/index.html");
	       }
	   }

	}
	
