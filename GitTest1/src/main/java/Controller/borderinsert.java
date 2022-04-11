package Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.bordDAO;
import Model.bordDTO;

@WebServlet("/borderinsert")
public class borderinsert extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		int num = Integer.parseInt(request.getParameter("num"));
		String title = request.getParameter("title");
		String data = request.getParameter("data");
		
		bordDTO dto = new bordDTO(title, data);
		
		bordDAO dao = new bordDAO();
		int cnt = dao.insert(dto);
		if (cnt > 0) {
			System.out.println("게시글 입력 성공");

			// url에 얹어서 보내는 방법 - 쿼리스트링방식
			// ?로 시작하고 변수형태 email보내야하니까 +로 연결
			// 한글을 보낼때는 URLEncoder.encode(인코딩 할 값, "인코딩 방식")
			response.sendRedirect("./Bord.jsp");
		} else {
			System.out.println("게시글 입력 실패");
			response.sendRedirect("./Bord.jsp");
		}

		
	}

}
