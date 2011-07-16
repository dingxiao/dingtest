/**
 * 
 */
package com.psd.log4j;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.util.*;

//import javax.servlet.http.HttpServlet;

/**
 * @author psdstaff5
 *
 */
public class LogServlet extends HttpServlet {
	Hello hello =null;
    @Override
    public void init() {
    	String scachePort = "";//Settings.get("memcache/port","");
        int cachePort = 11211;
        String cacheHost = "";//Settings.get("memcache/host","");
        hello = new Hello();
    }	
    @Override
    public void doPost ( HttpServletRequest request, HttpServletResponse response )
     throws ServletException, IOException {
        PrintWriter out;
        Map<String, Object> jsonObject = new LinkedHashMap<String, Object>();

        response.setContentType("application/json");
        String func = request.getParameter("func");

        String sID = null;
        //Cookie[] cookies = request.getCookies();


        out = response.getWriter();
        if(func.compareTo("profile") == 0){ 
            String input = request.getParameter("input");
            out.print("test");

        }else{
            out.print("test");
        }

    }
    @Override
    public void doGet ( HttpServletRequest request, HttpServletResponse response )
     throws ServletException, IOException {
        PrintWriter out = response.getWriter();;

        response.setContentType("text/html");
        String func = request.getParameter("func");
        int temperature = 22;
        out.print("test from hello");
        if (hello != null){
        	hello.setTemperature(temperature);
        }
    }    
}
