package com.dashboard.service;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;



public class GetUserTransaction {
String jsonResponse = null;
String response = null;

public String UserTransaction (String oauthAccessToken,String memberId,String page, String MMurl) {



try {

URL url = new URL(MMurl+"/api/v1/wallet/getTransactionPublic/"+memberId+"/"+page);
HttpURLConnection conn = (HttpURLConnection) url.openConnection();
conn.setDoOutput(true);
conn.setRequestMethod("GET");
conn.setRequestProperty("Content-Type", "application/json");
conn.setRequestProperty("Authorization", "Bearer " + oauthAccessToken);

BufferedReader br = new BufferedReader(new InputStreamReader((conn.getInputStream())));

while ((jsonResponse = br.readLine()) != null) {

response = jsonResponse;

}

}catch (MalformedURLException e) {

return e.getMessage();

} catch (IOException e) {

return e.getMessage();

}


return response;
}

}
