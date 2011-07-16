/**
 * 
 */
package com.psd.log4j;

/**
 * @author psdstaff5
 *
 */
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class Hello {
	final Logger logger = LoggerFactory.getLogger(Hello.class);
	Integer t=0;
	Integer oldT;

	public void setTemperature(Integer temperature) {
 

	   oldT = t;        

	   t = temperature;

	   logger.debug("Temperature set to {}. Old temperature was {}.", t, oldT);
	   if(temperature.intValue() > 50) {
	      logger.info("Temperature has risen above 50 degrees.");
	   }
   }
}
