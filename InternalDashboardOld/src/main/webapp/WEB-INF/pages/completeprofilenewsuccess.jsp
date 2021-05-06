<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE>
<html>
<head>
<title><%= session.getAttribute("DashBoardName") %> - Users List</title>
<link rel="apple-touch-icon" sizes="180x180" href="<%= session.getAttribute("Logo") %>">
<link rel="icon" type="image/png" sizes="32x32" href="<%= session.getAttribute("Logo") %>">
<link rel="icon" type="image/png" sizes="16x16" href="<%= session.getAttribute("Logo") %>">
<link rel="manifest" href="resources/nisg/favicon_io/site.webmanifest">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<link href="resources/nisg/css/bootstrap-min.css" rel="stylesheet" type="text/css">
<link href="resources/nisg/css/fontawesome.css" rel="stylesheet" type="text/css">
<link href="resources/nisg/css/customv4.css" rel="stylesheet" type="text/css">
<link href="resources/nisg/css/jquery-ui.css" rel="stylesheet" type="text/css">
<jsp:include page="colour.jsp" />
</head>

<body class="addCustomerPage">
<div class="container-fluid">
  <div class="row"> 
    <!------ Left Menu Section Starts ------>
<%--  <jsp:include page="leftmenunisg.jsp" /> --%>
    <!------ Left Menu Section Ends ------> 
    
    <!------ Right Main Section Starts ------>
    <div class="col-xl-10 col-lg-10 col-md-9 col-sm-12 rightMainSection">
      <!-- Add Customer Page Starts -->
      <div class="col-xl-9 addCustSection">
      	 <div class="headingSection">
            <div class="userBackBtn"> <a href="/nisgsponsoredaccounts"><img src="resources/nisg/images/userbackbtn.png" width="9" height="15" alt="Back" title="Back"></a> </div>
         	<h1>Add Customer</h1>
       <input type="hidden"  value="${customhash}" id="customercheck"> 	
          <input type="hidden"  value="<%= session.getAttribute("DashBoardName") %>" id="dashboardname"> 	
           <input type="hidden"  value="<%= session.getAttribute("customemailsession") %>" id="customemailsession"> 	
          
            <div class="clearfix"></div>
         </div>
            <%
																		
																		if ( request.getSession().getAttribute("succcessmsgcreateuser") != null ){
																			
																			%>
																		<div class="alert alert-success">
  
  </div>
																		<% 
																		  
																		request.getSession().setAttribute("succcessmsgcreateuser" , null) ;
																		}  
																		
																		%>
																		
																		
																		
																		
																																				<%     
																		if ( request.getSession().getAttribute("failmessagecreateuser") != null ){
																			
																			%>
																		
																		<div class="alert alert-danger">
																	    <strong> <%=(String)request.getSession().getAttribute("failmessagecreateuser")%> </strong>
																	  </div>
																	
																	    
																	<%-- 	swal("Yikes!", '<%=(String)request.getSession().getAttribute("failmessagecreateuser")%>', "error");
																	 --%>
																			<%-- alert ( '<%=(String)request.getSession().getAttribute("failmessagecreateuser")%>' ); 
																			 --%>
																			
																		
																			
																		<% 
																		  
																		request.getSession().setAttribute("failmessagecreateuser" , null) ;
																		}  
																		
																		%>
              <input type="hidden" value="<%= session.getAttribute("email") %>" id="backendmail">  
         <form action="/indexnew" method ="POST" id="adcustomerform">
         	<h2>Personal Details</h2>
         	<div class="formElementCon formElementConLR">
                <div class="form-group">
                    <label class="control-label">First name<span>*</span></label>
                    <input type="text" name="first_name" onkeypress="return ((event.charCode > 64 &amp;&amp; event.charCode < 91) || (event.charCode > 96 &amp;&amp; event.charCode < 123) || event.charCode == 8 || event.charCode == 32 || (event.charCode >= 48 &amp;&amp; event.charCode <= 57));" maxlength="15" class="form-control" value="${fname}" required>
                </div>
                <div class="form-group">
                    <label class="control-label">Middle Name</label>
                    <input type="text" name="middle_name"  class="form-control"  onkeypress="return ((event.charCode > 64 &amp;&amp; event.charCode < 91) || (event.charCode > 96 &amp;&amp; event.charCode < 123) || event.charCode == 8 || event.charCode == 32 || (event.charCode >= 48 &amp;&amp; event.charCode <= 57));" maxlength="15" value="${mname}">
                </div>
                <div class="form-group">
                    <label class="control-label">Last Name<span>*</span></label>
                    <input type="text" name="last_name" class="form-control" value="${lname}"  onkeypress="return ((event.charCode > 64 &amp;&amp; event.charCode < 91) || (event.charCode > 96 &amp;&amp; event.charCode < 123) || event.charCode == 8 || event.charCode == 32 || (event.charCode >= 48 &amp;&amp; event.charCode <= 57));" maxlength="15" required>
                </div>
                <!-- <div class="form-group">
                    <label class="control-label">Gender</label>
                    <Select class="form-control">
                    	<option value="">Select</option>
                        <option value="Male">Male</option>
                        <option value="Female">Female</option>
                    </Select>
                </div> -->
                <div class="form-group">
                    <label class="control-label">Date of Birth<span>*</span></label>
                    <input autocomplete="off" type="text" placeholder = "yyyy-mm-dd" class="form-control" value="${dob}"  name="bday" onchange="checkDOB()"  id="dateofbirth"   required>
                </div>
                <div class="form-group">
                    <label class="control-label">Phone Number<span>*</span></label>
                    <input type="text" class="form-control" title="Please enter number only" value="${pnumber}" name="phone_number" pattern="[0-9]+" minlength="5"  required>
                </div>
                <div class="form-group">
                    <label class="control-label">Email Id<span>*</span></label>
                    <input type="email" name="emall" id="customemail" class="form-control" value="${emall}" required>
                </div>
                <div class="form-group">
                    <label class="control-label">Nationality<span>*</span></label>
                 <!--    <input type="text" name="nationality"  required class="form-control" value="" required> -->
                <select name="nationality"  required class="form-control" required>   
                  <option >${nationality}</option>
                                            	<option myCCode="1"  myTag="UNITED STATES"  value="US">UNITED STATES</option>
												 										<option myCCode="52"  myTag="MEXICO"  value="MX">MEXICO</option>
												 										<option myCCode="93"  myTag="AFGHANISTAN"  value="AF">AFGHANISTAN</option>
												 										<option myCCode="355"  myTag="ALBANIA"  value="AL">ALBANIA</option>
												 										<option myCCode="213"  myTag="ALGERIA"  value="DZ">ALGERIA</option>
												 										<option myCCode="684"  myTag="AMERICAN SAMOA"  value="AS">AMERICAN SAMOA</option>
												 										<option myCCode="376"  myTag="ANDORRA"  value="AD">ANDORRA</option>
												 										<option myCCode="244"  myTag="ANGOLA"  value="AO">ANGOLA</option>
												 										<option myCCode="1264"  myTag="ANGUILLA"  value="AI">ANGUILLA</option>
												 										<option myCCode="1268"  myTag="ANTIGUA AND BARBUDA"  value="AG">ANTIGUA AND BARBUDA</option>
												 										<option myCCode="54"  myTag="ARGENTINA"  value="AR">ARGENTINA</option>
												 										<option myCCode="374"  myTag="ARMENIA"  value="AM">ARMENIA</option>
												 										<option myCCode="297"  myTag="ARUBA"  value="AW">ARUBA</option>
												 										<option myCCode="61"  myTag="AUSTRALIA"  value="AU">AUSTRALIA</option>
												 										<option myCCode="43"  myTag="AUSTRIA"  value="AT">AUSTRIA</option>
												 										<option myCCode="994"  myTag="AZERBAIJAN"  value="AZ">AZERBAIJAN</option>
												 										<option myCCode="1242"  myTag="BAHAMAS"  value="BS">BAHAMAS</option>
												 										<option myCCode="973"  myTag="BAHRAIN"  value="BH">BAHRAIN</option>
												 										<option myCCode="880"  myTag="BANGLADESH"  value="BD">BANGLADESH</option>
												 										<option myCCode="1246"  myTag="BARBADOS"  value="BB">BARBADOS</option>
												 										<option myCCode="375"  myTag="BELARUS"  value="BY">BELARUS</option>
												 										<option myCCode="32"  myTag="BELGIUM"  value="BE">BELGIUM</option>
												 										<option myCCode="501"  myTag="BELIZE"  value="BZ">BELIZE</option>
												 										<option myCCode="229"  myTag="BENIN"  value="BJ">BENIN</option>
												 										<option myCCode="1441"  myTag="BERMUDA"  value="BM">BERMUDA</option>
												 										<option myCCode="975"  myTag="BHUTAN"  value="BT">BHUTAN</option>
												 										<option myCCode="387"  myTag="BOSNIA AND HERZEGOVINA"  value="BA">BOSNIA AND HERZEGOVINA</option>
												 										<option myCCode="267"  myTag="BOTSWANA"  value="BW">BOTSWANA</option>
												 										<option myCCode="55"  myTag="BRAZIL"  value="BR">BRAZIL</option>
												 										<option myCCode="1284"  myTag="BRITISH VIRGIN ISLANDS"  value="VG">BRITISH VIRGIN ISLANDS</option>
												 										<option myCCode="673"  myTag="BRUNEI"  value="BN">BRUNEI</option>
												 										<option myCCode="359"  myTag="BULGARIA"  value="BG">BULGARIA</option>
												 										<option myCCode="226"  myTag="BURKINA FASO"  value="BF">BURKINA FASO</option>
												 										<option myCCode="257"  myTag="BURUNDI"  value="BI">BURUNDI</option>
												 										<option myCCode="237"  myTag="CAMEROON"  value="CM">CAMEROON</option>
												 										<option myCCode="1"  myTag="CANADA"  value="CA">CANADA</option>
												 										<option myCCode="238"  myTag="CAPE VERDE"  value="CV">CAPE VERDE</option>
												 										<option myCCode="1345"  myTag="CAYMAN ISLANDS"  value="KY">CAYMAN ISLANDS</option>
												 										<option myCCode="236"  myTag="CENTRAL AFRICAN REPUBLIC"  value="CF">CENTRAL AFRICAN REPUBLIC</option>
												 										<option myCCode="235"  myTag="CHAD"  value="TD">CHAD</option>
												 										<option myCCode="42"  myTag="Czech Republic"  value="CV">Czech Republic</option>
												 										<option myCCode="56"  myTag="CHILE"  value="CL">CHILE</option>
												 										<option myCCode="86"  myTag="CHINA"  value="CN">CHINA</option>
												 										<option myCCode="672"  myTag="CHRISTMAS ISLAND"  value="CX">CHRISTMAS ISLAND</option>
												 										<option myCCode="891"  myTag="COCOS ISLANDS"  value="CC">COCOS ISLANDS</option>
												 										<option myCCode="57"  myTag="COLOMBIA"  value="CO">COLOMBIA</option>
												 										<option myCCode="269"  myTag="COMOROS"  value="KM">COMOROS</option>
												 										<option myCCode="242"  myTag="CONGO (Brazzaville)"  value="CG">CONGO Brazzaville</option>
																						<option myCCode="242"  myTag="CONGO (Kinshasa)"  value="CD">CONGO Kinshasa</option>
												 										<option myCCode="682"  myTag="COOK ISLANDS"  value="CK">COOK ISLANDS</option>
												 										<option myCCode="506"  myTag="COSTA RICA"  value="CR">COSTA RICA</option>
												 										<option myCCode="385"  myTag="CROATIA"  value="HR">CROATIA</option>
												 										<option myCCode="53"  myTag="CUBA"  value="CU">CUBA</option>
												 										<option myCCode="357"  myTag="CYPRUS"  value="CY">CYPRUS</option>
												 										<option myCCode="45"  myTag="DENMARK"  value="DK">DENMARK</option>
												 										<option myCCode="253"  myTag="DJIBOUTI"  value="DJ">DJIBOUTI</option>
												 										<option myCCode="1767"  myTag="DOMINICA"  value="DM">DOMINICA</option>
												 										<option myCCode="1809"  myTag="DOMINICAN REPUBLIC"  value="DO">DOMINICAN REPUBLIC</option>
												 										<option myCCode="670"  myTag="EAST TIMOR"  value="TL">EAST TIMOR</option>
												 										<option myCCode="593"  myTag="ECUADOR"  value="EC">ECUADOR</option>
												 										<option myCCode="20"  myTag="EGYPT"  value="EG">EGYPT</option>
												 										<option myCCode="503"  myTag="EL SALVADOR"  value="SV">EL SALVADOR</option>
												 										<option myCCode="240"  myTag="EQUATORIAL GUINEA"  value="GQ">EQUATORIAL GUINEA</option>
												 										<option myCCode="291"  myTag="ERITREA"  value="ER">ERITREA</option>
												 										<option myCCode="591"  myTag="ESTADO PLURINACIONAL DE BOLIVIA"  value="BO">ESTADO PLURINACIONAL DE BOLIVIA</option>
												 										<option myCCode="372"  myTag="ESTONIA"  value="EE">ESTONIA</option>
												 										<option myCCode="251"  myTag="ETHIOPIA"  value="ET">ETHIOPIA</option>
												 										<option myCCode="500"  myTag="FALKLAND ISLANDS"  value="FK">FALKLAND ISLANDS</option>
												 										<option myCCode="298"  myTag="Faroe Islands"  value="FO">Faroe Islands</option>
												 										<option myCCode="679"  myTag="FIJI"  value="FJ">FIJI</option>
												 										<option myCCode="358"  myTag="FINLAND"  value="FI">FINLAND</option>
												 										<option myCCode="33"  myTag="FRANCE"  value="FR">FRANCE</option>
												 										<option myCCode="594"  myTag="FRENCH GUIANA"  value="GF">FRENCH GUIANA</option>
												 										<option myCCode="689"  myTag="FRENCH POLYNESIA"  value="PF">FRENCH POLYNESIA</option>
												 										<option myCCode="241"  myTag="GABON"  value="GA">GABON</option>
												 										<option myCCode="220"  myTag="GAMBIA"  value="GM">GAMBIA</option>
												 										<option myCCode="995"  myTag="GEORGIA"  value="GE">GEORGIA</option>
												 										<option myCCode="49"  myTag="GERMANY"  value="DE">GERMANY</option>
												 										<option myCCode="350"  myTag="GIBRALTAR"  value="GI">GIBRALTAR</option>
												 										<option myCCode="30"  myTag="GREECE"  value="GR">GREECE</option>
												 										<option myCCode="299"  myTag="GREENLAND"  value="GL">GREENLAND</option>
												 										<option myCCode="1473"  myTag="GRENADA"  value="GD">GRENADA</option>
												 										<option myCCode="590"  myTag="Guadeloupe"  value="GP">Guadeloupe</option>
												 										<option myCCode="671"  myTag="GUAM"  value="GU">GUAM</option>
												 										<option myCCode="502"  myTag="GUATEMALA"  value="GT">GUATEMALA</option>
												 										<option myCCode="44"  myTag="GUERNSEY"  value="GG">GUERNSEY</option>
												 										<option myCCode="224"  myTag="GUINEA"  value="GN">GUINEA</option>
												 										<option myCCode="245"  myTag="GUINEA BISSAU"  value="GW">GUINEA BISSAU</option>
												 										<option myCCode="592"  myTag="GUYANA"  value="GY">GUYANA</option>
												 										<option myCCode="509"  myTag="HAITI"  value="HT">HAITI</option>
												 										<option myCCode="379"  myTag="HOLY SEE"  value="VA">HOLY SEE</option>
												 										<option myCCode="504"  myTag="HONDURAS"  value="HN">HONDURAS</option>
												 										<option myCCode="852"  myTag="HONG KONG"  value="HK">HONG KONG</option>
												 										<option myCCode="36"  myTag="HUNGARY"  value="HU">HUNGARY</option>
												 										<option myCCode="354"  myTag="ICELAND"  value="IS">ICELAND</option>
												 										<option myCCode="IND"  myTag="INDIA"  value="IN">INDIA</option>
												 										<option myCCode="62"  myTag="INDONESIA"  value="ID">INDONESIA</option>
												 										<option myCCode="964"  myTag="IRAQ"  value="IQ">IRAQ</option>
												 										<option myCCode="353"  myTag="IRELAND"  value="IE">IRELAND</option>
												 										<option myCCode="44"  myTag="Isle of Man"  value="IM">Isle of Man</option>
												 										<option myCCode="972"  myTag="ISRAEL"  value="IL">ISRAEL</option>
												 										<option myCCode="39"  myTag="ITALY"  value="IT">ITALY</option>
												 										<option myCCode="225"  myTag="IVORY COAST"  value="CV">IVORY COAST</option>
												 										<option myCCode="1876"  myTag="JAMAICA"  value="JM">JAMAICA</option>
												 										<option myCCode="81"  myTag="JAPAN"  value="JP">JAPAN</option>
												 										<option myCCode="44"  myTag="JERSEY"  value="JE">JERSEY</option>
												 										<option myCCode="962"  myTag="JORDAN"  value="JO">JORDAN</option>
												 										<option myCCode="77"  myTag="KAZAKHSTAN"  value="KZ">KAZAKHSTAN</option>
												 										<option myCCode="254"  myTag="KENYA"  value="KE">KENYA</option>
												 										<option myCCode="686"  myTag="KIRIBATI"  value="KI">KIRIBATI</option>
												 										<option myCCode="381"  myTag="KOSOVO"  value="XK">KOSOVO</option>
												 										<option myCCode="82"  myTag="KOREA"  value="KR">South Korea</option>
												 										
												 										
												 										
												 										<option myCCode="965"  myTag="KUWAIT"  value="KW">KUWAIT</option>
												 										<option myCCode="996"  myTag="KYRGYZSTAN"  value="KG">KYRGYZSTAN</option>
												 										<option myCCode="371"  myTag="LATVIA"  value="LV">LATVIA</option>
												 										<option myCCode="961"  myTag="LEBANON"  value="LB">LEBANON</option>
												 										<option myCCode="266"  myTag="LESOTHO"  value="LS">LESOTHO</option>
												 										<option myCCode="231"  myTag="LIBERIA"  value="LR">LIBERIA</option>
												 										<option myCCode="218"  myTag="LIBYA"  value="LY">LIBYA</option>
												 										<option myCCode="423"  myTag="LIECHTENSTEIN"  value="LI">LIECHTENSTEIN</option>
												 										<option myCCode="370"  myTag="LITHUANIA"  value="LT">LITHUANIA</option>
												 										<option myCCode="352"  myTag="LUXEMBOURG"  value="LU">LUXEMBOURG</option>
												 										<option myCCode="853"  myTag="MACAO"  value="MO">MACAO</option>
												 										<option myCCode="389"  myTag="MACEDONIA"  value="MK">MACEDONIA</option>
												 										<option myCCode="261"  myTag="MADAGASCAR"  value="MG">MADAGASCAR</option>
												 										<option myCCode="265"  myTag="MALAWI"  value="MW">MALAWI</option>
												 										<option myCCode="60"  myTag="MALAYSIA"  value="MY">MALAYSIA</option>
												 										<option myCCode="960"  myTag="MALDIVES"  value="MV">MALDIVES</option>
												 										<option myCCode="223"  myTag="MALI"  value="ML">MALI</option>
												 										<option myCCode="692"  myTag="MARSHALL ISLANDS"  value="MH">MARSHALL ISLANDS</option>
												 										<option myCCode="596"  myTag="MARTINIQUE"  value="MQ">MARTINIQUE</option>
												 										<option myCCode="230"  myTag="Mauritius"  value="MU">Mauritius</option>
												 										<option myCCode="222"  myTag="MAURITANIA"  value="MR">MAURITANIA</option>
												 										<option myCCode="262"  myTag="MAYOTTE"  value="YT">MAYOTTE</option>
												 										<option myCCode="691"  myTag="MICRONESIA"  value="FM">MICRONESIA</option>
												 										<option myCCode="373"  myTag="MOLDOVA"  value="MD">MOLDOVA</option>
												 										<option myCCode="377"  myTag="MONACO"  value="MC">MONACO</option>
												 										<option myCCode="976"  myTag="MONGOLIA"  value="MN">MONGOLIA</option>
												 										<option myCCode="382"  myTag="MONTENEGRO"  value="ME">MONTENEGRO</option>
												 										<option myCCode="1664"  myTag="MONTSERRAT"  value="MS">MONTSERRAT</option>
												 										<option myCCode="212"  myTag="MOROCCO"  value="MA">MOROCCO</option>
												 										<option myCCode="258"  myTag="MOZAMBIQUE"  value="MZ">MOZAMBIQUE</option>
												 										<option myCCode="95"  myTag="MYANMAR"  value="MM">MYANMAR</option>
												 										<option myCCode="264"  myTag="NAMIBIA"  value="NA">NAMIBIA</option>
												 										<option myCCode="674"  myTag="NAURU"  value="NR">NAURU</option>
												 										<option myCCode="977"  myTag="NEPAL"  value="NP">NEPAL</option>
												 										<option myCCode="599"  myTag="NETHERLANDS"  value="NL">NETHERLANDS</option>
												 										<option myCCode="31"  myTag="NETHERLANDS ANTILLES"  value="AN">NETHERLANDS ANTILLES</option>
												 										<option myCCode="687"  myTag="NEW CALEDONIA"  value="NC">NEW CALEDONIA</option>
												 										<option myCCode="64"  myTag="NEW ZEALAND"  value="NZ">NEW ZEALAND</option>
												 										<option myCCode="505"  myTag="NICARAGUA"  value="NI">NICARAGUA</option>
												 										<option myCCode="227"  myTag="NIGER"  value="NE">NIGER</option>
												 										<option myCCode="234"  myTag="NIGERIA"  value="NG">NIGERIA</option>
												 										<option myCCode="683"  myTag="NIUE"  value="NU">NIUE</option>
												 										<option myCCode="672"  myTag="NORFOLK ISLAND"  value="NF">NORFOLK ISLAND</option>
												 										<option myCCode="670"  myTag="NORTHERN MARIANA"  value="MP">NORTHERN MARIANA</option>
												 										<option myCCode="47"  myTag="NORWAY"  value="NO">NORWAY</option>
												 										<option myCCode="968"  myTag="OMAN"  value="OM">OMAN</option>
												 										<option myCCode="680"  myTag="PALAU"  value="PW">PALAU</option>
												 										<option myCCode="970"  myTag="Palestinian Territory"  value="PS">Palestinian Territory</option>
												 										<option myCCode="507"  myTag="PANAMA"  value="PA">PANAMA</option>
												 										<option myCCode="675"  myTag="PAPUA NEW GUINEA"  value="PG">PAPUA NEW GUINEA</option>
												 										<option myCCode="595"  myTag="PARAGUAY"  value="PY">PARAGUAY</option>
												 										<option myCCode="51"  myTag="PERU"  value="PE">PERU</option>
												 										<option myCCode="63"  myTag="PHILIPPINES"  value="PH">PHILIPPINES</option>
												 										<option myCCode="48"  myTag="POLAND"  value="PL">POLAND</option>
												 										<option myCCode="351"  myTag="PORTUGAL"  value="PT">PORTUGAL</option>
												 										<option myCCode="787"  myTag="PUERTO RICO"  value="PR">PUERTO RICO</option>
																		                                <option myCCode="974"  myTag="QATAR"  value="QA">QATAR</option>
												 										<option myCCode="40"  myTag="ROMANIA"  value="RO">ROMANIA</option>
												 										<option myCCode="7"  myTag="RUSSIA"  value="RU">RUSSIA</option>
												 										<option myCCode="250"  myTag="RWANDA"  value="RW">RWANDA</option>
												 										<option myCCode="685"  myTag="SAMOA"  value="WS">SAMOA</option>
												 										<option myCCode="378"  myTag="SAN MARINO"  value="SM">SAN MARINO</option>
												 										<option myCCode="239"  myTag="SAO TOME AND PRINCIPE"  value="ST">SAO TOME AND PRINCIPE</option>
												 										<option myCCode="966"  myTag="SAUDI ARABIA"  value="SA">SAUDI ARABIA</option>
												 										<option myCCode="221"  myTag="SENEGAL"  value="SN">SENEGAL</option>
												 										<option myCCode="381"  myTag="SERBIA"  value="RS">SERBIA</option>
												 										<option myCCode="248"  myTag="SEYCHELLES"  value="SC">SEYCHELLES</option>
												 										<option myCCode="232"  myTag="SIERRA LEONE"  value="SL">SIERRA LEONE</option>
												 										<option myCCode="65"  myTag="SINGAPORE"  value="SG">SINGAPORE</option>
												 										<option myCCode=""  myTag="Saint-Martin"  value="MF">Saint-Martin</option>
												 										<option myCCode="421"  myTag="SLOVAKIA"  value="SK">SLOVAKIA</option>
												 										<option myCCode="386"  myTag="SLOVENIA"  value="SI">SLOVENIA</option>
												 										<option myCCode="677"  myTag="SOLOMON ISLANDS"  value="SB">SOLOMON ISLANDS</option>
												 										<option myCCode="252"  myTag="SOMALIA"  value="SO">SOMALIA</option>
												 										<option myCCode="27"  myTag="SOUTH AFRICA"  value="ZA">SOUTH AFRICA</option>
												 										<option myCCode="34"  myTag="SPAIN"  value="ES">SPAIN</option>
												 										<option myCCode="94"  myTag="SRI LANKA"  value="LK">SRI LANKA</option>
												 										<option myCCode="1869"  myTag="ST KITTS AND NEVIS"  value="KN">ST KITTS AND NEVIS</option>
												 										<option myCCode="1784"  myTag="ST VINCENT AND GRENADINES"  value="VC">ST VINCENT AND GRENADINES</option>
												 										<option myCCode="249"  myTag="SUDAN"  value="SD">SUDAN</option>
												 										<option myCCode="597"  myTag="SURINAME"  value="SR">SURINAME</option>
												 									        <option myCCode="47"  myTag="SVALBARD"  value="SJ">SVALBARD</option>
												 										<option myCCode="268"  myTag="SWAZILAND"  value="SWZ"></option>
												 										<option myCCode="46"  myTag="SWEDEN"  value="SWE">SWEDEN</option>
												 										<option myCCode="41"  myTag="SWITZERLAND"  value="CH">SWITZERLAND</option>
												 										<option myCCode="963"  myTag="SYRIA"  value="SY">SYRIA</option>
												 										<option myCCode="886"  myTag="TAIWAN"  value="TW">TAIWAN</option>
												 										<option myCCode="992"  myTag="TAJIKISTAN"  value="TJ">TAJIKISTAN</option>
												 										<option myCCode="255"  myTag="TANZANIA"  value="TZ">TANZANIA</option>
												 										<option myCCode="66"  myTag="THAILAND"  value="TH">THAILAND</option>
												 										<option myCCode="670"  myTag="Timor-Leste"  value="TL">Timor-Leste</option>
												 										<option myCCode="228"  myTag="TOGO"  value="TG">TOGO</option>
												 										<option myCCode="690"  myTag="TOKELAU"  value="TK">TOKELAU</option>
												 										<option myCCode="676"  myTag="TONGA"  value="TO">TONGA</option>
												 										<option myCCode="1868"  myTag="TRINIDAD AND TOBAGO"  value="TT">TRINIDAD AND TOBAGO</option>
												 										<option myCCode="216"  myTag="TUNISIA"  value="TN">TUNISIA</option>
												 										<option myCCode="90"  myTag="TURKEY"  value="TR">TURKEY</option>
												 										<option myCCode="993"  myTag="TURKMENISTAN"  value="TM">TURKMENISTAN</option>
												 										<option myCCode="1649"  myTag="TURKS AND CAICOS"  value="TC">TURKS AND CAICOS</option>
												 										<option myCCode="688"  myTag="TUVALU"  value="TV">TUVALU</option>
												 										<option myCCode="256"  myTag="UGANDA"  value="UG">UGANDA</option>
												 										<option myCCode="380"  myTag="UKRAINE"  value="UA">UKRAINE</option>
												 										<option myCCode="971"  myTag="UNITED ARAB EMIRATES"  value="AE">UNITED ARAB EMIRATES</option>
												 										<option myCCode="44"  myTag="UNITED KINGDOM"  value="GB">UNITED KINGDOM</option>
												 										<option myCCode="598"  myTag="URUGUAY"  value="UY">URUGUAY</option>
												 										<option myCCode="998"  myTag="UZBEKISTAN"  value="UZ">UZBEKISTAN</option>
												 										<option myCCode="678"  myTag="VANUATU"  value="VU">VANUATU</option>
												 										<option myCCode="58"  myTag="VENEZUELA"  value="VE">VENEZUELA</option>
												 										<option myCCode="84"  myTag="VIETNAM"  value="VN">VIETNAM</option>
												 										<option myCCode="1340"  myTag="VIRGIN ISLANDS"  value="VG">VIRGIN ISLANDS</option>
												 										<option myCCode="681"  myTag="WALLIS AND FUTUNA"  value="WF">WALLIS AND FUTUNA</option>
												 										<option myCCode="212"  myTag="WESTERN SAHARA"  value="EH">WESTERN SAHARA</option>
												 										<option myCCode="38"  myTag="YUGOSLAVIA"  value="YG">YUGOSLAVIA</option>
												 										<option myCCode="260"  myTag="ZAMBIA"  value="ZM">ZAMBIA</option>
                
                </select>
                
                
                </div>
                <div class="clearfix"></div>
            </div>
            
            <h2>Contact Address</h2>
            <div class="formElementCon formElementConLR">
            	<div class="form-group">
                    <label class="control-label">Country<span>*</span></label>
                    <select id="Country" required name="country" class="form-control">
                    <option>${dcountry}</option>
																						<option myCCode="1"  myTag="UNITED STATES"  value="US">UNITED STATES</option>
												 										<option myCCode="52"  myTag="MEXICO"  value="MX">MEXICO</option>
												 										<option myCCode="93"  myTag="AFGHANISTAN"  value="AF">AFGHANISTAN</option>
												 										<option myCCode="355"  myTag="ALBANIA"  value="AL">ALBANIA</option>
												 										<option myCCode="213"  myTag="ALGERIA"  value="DZ">ALGERIA</option>
												 										<option myCCode="684"  myTag="AMERICAN SAMOA"  value="AS">AMERICAN SAMOA</option>
												 										<option myCCode="376"  myTag="ANDORRA"  value="AD">ANDORRA</option>
												 										<option myCCode="244"  myTag="ANGOLA"  value="AO">ANGOLA</option>
												 										<option myCCode="1264"  myTag="ANGUILLA"  value="AI">ANGUILLA</option>
												 										<option myCCode="1268"  myTag="ANTIGUA AND BARBUDA"  value="AG">ANTIGUA AND BARBUDA</option>
												 										<option myCCode="54"  myTag="ARGENTINA"  value="AR">ARGENTINA</option>
												 										<option myCCode="374"  myTag="ARMENIA"  value="AM">ARMENIA</option>
												 										<option myCCode="297"  myTag="ARUBA"  value="AW">ARUBA</option>
												 										<option myCCode="61"  myTag="AUSTRALIA"  value="AU">AUSTRALIA</option>
												 										<option myCCode="43"  myTag="AUSTRIA"  value="AT">AUSTRIA</option>
												 										<option myCCode="994"  myTag="AZERBAIJAN"  value="AZ">AZERBAIJAN</option>
												 										<option myCCode="1242"  myTag="BAHAMAS"  value="BS">BAHAMAS</option>
												 										<option myCCode="973"  myTag="BAHRAIN"  value="BH">BAHRAIN</option>
												 										<option myCCode="880"  myTag="BANGLADESH"  value="BD">BANGLADESH</option>
												 										<option myCCode="1246"  myTag="BARBADOS"  value="BB">BARBADOS</option>
												 										<option myCCode="375"  myTag="BELARUS"  value="BY">BELARUS</option>
												 										<option myCCode="32"  myTag="BELGIUM"  value="BE">BELGIUM</option>
												 										<option myCCode="501"  myTag="BELIZE"  value="BZ">BELIZE</option>
												 										<option myCCode="229"  myTag="BENIN"  value="BJ">BENIN</option>
												 										<option myCCode="1441"  myTag="BERMUDA"  value="BM">BERMUDA</option>
												 										<option myCCode="975"  myTag="BHUTAN"  value="BT">BHUTAN</option>
												 										<option myCCode="387"  myTag="BOSNIA AND HERZEGOVINA"  value="BA">BOSNIA AND HERZEGOVINA</option>
												 										<option myCCode="267"  myTag="BOTSWANA"  value="BW">BOTSWANA</option>
												 										<option myCCode="55"  myTag="BRAZIL"  value="BR">BRAZIL</option>
												 										<option myCCode="1284"  myTag="BRITISH VIRGIN ISLANDS"  value="VG">BRITISH VIRGIN ISLANDS</option>
												 										<option myCCode="673"  myTag="BRUNEI"  value="BN">BRUNEI</option>
												 										<option myCCode="359"  myTag="BULGARIA"  value="BG">BULGARIA</option>
												 										<option myCCode="226"  myTag="BURKINA FASO"  value="BF">BURKINA FASO</option>
												 										<option myCCode="257"  myTag="BURUNDI"  value="BI">BURUNDI</option>
												 										<option myCCode="237"  myTag="CAMEROON"  value="CM">CAMEROON</option>
												 										<option myCCode="1"  myTag="CANADA"  value="CA">CANADA</option>
												 										<option myCCode="238"  myTag="CAPE VERDE"  value="CV">CAPE VERDE</option>
												 										<option myCCode="1345"  myTag="CAYMAN ISLANDS"  value="KY">CAYMAN ISLANDS</option>
												 										<option myCCode="236"  myTag="CENTRAL AFRICAN REPUBLIC"  value="CF">CENTRAL AFRICAN REPUBLIC</option>
												 										<option myCCode="235"  myTag="CHAD"  value="TD">CHAD</option>
												 										<option myCCode="42"  myTag="Czech Republic"  value="CV">Czech Republic</option>
												 										<option myCCode="56"  myTag="CHILE"  value="CL">CHILE</option>
												 										<option myCCode="86"  myTag="CHINA"  value="CN">CHINA</option>
												 										<option myCCode="672"  myTag="CHRISTMAS ISLAND"  value="CX">CHRISTMAS ISLAND</option>
												 										<option myCCode="891"  myTag="COCOS ISLANDS"  value="CC">COCOS ISLANDS</option>
												 										<option myCCode="57"  myTag="COLOMBIA"  value="CO">COLOMBIA</option>
												 										<option myCCode="269"  myTag="COMOROS"  value="KM">COMOROS</option>
												 										<option myCCode="242"  myTag="CONGO (Brazzaville)"  value="CG">CONGO Brazzaville</option>
																						<option myCCode="242"  myTag="CONGO (Kinshasa)"  value="CD">CONGO Kinshasa</option>
												 										<option myCCode="682"  myTag="COOK ISLANDS"  value="CK">COOK ISLANDS</option>
												 										<option myCCode="506"  myTag="COSTA RICA"  value="CR">COSTA RICA</option>
												 										<option myCCode="385"  myTag="CROATIA"  value="HR">CROATIA</option>
												 										<option myCCode="53"  myTag="CUBA"  value="CU">CUBA</option>
												 										<option myCCode="357"  myTag="CYPRUS"  value="CY">CYPRUS</option>
												 										<option myCCode="45"  myTag="DENMARK"  value="DK">DENMARK</option>
												 										<option myCCode="253"  myTag="DJIBOUTI"  value="DJ">DJIBOUTI</option>
												 										<option myCCode="1767"  myTag="DOMINICA"  value="DM">DOMINICA</option>
												 										<option myCCode="1809"  myTag="DOMINICAN REPUBLIC"  value="DO">DOMINICAN REPUBLIC</option>
												 										<option myCCode="670"  myTag="EAST TIMOR"  value="TL">EAST TIMOR</option>
												 										<option myCCode="593"  myTag="ECUADOR"  value="EC">ECUADOR</option>
												 										<option myCCode="20"  myTag="EGYPT"  value="EG">EGYPT</option>
												 										<option myCCode="503"  myTag="EL SALVADOR"  value="SV">EL SALVADOR</option>
												 										<option myCCode="240"  myTag="EQUATORIAL GUINEA"  value="GQ">EQUATORIAL GUINEA</option>
												 										<option myCCode="291"  myTag="ERITREA"  value="ER">ERITREA</option>
												 										<option myCCode="591"  myTag="ESTADO PLURINACIONAL DE BOLIVIA"  value="BO">ESTADO PLURINACIONAL DE BOLIVIA</option>
												 										<option myCCode="372"  myTag="ESTONIA"  value="EE">ESTONIA</option>
												 										<option myCCode="251"  myTag="ETHIOPIA"  value="ET">ETHIOPIA</option>
												 										<option myCCode="500"  myTag="FALKLAND ISLANDS"  value="FK">FALKLAND ISLANDS</option>
												 										<option myCCode="298"  myTag="Faroe Islands"  value="FO">Faroe Islands</option>
												 										<option myCCode="679"  myTag="FIJI"  value="FJ">FIJI</option>
												 										<option myCCode="358"  myTag="FINLAND"  value="FI">FINLAND</option>
												 										<option myCCode="33"  myTag="FRANCE"  value="FR">FRANCE</option>
												 										<option myCCode="594"  myTag="FRENCH GUIANA"  value="GF">FRENCH GUIANA</option>
												 										<option myCCode="689"  myTag="FRENCH POLYNESIA"  value="PF">FRENCH POLYNESIA</option>
												 										<option myCCode="241"  myTag="GABON"  value="GA">GABON</option>
												 										<option myCCode="220"  myTag="GAMBIA"  value="GM">GAMBIA</option>
												 										<option myCCode="995"  myTag="GEORGIA"  value="GE">GEORGIA</option>
												 										<option myCCode="49"  myTag="GERMANY"  value="DE">GERMANY</option>
												 										<option myCCode="350"  myTag="GIBRALTAR"  value="GI">GIBRALTAR</option>
												 										<option myCCode="30"  myTag="GREECE"  value="GR">GREECE</option>
												 										<option myCCode="299"  myTag="GREENLAND"  value="GL">GREENLAND</option>
												 										<option myCCode="1473"  myTag="GRENADA"  value="GD">GRENADA</option>
												 										<option myCCode="590"  myTag="Guadeloupe"  value="GP">Guadeloupe</option>
												 										<option myCCode="671"  myTag="GUAM"  value="GU">GUAM</option>
												 										<option myCCode="502"  myTag="GUATEMALA"  value="GT">GUATEMALA</option>
												 										<option myCCode="44"  myTag="GUERNSEY"  value="GG">GUERNSEY</option>
												 										<option myCCode="224"  myTag="GUINEA"  value="GN">GUINEA</option>
												 										<option myCCode="245"  myTag="GUINEA BISSAU"  value="GW">GUINEA BISSAU</option>
												 										<option myCCode="592"  myTag="GUYANA"  value="GY">GUYANA</option>
												 										<option myCCode="509"  myTag="HAITI"  value="HT">HAITI</option>
												 										<option myCCode="379"  myTag="HOLY SEE"  value="VA">HOLY SEE</option>
												 										<option myCCode="504"  myTag="HONDURAS"  value="HN">HONDURAS</option>
												 										<option myCCode="852"  myTag="HONG KONG"  value="HK">HONG KONG</option>
												 										<option myCCode="36"  myTag="HUNGARY"  value="HU">HUNGARY</option>
												 										<option myCCode="354"  myTag="ICELAND"  value="IS">ICELAND</option>
												 										<option myCCode="IND"  myTag="INDIA"  value="IN">INDIA</option>
												 										<option myCCode="62"  myTag="INDONESIA"  value="ID">INDONESIA</option>
												 										<option myCCode="964"  myTag="IRAQ"  value="IQ">IRAQ</option>
												 										<option myCCode="353"  myTag="IRELAND"  value="IE">IRELAND</option>
												 										<option myCCode="44"  myTag="Isle of Man"  value="IM">Isle of Man</option>
												 										<option myCCode="972"  myTag="ISRAEL"  value="IL">ISRAEL</option>
												 										<option myCCode="39"  myTag="ITALY"  value="IT">ITALY</option>
												 										<option myCCode="225"  myTag="IVORY COAST"  value="CV">IVORY COAST</option>
												 										<option myCCode="1876"  myTag="JAMAICA"  value="JM">JAMAICA</option>
												 										<option myCCode="81"  myTag="JAPAN"  value="JP">JAPAN</option>
												 										<option myCCode="44"  myTag="JERSEY"  value="JE">JERSEY</option>
												 										<option myCCode="962"  myTag="JORDAN"  value="JO">JORDAN</option>
												 										<option myCCode="77"  myTag="KAZAKHSTAN"  value="KZ">KAZAKHSTAN</option>
												 										<option myCCode="254"  myTag="KENYA"  value="KE">KENYA</option>
												 										<option myCCode="686"  myTag="KIRIBATI"  value="KI">KIRIBATI</option>
												 										<option myCCode="381"  myTag="KOSOVO"  value="XK">KOSOVO</option>
												 										<option myCCode="82"  myTag="KOREA"  value="KR">South Korea</option>
												 										
												 										
												 										
												 										<option myCCode="965"  myTag="KUWAIT"  value="KW">KUWAIT</option>
												 										<option myCCode="996"  myTag="KYRGYZSTAN"  value="KG">KYRGYZSTAN</option>
												 										<option myCCode="371"  myTag="LATVIA"  value="LV">LATVIA</option>
												 										<option myCCode="961"  myTag="LEBANON"  value="LB">LEBANON</option>
												 										<option myCCode="266"  myTag="LESOTHO"  value="LS">LESOTHO</option>
												 										<option myCCode="231"  myTag="LIBERIA"  value="LR">LIBERIA</option>
												 										<option myCCode="218"  myTag="LIBYA"  value="LY">LIBYA</option>
												 										<option myCCode="423"  myTag="LIECHTENSTEIN"  value="LI">LIECHTENSTEIN</option>
												 										<option myCCode="370"  myTag="LITHUANIA"  value="LT">LITHUANIA</option>
												 										<option myCCode="352"  myTag="LUXEMBOURG"  value="LU">LUXEMBOURG</option>
												 										<option myCCode="853"  myTag="MACAO"  value="MO">MACAO</option>
												 										<option myCCode="389"  myTag="MACEDONIA"  value="MK">MACEDONIA</option>
												 										<option myCCode="261"  myTag="MADAGASCAR"  value="MG">MADAGASCAR</option>
												 										<option myCCode="265"  myTag="MALAWI"  value="MW">MALAWI</option>
												 										<option myCCode="60"  myTag="MALAYSIA"  value="MY">MALAYSIA</option>
												 										<option myCCode="960"  myTag="MALDIVES"  value="MV">MALDIVES</option>
												 										<option myCCode="223"  myTag="MALI"  value="ML">MALI</option>
												 										<option myCCode="692"  myTag="MARSHALL ISLANDS"  value="MH">MARSHALL ISLANDS</option>
												 										<option myCCode="596"  myTag="MARTINIQUE"  value="MQ">MARTINIQUE</option>
												 										<option myCCode="230"  myTag="Mauritius"  value="MU">Mauritius</option>
												 										<option myCCode="222"  myTag="MAURITANIA"  value="MR">MAURITANIA</option>
												 										<option myCCode="262"  myTag="MAYOTTE"  value="YT">MAYOTTE</option>
												 										<option myCCode="691"  myTag="MICRONESIA"  value="FM">MICRONESIA</option>
												 										<option myCCode="373"  myTag="MOLDOVA"  value="MD">MOLDOVA</option>
												 										<option myCCode="377"  myTag="MONACO"  value="MC">MONACO</option>
												 										<option myCCode="976"  myTag="MONGOLIA"  value="MN">MONGOLIA</option>
												 										<option myCCode="382"  myTag="MONTENEGRO"  value="ME">MONTENEGRO</option>
												 										<option myCCode="1664"  myTag="MONTSERRAT"  value="MS">MONTSERRAT</option>
												 										<option myCCode="212"  myTag="MOROCCO"  value="MA">MOROCCO</option>
												 										<option myCCode="258"  myTag="MOZAMBIQUE"  value="MZ">MOZAMBIQUE</option>
												 										<option myCCode="95"  myTag="MYANMAR"  value="MM">MYANMAR</option>
												 										<option myCCode="264"  myTag="NAMIBIA"  value="NA">NAMIBIA</option>
												 										<option myCCode="674"  myTag="NAURU"  value="NR">NAURU</option>
												 										<option myCCode="977"  myTag="NEPAL"  value="NP">NEPAL</option>
												 										<option myCCode="599"  myTag="NETHERLANDS"  value="NL">NETHERLANDS</option>
												 										<option myCCode="31"  myTag="NETHERLANDS ANTILLES"  value="AN">NETHERLANDS ANTILLES</option>
												 										<option myCCode="687"  myTag="NEW CALEDONIA"  value="NC">NEW CALEDONIA</option>
												 										<option myCCode="64"  myTag="NEW ZEALAND"  value="NZ">NEW ZEALAND</option>
												 										<option myCCode="505"  myTag="NICARAGUA"  value="NI">NICARAGUA</option>
												 										<option myCCode="227"  myTag="NIGER"  value="NE">NIGER</option>
												 										<option myCCode="234"  myTag="NIGERIA"  value="NG">NIGERIA</option>
												 										<option myCCode="683"  myTag="NIUE"  value="NU">NIUE</option>
												 										<option myCCode="672"  myTag="NORFOLK ISLAND"  value="NF">NORFOLK ISLAND</option>
												 										<option myCCode="670"  myTag="NORTHERN MARIANA"  value="MP">NORTHERN MARIANA</option>
												 										<option myCCode="47"  myTag="NORWAY"  value="NO">NORWAY</option>
												 										<option myCCode="968"  myTag="OMAN"  value="OM">OMAN</option>
												 										<option myCCode="680"  myTag="PALAU"  value="PW">PALAU</option>
												 										<option myCCode="970"  myTag="Palestinian Territory"  value="PS">Palestinian Territory</option>
												 										<option myCCode="507"  myTag="PANAMA"  value="PA">PANAMA</option>
												 										<option myCCode="675"  myTag="PAPUA NEW GUINEA"  value="PG">PAPUA NEW GUINEA</option>
												 										<option myCCode="595"  myTag="PARAGUAY"  value="PY">PARAGUAY</option>
												 										<option myCCode="51"  myTag="PERU"  value="PE">PERU</option>
												 										<option myCCode="63"  myTag="PHILIPPINES"  value="PH">PHILIPPINES</option>
												 										<option myCCode="48"  myTag="POLAND"  value="PL">POLAND</option>
												 										<option myCCode="351"  myTag="PORTUGAL"  value="PT">PORTUGAL</option>
												 										<option myCCode="787"  myTag="PUERTO RICO"  value="PR">PUERTO RICO</option>
																		                                <option myCCode="974"  myTag="QATAR"  value="QA">QATAR</option>
												 										<option myCCode="40"  myTag="ROMANIA"  value="RO">ROMANIA</option>
												 										<option myCCode="7"  myTag="RUSSIA"  value="RU">RUSSIA</option>
												 										<option myCCode="250"  myTag="RWANDA"  value="RW">RWANDA</option>
												 										<option myCCode="685"  myTag="SAMOA"  value="WS">SAMOA</option>
												 										<option myCCode="378"  myTag="SAN MARINO"  value="SM">SAN MARINO</option>
												 										<option myCCode="239"  myTag="SAO TOME AND PRINCIPE"  value="ST">SAO TOME AND PRINCIPE</option>
												 										<option myCCode="966"  myTag="SAUDI ARABIA"  value="SA">SAUDI ARABIA</option>
												 										<option myCCode="221"  myTag="SENEGAL"  value="SN">SENEGAL</option>
												 										<option myCCode="381"  myTag="SERBIA"  value="RS">SERBIA</option>
												 										<option myCCode="248"  myTag="SEYCHELLES"  value="SC">SEYCHELLES</option>
												 										<option myCCode="232"  myTag="SIERRA LEONE"  value="SL">SIERRA LEONE</option>
												 										<option myCCode="65"  myTag="SINGAPORE"  value="SG">SINGAPORE</option>
												 										<option myCCode=""  myTag="Saint-Martin"  value="MF">Saint-Martin</option>
												 										<option myCCode="421"  myTag="SLOVAKIA"  value="SK">SLOVAKIA</option>
												 										<option myCCode="386"  myTag="SLOVENIA"  value="SI">SLOVENIA</option>
												 										<option myCCode="677"  myTag="SOLOMON ISLANDS"  value="SB">SOLOMON ISLANDS</option>
												 										<option myCCode="252"  myTag="SOMALIA"  value="SO">SOMALIA</option>
												 										<option myCCode="27"  myTag="SOUTH AFRICA"  value="ZA">SOUTH AFRICA</option>
												 										<option myCCode="34"  myTag="SPAIN"  value="ES">SPAIN</option>
												 										<option myCCode="94"  myTag="SRI LANKA"  value="LK">SRI LANKA</option>
												 										<option myCCode="1869"  myTag="ST KITTS AND NEVIS"  value="KN">ST KITTS AND NEVIS</option>
												 										<option myCCode="1784"  myTag="ST VINCENT AND GRENADINES"  value="VC">ST VINCENT AND GRENADINES</option>
												 										<option myCCode="249"  myTag="SUDAN"  value="SD">SUDAN</option>
												 										<option myCCode="597"  myTag="SURINAME"  value="SR">SURINAME</option>
												 									        <option myCCode="47"  myTag="SVALBARD"  value="SJ">SVALBARD</option>
												 										<option myCCode="268"  myTag="SWAZILAND"  value="SWZ"></option>
												 										<option myCCode="46"  myTag="SWEDEN"  value="SWE">SWEDEN</option>
												 										<option myCCode="41"  myTag="SWITZERLAND"  value="CH">SWITZERLAND</option>
												 										<option myCCode="963"  myTag="SYRIA"  value="SY">SYRIA</option>
												 										<option myCCode="886"  myTag="TAIWAN"  value="TW">TAIWAN</option>
												 										<option myCCode="992"  myTag="TAJIKISTAN"  value="TJ">TAJIKISTAN</option>
												 										<option myCCode="255"  myTag="TANZANIA"  value="TZ">TANZANIA</option>
												 										<option myCCode="66"  myTag="THAILAND"  value="TH">THAILAND</option>
												 										<option myCCode="670"  myTag="Timor-Leste"  value="TL">Timor-Leste</option>
												 										<option myCCode="228"  myTag="TOGO"  value="TG">TOGO</option>
												 										<option myCCode="690"  myTag="TOKELAU"  value="TK">TOKELAU</option>
												 										<option myCCode="676"  myTag="TONGA"  value="TO">TONGA</option>
												 										<option myCCode="1868"  myTag="TRINIDAD AND TOBAGO"  value="TT">TRINIDAD AND TOBAGO</option>
												 										<option myCCode="216"  myTag="TUNISIA"  value="TN">TUNISIA</option>
												 										<option myCCode="90"  myTag="TURKEY"  value="TR">TURKEY</option>
												 										<option myCCode="993"  myTag="TURKMENISTAN"  value="TM">TURKMENISTAN</option>
												 										<option myCCode="1649"  myTag="TURKS AND CAICOS"  value="TC">TURKS AND CAICOS</option>
												 										<option myCCode="688"  myTag="TUVALU"  value="TV">TUVALU</option>
												 										<option myCCode="256"  myTag="UGANDA"  value="UG">UGANDA</option>
												 										<option myCCode="380"  myTag="UKRAINE"  value="UA">UKRAINE</option>
												 										<option myCCode="971"  myTag="UNITED ARAB EMIRATES"  value="AE">UNITED ARAB EMIRATES</option>
												 										<option myCCode="44"  myTag="UNITED KINGDOM"  value="GB">UNITED KINGDOM</option>
												 										<option myCCode="598"  myTag="URUGUAY"  value="UY">URUGUAY</option>
												 										<option myCCode="998"  myTag="UZBEKISTAN"  value="UZ">UZBEKISTAN</option>
												 										<option myCCode="678"  myTag="VANUATU"  value="VU">VANUATU</option>
												 										<option myCCode="58"  myTag="VENEZUELA"  value="VE">VENEZUELA</option>
												 										<option myCCode="84"  myTag="VIETNAM"  value="VN">VIETNAM</option>
												 										<option myCCode="1340"  myTag="VIRGIN ISLANDS"  value="VG">VIRGIN ISLANDS</option>
												 										<option myCCode="681"  myTag="WALLIS AND FUTUNA"  value="WF">WALLIS AND FUTUNA</option>
												 										<option myCCode="212"  myTag="WESTERN SAHARA"  value="EH">WESTERN SAHARA</option>
												 										<option myCCode="38"  myTag="YUGOSLAVIA"  value="YG">YUGOSLAVIA</option>
												 										<option myCCode="260"  myTag="ZAMBIA"  value="ZM">ZAMBIA</option>
                    </select>
                  </div>
                  <div class="form-group">
                    <label class="control-label">Zipcode</label>
                    <input type="text"   onkeypress="return ((event.charCode > 64 &amp;&amp; event.charCode < 91) || (event.charCode > 96 &amp;&amp; event.charCode < 123) || event.charCode == 8 || event.charCode == 32 || (event.charCode >= 48 &amp;&amp; event.charCode <= 57));" maxlength="10" name="dzip" id="postalold"  value="${bpost}"   class="form-control">
                  </div>
                  <div class="form-group">
                    <label class="control-label">Address Line 1<span>*</span></label>
                    <input type="text" required  onkeypress="return ((event.charCode > 64 &amp;&amp; event.charCode < 91) || (event.charCode > 96 &amp;&amp; event.charCode < 123) || event.charCode == 8 || event.charCode == 32 || (event.charCode >= 48 &amp;&amp; event.charCode <= 57));" maxlength="35"   id="addr1" name="address_line_1" value="${dline1}"  class="form-control">
                  </div>
                  <div class="form-group">
                    <label class="control-label">Address Line 2</label>
                    <input type="text"  onkeypress="return ((event.charCode > 64 &amp;&amp; event.charCode < 91) || (event.charCode > 96 &amp;&amp; event.charCode < 123) || event.charCode == 8 || event.charCode == 32 || (event.charCode >= 48 &amp;&amp; event.charCode <= 57));" maxlength="35" name="address_line_2" value="${dline2}" id="addr2"  class="form-control">
                  </div>
                  
                  <div class="form-group">
                    <label class="control-label">City<span>*</span></label>
                    <input type="text"  onkeypress="return ((event.charCode > 64 &amp;&amp; event.charCode < 91) || (event.charCode > 96 &amp;&amp; event.charCode < 123) || event.charCode == 8 || event.charCode == 32 || (event.charCode >= 48 &amp;&amp; event.charCode <= 57));" maxlength="15" name="city" value="${dcity}" id="cityold" required class="form-control">
                  </div>
                  <div class="form-group">
                    <label class="control-label">State<span>*</span></label>
                    <input type="text"  onkeypress="return ((event.charCode > 64 &amp;&amp; event.charCode < 91) || (event.charCode > 96 &amp;&amp; event.charCode < 123) || event.charCode == 8 || event.charCode == 32 || (event.charCode >= 48 &amp;&amp; event.charCode <= 57));" maxlength="15"  required value="${dstate}" name="state"  id="stateold" class="form-control">
                  </div>
                  
                  <div class="formBillingAddress">
                  	  <div class="addChkBox">
                      	<span>Billing address same as Contact Address</span> <input id="checksameaddress" type="checkbox" onclick="same()">
                      </div>
                  </div>
            	<div class="clearfix"></div>
            </div>
            
            <h2>Billing Address</h2>
            <div class="formElementCon formElementConLR">
            	<div class="form-group">
                    <label class="control-label">Country<span>*</span></label>
                    <select  id="countrynew" name="billing_country" class="form-control">
                    
                    
                    
                     <option >${bcountry}</option>
																						<option myCCode="1"  myTag="UNITED STATES"  value="US">UNITED STATES</option>
												 										<option myCCode="52"  myTag="MEXICO"  value="MX">MEXICO</option>
												 										<option myCCode="93"  myTag="AFGHANISTAN"  value="AF">AFGHANISTAN</option>
												 										<option myCCode="355"  myTag="ALBANIA"  value="AL">ALBANIA</option>
												 										<option myCCode="213"  myTag="ALGERIA"  value="DZ">ALGERIA</option>
												 										<option myCCode="684"  myTag="AMERICAN SAMOA"  value="AS">AMERICAN SAMOA</option>
												 										<option myCCode="376"  myTag="ANDORRA"  value="AD">ANDORRA</option>
												 										<option myCCode="244"  myTag="ANGOLA"  value="AO">ANGOLA</option>
												 										<option myCCode="1264"  myTag="ANGUILLA"  value="AI">ANGUILLA</option>
												 										<option myCCode="1268"  myTag="ANTIGUA AND BARBUDA"  value="AG">ANTIGUA AND BARBUDA</option>
												 										<option myCCode="54"  myTag="ARGENTINA"  value="AR">ARGENTINA</option>
												 										<option myCCode="374"  myTag="ARMENIA"  value="AM">ARMENIA</option>
												 										<option myCCode="297"  myTag="ARUBA"  value="AW">ARUBA</option>
												 										<option myCCode="61"  myTag="AUSTRALIA"  value="AU">AUSTRALIA</option>
												 										<option myCCode="43"  myTag="AUSTRIA"  value="AT">AUSTRIA</option>
												 										<option myCCode="994"  myTag="AZERBAIJAN"  value="AZ">AZERBAIJAN</option>
												 										<option myCCode="1242"  myTag="BAHAMAS"  value="BS">BAHAMAS</option>
												 										<option myCCode="973"  myTag="BAHRAIN"  value="BH">BAHRAIN</option>
												 										<option myCCode="880"  myTag="BANGLADESH"  value="BD">BANGLADESH</option>
												 										<option myCCode="1246"  myTag="BARBADOS"  value="BB">BARBADOS</option>
												 										<option myCCode="375"  myTag="BELARUS"  value="BY">BELARUS</option>
												 										<option myCCode="32"  myTag="BELGIUM"  value="BE">BELGIUM</option>
												 										<option myCCode="501"  myTag="BELIZE"  value="BZ">BELIZE</option>
												 										<option myCCode="229"  myTag="BENIN"  value="BJ">BENIN</option>
												 										<option myCCode="1441"  myTag="BERMUDA"  value="BM">BERMUDA</option>
												 										<option myCCode="975"  myTag="BHUTAN"  value="BT">BHUTAN</option>
												 										<option myCCode="387"  myTag="BOSNIA AND HERZEGOVINA"  value="BA">BOSNIA AND HERZEGOVINA</option>
												 										<option myCCode="267"  myTag="BOTSWANA"  value="BW">BOTSWANA</option>
												 										<option myCCode="55"  myTag="BRAZIL"  value="BR">BRAZIL</option>
												 										<option myCCode="1284"  myTag="BRITISH VIRGIN ISLANDS"  value="VG">BRITISH VIRGIN ISLANDS</option>
												 										<option myCCode="673"  myTag="BRUNEI"  value="BN">BRUNEI</option>
												 										<option myCCode="359"  myTag="BULGARIA"  value="BG">BULGARIA</option>
												 										<option myCCode="226"  myTag="BURKINA FASO"  value="BF">BURKINA FASO</option>
												 										<option myCCode="257"  myTag="BURUNDI"  value="BI">BURUNDI</option>
												 										<option myCCode="237"  myTag="CAMEROON"  value="CM">CAMEROON</option>
												 										<option myCCode="1"  myTag="CANADA"  value="CA">CANADA</option>
												 										<option myCCode="238"  myTag="CAPE VERDE"  value="CV">CAPE VERDE</option>
												 										<option myCCode="1345"  myTag="CAYMAN ISLANDS"  value="KY">CAYMAN ISLANDS</option>
												 										<option myCCode="236"  myTag="CENTRAL AFRICAN REPUBLIC"  value="CF">CENTRAL AFRICAN REPUBLIC</option>
												 										<option myCCode="235"  myTag="CHAD"  value="TD">CHAD</option>
												 										<option myCCode="42"  myTag="Czech Republic"  value="CV">Czech Republic</option>
												 										<option myCCode="56"  myTag="CHILE"  value="CL">CHILE</option>
												 										<option myCCode="86"  myTag="CHINA"  value="CN">CHINA</option>
												 										<option myCCode="672"  myTag="CHRISTMAS ISLAND"  value="CX">CHRISTMAS ISLAND</option>
												 										<option myCCode="891"  myTag="COCOS ISLANDS"  value="CC">COCOS ISLANDS</option>
												 										<option myCCode="57"  myTag="COLOMBIA"  value="CO">COLOMBIA</option>
												 										<option myCCode="269"  myTag="COMOROS"  value="KM">COMOROS</option>
												 										<option myCCode="242"  myTag="CONGO (Brazzaville)"  value="CG">CONGO Brazzaville</option>
																						<option myCCode="242"  myTag="CONGO (Kinshasa)"  value="CD">CONGO Kinshasa</option>
												 										<option myCCode="682"  myTag="COOK ISLANDS"  value="CK">COOK ISLANDS</option>
												 										<option myCCode="506"  myTag="COSTA RICA"  value="CR">COSTA RICA</option>
												 										<option myCCode="385"  myTag="CROATIA"  value="HR">CROATIA</option>
												 										<option myCCode="53"  myTag="CUBA"  value="CU">CUBA</option>
												 										<option myCCode="357"  myTag="CYPRUS"  value="CY">CYPRUS</option>
												 										<option myCCode="45"  myTag="DENMARK"  value="DK">DENMARK</option>
												 										<option myCCode="253"  myTag="DJIBOUTI"  value="DJ">DJIBOUTI</option>
												 										<option myCCode="1767"  myTag="DOMINICA"  value="DM">DOMINICA</option>
												 										<option myCCode="1809"  myTag="DOMINICAN REPUBLIC"  value="DO">DOMINICAN REPUBLIC</option>
												 										<option myCCode="670"  myTag="EAST TIMOR"  value="TL">EAST TIMOR</option>
												 										<option myCCode="593"  myTag="ECUADOR"  value="EC">ECUADOR</option>
												 										<option myCCode="20"  myTag="EGYPT"  value="EG">EGYPT</option>
												 										<option myCCode="503"  myTag="EL SALVADOR"  value="SV">EL SALVADOR</option>
												 										<option myCCode="240"  myTag="EQUATORIAL GUINEA"  value="GQ">EQUATORIAL GUINEA</option>
												 										<option myCCode="291"  myTag="ERITREA"  value="ER">ERITREA</option>
												 										<option myCCode="591"  myTag="ESTADO PLURINACIONAL DE BOLIVIA"  value="BO">ESTADO PLURINACIONAL DE BOLIVIA</option>
												 										<option myCCode="372"  myTag="ESTONIA"  value="EE">ESTONIA</option>
												 										<option myCCode="251"  myTag="ETHIOPIA"  value="ET">ETHIOPIA</option>
												 										<option myCCode="500"  myTag="FALKLAND ISLANDS"  value="FK">FALKLAND ISLANDS</option>
												 										<option myCCode="298"  myTag="Faroe Islands"  value="FO">Faroe Islands</option>
												 										<option myCCode="679"  myTag="FIJI"  value="FJ">FIJI</option>
												 										<option myCCode="358"  myTag="FINLAND"  value="FI">FINLAND</option>
												 										<option myCCode="33"  myTag="FRANCE"  value="FR">FRANCE</option>
												 										<option myCCode="594"  myTag="FRENCH GUIANA"  value="GF">FRENCH GUIANA</option>
												 										<option myCCode="689"  myTag="FRENCH POLYNESIA"  value="PF">FRENCH POLYNESIA</option>
												 										<option myCCode="241"  myTag="GABON"  value="GA">GABON</option>
												 										<option myCCode="220"  myTag="GAMBIA"  value="GM">GAMBIA</option>
												 										<option myCCode="995"  myTag="GEORGIA"  value="GE">GEORGIA</option>
												 										<option myCCode="49"  myTag="GERMANY"  value="DE">GERMANY</option>
												 										<option myCCode="350"  myTag="GIBRALTAR"  value="GI">GIBRALTAR</option>
												 										<option myCCode="30"  myTag="GREECE"  value="GR">GREECE</option>
												 										<option myCCode="299"  myTag="GREENLAND"  value="GL">GREENLAND</option>
												 										<option myCCode="1473"  myTag="GRENADA"  value="GD">GRENADA</option>
												 										<option myCCode="590"  myTag="Guadeloupe"  value="GP">Guadeloupe</option>
												 										<option myCCode="671"  myTag="GUAM"  value="GU">GUAM</option>
												 										<option myCCode="502"  myTag="GUATEMALA"  value="GT">GUATEMALA</option>
												 										<option myCCode="44"  myTag="GUERNSEY"  value="GG">GUERNSEY</option>
												 										<option myCCode="224"  myTag="GUINEA"  value="GN">GUINEA</option>
												 										<option myCCode="245"  myTag="GUINEA BISSAU"  value="GW">GUINEA BISSAU</option>
												 										<option myCCode="592"  myTag="GUYANA"  value="GY">GUYANA</option>
												 										<option myCCode="509"  myTag="HAITI"  value="HT">HAITI</option>
												 										<option myCCode="379"  myTag="HOLY SEE"  value="VA">HOLY SEE</option>
												 										<option myCCode="504"  myTag="HONDURAS"  value="HN">HONDURAS</option>
												 										<option myCCode="852"  myTag="HONG KONG"  value="HK">HONG KONG</option>
												 										<option myCCode="36"  myTag="HUNGARY"  value="HU">HUNGARY</option>
												 										<option myCCode="354"  myTag="ICELAND"  value="IS">ICELAND</option>
												 										<option myCCode="IND"  myTag="INDIA"  value="IN">INDIA</option>
												 										<option myCCode="62"  myTag="INDONESIA"  value="ID">INDONESIA</option>
												 										<option myCCode="964"  myTag="IRAQ"  value="IQ">IRAQ</option>
												 										<option myCCode="353"  myTag="IRELAND"  value="IE">IRELAND</option>
												 										<option myCCode="44"  myTag="Isle of Man"  value="IM">Isle of Man</option>
												 										<option myCCode="972"  myTag="ISRAEL"  value="IL">ISRAEL</option>
												 										<option myCCode="39"  myTag="ITALY"  value="IT">ITALY</option>
												 										<option myCCode="225"  myTag="IVORY COAST"  value="CV">IVORY COAST</option>
												 										<option myCCode="1876"  myTag="JAMAICA"  value="JM">JAMAICA</option>
												 										<option myCCode="81"  myTag="JAPAN"  value="JP">JAPAN</option>
												 										<option myCCode="44"  myTag="JERSEY"  value="JE">JERSEY</option>
												 										<option myCCode="962"  myTag="JORDAN"  value="JO">JORDAN</option>
												 										<option myCCode="77"  myTag="KAZAKHSTAN"  value="KZ">KAZAKHSTAN</option>
												 										<option myCCode="254"  myTag="KENYA"  value="KE">KENYA</option>
												 										<option myCCode="686"  myTag="KIRIBATI"  value="KI">KIRIBATI</option>
												 										<option myCCode="381"  myTag="KOSOVO"  value="XK">KOSOVO</option>
												 										<option myCCode="82"  myTag="KOREA"  value="KR">South Korea</option>
												 										
												 										<option myCCode="965"  myTag="KUWAIT"  value="KW">KUWAIT</option>
												 										<option myCCode="996"  myTag="KYRGYZSTAN"  value="KG">KYRGYZSTAN</option>
												 										<option myCCode="371"  myTag="LATVIA"  value="LV">LATVIA</option>
												 										<option myCCode="961"  myTag="LEBANON"  value="LB">LEBANON</option>
												 										<option myCCode="266"  myTag="LESOTHO"  value="LS">LESOTHO</option>
												 										<option myCCode="231"  myTag="LIBERIA"  value="LR">LIBERIA</option>
												 										<option myCCode="218"  myTag="LIBYA"  value="LY">LIBYA</option>
												 										<option myCCode="423"  myTag="LIECHTENSTEIN"  value="LI">LIECHTENSTEIN</option>
												 										<option myCCode="370"  myTag="LITHUANIA"  value="LT">LITHUANIA</option>
												 										<option myCCode="352"  myTag="LUXEMBOURG"  value="LU">LUXEMBOURG</option>
												 										<option myCCode="853"  myTag="MACAO"  value="MO">MACAO</option>
												 										<option myCCode="389"  myTag="MACEDONIA"  value="MK">MACEDONIA</option>
												 										<option myCCode="261"  myTag="MADAGASCAR"  value="MG">MADAGASCAR</option>
												 										<option myCCode="265"  myTag="MALAWI"  value="MW">MALAWI</option>
												 										<option myCCode="60"  myTag="MALAYSIA"  value="MY">MALAYSIA</option>
												 										<option myCCode="960"  myTag="MALDIVES"  value="MV">MALDIVES</option>
												 										<option myCCode="223"  myTag="MALI"  value="ML">MALI</option>
												 										<option myCCode="692"  myTag="MARSHALL ISLANDS"  value="MH">MARSHALL ISLANDS</option>
												 										<option myCCode="596"  myTag="MARTINIQUE"  value="MQ">MARTINIQUE</option>
												 										<option myCCode="230"  myTag="Mauritius"  value="MU">Mauritius</option>
												 										<option myCCode="222"  myTag="MAURITANIA"  value="MR">MAURITANIA</option>
												 										<option myCCode="262"  myTag="MAYOTTE"  value="YT">MAYOTTE</option>
												 										<option myCCode="691"  myTag="MICRONESIA"  value="FM">MICRONESIA</option>
												 										<option myCCode="373"  myTag="MOLDOVA"  value="MD">MOLDOVA</option>
												 										<option myCCode="377"  myTag="MONACO"  value="MC">MONACO</option>
												 										<option myCCode="976"  myTag="MONGOLIA"  value="MN">MONGOLIA</option>
												 										<option myCCode="382"  myTag="MONTENEGRO"  value="ME">MONTENEGRO</option>
												 										<option myCCode="1664"  myTag="MONTSERRAT"  value="MS">MONTSERRAT</option>
												 										<option myCCode="212"  myTag="MOROCCO"  value="MA">MOROCCO</option>
												 										<option myCCode="258"  myTag="MOZAMBIQUE"  value="MZ">MOZAMBIQUE</option>
												 										<option myCCode="95"  myTag="MYANMAR"  value="MM">MYANMAR</option>
												 										<option myCCode="264"  myTag="NAMIBIA"  value="NA">NAMIBIA</option>
												 										<option myCCode="674"  myTag="NAURU"  value="NR">NAURU</option>
												 										<option myCCode="977"  myTag="NEPAL"  value="NP">NEPAL</option>
												 										<option myCCode="599"  myTag="NETHERLANDS"  value="NL">NETHERLANDS</option>
												 										<option myCCode="31"  myTag="NETHERLANDS ANTILLES"  value="AN">NETHERLANDS ANTILLES</option>
												 										<option myCCode="687"  myTag="NEW CALEDONIA"  value="NC">NEW CALEDONIA</option>
												 										<option myCCode="64"  myTag="NEW ZEALAND"  value="NZ">NEW ZEALAND</option>
												 										<option myCCode="505"  myTag="NICARAGUA"  value="NI">NICARAGUA</option>
												 										<option myCCode="227"  myTag="NIGER"  value="NE">NIGER</option>
												 										<option myCCode="234"  myTag="NIGERIA"  value="NG">NIGERIA</option>
												 										<option myCCode="683"  myTag="NIUE"  value="NU">NIUE</option>
												 										<option myCCode="672"  myTag="NORFOLK ISLAND"  value="NF">NORFOLK ISLAND</option>
												 										<option myCCode="670"  myTag="NORTHERN MARIANA"  value="MP">NORTHERN MARIANA</option>
												 										<option myCCode="47"  myTag="NORWAY"  value="NO">NORWAY</option>
												 										<option myCCode="968"  myTag="OMAN"  value="OM">OMAN</option>
												 										<option myCCode="680"  myTag="PALAU"  value="PW">PALAU</option>
												 										<option myCCode="970"  myTag="Palestinian Territory"  value="PS">Palestinian Territory</option>
												 										<option myCCode="507"  myTag="PANAMA"  value="PA">PANAMA</option>
												 										<option myCCode="675"  myTag="PAPUA NEW GUINEA"  value="PG">PAPUA NEW GUINEA</option>
												 										<option myCCode="595"  myTag="PARAGUAY"  value="PY">PARAGUAY</option>
												 										<option myCCode="51"  myTag="PERU"  value="PE">PERU</option>
												 										<option myCCode="63"  myTag="PHILIPPINES"  value="PH">PHILIPPINES</option>
												 										<option myCCode="48"  myTag="POLAND"  value="PL">POLAND</option>
												 										<option myCCode="351"  myTag="PORTUGAL"  value="PT">PORTUGAL</option>
												 										<option myCCode="787"  myTag="PUERTO RICO"  value="PR">PUERTO RICO</option>
																		                                <option myCCode="974"  myTag="QATAR"  value="QA">QATAR</option>
												 										<option myCCode="40"  myTag="ROMANIA"  value="RO">ROMANIA</option>
												 										<option myCCode="7"  myTag="RUSSIA"  value="RU">RUSSIA</option>
												 										<option myCCode="250"  myTag="RWANDA"  value="RW">RWANDA</option>
												 										<option myCCode="685"  myTag="SAMOA"  value="WS">SAMOA</option>
												 										<option myCCode="378"  myTag="SAN MARINO"  value="SM">SAN MARINO</option>
												 										<option myCCode="239"  myTag="SAO TOME AND PRINCIPE"  value="ST">SAO TOME AND PRINCIPE</option>
												 										<option myCCode="966"  myTag="SAUDI ARABIA"  value="SA">SAUDI ARABIA</option>
												 										<option myCCode="221"  myTag="SENEGAL"  value="SN">SENEGAL</option>
												 										<option myCCode="381"  myTag="SERBIA"  value="RS">SERBIA</option>
												 										<option myCCode="248"  myTag="SEYCHELLES"  value="SC">SEYCHELLES</option>
												 										<option myCCode="232"  myTag="SIERRA LEONE"  value="SL">SIERRA LEONE</option>
												 										<option myCCode="65"  myTag="SINGAPORE"  value="SG">SINGAPORE</option>
												 										<option myCCode=""  myTag="Saint-Martin"  value="MF">Saint-Martin</option>
												 										<option myCCode="421"  myTag="SLOVAKIA"  value="SK">SLOVAKIA</option>
												 										<option myCCode="386"  myTag="SLOVENIA"  value="SI">SLOVENIA</option>
												 										<option myCCode="677"  myTag="SOLOMON ISLANDS"  value="SB">SOLOMON ISLANDS</option>
												 										<option myCCode="252"  myTag="SOMALIA"  value="SO">SOMALIA</option>
												 										<option myCCode="27"  myTag="SOUTH AFRICA"  value="ZA">SOUTH AFRICA</option>
												 										<option myCCode="34"  myTag="SPAIN"  value="ES">SPAIN</option>
												 										<option myCCode="94"  myTag="SRI LANKA"  value="LK">SRI LANKA</option>
												 										<option myCCode="1869"  myTag="ST KITTS AND NEVIS"  value="KN">ST KITTS AND NEVIS</option>
												 										<option myCCode="1784"  myTag="ST VINCENT AND GRENADINES"  value="VC">ST VINCENT AND GRENADINES</option>
												 										<option myCCode="249"  myTag="SUDAN"  value="SD">SUDAN</option>
												 										<option myCCode="597"  myTag="SURINAME"  value="SR">SURINAME</option>
												 									        <option myCCode="47"  myTag="SVALBARD"  value="SJ">SVALBARD</option>
												 										<option myCCode="268"  myTag="SWAZILAND"  value="SWZ"></option>
												 										<option myCCode="46"  myTag="SWEDEN"  value="SWE">SWEDEN</option>
												 										<option myCCode="41"  myTag="SWITZERLAND"  value="CH">SWITZERLAND</option>
												 										<option myCCode="963"  myTag="SYRIA"  value="SY">SYRIA</option>
												 										<option myCCode="886"  myTag="TAIWAN"  value="TW">TAIWAN</option>
												 										<option myCCode="992"  myTag="TAJIKISTAN"  value="TJ">TAJIKISTAN</option>
												 										<option myCCode="255"  myTag="TANZANIA"  value="TZ">TANZANIA</option>
												 										<option myCCode="66"  myTag="THAILAND"  value="TH">THAILAND</option>
												 										<option myCCode="670"  myTag="Timor-Leste"  value="TL">Timor-Leste</option>
												 										<option myCCode="228"  myTag="TOGO"  value="TG">TOGO</option>
												 										<option myCCode="690"  myTag="TOKELAU"  value="TK">TOKELAU</option>
												 										<option myCCode="676"  myTag="TONGA"  value="TO">TONGA</option>
												 										<option myCCode="1868"  myTag="TRINIDAD AND TOBAGO"  value="TT">TRINIDAD AND TOBAGO</option>
												 										<option myCCode="216"  myTag="TUNISIA"  value="TN">TUNISIA</option>
												 										<option myCCode="90"  myTag="TURKEY"  value="TR">TURKEY</option>
												 										<option myCCode="993"  myTag="TURKMENISTAN"  value="TM">TURKMENISTAN</option>
												 										<option myCCode="1649"  myTag="TURKS AND CAICOS"  value="TC">TURKS AND CAICOS</option>
												 										<option myCCode="688"  myTag="TUVALU"  value="TV">TUVALU</option>
												 										<option myCCode="256"  myTag="UGANDA"  value="UG">UGANDA</option>
												 										<option myCCode="380"  myTag="UKRAINE"  value="UA">UKRAINE</option>
												 										<option myCCode="971"  myTag="UNITED ARAB EMIRATES"  value="AE">UNITED ARAB EMIRATES</option>
												 										<option myCCode="44"  myTag="UNITED KINGDOM"  value="GB">UNITED KINGDOM</option>
												 										<option myCCode="598"  myTag="URUGUAY"  value="UY">URUGUAY</option>
												 										<option myCCode="998"  myTag="UZBEKISTAN"  value="UZ">UZBEKISTAN</option>
												 										<option myCCode="678"  myTag="VANUATU"  value="VU">VANUATU</option>
												 										<option myCCode="58"  myTag="VENEZUELA"  value="VE">VENEZUELA</option>
												 										<option myCCode="84"  myTag="VIETNAM"  value="VN">VIETNAM</option>
												 										<option myCCode="1340"  myTag="VIRGIN ISLANDS"  value="VG">VIRGIN ISLANDS</option>
												 										<option myCCode="681"  myTag="WALLIS AND FUTUNA"  value="WF">WALLIS AND FUTUNA</option>
												 										<option myCCode="212"  myTag="WESTERN SAHARA"  value="EH">WESTERN SAHARA</option>
												 										<option myCCode="38"  myTag="YUGOSLAVIA"  value="YG">YUGOSLAVIA</option>
												 										<option myCCode="260"  myTag="ZAMBIA"  value="ZM">ZAMBIA</option>
                    
                    </select>
                  </div>
                  <div class="form-group">
                    <label class="control-label">Zipcode</label>
                    <input type="text" id="postalnew"  onkeypress="return ((event.charCode > 64 &amp;&amp; event.charCode < 91) || (event.charCode > 96 &amp;&amp; event.charCode < 123) || event.charCode == 8 || event.charCode == 32 || (event.charCode >= 48 &amp;&amp; event.charCode <= 57));" maxlength="10"  value="${bpost}" name="billingzip"   class="form-control">
                  </div>
                  <div class="form-group">
                    <label class="control-label">Address Line 1<span>*</span></label>
                    <input type="text"  onkeypress="return ((event.charCode > 64 &amp;&amp; event.charCode < 91) || (event.charCode > 96 &amp;&amp; event.charCode < 123) || event.charCode == 8 || event.charCode == 32 || (event.charCode >= 48 &amp;&amp; event.charCode <= 57));" maxlength="35" required id="addr1new" value="${bline1}" name="billing_address_line_1" class="form-control">
                  </div>
                  <div class="form-group">
                    <label class="control-label">Address Line 2</label>
                    <input type="text"  id="addr2new" value="${bline2}"  onkeypress="return ((event.charCode > 64 &amp;&amp; event.charCode < 91) || (event.charCode > 96 &amp;&amp; event.charCode < 123) || event.charCode == 8 || event.charCode == 32 || (event.charCode >= 48 &amp;&amp; event.charCode <= 57));" maxlength="35" name="billing_address_line_2"  class="form-control">
                  </div>
                 
                  <div class="form-group">
                    <label class="control-label">City<span>*</span></label>
                    <input type="text" required  onkeypress="return ((event.charCode > 64 &amp;&amp; event.charCode < 91) || (event.charCode > 96 &amp;&amp; event.charCode < 123) || event.charCode == 8 || event.charCode == 32 || (event.charCode >= 48 &amp;&amp; event.charCode <= 57));" maxlength="15"  id="citynew" value="${bcity}" name="billing_city"  class="form-control">
                  </div>
                  <div class="form-group">
                    <label class="control-label">State<span>*</span></label>
                    <input type="text"   onkeypress="return ((event.charCode > 64 &amp;&amp; event.charCode < 91) || (event.charCode > 96 &amp;&amp; event.charCode < 123) || event.charCode == 8 || event.charCode == 32 || (event.charCode >= 48 &amp;&amp; event.charCode <= 57));" maxlength="15"  required name="billing_state" id="statenew"  value="${bstate}" class="form-control">
                  </div>
                  
                  <div class="addCustSubmitBtn">
                    <button type="submit" class="blueButton">Submit</button>
                  </div>
            	<div class="clearfix"></div>
            </div>
         </form>
    
      </div>
      <!-- Add Customer Page Ends -->
    </div>
    <!------ Right Main Section Ends ------>
    <div class="clearfix"></div>
  </div>
</div>
<script src="resources/jquery-3.5.0.js"></script>
<script src="resources/nisg/js/bootstrap-min.js"></script>
<script src="resources/nisg/js/jquery-ui.js"></script>  
<script src="resources/nisg/js/customv6.js"></script>
<script src="resources/smtp.js"></script>

 <script src="resources/assets/scripts/completesuccess1.js"></script>
<script data-jsd-embedded data-key="44b1c426-6068-44f1-b503-c84acbcd1bae" data-base-url="https://jsd-widget.atlassian.com" src="https://jsd-widget.atlassian.com/assets/embed.js"></script>      
 	<script src="resources/sweetalert.min.js"></script>
</body>
</html>