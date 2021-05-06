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


public class PostKycDocuments {



String jsonResponse = null;
String response = null;
public static String postKYCDocument(String oauthAccessToken, MultipartFile files, String mmurl) throws IOException
{
String result = null;

OkHttpClient client = new OkHttpClient().newBuilder()
.build();
MediaType mediaType = MediaType.parse("text/plain");
RequestBody body = new MultipartBody.Builder().setType(MultipartBody.FORM)
.addFormDataPart("doc",files.getOriginalFilename(),
RequestBody.create(MediaType.parse("application/octet-stream"),
files.getBytes()))
.build();
Request request = new Request.Builder()
.url(mmurl+"/api/v1/kyc/postKycDocuments")
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

public String uploadDoc(String oauthAccessToken, List <MultipartFile> files, String mmurl) throws IOException
{
String result = null;

OkHttpClient client = new OkHttpClient().newBuilder()
.build();
MediaType mediaType = MediaType.parse("text/plain");
RequestBody body = new MultipartBody.Builder().setType(MultipartBody.FORM)

.addFormDataPart("doc",files.get(0).getOriginalFilename(),
RequestBody.create(MediaType.parse("application/octet-stream"),
files.get(0).getBytes()))

.build();
Request request = new Request.Builder()
.url(mmurl+"/api/v1/kyc/postKycDocuments")
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

