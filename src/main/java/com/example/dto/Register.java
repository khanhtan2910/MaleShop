package com.example.dto;

import java.util.Date;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;

import com.example.validator.BirthDay;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
public class Register {
	@Size(min = 5, message = "{size.fullName}")
	@NotBlank(message = "{notblank.fullName}")
	private String fullName;

	@Email(message = "{email.email}")
	@NotBlank(message = "{notblank.email}")
	private String email;

	@NotBlank(message = "{notblank.password}")
	private String password;

	@NotBlank(message = "{notblank.password}")
	private String passwordAgain;

	@BirthDay
	@DateTimeFormat(iso = ISO.DATE)
	private Date birthDay;

	public Register() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Register(
			@Size(min = 5, message = "{size.fullName}") @NotBlank(message = "{notblank.fullName}") String fullName,
			@Email(message = "{email.email}") @NotBlank(message = "{notblank.email}") String email,
			@NotBlank(message = "{notblank.password}") String password,
			@NotBlank(message = "{notblank.password}") String passwordAgain, Date birthDay) {
		super();
		this.fullName = fullName;
		this.email = email;
		this.password = password;
		this.passwordAgain = passwordAgain;
		this.birthDay = birthDay;
	}

	public String getFullName() {
		return fullName;
	}

	public void setFullName(String fullName) {
		this.fullName = fullName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
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

	public Date getBirthDay() {
		return birthDay;
	}

	public void setBirthDay(Date birthDay) {
		this.birthDay = birthDay;
	}
	
	
}
