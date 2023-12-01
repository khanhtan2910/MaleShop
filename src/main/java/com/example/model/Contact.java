package com.example.model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EntityListeners;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.Parameter;
import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.annotation.LastModifiedDate;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "contacts")
@EntityListeners(AuditingEntityListener.class)
public class Contact implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(generator = "UUID")
	@GenericGenerator(name = "UUID", strategy = "org.hibernate.id.UUIDGenerator", parameters = {
			@Parameter(name = "uuid_gen_strategy_class", value = "org.hibernate.id.uuid.CustomVersionOneStrategy") })
	@Column(name = "id")
	private String id;

	@Size(min = 5, message = "{size.fullName}")
	@Column(name = "full_name")
	private String fullName;

	@Email(message = "{email.email}")
	@NotBlank(message = "{notblank.email}")
	@Column(name = "email")
	private String email;

	@NotBlank(message = "{notblank.subject}")
	@Column(name = "subject")
	private String subject;

	@NotBlank(message = "{notblank.message}")
	@Column(name = "message")
	private String message;

	@Column(name = "confirm")
	private boolean confirm = false;

	@CreatedDate
	@Column(name = "created_date", nullable = false, updatable = false)
	@Temporal(TemporalType.TIMESTAMP)
	private Date createdDate;

	@LastModifiedDate
	@Column(name = "last_modified_date")
	@Temporal(TemporalType.TIMESTAMP)
	private Date lastModifiedDate;

	public Contact() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Contact(String id, @Size(min = 5, message = "{size.fullName}") String fullName,
			@Email(message = "{email.email}") @NotBlank(message = "{notblank.email}") String email,
			@NotBlank(message = "{notblank.subject}") String subject,
			@NotBlank(message = "{notblank.message}") String message, boolean confirm, Date createdDate,
			Date lastModifiedDate) {
		super();
		this.id = id;
		this.fullName = fullName;
		this.email = email;
		this.subject = subject;
		this.message = message;
		this.confirm = confirm;
		this.createdDate = createdDate;
		this.lastModifiedDate = lastModifiedDate;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
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

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public boolean isConfirm() {
		return confirm;
	}

	public void setConfirm(boolean confirm) {
		this.confirm = confirm;
	}

	public Date getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}

	public Date getLastModifiedDate() {
		return lastModifiedDate;
	}

	public void setLastModifiedDate(Date lastModifiedDate) {
		this.lastModifiedDate = lastModifiedDate;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	
}
