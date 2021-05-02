package com.dashboard.service;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;

import javax.servlet.http.HttpServletRequest;

public class NIUMWalletBalance {
	String jsonResponse = null;
	String response = null;

	
	public String walletb (String ipax,String clientkahash,String oauthAccessToken,String CustomerHashID,String WalletHashID,HttpServletRequest request,String auth,String nisg) {


		try {

			URL url = new URL(nisg+"/api/v1/getWalletBalance/"+CustomerHashID+"/"+WalletHashID);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setDoOutput(true);
			conn.setRequestMethod("GET");
			conn.setRequestProperty("Content-Type", "application/json");
			conn.setRequestProperty("clientHasID", clientkahash);
			conn.setRequestProperty("x-api-key",ipax);
			conn.setRequestProperty("Authorization", "Bearer " + oauthAccessToken);


			/*
			 * OutputStream os = conn.getOutputStream(); os.write(input.getBytes());
			 * os.flush();
			 */

		BufferedReader br = new BufferedReader(new InputStreamReader(
		(conn.getInputStream())));


		while ((jsonResponse = br.readLine())!= null) {


		response = jsonResponse;


		}




		} catch (Exception e) {
		e.printStackTrace();
		

		}


		return response;
		}

}
