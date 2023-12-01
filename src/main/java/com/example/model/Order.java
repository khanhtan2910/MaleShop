package com.example.model;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EntityListeners;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
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
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;

import com.example.validator.BirthDay;
import com.example.validator.Phone;
import com.example.validator.ZipCode;
import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "orders")
@EntityListeners(AuditingEntityListener.class)
public class Order implements Serializable {

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
	
	@BirthDay
	@DateTimeFormat(iso = ISO.DATE)
	@Column(name = "birth_day")
	private Date birthDay;
	
	@NotBlank(message = "{notblank.addressOrder}")
	@Column(name = "address_order")
	private String addressOrder;
	
	@Phone
	@Column(name = "phone")
	private String phone;
	
	@ZipCode
	@Column(name = "zip")
	private String zip;
	
	@Column(name = "note")
	private String note;
	
	@Column(name = "status")
	private String status;
	
	@Column(name = "pay")
	private String pay;

	@CreatedDate
	@Column(name = "created_date", nullable = false, updatable = false)
	@Temporal(TemporalType.TIMESTAMP)
	private Date createdDate;

	@LastModifiedDate
	@Column(name = "last_modified_date")
	@Temporal(TemporalType.TIMESTAMP)
	private Date lastModifiedDate;
	
	@JsonIgnore
	@OneToMany(mappedBy = "order", cascade = CascadeType.ALL)
	private List<OrderDetail> orderDetails;

	public Order() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Order(String id, @Size(min = 5, message = "{size.fullName}") String fullName,
			@Email(message = "{email.email}") @NotBlank(message = "{notblank.email}") String email, Date birthDay,
			@NotBlank(message = "{notblank.addressOrder}") String addressOrder, String phone, String zip, String note,
			String status, String pay, Date createdDate, Date lastModifiedDate, List<OrderDetail> orderDetails) {
		super();
		this.id = id;
		this.fullName = fullName;
		this.email = email;
		this.birthDay = birthDay;
		this.addressOrder = addressOrder;
		this.phone = phone;
		this.zip = zip;
		this.note = note;
		this.status = status;
		this.pay = pay;
		this.createdDate = createdDate;
		this.lastModifiedDate = lastModifiedDate;
		this.orderDetails = orderDetails;
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

	public Date getBirthDay() {
		return birthDay;
	}

	public void setBirthDay(Date birthDay) {
		this.birthDay = birthDay;
	}

	public String getAddressOrder() {
		return addressOrder;
	}

	public void setAddressOrder(String addressOrder) {
		this.addressOrder = addressOrder;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getZip() {
		return zip;
	}

	public void setZip(String zip) {
		this.zip = zip;
	}

	public String getNote() {
		return note;
	}

	public void setNote(String note) {
		this.note = note;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getPay() {
		return pay;
	}

	public void setPay(String pay) {
		this.pay = pay;
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

	public List<OrderDetail> getOrderDetails() {
		return orderDetails;
	}

	public void setOrderDetails(List<OrderDetail> orderDetails) {
		this.orderDetails = orderDetails;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	
}
