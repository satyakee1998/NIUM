package com.dashboard.controller;

import java.io.IOException;
import java.io.InputStream;
import java.net.UnknownHostException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;


import com.dashboard.bean.KYCFileUpload;
import com.dashboard.bean.NIUMCreateCustomerBean;
import com.dashboard.bean.NIUMCreateUserBean;
import com.dashboard.bean.PrefundRequestBean;
import com.dashboard.service.FetchUserDetails;
import com.dashboard.service.FetchUserKYCDetails;
import com.dashboard.service.FetchUserList;
import com.dashboard.service.FetchUserListNium;
import com.dashboard.service.GetExchangeRateNIUM;
import com.dashboard.service.GetUserAddress;
import com.dashboard.service.GetUserTransaction;
import com.dashboard.service.GetWallet;
import com.dashboard.service.NIUMAcceptTerms;
import com.dashboard.service.NIUMActivateCard;
import com.dashboard.service.NIUMAddCustomer;
import com.dashboard.service.NIUMGetCard;
import com.dashboard.service.NIUMGetTerms;
import com.dashboard.service.NIUMWalletBalance;

import com.dashboard.service.NiumGetCustomer;
import com.dashboard.service.OauthAuthentication;
import com.dashboard.service.PostKycDocuments;
import com.dashboard.service.PostPrefund;
import com.dashboard.service.ShowPreFund;
import com.dashboard.service.TransferToWallet;
import com.dashboard.service.UpdateAddress;
import com.dashboard.service.UploadKYC;
import com.dashboard.service.getPrefundBalanceStylopay;
import com.dashboard.service.updateUserDetails;
import com.dashboard.utility.Constant;

/*import com.stylopay.bean.CreateUserBean;*/
import com.dashboard.bean.UpdateUserAddressBean;
import com.dashboard.bean.UpdateUserDetailsBean;

@Controller
public class ClientController {

	@RequestMapping(value = "/dashboard", method = RequestMethod.GET)

	public String dash() {
		return "dashboard";
	}

	@RequestMapping(value = "/prefund", method = RequestMethod.GET)

	public String fund() {
		return "prefund";
	}

	@RequestMapping(value = "/transfer", method = RequestMethod.GET)

	public String tran() {
		return "accounts";
	}

	@RequestMapping(value = "/fetchCustomerDetails", method = RequestMethod.GET)
	public ModelAndView CLientList(HttpSession session, HttpServletRequest request) {
		return new ModelAndView("clientdetails");
	}

	@RequestMapping(value = "/mmuserlist", method = RequestMethod.GET)
	public ModelAndView User(HttpSession session, HttpServletRequest request) {

		return new ModelAndView("userlist");

	}

	@RequestMapping(value = "/nisguserlist", method = RequestMethod.GET)
	public ModelAndView nisguser(HttpSession session, HttpServletRequest request) {

		return new ModelAndView("nisguserlist");
	}

	@RequestMapping(value = "/uploadKyc", method = RequestMethod.GET)
	public ModelAndView Doc(HttpSession session, HttpServletRequest request) {

		return new ModelAndView("upload");
	}

	@RequestMapping(value = "/uploaddoc", method = RequestMethod.GET)
	public ModelAndView doc(HttpSession session, HttpServletRequest request) {

		return new ModelAndView("uploaddoc");
	}

	@RequestMapping(value = "/mmprefundrequest", method = RequestMethod.GET)
	public ModelAndView prer(HttpServletRequest request) throws IOException {
		return new ModelAndView("postprefund");
	}

	@RequestMapping(value = "/mmprefundlist", method = RequestMethod.GET)
	public ModelAndView prea(HttpServletRequest request) throws IOException {

		return new ModelAndView("prefund");
	}

	@RequestMapping(value = "/niumcusdetails", method = RequestMethod.GET)
	public ModelAndView cus(HttpServletRequest request) throws IOException {

		return new ModelAndView("niumcusdetails");
	}

	@RequestMapping(value = "/mminternalcustomer", method = RequestMethod.GET)
	public ModelAndView User(@RequestParam("member_ID") String memberId, @RequestParam("user_Email") String email,
			@RequestParam("user_fname") String username, HttpServletRequest request) {
		request.getSession().setAttribute("member_Id", memberId);
		request.getSession().setAttribute("Uemail", email);
		request.getSession().setAttribute("firstname", username);

		ModelAndView mv = new ModelAndView("userdetails");

		mv.addObject("memberId", memberId);
		mv.addObject("Uemail", email);
		mv.addObject("firstname", username);
		return mv;
	}

