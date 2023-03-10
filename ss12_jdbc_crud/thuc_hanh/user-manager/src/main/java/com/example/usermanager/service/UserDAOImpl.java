package com.example.usermanager.service;

import com.example.usermanager.model.User;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UserDAOImpl implements IUserDAO{
    private String jdbcUrl = "jdbc:mysql://localhost:3306/ss12_user";
    private String jdbcUserName = "root";
    private String jdbcPassword = "chinh@240203";
    private static final String INSERT_USER_SQL = "insert into users (name, email, country) values (?,?,?);";
    private static final String SELECT_USER_BY_ID = "select * from users where id = ?;";
    private static final String SELECT_ALL_USERS = "select * from users;";
    private static final String DELETE_USER_BY_ID = "delete from users where id = ?;";
    private static final String UPDATE_USER_BY_ID = "update users set name = ?, email = ?, country = ? where id = ?;";
    private static final String SELECT_USER_BY_COUNTRY = "select * from users where country like ?;";
    public UserDAOImpl() {
    }
    protected Connection getConnection() {
        Connection connection = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcUrl, jdbcUserName, jdbcPassword);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return connection;
    }
    public void insertUser(User user) {
        try(Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(INSERT_USER_SQL)) {
            preparedStatement.setString(1, user.getName());
            preparedStatement.setString(2, user.getEmail());
            preparedStatement.setString(3, user.getCountry());
            System.out.println(preparedStatement);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    public List<User> selectAllUsers() {
        List<User> users = new ArrayList<>();
        try(Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_USERS)) {
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                String email = resultSet.getString("email");
                String country = resultSet.getString("country");
                users.add(new User(id, name, email, country));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return users;
    }
    public User selectUser(int id) {
        User user = null;
        try(Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(SELECT_USER_BY_ID)) {
            preparedStatement.setInt(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();
            while(resultSet.next()) {
                String name = resultSet.getString("name");
                String email = resultSet.getString("email");
                String country = resultSet.getString("country");
            user = new User(id, name, email, country);
            }
            return user;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    public boolean deleteUser(int id) {
        boolean rowDeleted;
        try(Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(DELETE_USER_BY_ID)) {
            preparedStatement.setInt(1, id);
            rowDeleted = preparedStatement.executeUpdate() > 0;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return rowDeleted;
    }
    public boolean updateUser(User user) {
        boolean rowUpdated;
        try(Connection connection = getConnection();PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_USER_BY_ID)) {
            preparedStatement.setString(1, user.getName());
            preparedStatement.setString(2, user.getEmail());
            preparedStatement.setString(3, user.getCountry());
            preparedStatement.setInt(4, user.getId());
            rowUpdated = preparedStatement.executeUpdate() > 0;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return rowUpdated;
    }

    @Override
    public List<User> searchUserByName(String name) {
        List<User> userList = new ArrayList<>();
        try(Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(SELECT_USER_BY_COUNTRY)) {
            preparedStatement.setString(1, name);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String nameUser = resultSet.getString("name");
                String email = resultSet.getString("email");
                String country = resultSet.getString("country");
                userList.add(new User(id, nameUser, email, country));
            }
            System.out.println(userList);
            return userList;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
