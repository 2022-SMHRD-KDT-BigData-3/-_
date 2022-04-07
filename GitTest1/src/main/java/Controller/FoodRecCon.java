package Controller;

import java.io.IOException;
import java.net.URLEncoder;
import java.sql.Array;
import java.util.ArrayList;
import java.util.Scanner;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Model.FoodRecDAO;
import Model.FoodRecDTO;

@WebServlet("/FoodRecCon")
public class FoodRecCon extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("[FoodRecCon]");

		request.setCharacterEncoding("UTF-8");

		String choice = request.getParameter("platform");

		System.out.println("choice : " + choice);

		FoodRecDAO dao = new FoodRecDAO();
		ArrayList<FoodRecDTO> list = dao.f_dec(choice);
		
		
		
		
		if (list.size() > 0) {
			System.out.println("영양소 선택 성공");

			// url에 얹어서 보내기(쿼리스트링방식)
			// 한글을 보낼때는 URLEncoder.encode(인코딩 할 값, 인코딩 방식)
			// email= 이거 공백들어가면 안된다
			
			HttpSession session = request.getSession();
			
			session.setAttribute("list", list);
			
			response.sendRedirect("./page-3.jsp");
		} else {
			System.out.print("영양소 선택실패");
			response.sendRedirect("./page-3.jsp");
		}

	}

}
