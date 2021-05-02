package com.dashboard.service;

import java.io.IOException;
import java.util.concurrent.TimeUnit;

import okhttp3.MediaType;
import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.Response;
public class GetWallet {

	String jsonResponse = null;
	String response = null;
	
	public String walletb (String oauthAccessToken,String memberId, String MMurl) {
		
		
		String result =null;

		try {
		
		OkHttpClient client = new OkHttpClient().newBuilder()
				.connectTimeout(30, TimeUnit.SECONDS)
  				.readTimeout(30, TimeUnit.SECONDS)
		.build();
		MediaType mediaType = MediaType.parse("application/json,text/plain");
		Request request = new Request.Builder()
		.url(MMurl+"/api/v1/users/getWalletBalancePublic/"+memberId)
		.method("GET", null)
		.addHeader("Content-Type", "application/json")
		.addHeader("Authorization", "Bearer " + oauthAccessToken)
	
		.build();
		Response response = null;
		try {
		response = client.newCall(request).execute();
		} catch (IOException e) {
		/* exception */
		return e.getMessage();
		}

		try {
		result = response.body().string();

		} catch (IOException e) {
			/* exception */
		return e.getMessage();
		}
		}
		catch (Exception e) {
			/* exception */
		return e.getMessage();
		}

		return result;
	}

}
