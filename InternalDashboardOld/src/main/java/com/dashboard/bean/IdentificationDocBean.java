package com.dashboard.bean;

import java.util.List;

public class IdentificationDocBean {
	
String identificationType;

	
	List<IdentificationDocumentBean> identificationDocument;

	public String getIdentificationType() {
		return identificationType;
	}

	public void setIdentificationType(String identificationType) {
		this.identificationType = identificationType;
	}


	public List<IdentificationDocumentBean> getIdentificationDocument() {
		return identificationDocument;
	}

	public void setIdentificationDocument(List<IdentificationDocumentBean> identificationDocument) {
		this.identificationDocument = identificationDocument;
	}



}
