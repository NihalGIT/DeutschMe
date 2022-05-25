package pages;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JDialog;
import javax.swing.JOptionPane;

import beans.DB_con;

/**
 * Servlet implementation class Update
 */
@WebServlet("/Update")
public class Update extends HttpServlet {
	private static final long serialVersionUID = 1L;
	String new_level;
	String mail="";
	Connection conne;
 	DB_con inf=new DB_con();
 	String user=inf.getUser();
 	String url=inf.getUrl();
 	String pwd=inf.getPwd();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Update() {
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
		String nq = (String)context.getAttribute("np");
		request.setAttribute("np", nq);
	    mail= (String)context.getAttribute("mail");
	    System.out.print(mail);
	    System.out.println(level);
		if(level.equals("A1")){
        	new_level="A2";
        }else if (level.equals("A2")){
        	 new_level="B1";
        }else{
        	new_level="B2";
        }
		 System.out.println(mail);
		 System.out.println(new_level);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request,response);
	    String j=(String)request.getParameter("score");
		if (Integer.parseInt(j)>=4){
    		try {
    	   	    Class.forName("org.postgresql.Driver");
    			conne = DriverManager.getConnection (url,user,pwd);
    		    PreparedStatement ps=conne.prepareStatement("UPDATE personne SET niveau = ? WHERE email=?;");
    		    ps.setObject(1,new_level);
    		    ps.setObject(2,mail);
    		    ps.executeUpdate();
    		    JOptionPane optionPane = new JOptionPane("Vous avez passer au niveau "+new_level+
    		    		"! Pour importer les updates , veuillez vous reconnecter.",JOptionPane.INFORMATION_MESSAGE);
				JDialog dialog = optionPane.createDialog("Congrats!");
				dialog.setAlwaysOnTop(true); 
				dialog.setVisible(true);
    			this.getServletContext().getRequestDispatcher( "/WEB-INF/Login.jsp").forward( request, response );
    	}catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
         }
    		}else {
    			this.getServletContext().getRequestDispatcher( "/WEB-INF/Home.jsp").forward( request, response );
    			
    		}
	}

}
