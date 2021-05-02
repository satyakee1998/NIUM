package com.dashboard.service;

import java.io.IOException;

import okhttp3.MediaType;
import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.Response;

public class GetcardByID {
	public String getcardid(String oauthAccessToken, String memberId, String userCardid, String MMurl) {

		String result = null;

		try {

			OkHttpClient client = new OkHttpClient().newBuilder().build();
			MediaType mediaType = MediaType.parse("application/json,text/plain");

			Request request = new Request.Builder()
					.url(MMurl + "/api/v1/card/getCardByIdPublic/" + memberId + "/" + userCardid).method("GET", null)
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
		} catch (Exception e) {
			/* exception */
			return e.getMessage();
		}

		return result;
	}

	/*
	 * public static void main(String...args) { OauthAuthentication auth = new
	 * OauthAuthentication(); String
	 * token=auth.createOauthToken("mithilesh@stylopay.com","W@llet123",
	 * null,"http://developer.sandbox.stylopay.com:8081");
	 * System.out.println(token);
	 * 
	 * }
	 */
}
