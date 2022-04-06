package Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.CheckingDTO;

@WebServlet("/UserimportServiceCon")
public class UserimportServiceCon extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	System.out.println("UserimportServiceCon");
	
	request.setCharacterEncoding("UTF-8");
	
	int age = Integer.parseInt(request.getParameter("age"));
	int weigth = Integer.parseInt(request.getParameter("weigth"));
	int heigth = Integer.parseInt(request.getParameter("heigth"));
	int bs = Integer.parseInt(request.getParameter("bs"));
	int bp = Integer.parseInt(request.getParameter("bp"));
	int act = Integer.parseInt(request.getParameter("act"));
	
	System.out.println(age);
	System.out.println(weigth);
	System.out.println(heigth);
	System.out.println(bs);
	System.out.println(bp);
	System.out.println(act);
	
	CheckingDTO dto = new CheckingDTO(age,weigth,heigth,bs,bp,act);


	}

}
