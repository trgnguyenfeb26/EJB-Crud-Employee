package DemoEJB.Sevrvic;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.ejb.LocalBean;
import javax.ejb.Stateless;

import DemoEJB.Model.Employee;

/**
 * Session Bean implementation class Employee
 */
@Stateless
@LocalBean
public class Employees implements EmployeesRemote, EmployeesLocal {

    /**
     * Default constructor. 
     */
    public Employees() {
        // TODO Auto-generated constructor stub
    }
    protected Connection getConnection() {
		Connection connection = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/demoEJB?useSSL=false", "root", "123456");
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		return connection;
	}
	@Override
	public void insertEmployee(Employee employee) {
		// TODO Auto-generated method stub
		try (Connection conn = getConnection();
				PreparedStatement preparedStatement 
			= conn.prepareStatement("INSERT INTO employee (name,email,phone,address) VALUES (?, ?, ?, ?);")) {
			preparedStatement.setString(1, employee.getName());
			preparedStatement.setString(2, employee.getEmail());
			preparedStatement.setString(3, employee.getPhone());
			preparedStatement.setString(4, employee.getAddress());
			preparedStatement.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
	@Override
	public void deleteEmployee(int id) {
		// TODO Auto-generated method stub
		try (Connection conn = getConnection();
				PreparedStatement statement = conn.prepareStatement("delete from employee where id = ?;");) {
			statement.setInt(1, id);
			statement.executeUpdate();
		}catch (SQLException e) {
			e.printStackTrace();
		}

	}
	@Override
	public void updateEmployee(Employee employee) {
		// TODO Auto-generated method stub
		try (Connection conn = getConnection();
				PreparedStatement statement = conn.prepareStatement("update employee set name = ?,email= ?,phone= ?, address = ? where id = ?;");) {
			statement.setString(1, employee.getName());
			statement.setString(2, employee.getEmail());
			statement.setString(3, employee.getPhone());
			statement.setString(4, employee.getAddress());
			statement.setInt(5, employee.getId());
			statement.executeUpdate();
		}catch (SQLException e) {
			e.printStackTrace();
		}
	}
	@Override
	public Employee findEmployee(int id) {
		// TODO Auto-generated method stub
		Employee employee = null;
		try (Connection connection = getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement("select id,name,email,phone,address from Employee where id =?");) {
			preparedStatement.setInt(1, id);
			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				String name = rs.getString("name");
				String email = rs.getString("email");
				String phone = rs.getString("phone");
				String Address = rs.getString("Address");
				employee = new Employee(id, name, email,phone, Address);
			}
		} catch (SQLException e) {
			
		}
		return employee;
	}
	@Override
	public List<Employee> findAllEmployee() {
		// TODO Auto-generated method stub
		List<Employee> employees = new ArrayList<>();
		try (Connection conn = getConnection();
				PreparedStatement preparedStatement = conn.prepareStatement("SELECT * FROM employee;");) {
				ResultSet rs = preparedStatement.executeQuery();
				while (rs.next()) {
					int id = rs.getInt("id");
					String name = rs.getString("name");
					String email = rs.getString("email");
					String phone = rs.getString("phone");
					String Address = rs.getString("Address");
					employees.add(new Employee(id, name, email,phone, Address));
				}
			} catch (SQLException e) {	
				e.printStackTrace();
		}
		return employees;
	}
	
	

}
