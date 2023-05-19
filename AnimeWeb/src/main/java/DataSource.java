package database;

import java.sql.Connection;

import java.sql.SQLException;


import com.zaxxer.hikari.HikariConfig;
import com.zaxxer.hikari.HikariDataSource;


public class DataSource {
	// Kết nối database bằng việc sử dụng thư viện hikari
	private static final String DB_URL = "jdbc:mysql://34.124.156.105/animeweb";
	private static final String USER = "root";
	private static final String PASS = "123456";
	private static final HikariConfig config = new HikariConfig();
	private static final String CLASS_NAME = "com.mysql.cj.jdbc.Driver";
	static HikariDataSource ds;
	

	static {

		config.setJdbcUrl(DB_URL);
		config.setUsername(USER);
		config.setPassword(PASS);
		config.setDriverClassName(CLASS_NAME);
		config.setMinimumIdle(5);

		config.setMaximumPoolSize(30);
		config.setConnectionTimeout(50000);
		config.addDataSourceProperty("cachePrepStmts", "true");
		config.addDataSourceProperty("prepStmtCacheSize", "250");
		config.addDataSourceProperty("prepStmtCacheSqlLimit", "2048");
		config.setIdleTimeout(Long.MAX_VALUE);
		ds = new HikariDataSource(config);

	}
	
	private DataSource() {
	}

	public static void closeConnection() {
		ds.close();
	}

	public static Connection getConnection() throws SQLException {
		return ds.getConnection();
	}

	public static void main(String[] args) throws SQLException {
		System.out.println(DataSource.getConnection());
	}



}