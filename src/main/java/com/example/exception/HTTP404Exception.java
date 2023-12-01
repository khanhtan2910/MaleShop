package com.example.exception;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ResponseStatus;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
@ResponseStatus(value = HttpStatus.NOT_FOUND, reason = "Not Found")
public class HTTP404Exception extends RuntimeException {

	private static final long serialVersionUID = 1L;

	private String errorMessage;

	private String errorCode;

	public HTTP404Exception() {
		super();
		// TODO Auto-generated constructor stub
	}

	public HTTP404Exception(String message, Throwable cause, boolean enableSuppression, boolean writableStackTrace) {
		super(message, cause, enableSuppression, writableStackTrace);
		// TODO Auto-generated constructor stub
	}

	public HTTP404Exception(String message, Throwable cause) {
		super(message, cause);
		// TODO Auto-generated constructor stub
	}

	public HTTP404Exception(String message) {
		super(message);
		// TODO Auto-generated constructor stub
	}

	public HTTP404Exception(Throwable cause) {
		super(cause);
		// TODO Auto-generated constructor stub
	}

	public HTTP404Exception(String errorMessage, String errorCode) {
		super();
		this.errorMessage = errorMessage;
		this.errorCode = errorCode;
	}

	public String getErrorMessage() {
		return errorMessage;
	}

	public void setErrorMessage(String errorMessage) {
		this.errorMessage = errorMessage;
	}

	public String getErrorCode() {
		return errorCode;
	}

	public void setErrorCode(String errorCode) {
		this.errorCode = errorCode;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	
}