	// Fetching UserList of Client
	@RequestMapping(value = "/userDetailsListnew", method = RequestMethod.GET)
	@ResponseBody
	public String UserList(HttpSession session, HttpServletRequest request) {
		OauthAuthentication newauth = new OauthAuthentication();
		String oauthAccessToken = newauth.createOauthToken(Constant.Email, Constant.Password, request,
				Constant.OauthUrl);
		FetchUserList user = new FetchUserList();

		String response = user.fetchcustomer(Constant.STARTING, Constant.ENDING, oauthAccessToken, Constant.Agent_Code,
				Constant.Sub_Agent_Code, request, Constant.MMUrl);
		JSONArray fetchUserjsonArray = new JSONArray(response);
		JSONObject fetchUserjsonObject = fetchUserjsonArray.getJSONObject(0);
		request.getSession().setAttribute("nameof", fetchUserjsonObject.getString("memberId"));

		String userid = fetchUserjsonObject.getString("memberId");
		FetchUserDetails details = new FetchUserDetails();
		details.fetchuserdetails(oauthAccessToken, userid, request, Constant.MMUrl);
		return response;

	}

	// User details
	@RequestMapping(value = "/userDetails", method = RequestMethod.GET)
	@ResponseBody
	public String userDetails(HttpSession session, HttpServletRequest request,
			@RequestParam("newuserID") String newuserID) {
		OauthAuthentication newauth = new OauthAuthentication();

		String oauthAccessToken = newauth.createOauthToken(Constant.Email, Constant.Password, request,
				Constant.OauthUrl);
		String newUserID = (String) request.getSession().getAttribute("member_Id");

		FetchUserList userdetails = new FetchUserList();
		String userDetail = userdetails.mmgetuserdetails(oauthAccessToken, newUserID, Constant.MMUrl);
		JSONObject userdetials = new JSONObject(userDetail);

		JSONObject detailsrespo = userdetials.getJSONObject("responseObject");

		JSONObject identity = detailsrespo.getJSONObject("identification");
		String idType = identity.getString("type");
		String idNumber = identity.getString("number");

		String userEmailId = detailsrespo.getString("email");
		String userId = detailsrespo.getString("id");
		String userIdtype = identity.getString("type");
		String userNum = identity.getString("number");

		request.getSession().setAttribute("userEamil", userEmailId);
		request.getSession().setAttribute("userID", userId);
		request.getSession().setAttribute("userIdtype", userIdtype);
		request.getSession().setAttribute("usernum", userNum);

		return userDetail;
	}

	// update user
	@RequestMapping(value = "/mmupdateDetail", method = RequestMethod.POST)
	@ResponseBody
	public String updatePersonalInfo(@RequestParam("firstname") String firstname,
			@RequestParam("title") String usertitle, @RequestParam("prefferedname") String pname,
			@RequestParam("lastname") String lastname, @RequestParam("phonecode") String phonecode,
			@RequestParam("phone") String phone, @RequestParam("dob") String dateofbirth, HttpServletRequest request) {

		OauthAuthentication newauth = new OauthAuthentication();

		String oauthAccessToken = newauth.createOauthToken(Constant.Email, Constant.Password, request,
				Constant.OauthUrl);

		String memberId = ((String) request.getSession().getAttribute("userID"));
		String idType = (String) request.getSession().getAttribute("userIdtype");
		String idNumber = (String) request.getSession().getAttribute("usernum");

		UpdateUserDetailsBean userDetails = new UpdateUserDetailsBean();

		userDetails.setFirst_name(firstname);
		userDetails.setLast_name(lastname);
		userDetails.setMiddle_name(pname);
		userDetails.setMobileCountryCode(phonecode);
		userDetails.setMobile(phone);
		userDetails.setId(memberId);
		userDetails.setTitle(usertitle);
		userDetails.setGender("");
		userDetails.setId_type(idType);
		userDetails.setId_number(idNumber);
		userDetails.setCountry_of_issue("");
		userDetails.setBirthDate(dateofbirth);

		updateUserDetails update = new updateUserDetails();

		return update.updateDetails(oauthAccessToken, userDetails, Constant.MMUrl);
	}

	/// User Address
	@RequestMapping(value = "/AddressInfo", method = RequestMethod.GET)
	@ResponseBody
	public String Address(HttpServletRequest request, Model model, HttpServletResponse httpServletResponse)
			throws SQLException, JSONException {

		String email = (String) request.getSession().getAttribute("email");

		String password = (String) request.getSession().getAttribute("password");
		OauthAuthentication newauth = new OauthAuthentication();

		String oauthAccessToken = newauth.createOauthToken(Constant.Email, Constant.Password, request,
				Constant.OauthUrl);

		String memberid = (String) request.getSession().getAttribute("member_Id");
		String residential = "residential";

		GetUserAddress Address = new GetUserAddress();

		String AddUser = Address.user(oauthAccessToken, memberid, residential, Constant.MMUrl);

		return AddUser;

	}

