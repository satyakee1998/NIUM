

package com.dashboard.service;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;

import org.json.JSONArray;
import org.json.JSONObject;

import okhttp3.MediaType;
import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.RequestBody;
import okhttp3.Response;



public class TransferToWallet {
	
	////// private static final com.sun.org.slf4j.internal.Logger LOGGER = LoggerFactory.getLogger(TransferToWallet.class);

	
	String currency = null;
	String username = null;
	
	String jsonResponse = null;
	String response = null;
	
	public String transferw(String oauthAccessToken,String amount,String email, String Agent_Code,String Sub_Agent_code,String client_agent_subAgent_name, String MMurl) {
	
	String result =null;

	
	try {
		String input = "{  \"amount\":\"" + amount + "\", \"email\":\""+email+"\",\"agent_code\":\"" + Agent_Code + "\",\"sub_agent_code\":\""+Sub_Agent_code+"\",\"client_agent_subAgent_name\":\""+client_agent_subAgent_name+"\"}";
		
	
	OkHttpClient client = new OkHttpClient().newBuilder()
	.build();
	MediaType mediaType = MediaType.parse("application/json,text/plain");
	RequestBody body = RequestBody.create(mediaType, input);
	
	Request request = new Request.Builder()
	.url(MMurl+"/api/v1/putFundIntoWalletStylopay")
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
