package com.dashboard.service;

import java.io.IOException;

import org.json.JSONObject;

import com.dashboard.bean.UpdateUserDetailsBean;

import okhttp3.MediaType;
import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.RequestBody;
import okhttp3.Response;

public class updateUserDetails {

public String updateDetails(String oauthAccessToken, UpdateUserDetailsBean userDetails, String MMurl) {


String result =null;


try {
JSONObject UserpersonalDetails = new JSONObject(userDetails);
OkHttpClient client = new OkHttpClient().newBuilder()
.build();
MediaType mediaType = MediaType.parse("application/json,text/plain");
RequestBody body = RequestBody.create(mediaType,UserpersonalDetails.toString());


Request request = new Request.Builder()
.url(MMurl+"/api/v1/updateUserPublic")
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