package Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Model.MemberDAO;
import Model.MemberDTO;
import Model.MenuDTO;
import Model.MenuDAO;

@WebServlet("/InsertServiceCon")
public class InsertServiceCon extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("[ServiceCon]");

		// 1. post방식 인코딩
		// 인코딩 방식은 데이터를 보낸 main.jsp의 페이지 인코딩 방식을 따라감
		request.setCharacterEncoding("UTF-8");

		// 2. request객체에서 보낸 데이터 4가지 받아오기
		String id = request.getParameter("id");
		int meal = Integer.parseInt(request.getParameter("meal"));
		String fname = request.getParameter("fname");
		float cal = Float.valueOf(request.getParameter("cal"));
		float pro = Float.valueOf(request.getParameter("pro"));
		float car = Float.valueOf(request.getParameter("car"));
		float fat = Float.valueOf(request.getParameter("fat"));

		System.out.println(id);
		System.out.println(meal);
		System.out.println(fname);
		System.out.println(cal);
		System.out.println(pro);
		System.out.println(car);
		System.out.println(fat);
		MenuDTO dto = new MenuDTO(id, meal,fname, cal, pro, car, fat);

		// 4. join메소드 호출
		MenuDAO dao = new MenuDAO();
		int cnt = dao.insert(dto);
		

		// 5. 실행 결과값에 따라서 페이지 이동
		// cnt가 0이면 변화가 없다는 뜻
		if (cnt > 0) {
			System.out.println("식단 입력 성공");

			// url에 얹어서 보내는 방법 - 쿼리스트링방식
			// ?로 시작하고 변수형태 email보내야하니까 +로 연결
			// 한글을 보낼때는 URLEncoder.encode(인코딩 할 값, "인코딩 방식")
			response.sendRedirect("./page-2.jsp");
		} else {
			System.out.println("식단 입력 실패");
			response.sendRedirect("./page-2.jsp");
		}

	}

}
