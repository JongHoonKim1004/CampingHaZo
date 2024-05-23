package com.camping.service;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.ProtocolException;
import java.net.URL;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Service;

import com.camping.mapper.UsersMapper;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.camping.domain.UsersVO;
import com.camping.security.domain.CustomKakaoUser;
import com.camping.domain.KakaoVO;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class KakaoService {
 
	@Autowired
	private UsersMapper usersmapper;
  
	 // 인가코드 로 토큰 받기
	 public String getToken(String code) throws IOException {
	     
	        String host = "https://kauth.kakao.com/oauth/token";
	        URL url = new URL(host);
	        HttpURLConnection urlConnection = (HttpURLConnection) url.openConnection();
	        String token = "";
	        try {
	            urlConnection.setRequestMethod("POST");
	            urlConnection.setDoOutput(true);

	            BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(urlConnection.getOutputStream()));
	            StringBuilder sb = new StringBuilder();
	            sb.append("grant_type=authorization_code");
	            sb.append("&client_id=f9a28876f9104e4332a4a3e6cae9c8b5");
	            sb.append("&redirect_uri=http://localhost:8282/login/oauth2/code/kakao");
	            sb.append("&code=" + code);

	            bw.write(sb.toString());
	            bw.flush();

	            int responseCode = urlConnection.getResponseCode();
	            log.info("responseCode = " + responseCode);

	            BufferedReader br = new BufferedReader(new InputStreamReader(urlConnection.getInputStream()));
	            String line = "";
	            String result = "";
	            while ((line = br.readLine()) != null) {
	                result += line;
	            }
	            log.info("result = " + result);

	          
	            JSONParser parser = new JSONParser();
	            JSONObject elem = (JSONObject) parser.parse(result);
	            
	            

	            String access_token = elem.get("access_token").toString();
	            String refresh_token = elem.get("refresh_token").toString();
	            log.info("refresh_token = " + refresh_token);
	            log.info("access_token = " + access_token);

	            token = access_token;

	            br.close();
	            bw.close();
	        } catch (IOException e) {
	            e.printStackTrace();
	        } catch (ParseException e) {
	            e.printStackTrace();
	        }


	        return token;
	    }
	 
	 public KakaoVO userInfo(String access_Token) throws IOException{
			log.info("사용자 정보 보기------------------------");
			KakaoVO userInfo = new KakaoVO();
			
	 		String reqURl = "https://kapi.kakao.com/v2/user/me";

	 		try {
	 			URL url = new URL(reqURl);
	 			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	 			conn.setRequestMethod("GET");
	 			
	 			conn.setRequestProperty("Authorization", "Bearer " + access_Token);
	 			
	 			int responseCode = conn.getResponseCode();
	 			log.info("responseCode: " + responseCode);
	 			
	 			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
	 			
	 			String line = "";
	 			String result = "";
	 			
	 			while((line = br.readLine()) != null) {
	 				result += line;
	 			}
	 			
	 			log.info("responseBody: " + result);
	 			
	 			JsonParser parser = new JsonParser();
	 			JsonElement element = parser.parse(result);
	 			
	 			JsonObject properties = element.getAsJsonObject().get("properties").getAsJsonObject();
	 			JsonObject kakao_account = element.getAsJsonObject().get("kakao_account").getAsJsonObject();
	 			
	 			long id = element.getAsJsonObject().get("id").getAsLong();
	 			
	 			String nickname = properties.getAsJsonObject().get("nickname").getAsString();
	 			String email = kakao_account.getAsJsonObject().get("email").getAsString();
	 			
	 			log.info("id: " + id);
	 			log.info("nickname : " + nickname);
	 			
	 			userInfo.setKakaoId(id);
	 			userInfo.setNickname(nickname);
	 			userInfo.setKakaoEmail(email);
	 		} catch(Exception e) {
	 			e.printStackTrace();
	 		}
	 		return userInfo;
		}
	 
	        public void setAuthentication(String email) {
			UsersVO kakaouser = usersmapper.findByUsername(email);
			
			UserDetails userDetails = new CustomKakaoUser(kakaouser);
			
			Authentication authentication = new UsernamePasswordAuthenticationToken(userDetails, "", userDetails.getAuthorities());
			
			
			SecurityContextHolder.getContext().setAuthentication(authentication);
			
		}
	 
}
