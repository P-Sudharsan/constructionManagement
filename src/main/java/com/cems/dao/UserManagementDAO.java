package com.cems.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.cems.model.User;

public class UserManagementDAO {
	private String jdbcURL = "jdbc:mysql://localhost:3306/cemsdb?useSSL=false";
	private String jdbcUsername = "root";
	private String jdbcPassword = "senthosa";

	private static final String INSERT_USERS_SQL = "INSERT INTO user" + "  (fname, lname, uname, dob, gender, phoneno, email, password) VALUES "
			+ " (?, ?, ?, ?, ?, ?, ?, ?);";

	private static final String SELECT_USER_BY_ID = "select u_id,fname,lname,dob,gender,phoneno,email from user where u_id =?";
	private static final String SELECT_ALL_USERS = "select * from user";
	private static final String DELETE_USERS_SQL = "delete from user where u_id = ?;";
	private static final String UPDATE_USERS_SQL = "update user set fname = ?, lname = ?, dob = ?, gender = ?, phoneno = ?, email= ? where u_id = ?;";

	public UserManagementDAO() {
	}

	protected Connection getConnection() {
		Connection connection = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return connection;
	}

	/*
	 * public void insertUser(User user) throws SQLException {
	 * System.out.println(INSERT_USERS_SQL); // try-with-resource statement will
	 * auto close the connection. try (Connection connection = getConnection();
	 * PreparedStatement preparedStatement =
	 * connection.prepareStatement(INSERT_USERS_SQL)) {
	 * preparedStatement.setString(1, user.getFname());
	 * preparedStatement.setString(2, user.getLname());
	 * preparedStatement.setString(3, user.getUname());
	 * preparedStatement.setString(4, user.getDob()); preparedStatement.setString(5,
	 * user.getGender()); preparedStatement.setString(6, user.getPhoneno());
	 * preparedStatement.setString(7, user.getEmail());
	 * preparedStatement.setString(8, user.getPassword());
	 * System.out.println(preparedStatement); preparedStatement.executeUpdate(); }
	 * catch (SQLException e) { printSQLException(e); } }
	 */

	public User selectUser(int id) {
		User user = null;
		// Step 1: Establishing a Connection
		try (Connection connection = getConnection();
				// Step 2:Create a statement using connection object
				PreparedStatement preparedStatement = connection.prepareStatement(SELECT_USER_BY_ID);) {
			preparedStatement.setInt(1, id);
			System.out.println(preparedStatement);
			// Step 3: Execute the query or update query
			ResultSet rs = preparedStatement.executeQuery();

			// Step 4: Process the ResultSet object.
			while (rs.next()) {
				//int _id = rs.getInt("u_id");
				String f_name = rs.getString("fname");
				String l_name = rs.getString("lname");
				String DOB = rs.getString("dob");
				String Gender = rs.getString("gender");
				String phone_no = rs.getString("phoneno");
				String email = rs.getString("email");
				
				user = new User(id, f_name, l_name, DOB, Gender, phone_no, email);
			}
		} catch (SQLException e) {
			printSQLException(e);
		}
		return user;
	}

	public List<User> selectAllUsers() {

		// using try-with-resources to avoid closing resources (boiler plate code)
		List<User> users = new ArrayList<>();
		// Step 1: Establishing a Connection
		try (Connection connection = getConnection();

				// Step 2:Create a statement using connection object
			PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_USERS);) {
			System.out.println(preparedStatement);
			// Step 3: Execute the query or update query
			ResultSet rs = preparedStatement.executeQuery();

			// Step 4: Process the ResultSet object.
			while (rs.next()) {
				int id = rs.getInt("u_id");
				String fname = rs.getString("fname");
				String lname = rs.getString("lname");
				String uname = rs.getString("uname");
				String dob = rs.getString("dob");
				String gender = rs.getString("gender");
				String phoneno = rs.getString("phoneno");
				String email = rs.getString("email");
				String password = rs.getString("password");
				users.add(new User( id, fname, lname, uname, dob, gender, phoneno, email, password));
			}
		} catch (SQLException e) {
			printSQLException(e);
		}
		return users;
	}

	public boolean deleteUser(int id) throws SQLException {
		boolean rowDeleted;
		try (Connection connection = getConnection();
				PreparedStatement statement = connection.prepareStatement(DELETE_USERS_SQL);) {
			statement.setInt(1, id);
			rowDeleted = statement.executeUpdate() > 0;
		}
		return rowDeleted;
	}

	public boolean updateUser(User user) throws SQLException {
		boolean rowUpdated;
		try (Connection connection = getConnection();
				PreparedStatement statement = connection.prepareStatement(UPDATE_USERS_SQL);) 
		{
			statement.setString(1, user.getFname());
			statement.setString(2, user.getLname());
			statement.setString(3, user.getDob());
			statement.setString(4, user.getGender());
			statement.setString(5, user.getPhoneno());
			statement.setString(6, user.getEmail());
			statement.setInt(7, user.getId());
			
			rowUpdated = statement.executeUpdate() > 0;
		}
		return rowUpdated;
	}

	private void printSQLException(SQLException ex) {
		for (Throwable e : ex) {
			if (e instanceof SQLException) {
				e.printStackTrace(System.err);
				System.err.println("SQLState: " + ((SQLException) e).getSQLState());
				System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
				System.err.println("Message: " + e.getMessage());
				Throwable t = ex.getCause();
				while (t != null) {
					System.out.println("Cause: " + t);
					t = t.getCause();
				}
			}
		}
	}
}
