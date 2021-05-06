package com.dashboard.service;

import java.io.IOException;
import java.util.concurrent.TimeUnit;

import okhttp3.MediaType;
import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.Response;

public class GetUserAddress {

	

		

		String jsonResponse = null;
		String response = null;
		
		public String user(String oauthAccessToken,String memberId,String residential, String mmurl) {
			// TODO Auto-generated method stub

	String result =null;

			try {
		
			OkHttpClient client = new OkHttpClient().newBuilder()
			.build();
			MediaType mediaType = MediaType.parse("application/json,text/plain");

			Request request = new Request.Builder()
			.url(mmurl+"/api/v1/getUserAddressPublic/"+memberId+"?addressType="+residential)
			.method("GET", null)
			.addHeader("Content-Type", "application/json")
			.addHeader("Authorization", "Bearer " + oauthAccessToken)
			.addHeader("addressType", "residential")

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



