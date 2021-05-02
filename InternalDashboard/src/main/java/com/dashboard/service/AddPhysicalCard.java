package com.dashboard.service;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.concurrent.TimeUnit;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Component;

import okhttp3.MediaType;
import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.RequestBody;
import okhttp3.Response;

public class AddPhysicalCard {
String jsonResponse = null;
String response = null;

public String assignphycard(String oauthAccessToken, String accountnum, String stylophycad, String memberid, String walletid, String MMurl ) {



String result =null;



try {
String input = "{ \"cardTypeCode\":\"" + stylophycad + "\", \"assoc_number\": \"" + accountnum + "\",\"userId\":\""+memberid +"\", \"walletHashId\":\"" +walletid+"\"}";

OkHttpClient client = new OkHttpClient().newBuilder()
.build();
MediaType mediaType = MediaType.parse("application/json,text/plain");
RequestBody body = RequestBody.create(mediaType, input);

Request request = new Request.Builder()
.url(MMurl+"/api/v1/card/addPhysicalCard")
.method("POST", body)
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


public String cardActivate(String oauthAccessToken, String activenum, String cardid, String mmurl) {

String result =null;


try {
String input = "{ \"activation_code\":\"" + activenum + "\"}";

OkHttpClient client = new OkHttpClient().newBuilder()
.build();
MediaType mediaType = MediaType.parse("application/json,text/plain");
RequestBody body = RequestBody.create(mediaType, input);

Request request = new Request.Builder()
.url(mmurl+"/api/v1/card/activationCard/"+cardid)
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