	@RequestMapping(value = "/mmupdateAddressdetails", method = RequestMethod.POST)
	@ResponseBody
	public String updateUserAddress(@RequestParam("address1") String updateAddress1,
			@RequestParam("address2") String updateAddress2, @RequestParam("city") String updateCity,
			@RequestParam("postalcode") String updateZip, @RequestParam("state") String updateState,
			@RequestParam("country") String updateCountry, HttpServletRequest request,
			HttpServletResponse httpServletResponse) throws UnknownHostException {

		String memberid = (String) request.getSession().getAttribute("userID");

//		String email = (String) request.getSession().getAttribute("email");
//
//		String password = (String) request.getSession().getAttribute("password");

		OauthAuthentication newauth = new OauthAuthentication();

		String oauthAccessToken = newauth.createOauthToken(Constant.Email, Constant.Password, request,
				Constant.OauthUrl);
		UpdateUserAddressBean addressBeanMM = new com.dashboard.bean.UpdateUserAddressBean();
		addressBeanMM.setAddressLine1(updateAddress1);
		addressBeanMM.setAddressLine2(updateAddress2);
		addressBeanMM.setAddressType("residential");
		addressBeanMM.setCity(updateCity);
		addressBeanMM.setCountry(updateCountry);
		addressBeanMM.setZipCode(updateZip);
		addressBeanMM.setState(updateState);
		UpdateAddress update = new UpdateAddress();

		return update.updateAddress(oauthAccessToken, memberid, addressBeanMM, Constant.MMUrl);

	}

	/// user walletInfo

	@RequestMapping(value = "/walletInfo", method = RequestMethod.GET)
	@ResponseBody
	public String walletdet(HttpServletRequest request, Model model, HttpServletResponse httpServletResponse)
			throws SQLException, JSONException {

		String email = (String) request.getSession().getAttribute("email");

		String password = (String) request.getSession().getAttribute("password");
		OauthAuthentication newauth = new OauthAuthentication();

		String oauthAccessToken = newauth.createOauthToken(Constant.Email, Constant.Password, request,
				Constant.OauthUrl);

		String memberid = (String) request.getSession().getAttribute("member_Id");

		GetWallet walletdet = new GetWallet();

		String UserWallet = walletdet.walletb(oauthAccessToken, memberid, Constant.MMUrl);

		return UserWallet;

	}

////User Transaction
	@RequestMapping(value = "/mmgetusertransaction", method = RequestMethod.GET)
	@ResponseBody
	public String getusertrans(@RequestParam("pagenum") String page, HttpServletRequest request, Model model,
			HttpServletResponse httpServletResponse) throws SQLException, JSONException {

		OauthAuthentication newauth = new OauthAuthentication();

		String oauthAccessToken = newauth.createOauthToken(Constant.Email, Constant.Password, request,
				Constant.OauthUrl);

		GetUserTransaction GetTransaction = new GetUserTransaction();

		return GetTransaction.UserTransaction(oauthAccessToken, (String) request.getSession().getAttribute("member_Id"),
				page, Constant.MMUrl);

	}

////user KYC Details
	@RequestMapping(value = "/mmgetgetcustomerkyc", method = RequestMethod.POST)
	@ResponseBody
	public String getcyfu(@RequestParam("memberId") String memberId,

			HttpServletRequest request, Model model, HttpServletResponse httpServletResponse)
			throws SQLException, JSONException {
		String email = (String) request.getSession().getAttribute("email");

		String password = (String) request.getSession().getAttribute("password");

		OauthAuthentication newauth = new OauthAuthentication();

		String oauthAccessToken = newauth.createOauthToken(Constant.Email, Constant.Password, request,
				Constant.OauthUrl);
		String memberid = (String) request.getSession().getAttribute("member_Id");

		FetchUserKYCDetails GetKYC = new FetchUserKYCDetails();

		return GetKYC.getcustomerKYCdetails(oauthAccessToken, (String) request.getSession().getAttribute("member_Id"),
				Constant.MMUrl);

	}

	///// user KYCUpload

	@RequestMapping(value = "/mmkycUploadDocs", method = RequestMethod.POST)

	public ModelAndView uploadKycDocs(@ModelAttribute("fileupload") KYCFileUpload kycFileUpload, Model model,
			HttpServletRequest request) throws IOException {

		ModelAndView mv = new ModelAndView("userdetails");

		OauthAuthentication newauth = new OauthAuthentication();

		String oauthAccessToken = newauth.createOauthToken(Constant.Email, Constant.Password, request,
				Constant.OauthUrl);

		// Get the list of files
		List<MultipartFile> files = kycFileUpload.getFiles();

		String memberid = (String) request.getSession().getAttribute("userID");

		String useremail = (String) request.getSession().getAttribute("userEamil");

		FetchUserKYCDetails GetKYC = new FetchUserKYCDetails();

		String userKYCDetails = GetKYC.getcustomerKYCdetails(oauthAccessToken,
				(String) request.getSession().getAttribute("member_Id"), Constant.MMUrl);

		JSONObject kysinfo = new JSONObject(userKYCDetails);

		String FourStopID = kysinfo.get("fourStopId").toString();
		request.getSession().setAttribute("screID", FourStopID);

		String registration_id = FourStopID;
		String username = useremail;
		String user_id = memberid;

		UploadKYC upload = new UploadKYC();
		String kyc = upload.uploadKYCs(oauthAccessToken, files, username, user_id, registration_id, Constant.MMUrl);

		return mv;

	}

////Upload Documents
	@RequestMapping(value = "/mmUploadDocs", method = RequestMethod.POST)

