package com.dashboard.service;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;

import javax.servlet.http.HttpServletRequest;

import okhttp3.MediaType;
import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.Response;
import com.dashboard.utility.Constant;


//import org.json.JSONArray;
//import org.json.JSONObject;

public class FetchUserList {
///// private static final com.sun.org.slf4j.internal.Logger LOGGER = LoggerFactory.getLogger(PostPrefund.class);

	/*
	 * String currency = null; String username = null;
	 */
String jsonResponse = null;
String response = null;

public String fetchcustomer (String order,String oauthAccessToken,String ipax,String clientkahash,HttpServletRequest request,String nisg) {


//String endings = "1000";
try {

URL url = new URL( nisg+"/api/v1/fetchCustomer?order="+order+"&page=&size=&email=&mobile=");
HttpURLConnection conn = (HttpURLConnection) url.openConnection();
conn.setDoOutput(true);
conn.setRequestMethod("GET");
conn.setRequestProperty("Content-Type", "application/json");
conn.setRequestProperty("clientHasID", clientkahash);
conn.setRequestProperty("x-api-key",ipax);
conn.setRequestProperty("Authorization", "Bearer " + oauthAccessToken);

/*
 * OutputStream os = conn.getOutputStream(); os.write(input.getBytes());
 * os.flush();
 */
BufferedReader br = new BufferedReader(new InputStreamReader(
(conn.getInputStream())));
while ((jsonResponse = br.readLine())!= null) {
response = jsonResponse;
}

} catch (MalformedURLException e) {

///// LOGGER.error(Constant.ERRORS, e.getCause(), e.getMessage());
return e.getMessage();
} catch (IOException e) {
return e.getMessage();
}
return response;
}
public String mmgetuserdetails (String oauthAccessToken,String memberId , String MMurl) {

String result =null;

try {

OkHttpClient client = new OkHttpClient().newBuilder()
.build();
MediaType mediaType = MediaType.parse("application/json,text/plain");

Request request = new Request.Builder()
.url(MMurl+"/api/v1/users/userPublic/"+memberId)
.method("GET", null)
.addHeader("Content-Type", "application/json")
.addHeader("Authorization", "Bearer " + oauthAccessToken)
.build();
Response response = null;
try {
response = client.newCall(request).execute();
} catch (IOException e) {
/*exception*/
return e.getMessage();
}

try {
result = response.body().string();

} catch (IOException e) {
/*exception*/
return e.getMessage();
}
}
catch (Exception e) {
/*exception*/
return e.getMessage();
}

return result;
}

}



