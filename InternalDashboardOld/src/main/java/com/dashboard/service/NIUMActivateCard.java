package com.dashboard.service;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;

import javax.servlet.http.HttpServletRequest;

import org.json.JSONArray;
import org.json.JSONObject;




public class NIUMActivateCard {
	///// private static final com.sun.org.slf4j.internal.Logger LOGGER = LoggerFactory.getLogger(PostPrefund.class);

	String currency = null;
	String username = null;
	
	String jsonResponse = null;
	String response = null;	
	
	public String unblock (String instruction,String ipax,String clientkahash,String oauthAccessToken,String cushas,String walhas,String carhas, HttpServletRequest request,String auth,String nisg,String reason,String blockAction) {
		
		
		try {

			URL url = new URL(nisg+"/api/v1/"+instruction+"/"+cushas+"/"+walhas+"/"+carhas);
//			
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setDoOutput(true);
			conn.setRequestMethod("POST");
			conn.setRequestProperty("Content-Type", "application/json");
			conn.setRequestProperty("clientHasID", clientkahash);
			conn.setRequestProperty("x-api-key", ipax);
			conn.setRequestProperty("Authorization", "Bearer " + oauthAccessToken);
			
			String input = "{\"reason\":\""+reason+"\",\"blockAction\":\""+blockAction+"\"}";
						
			

			OutputStream os = conn.getOutputStream();
			os.write(input.getBytes());
			os.flush();
			

			BufferedReader br = new BufferedReader(new InputStreamReader(
					(conn.getInputStream())));
			

			while ((jsonResponse = br.readLine())!= null) {	
		
				
				response = jsonResponse;				
				
				
			}
			

			

		  } catch (MalformedURLException e) {

			 ///// LOGGER.error(Constant.ERRORS, e.getCause(), e.getMessage());
			  return e.getMessage();
			
		  } catch (IOException e) {

			  request.getSession().setAttribute("niumstatus", "Something Went Wrong." );
		  		
			/////  LOGGER.error(Constant.ERRORS, e.getCause(), e.getMessage());
			  return e.getMessage();
				

		 }		
			/*
			 * catch (ServerErrorException e) {
			 * 
			 * request.getSession().setAttribute("niumstatus", "Something Went Wrong." );
			 * 
			 * }
			 */
		
		return response;
	}

}
