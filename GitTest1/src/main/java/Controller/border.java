package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

import Model.bordDAO;
import Model.bordDTO;
import netscape.javascript.JSObject;

@WebServlet("/border")
public class border extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("[border]");
		
		request.setCharacterEncoding("UTF-8");
		//몇번부터 가져올 것인지?
		//몇개의 버튼 생성할 것인지를 알기위한 서블릿
		int num = Integer.parseInt(request.getParameter("num")); //몇번째 부터 DB에서 가져와야 할지 알수있는 num변수
		System.out.println("num : "+num);
		Gson gson = new Gson(); 
		
		response.setContentType("text/plain; charset=utf-8;");
		JsonObject json = new JsonObject(); //json 객체를 만들고
		JsonArray jarray = new JsonArray(); //json객체를 담아줄 jarray객체를 만들어 준다
		PrintWriter out = response.getWriter();
		
		ArrayList<bordDTO> list = new ArrayList<bordDTO>();
		bordDAO dao = new bordDAO();
		list= dao.all_bord(num); //num 변수의 값부터 DB에서 가져온다
		
		System.out.println("num2 : "+list.get(0).getNum());
		System.out.println("title  : "+list.get(0).getTitle());
		System.out.println("data  : "+list.get(0).getData());
		for(int i=0;i<list.size();i++) {
			json.addProperty("num", list.get(i).getNum());
			json.addProperty("title", list.get(i).getTitle());
			json.addProperty("data", list.get(i).getData());
			
			jarray.add(json);
		
		}
		
		System.out.println();
		out.print(jarray);
	}

}

	
