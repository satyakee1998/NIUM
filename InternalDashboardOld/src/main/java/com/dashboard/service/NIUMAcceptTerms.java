

package com.dashboard.service;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;

import javax.servlet.http.HttpServletRequest;

import org.json.JSONArray;
import org.json.JSONObject;




public class NIUMAcceptTerms {
	///// private static final com.sun.org.slf4j.internal.Logger LOGGER = LoggerFactory.getLogger(PostPrefund.class);

	String currency = null;
	String username = null;
	String valueof = "true";
	String jsonResponse = null;
	String response = null;
	
	public String accepterms(String clientkahash,String ipax,String oauthAccessToken,String tcname,String version ,String customerid,HttpServletRequest request,String nisg) {
		
		
		try {

			URL url = new URL(nisg+"/api/v1/acceptTermsAndCondition/"+customerid);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setDoOutput(true);
			conn.setRequestMethod("POST");
			conn.setRequestProperty("Content-Type", "application/json");
			conn.setRequestProperty("clientHasID", clientkahash);
			conn.setRequestProperty("x-api-key", ipax);
				conn.setRequestProperty("Authorization", "Bearer " + oauthAccessToken);
			
			String input = "{\"accept\":\""+valueof+"\",\"name\":\""+tcname+"\",\"versionId\":\""+version+"\"}";
						
			

			OutputStream os = conn.getOutputStream();
			os.write(input.getBytes());
			os.flush();
			

			BufferedReader br = new BufferedReader(new InputStreamReader(
					(conn.getInputStream())));
			

			while ((jsonResponse = br.readLine())!= null) {	
		
				
				response = jsonResponse;				
				
				
			}
			

			

		  } catch (MalformedURLException e) {

			 ///// LOGGER.error(Constant.ERRORS, e.getCause(), e.getMessage());
			  return e.getMessage();
			
		  } catch (IOException e) {

				/////  LOGGER.error(Constant.ERRORS, e.getCause(), e.getMessage());
				///  return e.getMessage();
				  request.getSession().setAttribute("niumstatus", "Something is not right, We are checking" );
						

			 }	
		
		
		return response;
	}

}
