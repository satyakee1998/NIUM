

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
/*import org.springframework.web.server.ServerErrorException;*/



public class NIUMGetTerms {
	

	String jsonResponse = null;
	String response = null;
	
	public String getterms (String clientkahash,String ipax,HttpServletRequest request,String nisg) {
		
		
		
		try {

			URL url = new URL(nisg+"/api/v1/getTermsAndCondition");
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setDoOutput(true);
			conn.setRequestMethod("GET");
			conn.setRequestProperty("Content-Type", "application/json");
			conn.setRequestProperty("clientHasID", clientkahash);
			conn.setRequestProperty("x-api-key", ipax);
			/////conn.setRequestProperty("Authorization", "Bearer " + oauthAccessToken);
			
			
			
			BufferedReader br = new BufferedReader(new InputStreamReader((conn.getInputStream())));

			while ((jsonResponse = br.readLine()) != null) {

				response = jsonResponse;

			}
			
		}catch (MalformedURLException e) {

			return e.getMessage();
			
		  } catch (IOException e) {

				/////  LOGGER.error(Constant.ERRORS, e.getCause(), e.getMessage());
				///  return e.getMessage();
				  request.getSession().setAttribute("niumstatus", "Something is not right, We are checking" );
						

			 }	
				/*
				 * catch (ServerErrorException e) {
				 * 
				 * request.getSession().setAttribute("niumstatus",
				 * "Something is not right, We are checking" );
				 * 
				 * }
				 */
		
		
		return response;
	}

}
