package pages;

import java.io.IOException;

import javax.naming.Context;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class MyTest
 */
@WebServlet("/MyTest")
public class MyTest extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyTest() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		ServletContext context = this.getServletContext();
		String level = (String)context.getAttribute("level");
		String mail= (String)context.getAttribute("mail");
		request.setAttribute("email",mail);
		request.setAttribute("Level", level);
		this.getServletContext().getRequestDispatcher( "/WEB-INF/Test.jsp").forward( request, response );
		}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		for(int i=1;i<=6;i++) {
			request.setAttribute("qst"+i,(String)request.getParameter("qst"+i));
			request.setAttribute("rc"+i,(String)request.getParameter("niveau"+i));
			request.setAttribute("rv"+i,(String)request.getParameter("explaination"+i));
			}
		this.getServletContext().getRequestDispatcher( "/WEB-INF/Correction.jsp").forward( request, response );
		}

}
