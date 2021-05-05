<style type="text/css">
body{background:<%=session.getAttribute("colour")%>;}
.customBtn:hover{background:<%=session.getAttribute("colour")%>;}
.customBtn{background: <%=session.getAttribute("colour")%>;}
.customDateRange{background: <%=session.getAttribute("colour")%>;}
.customOutlineBtn{border:1px solid <%=session.getAttribute("colour")%>;color:<%=session.getAttribute("colour")%>;}
.swal-button{background-color:<%=session.getAttribute("colour")%>;}
.yourCardsSection .headingSection p a{border:1px solid <%=session.getAttribute("colour")%>;}
.customBtn:focus{background:<%=session.getAttribute("colour")%>;}
.customBtn:hover{background:<%=session.getAttribute("btncolour")%>;}
.customPaginationSection{border-top:1px solid <%=session.getAttribute("colour")%>; border-bottom:1px solid <%=session.getAttribute("colour")%>;}
a.customLink{color:<%=session.getAttribute("colour")%>;}
.customOutlineBtn:hover{border:1px solid <%=session.getAttribute("colour")%>;}
.daterangepicker td.active, .daterangepicker td.active:hover {background-color: <%=session.getAttribute("colour")%>;}
.daterangepicker .ranges li.active {background-color: <%=session.getAttribute("colour")%> ;}
.daterangepicker .drp-buttons button.applyBtn.btn.btn-sm.btn-primary{background: <%=session.getAttribute("colour")%> ;border: 1px solid <%=session.getAttribute("colour")%> ;}
.navigationMenu ul li a:hover{color:#f9cff9; text-decoration:none; background:none; border-radius:0;}
.navigationMenu ul li.active{background:#fff; border-radius:22px 0 0 22px;}
.navigationMenu ul li.active a{color:<%=session.getAttribute("colour")%>; width:100%;}
.daterangepicker .drp-selected {color: <%=session.getAttribute("colour")%>;}
.dashBalance p a:hover{background:<%=session.getAttribute("colour")%>;}
.dashBalance p a{border:1px solid <%=session.getAttribute("colour")%>; color:<%=session.getAttribute("colour")%>;}
.blueButton{background:<%=session.getAttribute("colour")%>; border:1px solid <%=session.getAttribute("colour")%>; }
.blueButton:hover{background:<%=session.getAttribute("colour")%>; }
.borderButton{border:1px solid <%=session.getAttribute("colour")%>; color:<%=session.getAttribute("colour")%>;}
.userTabBtnSecTop p{ color:<%=session.getAttribute("colour")%>; }
.tabList li.active a{ color:<%=session.getAttribute("colour")%>;}
.dateNpagiCon { border-top: 1px solid <%=session.getAttribute("colour")%>; border-bottom: 1px solid <%=session.getAttribute("colour")%>;}
.dloadSampleLink a{color: <%=session.getAttribute("colour")%>;}
.walletTabLink a{color: <%=session.getAttribute("colour")%>;}

/****** Custom Button Starts ******/
.customBtn{ color:#fff; padding:12px 35px; border-radius:8px; font-size:13px; letter-spacing:0.5px; border:0; display:inline-block; cursor:pointer;}
.customBtn:hover{  border-radius:8px; color:#fff;}
.customBtn:focus{ border-radius:8px; color:#fff;}
.customBtn:disabled,.customBtn[disabled]{background:#D9B2FF; cursor:default;}
/****** Custom Button Ends ******/

</style>
