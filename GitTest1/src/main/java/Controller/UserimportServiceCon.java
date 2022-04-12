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
import Model.MemberDTO;

@WebServlet("/UserimportServiceCon")
public class UserimportServiceCon extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	System.out.println("UserimportServiceCon");
	
	request.setCharacterEncoding("UTF-8");

	int weigth = Integer.parseInt(request.getParameter("weigth"));
	int blood = Integer.parseInt(request.getParameter("bs"));
	int bsugar = Integer.parseInt(request.getParameter("bp"));
	int act = Integer.parseInt(request.getParameter("act"));
	int height = Integer.parseInt(request.getParameter("heigth"));
	int age = Integer.parseInt(request.getParameter("age"));
	
	System.out.println("weigth : " +weigth);
	System.out.println("blood : "+blood);
	System.out.println("bsugar : " +bsugar);
	System.out.println("act : "+act);
	System.out.println("height : "+height);
	System.out.println("age : "+age);
	
	HttpSession session = request.getSession();
	MemberDTO info = (MemberDTO)session.getAttribute("info");
	CheckingDTO dto = new CheckingDTO(info.getId(),weigth,blood,bsugar,act,height,age);
	CheckingDAO dao = new CheckingDAO();
	
	// 3. msgSend() 호출
	int cnt = dao.insert(dto);
	// 4. main.jsp 이동
	if(cnt > 0) {
          System.out.println("입력성공");
       
          session.setAttribute("ckdto", dto);
       }else {
          System.out.println("입력실패");


	} response.sendRedirect("./user-import.jsp");
	}
	}
