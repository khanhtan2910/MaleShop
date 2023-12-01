package com.example.dto;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
public class Login {
	@Email(message = "{email.email}")
	@NotBlank(message = "{notblank.email}")
	private String email;

	@NotBlank(message = "{notblank.password}")
	private String password;

	public Login() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Login(@Email(message = "{email.email}") @NotBlank(message = "{notblank.email}") String email,
			@NotBlank(message = "{notblank.password}") String password) {
		super();
		this.email = email;
		this.password = password;
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
	
	
}
