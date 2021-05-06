package com.dashboard.service;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;



public class getPrefundBalanceStylopay {
	
	String jsonResponse = null;
	String response = null;
	
	public String getprefundbalance (String oauthAccessToken,String Agent_Code,String Sub_Agent_code, String MMurl) {
		
		
		
		try {

			URL url = new URL(MMurl+"/api/v1/getPrefundBalanceStyloPay/"+Agent_Code+"/"+Sub_Agent_code);
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





