

package com.dashboard.service;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;

import org.json.JSONArray;
import org.json.JSONObject;



public class ShowPreFund {
	////// private static final com.sun.org.slf4j.internal.Logger LOGGER = LoggerFactory.getLogger(ShowPrefund.class);


	String jsonResponse = null;
	String response = null;
	
	public String getprefund (String oauthAccessToken, String Agent_code, String Sub_Agent_code, String MMurl) {
		
		
		
		try {

			URL url = new URL(MMurl+"/api/v1/getPrefundStyloPay/"+Agent_code+"/"+Sub_Agent_code);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setDoOutput(true);
			conn.setRequestMethod("GET");
			conn.setRequestProperty("Content-Type", "application/json");
			
			conn.setRequestProperty("Authorization", "Bearer " + oauthAccessToken);
			
			
			
			BufferedReader br = new BufferedReader(new InputStreamReader((conn.getInputStream())));

			while ((jsonResponse = br.readLine()) != null) {

				response = jsonResponse;

			}
			
		}catch (MalformedURLException e) {

			/* exception */
			return e.getMessage();
			
		  } catch (IOException e) {

			  /* exception */
			 
			  return e.getMessage();
				
		 }			
		
		
		return response;
	}
	
}


