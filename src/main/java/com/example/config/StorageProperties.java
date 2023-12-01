package com.example.config;

import org.springframework.boot.context.properties.ConfigurationProperties;

import lombok.Data;

@ConfigurationProperties("storage")
@Data
public class StorageProperties {
	private String location;

	public StorageProperties() {
		super();
		// TODO Auto-generated constructor stub
	}

	public StorageProperties(String location) {
		super();
		this.location = location;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	
}
