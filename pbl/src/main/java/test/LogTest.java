package test;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import ch.qos.logback.core.ConsoleAppender;

public class LogTest {
	public static final Logger logger = LoggerFactory.getLogger(LogTest.class);

	public static void main(String[] args) {

//		logger.
//		로그 레벨
		logger.debug("디버그 정보");
		logger.info("정보 로그");
		logger.warn("경고 로그");
		logger.error("에러 로그");
//		

	}
}
