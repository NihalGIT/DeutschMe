package pages;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JDialog;
import javax.swing.JOptionPane;

import beans.DB_con;

/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	
	Connection conne;
	DB_con inf=new DB_con();
	String user=inf.getUser();
	String url=inf.getUrl();
	String pwd=inf.getPwd();
	
	
    public Login() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		this.getServletContext().getRequestDispatcher( "/WEB-INF/Login.jsp").forward( request, response );
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
	   	    Class.forName("org.postgresql.Driver");
			conne = DriverManager.getConnection (url,user,pwd);
		    PreparedStatement ps=conne.prepareStatement("select * from personne where email = ?");
			ps.setObject(1,request.getParameter("mail")) ;
			ResultSet rs = ps.executeQuery() ;
			if (rs.next()) {
				        String nom=(String)rs.getObject("lastname");
				        String prenom=(String)rs.getObject("firstname");
				        String np= prenom+" "+nom;
				        request.setAttribute("np", np);
						String password=(String)rs.getObject("password");
						if (password.equals(request.getParameter("password"))) {
							JOptionPane optionPane = new JOptionPane("La connexion a été effectué avec succès !",JOptionPane.INFORMATION_MESSAGE);
							JDialog dialog = optionPane.createDialog("Congrats!");
							dialog.setAlwaysOnTop(true); 
							dialog.setVisible(true);
							this.getServletContext().getRequestDispatcher("/WEB-INF/Home.jsp").forward( request, response );
						}else {
							JOptionPane optionPane = new JOptionPane("Mot de passe incorrect !",JOptionPane.ERROR_MESSAGE);
							JDialog dialog = optionPane.createDialog("ERREUR!");
							dialog.setAlwaysOnTop(true); 
							dialog.setVisible(true);
							this.getServletContext().getRequestDispatcher("/WEB-INF/Login.jsp").forward( request, response );
						}
			}else {
				        JOptionPane optionPane = new JOptionPane("Aucun compte n'existe avec ce numéro de téléphone , veuillez-vous inscrire !"
				        		,JOptionPane.WARNING_MESSAGE);
						JDialog dialog = optionPane.createDialog("NOTE!");
						dialog.setAlwaysOnTop(true); 
						dialog.setVisible(true); 
						this.getServletContext().getRequestDispatcher("/WEB-INF/SignUp.jsp").forward( request, response );
			}
			}catch (SQLException e) {
				e.printStackTrace();
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
	         }
	}

}