	public ModelAndView uploadDocs(@ModelAttribute("uploadFiles") KYCFileUpload kycFileUpload, Model model,
			HttpServletRequest request) throws IOException {

		ModelAndView mv = new ModelAndView("userdetails");

//String memberid = (String) request.getSession().getAttribute("userID");
		String email = (String) request.getSession().getAttribute("email");

		String password = (String) request.getSession().getAttribute("password");

		OauthAuthentication newauth = new OauthAuthentication();
		String oauthAccessToken = newauth.createOauthToken(Constant.Email, Constant.Password, request,
				Constant.OauthUrl);

// Get the list of files
		List<MultipartFile> files = kycFileUpload.getFiles();
		PostKycDocuments postkyc = new PostKycDocuments();
		String Uploaddocs = postkyc.uploadDoc(oauthAccessToken, files, Constant.MMUrl);

		if (Uploaddocs != null) {
			request.getSession().setAttribute("uploadocs", "Document uploaded Successfully");
		} else {
			request.getSession().setAttribute("failed", "Document uploaded Failed");
		}
		return mv;

	}

	/* Post Prefund */

	@RequestMapping(value = "/mmpostprefund", method = RequestMethod.POST)
	@ResponseBody
	public String postprefund(@RequestParam("bankReferenceNumber") String bankReferenceNumber,
			@RequestParam("clientAccountNumber") String clientAccountNumber, @RequestParam("comments") String comments,
			@RequestParam("currencyCode") String currencyCode, @RequestParam("dateOfTransfer") String dateOfTransfer,
			@RequestParam("AccountNumber") String AccountNumber, @RequestParam("amount") String amount,
			@RequestParam("requesterId") String requesterId, HttpServletRequest request, Model model,
			HttpServletResponse httpServletResponse) throws SQLException, JSONException {

		String email = (String) request.getSession().getAttribute("email");

		String password = (String) request.getSession().getAttribute("password");
		OauthAuthentication newauth = new OauthAuthentication();

		String oauthAccessToken = newauth.createOauthToken(email, password, request, Constant.OauthUrl);

		PrefundRequestBean prefundreq = new PrefundRequestBean();
		prefundreq.setBankReferenceNumber(bankReferenceNumber);
		prefundreq.setClientAccountNumber(clientAccountNumber);
		prefundreq.setAccountNumber(AccountNumber);
		prefundreq.setAmount(amount);
		prefundreq.setComments(comments);
		prefundreq.setAgent_code((String) request.getSession().getAttribute("agent"));
		prefundreq.setSub_agent_code((String) request.getSession().getAttribute("sagent"));
		prefundreq.setCurrencyCode(currencyCode);
		prefundreq.setDateOfTransfer(dateOfTransfer);
		prefundreq.setRequesterId(requesterId);

//
		PostPrefund reqPostPrefund = new PostPrefund();

		String PostPrefunding = reqPostPrefund.postpre(oauthAccessToken, prefundreq, Constant.MMUrl);

		return PostPrefunding;

	}

///GetPreFund
	@RequestMapping(value = "/mmshowprefund", method = RequestMethod.GET)

	@ResponseBody
	public String getprefund(HttpServletRequest request, Model model, HttpServletResponse httpServletResponse)
			throws SQLException, JSONException {

		OauthAuthentication newauth = new OauthAuthentication();

		String oauthAccessToken = newauth.createOauthToken(Constant.Email, Constant.Password, request,
				Constant.OauthUrl);

		ShowPreFund getwaprefund = new ShowPreFund();
		return getwaprefund.getprefund(oauthAccessToken, Constant.Agent_Code, Constant.Sub_Agent_Code, Constant.MMUrl);

	}

//GetPreFundBalanceStylopay
	@RequestMapping(value = "/mmgetprebalance", method = RequestMethod.GET)

