package com.example.usermanager.service;

import com.example.usermanager.model.User;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UserDAOImpl implements IUserDAO {
    private String jdbcUrl = "jdbc:mysql://localhost:3306/ss12_user";
    private String jdbcUserName = "root";
    private String jdbcPassword = "chinh@240203";
    private static final String INSERT_USER_SQL = "insert into users (name, email, country) values (?,?,?);";
    private static final String SELECT_USER_BY_ID = "select * from users where id = ?;";
    private static final String SELECT_ALL_USERS = "select * from users;";
    private static final String DELETE_USER_BY_ID = "delete from users where id = ?;";
    private static final String UPDATE_USER_BY_ID = "update users set name = ?, email = ?, country = ? where id = ?;";
    private static final String SELECT_USER_BY_COUNTRY = "select * from users where country like ?;";
    private static final String SORT_USER_BY_NAME = "select * from users order by name;";

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
        try (Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(INSERT_USER_SQL)) {
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
        String query = "{call get_list_user}";
        List<User> users = new ArrayList<>();
        try (Connection connection = getConnection(); CallableStatement callableStatement = connection.prepareCall(query)) {
            ResultSet resultSet = callableStatement.executeQuery();

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
        try (Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(SELECT_USER_BY_ID)) {
            preparedStatement.setInt(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
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
        String query = "{call delete_user(?)}";
        try (Connection connection = getConnection(); CallableStatement callableStatement = connection.prepareCall(query)) {
            callableStatement.setInt(1, id);
            rowDeleted = callableStatement.executeUpdate() > 0;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return rowDeleted;
    }

    public boolean updateUser(User user) {
        boolean rowUpdated;
        String query = "{call edit_user(?,?,?,?)}";
        try (Connection connection = getConnection(); CallableStatement callableStatement = connection.prepareCall(query)) {
            callableStatement.setInt(1, user.getId());
            callableStatement.setString(2, user.getName());
            callableStatement.setString(3, user.getEmail());
            callableStatement.setString(4, user.getCountry());
            rowUpdated = callableStatement.executeUpdate() > 0;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return rowUpdated;
    }

    @Override
    public List<User> searchUserByName(String name) {
        List<User> userList = new ArrayList<>();
        try (Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(SELECT_USER_BY_COUNTRY)) {
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

    @Override
    public List<User> sortUserByName() {
        List<User> userList = new ArrayList<>();
        try (Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(SORT_USER_BY_NAME)) {
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                String email = resultSet.getString("email");
                String country = resultSet.getString("country");
                userList.add(new User(id, name, email, country));
            }
            return userList;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public User getUserById(int id) {
        User user = null;
        String query = "{call get_user_by_id(?)}";
        try (Connection connection = getConnection();
             CallableStatement callableStatement = connection.prepareCall(query)) {
            callableStatement.setInt(1, id);
            ResultSet resultSet = callableStatement.executeQuery();
            while (resultSet.next()) {
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

    @Override
    public void insertIntoUser(User user) throws SQLException {
        String query = "{call insert_user(?,?,?)}";
        try (Connection connection = getConnection(); CallableStatement callableStatement = connection.prepareCall(query)) {
            callableStatement.setString(1, user.getName());
            callableStatement.setString(2, user.getEmail());
            callableStatement.setString(3, user.getCountry());
            callableStatement.executeUpdate();
        }
    }

    @Override
    public void addUserTransaction(User user, int[] permissions) {
        Connection connection = null;
//        insert new user
        PreparedStatement preparedStatement = null;
//        assign permission for user
        PreparedStatement pstmtAssignment = null;
//        for getting user id
        ResultSet resultSet = null;
        try {
            connection = getConnection();
            connection.setAutoCommit(false);
            preparedStatement = connection.prepareStatement(INSERT_USER_SQL, Statement.RETURN_GENERATED_KEYS);
            preparedStatement.setString(1, user.getName());
            preparedStatement.setString(2, user.getEmail());
            preparedStatement.setString(3, user.getCountry());
            int rowEffected = preparedStatement.executeUpdate();
            resultSet = preparedStatement.getGeneratedKeys();
            int userId = 0;
            if (resultSet.next()) {
                userId = resultSet.getInt(1);
            }
            if (rowEffected == 1) {
                String sqlPivot = "insert into user_permision(permision_id, user_id) value (?,?);";
                pstmtAssignment = connection.prepareStatement(sqlPivot);
                for (int permissionId : permissions) {
                    pstmtAssignment.setInt(1, userId);
                    pstmtAssignment.setInt(2, permissionId);
                    pstmtAssignment.executeUpdate();
                }
                connection.commit();
            } else connection.rollback();
        } catch (SQLException e) {
            try {
                if (connection != null) connection.rollback();
            } catch (SQLException ex) {
                ex.getMessage();
            }
            System.out.println(e.getMessage());
        } finally {
            try {
                if (resultSet != null) resultSet.close();
                if (preparedStatement != null) preparedStatement.close();
                if (pstmtAssignment != null) pstmtAssignment.close();
                if (connection != null) connection.close();
            } catch (SQLException e) {
                System.out.println(e.getMessage());
            }
        }
    }

}
