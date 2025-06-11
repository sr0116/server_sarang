package util;

import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.mapping.Environment;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.apache.ibatis.transaction.TransactionFactory;
import org.apache.ibatis.transaction.jdbc.JdbcTransactionFactory;

public class MybatisUtil {
	
	private static SqlSessionFactory sqlSessionFactory;
	
	static {
		try {
			InputStream is = Resources.getResourceAsStream("mybatis-config.xml");
			sqlSessionFactory = new SqlSessionFactoryBuilder().build(is);
			TransactionFactory factory = new JdbcTransactionFactory();
			Environment environment = new Environment("mybatis-conf", factory, HikariCPUtil.getDataSource());
			sqlSessionFactory.getConfiguration().setEnvironment(environment);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public static SqlSession getSqlSession() {
		return sqlSessionFactory.openSession(true);
	}
	
	public static void main(String[] args) {
		System.out.println(sqlSessionFactory.getConfiguration().getEnvironment().getDataSource());
	}

}
