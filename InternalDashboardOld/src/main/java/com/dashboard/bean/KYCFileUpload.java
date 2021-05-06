package com.dashboard.bean;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class KYCFileUpload {
	
	private List<MultipartFile> files;
String idType1;
String idnumber;

	public String getIdnumber() {
	return idnumber;
}

public void setIdnumber(String idnumber) {
	this.idnumber = idnumber;
}

	public List<MultipartFile> getFiles() {
		return files;
	}

	public void setFiles(List<MultipartFile> files) {
		this.files = files;
	}
	
	@Override
    public String toString()
    {
        return "Files [files=" + files + "]";
    }

	public String getIdType1() {
		return idType1;
	}

	public void setIdType1(String idType1) {
		this.idType1 = idType1;
	}

}
