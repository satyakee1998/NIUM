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

public class FetchUserDetails {
	///// private static final com.sun.org.slf4j.internal.Logger LOGGER =
	///// LoggerFactory.getLogger(PostPrefund.class);

	String jsonResponse = null;
	String response = null;

	public String fetchuserdetails(String oauthAccessToken, String UserId, HttpServletRequest request, String nisg) {

		try {

			URL url = new URL(nisg + "/api-mm/api/v1/users/userPublic/" + UserId);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setDoOutput(true);
			conn.setRequestMethod("GET");
			conn.setRequestProperty("Content-Type", "application/json");
			//// conn.setRequestProperty("clientHasID", clientkahash);
			//// conn.setRequestProperty("x-api-key", ipax);
			conn.setRequestProperty("Authorization", "Bearer " + oauthAccessToken);

			BufferedReader br = new BufferedReader(new InputStreamReader((conn.getInputStream())));

			while ((jsonResponse = br.readLine()) != null) {

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
}
