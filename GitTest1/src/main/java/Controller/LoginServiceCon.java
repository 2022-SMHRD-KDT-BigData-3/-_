package Controller;

import java.io.IOException;
import java.util.ArrayList;

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

@WebServlet("/LoginServiceCon")
public class LoginServiceCon extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		  // 어디인지 확인하기 위해 꼭 적기
	      System.out.println("[LoginServiceCon]");
	      
	      // post 방식 인코딩
	      request.setCharacterEncoding("UTF-8");
	      
	      // 값 받아오기
	      String id = request.getParameter("id");
	      String pw = request.getParameter("pw");
	      
	      System.out.println("id : " + id);
	      System.out.println("pw : " + pw);
	      
	      // 지금 현재 DTO에는 매개변수를 4개로 받는 걸로 생성되어있음 그렇기 때문에 두개를 담을 수 있는 
	      // 생성자 따로 생성 후 선언
	      MemberDTO dto = new MemberDTO(id, pw);
	      
	      // login 메소드 호출
	      
	      MemberDAO dao = new MemberDAO();
	      MemberDTO info = dao.login(dto);
	      CheckingDAO ckdao = new CheckingDAO();
	      CheckingDTO ckdto = ckdao.select(dto);
	      
	      // 실행결과 console 창에 출력
	      if(info !=null) {
	    	  System.out.println("로그인 성공");
	    	  
	    	  // 로그인 정보 유지하기 -> session 이용하기
	    	  // 1. session객체선언
	    	  HttpSession session = request.getSession();
	    	  // 2. 로그인 정보를 담은 session 만들기
	    	  session.setAttribute("info", info);
	    	  if(ckdto!=null) {
	    		  session.setAttribute("ckdto", ckdto);
	    		  
	    	  }
	    	  response.sendRedirect("./index.jsp");
	      }else {
	    	  System.out.println("로그인실패");
	    	  response.sendRedirect("./page-login.jsp");
	      }
	     
	   }

	
	}


