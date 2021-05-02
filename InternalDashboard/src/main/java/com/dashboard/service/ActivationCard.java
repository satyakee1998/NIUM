package com.dashboard.service;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;

public class ActivationCard {
	String jsonResponse = null;
	String response = null;

	
	public String cardActivate(String oauthAccessToken, String activenum,String memberid, String cardid, String mmurl) {


		try {

		URL url = new URL(mmurl+"/api/v1/card/activationCardPublic/"+memberid+"/"+cardid);
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		conn.setDoOutput(true);
		conn.setRequestMethod("PUT");
		conn.setRequestProperty("Content-Type", "application/json");
		
		conn.setRequestProperty("Authorization", "Bearer " + oauthAccessToken);

		String input = "{\"activation_code\":\""+activenum+"\"}";



		OutputStream os = conn.getOutputStream();
		os.write(input.getBytes());
		os.flush();


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
