package com.example.dto;

import javax.validation.constraints.NotBlank;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
public class ConfirmPassword {
	
	private String code;

	@NotBlank(message = "{notblank.password}")
	private String password;

	@NotBlank(message = "{notblank.password}")
	private String passwordAgain;

	public ConfirmPassword() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ConfirmPassword(String code, @NotBlank(message = "{notblank.password}") String password,
			@NotBlank(message = "{notblank.password}") String passwordAgain) {
		super();
		this.code = code;
		this.password = password;
		this.passwordAgain = passwordAgain;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getPasswordAgain() {
		return passwordAgain;
	}

	public void setPasswordAgain(String passwordAgain) {
		this.passwordAgain = passwordAgain;
	}
	
	
}
