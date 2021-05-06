

package com.dashboard.service;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;

import javax.servlet.http.HttpServletRequest;


import org.springframework.web.client.HttpServerErrorException;



/*import com.sun.org.slf4j.internal.LoggerFactory;*/

public class NiumGetCustomer {
	///// private static final com.sun.org.slf4j.internal.Logger LOGGER = LoggerFactory.getLogger(GetCustomer.class);


	String jsonResponse = null;
	String response = null;
	
	public String getcustomerdetails (String ipax,String clientkahash,String oauthAccessToken,String customererid,HttpServletRequest request,String auth,String nisg) {
		
		
		
		try {

			URL url = new URL(nisg+"/api/v1/getCustomer/"+customererid);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setDoOutput(true);
			conn.setRequestMethod("GET");
			conn.setRequestProperty("Content-Type", "application/json");
			conn.setRequestProperty("clientHasID", clientkahash);
			conn.setRequestProperty("x-api-key", ipax);
			conn.setRequestProperty("Authorization", "Bearer " + oauthAccessToken);
			
			
			
			BufferedReader br = new BufferedReader(new InputStreamReader((conn.getInputStream())));

			while ((jsonResponse = br.readLine()) != null) {

				response = jsonResponse;

			}
			
		}catch (MalformedURLException e) {

		////	LOGGER.error(Constant.ERRORS, e.getCause(), e.getMessage());
			return e.getMessage();
			
		  } catch (IOException e) {

			  request.getSession().setAttribute("niumstatus", "Something Went Wrong." );
		  		
			  ////  LOGGER.error(Constant.ERRORS, e.getCause(), e.getMessage());
			  

		 }			catch (HttpServerErrorException e) {
				
			 request.getSession().setAttribute("niumstatus", "Something Went Wrong." );
		  			
			}
		
		
		return response;
	}

}
