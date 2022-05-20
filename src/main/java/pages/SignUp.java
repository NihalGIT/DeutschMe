package pages;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JDialog;
import javax.swing.JOptionPane;

import beans.DB_con;
import beans.recup;

/**
 * Servlet implementation class SignUp
 */
@WebServlet("/SignUp")
public class SignUp extends HttpServlet {
	Connection conne;
	DB_con inf=new DB_con();
	String user=inf.getUser();
	String url=inf.getUrl();
	String pwd=inf.getPwd();
	
    public SignUp() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		this.getServletContext().getRequestDispatcher( "/WEB-INF/SignUp.jsp").forward( request, response );
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		    response.setContentType("text/html");
			recup User=new recup();
			try {
			   	    Class.forName("org.postgresql.Driver");
					conne = DriverManager.getConnection (url,user,pwd);
					User.setNom(request.getParameter("lastname"));
					User.setPrenom(request.getParameter("firstname"));
					User.setPhone(request.getParameter("telephone"));
					User.setEmail(request.getParameter("email"));
					User.setLevel(request.getParameter("niveau"));
					request.setAttribute("user", User);
					if(request.getParameter("password").equals(request.getParameter("Confpassword"))) {
						PreparedStatement ps=conne.prepareStatement("insert into Personne values (?,?,?,?,?,?);");
						ps.setObject(1,request.getParameter("firstname"));
						ps.setObject(2,request.getParameter("lastname"));
				        ps.setObject(3,request.getParameter("telephone"));
					    ps.setObject(4,request.getParameter("email"));
					    ps.setObject(5,request.getParameter("niveau"));
					    ps.setObject(6,request.getParameter("password"));
					    ps.executeUpdate();
					    ps.close();
					    conne.close();
					    JOptionPane optionPane = new JOptionPane("Votre inscription a été effectué avec succès !",JOptionPane.INFORMATION_MESSAGE);
						JDialog dialog = optionPane.createDialog("Congrats!");
						dialog.setAlwaysOnTop(true); 
						dialog.setVisible(true);
						this.getServletContext().getRequestDispatcher("/WEB-INF/Login.jsp").forward( request, response );
					}else {
						JOptionPane optionPane = new JOptionPane("les mots de passe saisis sont differents !",JOptionPane.ERROR_MESSAGE);
						JDialog dialog = optionPane.createDialog("ERREUR!");
						dialog.setAlwaysOnTop(true); 
						dialog.setVisible(true);
						this.getServletContext().getRequestDispatcher("/WEB-INF/SignUp.jsp").forward( request, response );
					}
				        
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					JOptionPane optionPane = new JOptionPane("Un compte existe déjà avec le numéro de téléphone / l'adresse email saisis  , "
							+ "veuillez-vous connecter !",JOptionPane.WARNING_MESSAGE);
					JDialog dialog = optionPane.createDialog("Warning!");
					dialog.setAlwaysOnTop(true); 
					dialog.setVisible(true); 
				 } catch (ClassNotFoundException e1) {
				   	// TODO Auto-generated catch block
				   	   e1.printStackTrace();
			}
	    }

      }
