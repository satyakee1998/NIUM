package com.dashboard.service;

import java.io.IOException;

import org.json.JSONObject;

import com.dashboard.bean.UpdateUserAddressBean;

import okhttp3.MediaType;
import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.RequestBody;
import okhttp3.Response;

public class UpdateAddress {
	 public String updateAddress(String oauthAccessToken,String memberid, UpdateUserAddressBean addressBean, String MMurl) {
			
     	String jsonResponse = null;
			String result =null;


			try {
			

			JSONObject updateuserMM = new JSONObject(addressBean);
			OkHttpClient client = new OkHttpClient().newBuilder()
			.build();
			MediaType mediaType = MediaType.parse("application/json,text/plain");
			RequestBody body = RequestBody.create(mediaType,updateuserMM.toString());
			Request request = new Request.Builder()
			.url(MMurl+"/api/v1/updateUserAddressPublic/"+memberid)
			.method("PUT", body)
			.addHeader("Content-Type", "application/json")
			.addHeader("Authorization", "Bearer " + oauthAccessToken)

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
