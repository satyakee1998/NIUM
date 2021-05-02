package com.dashboard.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.dashboard.bean.LoginBean;
import com.dashboard.service.ActivationCard;
import com.dashboard.service.AddPhysicalCard;
import com.dashboard.service.FetchUserDetails;
import com.dashboard.service.FetchUserKYCDetails;
import com.dashboard.service.FetchUserList;
import com.dashboard.service.GetWallet;
import com.dashboard.service.GetcardByID;
import com.dashboard.service.NIUMWalletBalance;
import com.dashboard.service.OauthAuthentication;
import com.dashboard.utility.Constant;


@Controller
public class ClientController{
	



	@RequestMapping(value = "/dashboard", method = RequestMethod.GET)

	public String dash() {
	return "dashboard";
	}

	@RequestMapping(value = "/fetchCustomerDetails", method = RequestMethod.GET)
	public ModelAndView CLientList(HttpSession session,HttpServletRequest request) {
		return new ModelAndView("clientdetails");
	}
	
	@RequestMapping(value = "/UserList", method = RequestMethod.POST)
	public ModelAndView User(HttpSession session,HttpServletRequest request) {
		
		return new ModelAndView("userlist");
	}
	@RequestMapping(value = "/nisginternalcustomer", method = RequestMethod.GET)
	public ModelAndView User(@RequestParam("member_ID") String memberId,@RequestParam("wallet_hash_ID") String wallethashid,HttpServletRequest request) {
		request.getSession().setAttribute("member_Id", memberId);
		request.getSession().setAttribute("wallet_hash_Id", wallethashid);

		ModelAndView mv = new ModelAndView("userdetails");

		mv.addObject("memberId", memberId);
		mv.addObject("wallethashId", wallethashid);

		return mv;	}

	//Fetching NIUMUserList of Client
	@RequestMapping(value = "/userDetailsListnew", method = RequestMethod.GET)
	@ResponseBody
	public String UserList(HttpSession session,HttpServletRequest request) {
	OauthAuthentication newauth = new OauthAuthentication();
        String oauthAccessToken = newauth.createOauthToken(Constant.Email, Constant.Password,request, Constant.OauthUrl);
		FetchUserList user = new FetchUserList();
		
		String response = user.fetchcustomer(Constant.STARTING,Constant.ENDING,oauthAccessToken,Constant.Agent_Code,Constant.Sub_Agent_Code,request,  Constant.NIUMUrl);
		JSONArray fetchUserjsonArray = new JSONArray(response);
		JSONObject fetchUserjsonObject = fetchUserjsonArray.getJSONObject(0);
		request.getSession().setAttribute("nameof", fetchUserjsonObject.getString("memberId"));
		request.getSession().setAttribute("nameof", fetchUserjsonObject.getString("instarem_wallet_hash_id"));

		String customerhashid = fetchUserjsonObject.getString("memberId");
		String wallethashid = fetchUserjsonObject.getString("instarem_wallet_hash_id");
		System.out.println("MemberID:"+customerhashid);
		System.out.println("instarem_wallet_hash_id:"+wallethashid);
		
//		FetchUserDetails details = new FetchUserDetails();
//		details.fetchuserdetails(oauthAccessToken,userid,request,Constant.OauthUrl);
		return response;

	}
	//FETCHING NIUM WALLET BALANCE
	
	@RequestMapping(value = "/NIUMWalletInfo", method = RequestMethod.GET)
	@ResponseBody
	public String Walletbalance(HttpSession session,HttpServletRequest request, @RequestParam("CustomerHashID")String tempcutomerhashid,@RequestParam("WalletHashID")String tempwallethashid) {
	OauthAuthentication newauth = new OauthAuthentication();
        String oauthAccessToken = newauth.createOauthToken(Constant.Email, Constant.Password,request, Constant.OauthUrl);
		FetchUserList user = new FetchUserList();
		
		String resp = user.fetchcustomer(Constant.STARTING,Constant.ENDING,oauthAccessToken,Constant.Agent_Code,Constant.Sub_Agent_Code,request,  Constant.NIUMUrl);
		JSONArray fetchUserjsonArray = new JSONArray(resp);
		JSONObject fetchUserjsonObject = fetchUserjsonArray.getJSONObject(0);
		request.getSession().setAttribute("nameof", fetchUserjsonObject.getString("memberId"));
		request.getSession().setAttribute("nameof", fetchUserjsonObject.getString("instarem_wallet_hash_id"));
		String customerhashid = fetchUserjsonObject.getString("memberId");
		String wallethashid = fetchUserjsonObject.getString("instarem_wallet_hash_id");
		System.out.println("Customerhashid of Controller:"+customerhashid);
		System.out.println("Wallethashid of Controller:"+wallethashid);
		System.out.println("Customerhashid of View:"+tempcutomerhashid);
		System.out.println("Wallethashid of View:"+tempwallethashid);
		NIUMWalletBalance niumwalletbalance = new NIUMWalletBalance();
		String response= niumwalletbalance.walletb(Constant.xApiKey,Constant.clientHasId, oauthAccessToken, tempcutomerhashid, tempwallethashid, request, Constant.OauthUrl, Constant.NIUMUrl);
		System.out.println("Response:"+response);
		return response;
	}

	
	
//User details
	@RequestMapping(value = "/userDetails", method = RequestMethod.GET)
	@ResponseBody
	public String userDetails(HttpSession session , HttpServletRequest request, @RequestParam("newuserID")String newuserID) {
		OauthAuthentication newauth = new OauthAuthentication();

		String oauthAccessToken = newauth.createOauthToken(Constant.Email, Constant.Password,request, Constant.OauthUrl);
		String newUserID = (String) request.getSession().getAttribute("member_Id");
		FetchUserList userDetails = new FetchUserList();
		 return userDetails.mmgetuserdetails(oauthAccessToken,newUserID, Constant.MMUrl);
		 

	}

