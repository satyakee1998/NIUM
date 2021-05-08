package com.dashboard.service;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

import javax.servlet.http.HttpServletRequest;

import com.dashboard.utility.Constant;
public class NIUMGetCard {
	public String GetCustomerCard (String ipax,String clientkahash,String oauthAccessToken,String CustomerHashID,String WalletHashID,HttpServletRequest request,String nisg) {
		
		String jsonResponse = null;
		String response = null;
		
		
		try {

			URL url = new URL(nisg+"/api/v1/getCard/"+CustomerHashID+"/"+WalletHashID);
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
			
		}catch (Exception e) {

			return e.getMessage();
			
		  }
		return response;
	}
}
