package util;

import java.beans.PropertyChangeSupport;
import java.io.FileNotFoundException;
import java.io.InputStream;
import java.util.Hashtable;
import java.util.Properties;

import javax.sql.DataSource;

import com.zaxxer.hikari.HikariConfig;
import com.zaxxer.hikari.HikariDataSource;



public class HikariCPUtil {
	private static HikariDataSource dataSource;
	static {
		HikariConfig config = new HikariConfig();
		config.setJdbcUrl("jdbc:log4jdbc:mariadb://np.imchobo.com:3306/pbl");
		config.setUsername("sample");
		config.setPassword("1234");
		//
		Hashtable<String, Object> hashtable;
		
		//Properties  <string string>
		// 설정 정보 관리, 파일
		Properties props = new Properties();
		try (InputStream is = Thread.currentThread()
							.getContextClassLoader()
							.getResourceAsStream("secret/db.properties")) {
		if(is == null) {
			throw new FileNotFoundException("Cannot find db.properties in classpath");
		}
		props.load(is);
		} catch (Exception e) {
			e.printStackTrace();
		}
		config.setJdbcUrl(props.getProperty("jdbc.url"));
		config.setUsername(props.getProperty("jdbc.username"));
		config.setPassword(props.getProperty("jdbc.password"));
		config.setDriverClassName(props.getProperty("jdbc.driver.className"));
		
//		config.setDriverClassName("org.mariadb.jdbc.Driver");
		config.setDriverClassName("net.sf.log4jdbc.sql.jdbcapi.DriverSpy");
		config.setMaximumPoolSize(10);
		config.setMinimumIdle(5);
		config.setIdleTimeout(30000);
		config.setConnectionTimeout(30000);
		config.setPoolName("MyHikariCP");
		
		dataSource = new HikariDataSource(config);
	}
	
	public static DataSource getDataSource() {
		return dataSource;
	}
	public static void main(String[] args) {
		
		System.out.println(getDataSource());
		System.out.println(dataSource);
	}


}
