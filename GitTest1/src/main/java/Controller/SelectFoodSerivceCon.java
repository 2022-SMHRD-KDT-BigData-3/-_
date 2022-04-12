package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import Model.MemberDTO;
import Model.MenuDAO;
import Model.MenuDTO;

@WebServlet("/SelectFoodSerivceCon")
public class SelectFoodSerivceCon extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("[SelectFoodSerivceCon]");

		// 1. post방식 인코딩
		// 인코딩 방식은 데이터를 보낸 main.jsp의 페이지 인코딩 방식을 따라감
		request.setCharacterEncoding("UTF-8");

		// 2. request객체에서 보낸 데이터 4가지 받아오기
		String id = request.getParameter("id");
		String dietday = request.getParameter("date");
		
		System.out.println("셀렉트 id :"+id);
		System.out.println("셀렉트 date :"+dietday);
		MenuDTO dto = new MenuDTO(id, dietday);

		// 4. join메소드 호출
		MenuDAO dao = new MenuDAO();
		ArrayList<MenuDTO> info = dao.foodget(dto);
		
		for(int i=0; i<info.size(); i++) {
			System.out.println(info.get(i).getFname());
		}
		
		// 5. 실행 결과값에 따라서 페이지 이동
		// cnt가 0이면 변화가 없다는 뜻
		response.setContentType("text/plain; charset=utf-8;");
		
		if (info!=null) {
			System.out.println("식단 가져오기 성공");
			Gson gson = new Gson(); 
		      Object json = gson.toJson(info);
		      PrintWriter out = response.getWriter();
		      
		      out.print(json);
			// url에 얹어서 보내는 방법 - 쿼리스트링방식
			// ?로 시작하고 변수형태 email보내야하니까 +로 연결
			// 한글을 보낼때는 URLEncoder.encode(인코딩 할 값, "인코딩 방식")
			/* response.sendRedirect("./page-2.jsp"); */
		} else {
			System.out.println("식단 가져오기 실패");
			response.sendRedirect("./page-2.jsp");
		}

	}

	}


