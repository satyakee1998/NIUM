package com.dashboard.service;

import java.io.IOException;
import java.util.Base64;
import java.util.concurrent.TimeUnit;

import org.json.JSONObject;

import com.dashboard.bean.NIUMCreateCustomerBean;


import okhttp3.MediaType;
import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.RequestBody;
import okhttp3.Response;

public class NIUMAddCustomer {
	public String createUser(String clientkahash,String ipax,NIUMCreateCustomerBean createUserBean,String nisg)
	{
//		String response = null;

		String registerJsonResponse = null;
//		
		
		String result =null;


		try {
		

			JSONObject createUser = new JSONObject(createUserBean);
		OkHttpClient client = new OkHttpClient().newBuilder()
				.connectTimeout(30, TimeUnit.SECONDS)
  				.readTimeout(30, TimeUnit.SECONDS)
		.build();
		MediaType mediaType = MediaType.parse("application/json,text/plain");
		RequestBody body = RequestBody.create(mediaType,createUser.toString());
//		BASE64Encoder enc = new sun.misc.BASE64Encoder();
		String clientKeys = "swagger-client" + ":" + "swagger-secret";
		String encodedAuthorization = Base64.getEncoder().encodeToString(clientKeys.getBytes());
		Request request = new Request.Builder()
		.url(nisg+"/api/v1/addCustomer")
		.method("POST", body)
		.addHeader("Content-Type", "application/json")
		.addHeader("Authorization",  "Basic " + encodedAuthorization)
		.addHeader("x-api-key", ipax)
		.addHeader("clientHasID", clientkahash)
		.build();
		Response response = null;
		try {
		response = client.newCall(request).execute();
		} catch (IOException e) {
		
		return e.getMessage();
		}

		try {
		result = response.body().string();

		} catch (IOException e) {
		
		return e.getMessage();
		}
		}
		catch (Exception e) {
		
		return e.getMessage();
		}

		return result;
	}


}
