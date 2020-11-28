package com.thinking.machines.dao;

import java.sql.*;
public class DAOConnection
{
public static Connection getConnection() throws DAOException
{
try
{
Class.forName("com.mysql.cj.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/j2eeuec6thsem2020db","root","Pallavi@12");
return con;
}catch(Exception e)
{
throw new DAOException(e.getMessage());
}
}
}