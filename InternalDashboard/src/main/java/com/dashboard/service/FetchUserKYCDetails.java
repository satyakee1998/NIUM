package com.dashboard.service;

	import java.io.IOException;
	import java.util.List;

	import org.springframework.web.multipart.MultipartFile;

	import okhttp3.MediaType;
	import okhttp3.MultipartBody;
	import okhttp3.OkHttpClient;
	import okhttp3.Request;
	import okhttp3.RequestBody;
	import okhttp3.Response;

	public class FetchUserKYCDetails  {
		

		String jsonResponse = null;
		String response = null;
		
		public String getcustomerKYCdetails (String oauthAccessToken,String memberId, String MMurl) {
			
			String result =null;

			
			try {
			
			OkHttpClient client = new OkHttpClient().newBuilder()
			.build();
			MediaType mediaType = MediaType.parse("application/json,text/plain");

			Request request = new Request.Builder()
			.url(MMurl+"/api/v1/CommonServices/getKycDetails/"+memberId)
			.method("GET", null)
			.addHeader("Content-Type", "application/json")
			.addHeader("Authorization", "Bearer " + oauthAccessToken)
			.addHeader("cardTypeCode", "stylopaymccard")

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