	@ResponseBody
	public String getprefundbalance(HttpServletRequest request, Model model, HttpServletResponse httpServletResponse)
			throws SQLException, JSONException {

		OauthAuthentication newauth = new OauthAuthentication();

		String oauthAccessToken = newauth.createOauthToken(Constant.Email, Constant.Password, request,
				Constant.OauthUrl);

		getPrefundBalanceStylopay fundbalance = new getPrefundBalanceStylopay();
		String adminBalance = fundbalance.getprefundbalance(oauthAccessToken, Constant.Agent_Code,
				Constant.Sub_Agent_Code, Constant.MMUrl);

		JSONObject admindetials = new JSONObject(adminBalance);

		String currency = admindetials.getString("sgd");
		request.getSession().setAttribute("Singurrency", currency);

		return adminBalance;

	}

	/* wallet transfer */

	@RequestMapping(value = "/mmtransfertowall", method = RequestMethod.POST)
	@ResponseBody
	public String wallltransfer(@RequestParam("amount") String amount, HttpServletRequest request, Model model)
			throws SQLException, JSONException {

		OauthAuthentication newauth = new OauthAuthentication();

		String oauthAccessToken = newauth.createOauthToken(Constant.Email, Constant.Password, request,
				Constant.OauthUrl);

		TransferToWallet wallettr = new TransferToWallet();
		String email = (String) request.getSession().getAttribute("Uemail");
		String result = wallettr.transferw(oauthAccessToken, amount, email, Constant.Agent_Code,
				Constant.Sub_Agent_Code, Constant.client_agent_subAgent_name, Constant.MMUrl);
		/*
		 * 2 LINE LIKHNA HAI "JAI HANUMAN"
		 */
		getPrefundBalanceStylopay fundbalance = new getPrefundBalanceStylopay();
		String adminBalance = fundbalance.getprefundbalance(oauthAccessToken, Constant.Agent_Code,
				Constant.Sub_Agent_Code, Constant.MMUrl);

		JSONObject admindetials = new JSONObject(adminBalance);

		String currency = admindetials.getString("sgd");
		request.getSession().setAttribute("Singurrency", currency);

		return result;
	}

	@RequestMapping(value = "/nisgcustomer", method = RequestMethod.GET)
	public ModelAndView User(@RequestParam("member_ID") String memberId,
			@RequestParam("wallet_hash_ID") String wallethashid, HttpServletRequest request) {
		request.getSession().setAttribute("member_Id", memberId);
		request.getSession().setAttribute("wallet_hash_Id", wallethashid);

		ModelAndView mv = new ModelAndView("niumcusdetails");

		mv.addObject("memberId", memberId);
		mv.addObject("wallethashId", wallethashid);

		return mv;
	}

//Fetching NIUMUserList of Client
	@RequestMapping(value = "/nisgUserdetails", method = RequestMethod.GET)
	@ResponseBody
	public String nisgUserList(HttpSession session, HttpServletRequest request) {
		OauthAuthentication newauth = new OauthAuthentication();
		String oauthAccessToken = newauth.createOauthToken(Constant.Email, Constant.Password, request,
				Constant.OauthUrl);
		FetchUserListNium user = new FetchUserListNium();

		String response = user.fetchcustomer(Constant.STARTING, Constant.ENDING, oauthAccessToken, Constant.Agent_Code,
				Constant.Sub_Agent_Code, request, Constant.NIUMUrl);
		JSONArray fetchUserjsonArray = new JSONArray(response);
		JSONObject fetchUserjsonObject = fetchUserjsonArray.getJSONObject(0);
		request.getSession().setAttribute("nameof", fetchUserjsonObject.getString("memberId"));
		request.getSession().setAttribute("nameof", fetchUserjsonObject.getString("instarem_wallet_hash_id"));

		String customerhashid = fetchUserjsonObject.getString("memberId");
		String wallethashid = fetchUserjsonObject.getString("instarem_wallet_hash_id");
		System.out.println("MemberID:" + customerhashid);
		System.out.println("instarem_wallet_hash_id:" + wallethashid);

		return response;
	}

// Nium get customer details

	@RequestMapping(value = "/nisggetgetcustomer", method = RequestMethod.POST)
	@ResponseBody
	public String getcu(@RequestParam("customererid") String customererid,

			HttpServletRequest request, Model model, HttpServletResponse httpServletResponse)
			throws SQLException, JSONException {

		OauthAuthentication newauth = new OauthAuthentication();

		String oauthAccessToken = newauth.createOauthToken(Constant.nisgEmail, Constant.nisgPassword, request,
				Constant.OauthUrl);

		NiumGetCustomer customerdetails = new NiumGetCustomer();

		return customerdetails.getcustomerdetails(Constant.xApiKey, Constant.clientHasId, oauthAccessToken,
				customererid, request, Constant.OauthUrl, Constant.NIUMUrl);

	}
//FETCHING NIUM WALLET BALANCE