	/* fetch wallet details */
@RequestMapping(value = "/walletInfo", method = RequestMethod.GET)
@ResponseBody
public String walletdet(HttpServletRequest request, Model model,HttpServletResponse httpServletResponse) throws SQLException, JSONException {
	
	String email = (String) request.getSession().getAttribute("email");

	String password = (String) request.getSession().getAttribute("password");
	OauthAuthentication newauth = new OauthAuthentication();
	
	String oauthAccessToken = newauth.createOauthToken(Constant.Email,Constant.Password,request,Constant.OauthUrl);
	
	String memberid = (String) request.getSession().getAttribute("member_Id");
	System.out.println("MemberID1:"+memberid);

	GetWallet walletdet = new  GetWallet();

	String UserWallet = walletdet.walletb( oauthAccessToken,memberid,Constant.MMUrl );
//	JSONObject userwall = new JSONObject(UserWallet);
//	
//	JSONObject wallrespo = userwall.getJSONObject("responseObject");
//	 
//	String walletid  = wallrespo.getString("id");
//	request.getSession().setAttribute("walletID", walletid);
	
	return UserWallet;

}

////Fetch KYC Details
@RequestMapping(value = "/mmgetgetcustomerkyc", method = RequestMethod.POST)
@ResponseBody
public String getcyfu(@RequestParam("memberId") String memberId,
		
	HttpServletRequest request, Model model, HttpServletResponse httpServletResponse) throws SQLException, JSONException {
	String email = (String) request.getSession().getAttribute("email");

	String password = (String) request.getSession().getAttribute("password");

	OauthAuthentication newauth = new OauthAuthentication();
	
	String oauthAccessToken = newauth.createOauthToken(Constant.Email,Constant.Password,request,Constant.OauthUrl);
	String memberid = (String) request.getSession().getAttribute("member_Id");


	
	FetchUserKYCDetails GetKYC = new 	FetchUserKYCDetails();

	return GetKYC.getcustomerKYCdetails( oauthAccessToken,(String)request.getSession().getAttribute("member_Id"),Constant.MMUrl);
}

	/* fetching Get Card By ID */
	@RequestMapping(value = "/mmcustomercardsid", method = RequestMethod.POST)
	@ResponseBody()
	public String getcardbyid(@RequestParam("hiddencard") String usercardid,
			  HttpServletRequest request, Model model,
			HttpServletResponse httpServletResponse) throws SQLException, JSONException 
	{
		
		
		OauthAuthentication newauth = new OauthAuthentication();

		String oauthAccessToken = newauth.createOauthToken(Constant.Email,Constant.Password,request,Constant.OauthUrl);
		String memberid = (String) request.getSession().getAttribute("member_Id");
		/* String memberid = (String) request.getSession().getAttribute("memberId"); */
		System.out.println("MemberID2:"+memberid);
		GetcardByID cardbyid = new GetcardByID();
		String cardid = cardbyid.getcardid(oauthAccessToken, memberid,usercardid, Constant.MMUrl);
		System.out.println("Usercardid:"+usercardid);
		System.out.println("CardId:"+cardid);
		return cardbyid.getcardid(oauthAccessToken,memberid,usercardid, Constant.MMUrl);
		
		
	}
	
//	Activation Card
	@RequestMapping(value = "/activatephycard", method = RequestMethod.POST)
	@ResponseBody
	public String cardactivate(HttpServletRequest request, @RequestParam("activenum") String activenum,@RequestParam("cardId") String cardid)
	{
		OauthAuthentication newauth = new OauthAuthentication();

		String oauthAccessToken = newauth.createOauthToken(Constant.Email,Constant.Password,request,Constant.OauthUrl);
		String memberid = (String) request.getSession().getAttribute("member_Id");
		System.out.println("MemberID of Activation Card:"+memberid);
		System.out.println("Activation Code:"+activenum);
		System.out.println("CardId of Activation Card:"+cardid);
		ActivationCard ac = new ActivationCard();
		String activateCard = ac.cardActivate(oauthAccessToken,activenum,memberid,cardid,Constant.MMUrl);
		System.out.println("ActivateCard:"+activateCard);
		return ac.cardActivate(oauthAccessToken,activenum,memberid,cardid,Constant.MMUrl);
	}
	//Assign Physical Card

	@RequestMapping(value = "/mmassignphysical", method = RequestMethod.POST)

	@ResponseBody public String add_Physical_card_MM(@RequestParam("accountnum")
	String assoc_number,HttpServletRequest request, Model model, HttpServletResponse
	httpServletResponse) throws SQLException, JSONException
	{
	String accountnum = Constant.assoc_number+assoc_number;
	System.out.println(accountnum);
	String memberid = (String) request.getSession().getAttribute("member_Id");

	String walletHashId = (String) request.getSession().getAttribute("walletHashId");
	OauthAuthentication newauth = new OauthAuthentication();

	String oauthAccessToken = newauth.createOauthToken(Constant.Email,Constant.Password,request,Constant.OauthUrl);
	AddPhysicalCard add_card = new AddPhysicalCard();
	String s = add_card.assignphycard(oauthAccessToken, accountnum, Constant.cardTypeCode, memberid, walletHashId, Constant.MMUrl);
	System.out.println(s);
	return add_card.assignphycard(oauthAccessToken, accountnum, Constant.cardTypeCode, memberid, walletHashId, Constant.MMUrl);

	}
}



