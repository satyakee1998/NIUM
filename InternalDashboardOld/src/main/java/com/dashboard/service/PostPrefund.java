

package com.dashboard.service;

import java.io.IOException;

import org.json.JSONObject;

import com.dashboard.bean.PrefundRequestBean;

import okhttp3.MediaType;
import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.RequestBody;
import okhttp3.Response;



public class PostPrefund {

	String jsonResponse = null;
	String response = null;
	
//	public String postpre(String bankReferenceNumber,String oauthAccessToken, String clientAccountNumber, String comments,String currencyCode,String dateOfTransfer,
//			String AccountNumber ,String amount,String requesterId , String Agent_Code, String Sub_Agent_code, String prefundreq, String MMurl) {
//		
		public String postpre(String oauthAccessToken,PrefundRequestBean prefundreq, String MMurl) {
		

	String result =null;

	
	try {
//		String input = "{  \"bankReferenceNumber\":\"" + bankReferenceNumber + "\", \"clientAccountNumber\": \""  + clientAccountNumber + "\", \"dateOfTransfer\":\""+
//							dateOfTransfer + "\",   \"accountNumber \": \""+AccountNumber+ "\", \"amount\":\""+
//								amount+ "\", \"requesterId\":\""+requesterId+"\", \"sub_agent_code\":\""+
//									Sub_Agent_code+"\"   , \"agent_code\":\""+Agent_Code+"\" , \"comments\":\"" + comments + "\", \"currencyCode\": \"" + currencyCode + "\"}";
		
//
			JSONObject Postprefundreq = new JSONObject(prefundreq);
//			OkHttpClient client = new OkHttpClient().newBuilder()
//			.build();
//			MediaType mediaType = MediaType.parse("application/json,text/plain");
//			RequestBody body = RequestBody.create(mediaType,Postprefundreq.toString());
	OkHttpClient client = new OkHttpClient().newBuilder()
	.build();
	MediaType mediaType = MediaType.parse("application/json,text/plain");
	RequestBody body = RequestBody.create(mediaType, Postprefundreq.toString());
	
	Request request = new Request.Builder()
	.url(MMurl+"/api/v1/postPrefundStyloPay")
	.method("POST", body)
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