	@RequestMapping(value = "/NIUMWalletInfo", method = RequestMethod.GET)
	@ResponseBody
	public String Walletbalance(HttpSession session, HttpServletRequest request,
			@RequestParam("CustomerHashID") String tempcutomerhashid,
			@RequestParam("WalletHashID") String tempwallethashid) {
		OauthAuthentication newauth = new OauthAuthentication();
		String oauthAccessToken = newauth.createOauthToken(Constant.nisgEmail, Constant.nisgPassword, request,
				Constant.OauthUrl);
		FetchUserList user = new FetchUserList();

		String resp = user.fetchcustomer(Constant.STARTING, Constant.ENDING, oauthAccessToken, Constant.Agent_Code,
				Constant.Sub_Agent_Code, request, Constant.NIUMUrl);
		JSONArray fetchUserjsonArray = new JSONArray(resp);
		JSONObject fetchUserjsonObject = fetchUserjsonArray.getJSONObject(0);
		request.getSession().setAttribute("nameof", fetchUserjsonObject.getString("memberId"));
		request.getSession().setAttribute("nameof", fetchUserjsonObject.getString("instarem_wallet_hash_id"));
		String customerhashid = fetchUserjsonObject.getString("memberId");
		String wallethashid = fetchUserjsonObject.getString("instarem_wallet_hash_id");
		System.out.println("Customerhashid of Controller:" + customerhashid);
		System.out.println("Wallethashid of Controller:" + wallethashid);
		System.out.println("Customerhashid of View:" + tempcutomerhashid);
		System.out.println("Wallethashid of View:" + tempwallethashid);
		NIUMWalletBalance niumwalletbalance = new NIUMWalletBalance();
		String response = niumwalletbalance.walletb(Constant.xApiKey, Constant.clientHasId, oauthAccessToken,
				tempcutomerhashid, tempwallethashid, request, Constant.OauthUrl, Constant.NIUMUrl);
		System.out.println("Response:" + response);
		return response;
	}

	// Fetch NIUM GetExchangeRate//
	@RequestMapping(value = "/NIUMExchangeRate", method = RequestMethod.GET)
	@ResponseBody
	public String ExchangeRateNIUM(HttpSession session, HttpServletRequest request) {
		OauthAuthentication newauth = new OauthAuthentication();
		String oauthAccessToken = newauth.createOauthToken(Constant.nisgEmail, Constant.nisgPassword, request,
				Constant.OauthUrl);
		GetExchangeRateNIUM exchangerte = new GetExchangeRateNIUM();
		String response = exchangerte.exchangerate(Constant.xApiKey, Constant.clientHasId, oauthAccessToken, "EUR",
				"SGD", request, Constant.NIUMUrl);
		return response;
	}

