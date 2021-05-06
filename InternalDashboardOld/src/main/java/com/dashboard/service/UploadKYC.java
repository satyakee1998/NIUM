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

public class UploadKYC {
	public String uploadKYCs(String oauthAccessToken, List<MultipartFile> files, String username, String userid, String fourStopId, String mmurl) throws IOException
	{
	String result = null;

	OkHttpClient client = new OkHttpClient().newBuilder()
	.build();
	MediaType mediaType = MediaType.parse("text/plain");
	RequestBody body = new MultipartBody.Builder().setType(MultipartBody.FORM)
	.addFormDataPart("user_name", username)
	.addFormDataPart("user_number", userid)
	.addFormDataPart("customer_registration_id", fourStopId)
	.addFormDataPart("doc",files.get(0).getOriginalFilename(),
	RequestBody.create(MediaType.parse("application/octet-stream"),
	files.get(0).getBytes()))
	.addFormDataPart("doc2",files.get(1).getOriginalFilename(),
	RequestBody.create(MediaType.parse("application/octet-stream"),
	files.get(1).getBytes()))
	.addFormDataPart("doc3",files.get(2).getOriginalFilename(),
	RequestBody.create(MediaType.parse("application/octet-stream"),
	files.get(2).getBytes()))

	.build();
	Request request = new Request.Builder()
	.url(mmurl+"/api/v1/CommonServices/UploadDocuments")
	.method("POST", body)

	.addHeader("Authorization", "Bearer "+oauthAccessToken)
	.build();
	Response response = null;
	try {
	response = client.newCall(request).execute();
	} catch (IOException e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
	}

	try {
	result = response.body().string();

	}
	catch(Exception e)
	{
	e.printStackTrace();
	}
	return result;
	}
	

}


