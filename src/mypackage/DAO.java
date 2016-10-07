package mypackage;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Calendar;


public class DAO {
	private Connection connection = null;
	public DAO() throws SQLException, ClassNotFoundException {
	    Class.forName("com.mysql.jdbc.Driver");
	    connection = DriverManager.getConnection("jdbc:mysql://localhost/aula11", "root", "");
	}
	
	public void adiciona(Pessoas pessoa) {
		String sql = "INSERT INTO Pessoas" +
		"(nome,nascimento,altura,passaporte) values(?,?,?,?)";
		PreparedStatement stmt;
		try {
			stmt = connection.prepareStatement(sql);
		
		stmt.setString(1,pessoa.getNome());
		stmt.setDate(2, new Date(
			pessoa.getNascimento().getTimeInMillis()));
		stmt.setDouble(3,pessoa.getAltura());
		stmt.setString(4,pessoa.getPassaporte());
		stmt.execute();
		stmt.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public List<Pessoas> getLista() {

		List<Pessoas> pessoas = new ArrayList<Pessoas>();

		PreparedStatement stmt;
		try {
			stmt = connection.
			    prepareStatement("SELECT * FROM Pessoas");

		ResultSet rs = stmt.executeQuery();

		while (rs.next()) {
			Pessoas pessoa = new Pessoas();
			pessoa.setId(rs.getInt("id"));
			pessoa.setNome(rs.getString("nome"));
			Calendar data = Calendar.getInstance();
			data.setTime(rs.getDate("nascimento"));
			pessoa.setNascimento(data);
			pessoa.setAltura(rs.getDouble("altura"));
			pessoa.setPassaporte(rs.getString("passaporte"));
			pessoas.add(pessoa);
		}
		rs.close();
		stmt.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return pessoas;
	}
	public void altera(Pessoas pessoa) {
		String sql = "UPDATE Pessoas SET " +
	          "nome=?, nascimento=?, altura=?, passaporte=? WHERE id=?";
		PreparedStatement stmt;
		try {
			stmt = connection.prepareStatement(sql);
		
		stmt.setString(1, pessoa.getNome());
		stmt.setDate(2, new Date(pessoa.getNascimento()
			.getTimeInMillis()));
		stmt.setDouble(3, pessoa.getAltura());
		stmt.setString(4, pessoa.getPassaporte());
		stmt.setInt(5, pessoa.getId());
		stmt.execute();
		stmt.close();
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public void remove(String passaporte) {
		PreparedStatement stmt;
		try {
			stmt = connection
			   .prepareStatement("DELETE FROM Pessoas WHERE passaporte=?");
		
		stmt.setString(1, passaporte);
		stmt.execute();
		stmt.close();
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public void close() {
		try {
			connection.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
}