	/* Add Customer Page Return Controller */
	@RequestMapping(value = "/nisgaddcustomer", method = RequestMethod.GET)
	public ModelAndView addcustomer(HttpServletRequest request) throws IOException {
		/*
		 * if(request.getSession().getAttribute("cognitosession") == null ||
		 * request.getSession().getAttribute("oauthAccessToken") == null )
		 * 
		 * { return new ModelAndView ("loginredirect");
		 * 
		 * } if(request.getSession().getAttribute("Logo") ==null ||
		 * request.getSession().getAttribute("agent") == null)
		 * 
		 * { return new ModelAndView ("loginredirect");
		 * 
		 * } if (request.getSession().isNew()) { return new ModelAndView("login"); }
		 */

		return new ModelAndView("completeprofilenew");

	}
	@RequestMapping(value = "/indexnew", method = RequestMethod.POST)
	public ModelAndView createUserAPICalling(@ModelAttribute("createUser") NIUMCreateUserBean createUserBean,
			HttpServletRequest request,HttpServletResponse httpServletResponse) throws UnknownHostException  
	{
		

		ModelAndView  mv = new  ModelAndView("completeprofilenewsuccess");
		ModelAndView  mvsame = new  ModelAndView("completeprofilenew");
		
		String phon = createUserBean.getPhone_number();
		
		phon = phon.replace("+", "");
		
		
		
		

		 
		
		mvsame.addObject("fname", createUserBean.getFirst_name());
		request.getSession().setAttribute("fname", createUserBean.getFirst_name());
		
		mvsame.addObject("mname", createUserBean.getMiddle_name());
		request.getSession().setAttribute("mname", createUserBean.getMiddle_name());
		
		mvsame.addObject("lname", createUserBean.getLast_name());
		request.getSession().setAttribute("lname", createUserBean.getLast_name());
		
		mvsame.addObject("dob", createUserBean.getBday());
		request.getSession().setAttribute("dob", createUserBean.getBday());
		
		mvsame.addObject("email", createUserBean.getEmail());
		request.getSession().setAttribute("email", createUserBean.getEmail());
		
		mvsame.addObject("pnumber", phon);
		request.getSession().setAttribute("pnumber", phon);
		
		mvsame.addObject("nationality", createUserBean.getNationality());
		request.getSession().setAttribute("nationality", createUserBean.getNationality());
		
		mvsame.addObject("dline1", createUserBean.getAddress_line_1());
		request.getSession().setAttribute("dline1", createUserBean.getAddress_line_1());
		
		mvsame.addObject("dline2", createUserBean.getAddress_line_2());
		request.getSession().setAttribute("dline2", createUserBean.getAddress_line_2());
		
		mvsame.addObject("dcountry", createUserBean.getCountry());
		request.getSession().setAttribute("dcountry", createUserBean.getCountry());
		
		mvsame.addObject("dcity", createUserBean.getCity());
		request.getSession().setAttribute("dcity", createUserBean.getCity());
		
		mvsame.addObject("dstate", createUserBean.getState());
		request.getSession().setAttribute("dstate", createUserBean.getState());
		
		mvsame.addObject("dpost", createUserBean.getPost_code());
		request.getSession().setAttribute("dpost", createUserBean.getPost_code());
		
		mvsame.addObject("bcountry", createUserBean.getBilling_country());
		request.getSession().setAttribute("bcountry", createUserBean.getBilling_country());
		
		mvsame.addObject("bline1", createUserBean.getBilling_address_line_1());
		request.getSession().setAttribute("bline1", createUserBean.getBilling_address_line_1());
		
		mvsame.addObject("bline2", createUserBean.getBilling_address_line_2());
		request.getSession().setAttribute("bline2", createUserBean.getBilling_address_line_2());
		
		mvsame.addObject("bcity", createUserBean.getBilling_city());
		request.getSession().setAttribute("bcity", createUserBean.getBilling_city());
		
		mvsame.addObject("bstate", createUserBean.getBilling_state());
		request.getSession().setAttribute("bstate", createUserBean.getBilling_state());
		
		mvsame.addObject("bpost", createUserBean.getBilling_post_code());
		request.getSession().setAttribute("bpost", createUserBean.getBilling_post_code());
		
		NIUMCreateCustomerBean customerBeanNium = new NIUMCreateCustomerBean();////// Object Creation of NIUMCustomerBean////
		customerBeanNium.setEmail(createUserBean.getEmail());
		request.getSession().setAttribute("customemailsession",createUserBean.getEmail());
		String pass ="ChangeMe@123";
		customerBeanNium.setPassword(pass);
	
		

		
		customerBeanNium.setAgent_code("Agent_Code");
		customerBeanNium.setSub_agent_code("Sub_Agent_code");
		customerBeanNium.setClient_agent_subAgent_name("Stylopay");
		customerBeanNium.setUsername(createUserBean.getEmail());
		customerBeanNium.setCountry_isd_code("91");
		customerBeanNium.setPreferred_currency("EUR");
		
		
	
			customerBeanNium.setTitle("NA");
		
		customerBeanNium.setAddress_line_1(createUserBean.getAddress_line_1());
		customerBeanNium.setAddress_line_2(createUserBean.getAddress_line_2());
		customerBeanNium.setBillingAddress1(createUserBean.getBilling_address_line_1());
		customerBeanNium.setBillingAddress2(createUserBean.getBilling_address_line_2());
		customerBeanNium.setBillingCity(createUserBean.getBilling_city());
		customerBeanNium.setBillingLandmark("NA");
		customerBeanNium.setBillingState(createUserBean.getBilling_state());
		
		
if (createUserBean.getBilling_post_code() == null || createUserBean.getBilling_post_code().equals("") || createUserBean.getBilling_post_code().equals("")) 

	{
	customerBeanNium.setBillingZipCode("NA");
	customerBeanNium.setCorrespondenceZipCode("NA");
	}  
	else 
		{
		customerBeanNium.setBillingZipCode(createUserBean.getBilling_post_code());
		customerBeanNium.setCorrespondenceZipCode(createUserBean.getBilling_post_code() );
		}



	if (createUserBean.getPost_code() == null || createUserBean.getPost_code().equals("") || createUserBean.getPost_code().equals(" ") ) 
	{
		customerBeanNium.setDeliveryZipCode("NA");
	}  
	else 
	{
		customerBeanNium.setDeliveryZipCode(createUserBean.getPost_code());
	}

		
		
		
		
		
		customerBeanNium.setCity(createUserBean.getCity());
		customerBeanNium.setCorrespondenceAddress1(createUserBean.getAddress_line_1());
		customerBeanNium.setCorrespondenceAddress2(createUserBean.getAddress_line_2());
		customerBeanNium.setCorrespondenceCity(createUserBean.getCity());
		customerBeanNium.setCorrespondenceLandmark("NA");
		customerBeanNium.setCorrespondenceState(createUserBean.getCity());
		customerBeanNium.setCountry(createUserBean.getCountry());
		customerBeanNium.setCountryCode(createUserBean.getCountry());
		customerBeanNium.setDateOfBirth(createUserBean.getBday());
		customerBeanNium.setDeliveryAddress1(createUserBean.getAddress_line_1());
		customerBeanNium.setDeliveryAddress2(createUserBean.getAddress_line_2());
		customerBeanNium.setDeliveryCity(createUserBean.getCity());
		customerBeanNium.setDeliveryLandmark("NA");
		customerBeanNium.setDeliveryState(createUserBean.getState());
		customerBeanNium.setFirstName(createUserBean.getFirst_name());
		customerBeanNium.setLastName(createUserBean.getLast_name());
		if(createUserBean.getMiddle_name() != null)
		{
			customerBeanNium.setMiddleName(createUserBean.getMiddle_name());
		}
		else
		{
			customerBeanNium.setMiddleName("NA");
		}
		
		customerBeanNium.setMobile(phon);
		customerBeanNium.setNationality(createUserBean.getNationality());
		customerBeanNium.setPhone_type("M");
		customerBeanNium.setPreferredName(createUserBean.getFirst_name());
		customerBeanNium.setUsername(createUserBean.getEmail());
		
		
		
		
/////////Get Terms And Conditions/////////////
		
				NIUMGetTerms terms = new NIUMGetTerms();
				String gettermname = terms.getterms(Constant.clientHasId,Constant.xApiKey, request, Constant.NIUMUrl)  ;  
				JSONObject fetchUserjsonObj = new JSONObject(gettermname);
			
				request.getSession().setAttribute("termname", fetchUserjsonObj.getString("name"));
				request.getSession().setAttribute("version", fetchUserjsonObj.getString("versionId"));
				String gettermsname = fetchUserjsonObj.getString("name");
				String gettermsversionid = fetchUserjsonObj.getString("versionId");
			
			/* JSONObject getversion = new JSONObject(gettermname); */
			
			try {
				fetchUserjsonObj.get("name");
				
				}
			
			
			catch (Exception termsexceptios) 
			{
				ModelAndView  mvnew = new  ModelAndView("completeprofilenew");
				
				 request.getSession().setAttribute("failmessagecreateuser",  "Failed To Get T&C , please try again later");
					
				return mvnew;
			}
//////// Add Customer ////////////////////		
		NIUMAddCustomer addcustomer=new NIUMAddCustomer();
		String response = addcustomer.createUser(Constant.clientHasId,Constant.xApiKey,customerBeanNium, Constant.NIUMUrl);
		JSONObject fetchUserjson= new JSONObject(response);
		
		request.getSession().setAttribute("cushas", fetchUserjson.getString("customerHashId"));
		String customerhash = fetchUserjson.getString("customerHashId");
		
		
		


		OauthAuthentication newauth = new OauthAuthentication();
		String oauthAccessToken = newauth.createOauthToken(Constant.nisgEmail, Constant.nisgPassword, request,Constant.OauthUrl);
				
			     NIUMAcceptTerms acceptttt = new NIUMAcceptTerms();
				String acc = acceptttt.accepterms(Constant.clientHasId, Constant.xApiKey, oauthAccessToken, gettermsname, gettermsversionid, customerhash, request, Constant.NIUMUrl);
			
	
			        return mv;
	}
	//nium get cards////
	@RequestMapping(value = "/customercards", method = RequestMethod.GET)
	@ResponseBody
	public String getPanNumbhher(HttpServletRequest request,HttpServletResponse httpServletResponse,@RequestParam("cus") String customerhashid,@RequestParam("wal") String wallethashid) {
		
		
		OauthAuthentication newauth = new OauthAuthentication();
	  String oauthAccessToken = newauth.createOauthToken(Constant.nisgEmail, Constant.nisgPassword,request, Constant.OauthUrl);
		
	  NIUMGetCard user = new NIUMGetCard();
		
		String response = user.GetCustomerCard(Constant.xApiKey,Constant.clientHasId,oauthAccessToken,customerhashid,wallethashid,request,Constant.NIUMUrl);
		
		return response;
	}
      	               
      
	/////////Activate Card////////
@RequestMapping(value = "/nisgblockit", method = RequestMethod.POST)
@ResponseBody
public String unblockit(@RequestParam("cushas") String cushas,
		@RequestParam("walhas") String walhas, @RequestParam("carhas") String carhas,
		@RequestParam("instruction") String instruction, HttpServletRequest request, Model model,HttpServletResponse httpServletResponse)
				throws SQLException, JSONException {




	OauthAuthentication newauth = new OauthAuthentication();

	String oauthAccessToken = newauth.createOauthToken(Constant.nisgEmail, Constant.nisgPassword,request, Constant.OauthUrl);
	

	NIUMActivateCard activeblock = new NIUMActivateCard();

	return activeblock.unblock(instruction,Constant.xApiKey,Constant.clientHasId,oauthAccessToken, cushas, walhas, carhas,request,Constant.OauthUrl,Constant.NIUMUrl,"","");

}
}
		

								
                             


