package com.example.model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EntityListeners;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
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
@Table(name = "reviews")
@EntityListeners(AuditingEntityListener.class)
public class Review implements Serializable {

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
	
	@NotBlank(message = "{notblank.review}")
	@Column(name = "review")
	private String review;
	
	@Column(name = "star")
	private int star = 5;
	
	@Column(name = "avatar")
	private String avatar = "noImageAvata.png";
	
	@CreatedDate
	@Column(name = "created_date", nullable = false, updatable = false)
	@Temporal(TemporalType.TIMESTAMP)
	private Date createdDate;
	
	@LastModifiedDate
	@Column(name = "last_modified_date")
	@Temporal(TemporalType.TIMESTAMP)
	private Date lastModifiedDate;
	
	@ManyToOne
	@JoinColumn(name = "id_product")
	private Product product;

	public Review() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Review(String id, @Size(min = 5, message = "{size.fullName}") String fullName,
			@Email(message = "{email.email}") @NotBlank(message = "{notblank.email}") String email,
			@NotBlank(message = "{notblank.review}") String review, int star, String avatar, Date createdDate,
			Date lastModifiedDate, Product product) {
		super();
		this.id = id;
		this.fullName = fullName;
		this.email = email;
		this.review = review;
		this.star = star;
		this.avatar = avatar;
		this.createdDate = createdDate;
		this.lastModifiedDate = lastModifiedDate;
		this.product = product;
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

	public String getReview() {
		return review;
	}

	public void setReview(String review) {
		this.review = review;
	}

	public int getStar() {
		return star;
	}

	public void setStar(int star) {
		this.star = star;
	}

	public String getAvatar() {
		return avatar;
	}

	public void setAvatar(String avatar) {
		this.avatar = avatar;
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

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	
}
