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
@Table(name = "users")
@EntityListeners(AuditingEntityListener.class)
public class User implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(generator = "UUID")
	@GenericGenerator(name = "UUID", strategy = "org.hibernate.id.UUIDGenerator", parameters = {
			@Parameter(name = "uuid_gen_strategy_class", value = "org.hibernate.id.uuid.CustomVersionOneStrategy") })
	@Column(name = "id")
	private String id;

	@Email(message = "{email.email}")
	@NotBlank(message = "{notblank.email}")
	@Column(name = "email")
	private String email;

	@Column(name = "password")
	private String password = "MaleOnlineShopping@";

	@Size(min = 5, message = "{size.fullName}")
	@Column(name = "full_name")
	private String fullName;

	@BirthDay
	@DateTimeFormat(iso = ISO.DATE)
	@Column(name = "birth_day")
	private Date birthDay;

	@Column(name = "address")
	private String address = null;
	
	@Column(name = "address_order")
	private String addressOrder = null;

	@Column(name = "gender")
	private boolean gender = false;

	@Column(name = "role")
	private boolean role = false;

	@Column(name = "login")
	private boolean login = true;

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

	@Column(name = "last_login_date")
	@Temporal(TemporalType.TIMESTAMP)
	private Date lastLoginDate = new Date();

	@JsonIgnore
	@OneToMany(mappedBy = "createdBy", cascade = CascadeType.ALL)
	private List<Brand> brandCreatedBy;

	@JsonIgnore
	@OneToMany(mappedBy = "lastModifiedBy", cascade = CascadeType.ALL)
	private List<Brand> brandLastModifiedBy;

	@JsonIgnore
	@OneToMany(mappedBy = "createdBy", cascade = CascadeType.ALL)
	private List<CategoryBlog> categoryBlogCreatedBy;

	@JsonIgnore
	@OneToMany(mappedBy = "lastModifiedBy", cascade = CascadeType.ALL)
	private List<CategoryBlog> categoryBlogLastModifiedBy;

	@JsonIgnore
	@OneToMany(mappedBy = "createdBy", cascade = CascadeType.ALL)
	private List<CategoryProduct> categoryProductCreatedBy;

	@JsonIgnore
	@OneToMany(mappedBy = "lastModifiedBy", cascade = CascadeType.ALL)
	private List<CategoryProduct> categoryProductLastModifiedBy;

	@JsonIgnore
	@OneToMany(mappedBy = "createdBy", cascade = CascadeType.ALL)
	private List<Color> colorCreatedBy;

	@JsonIgnore
	@OneToMany(mappedBy = "lastModifiedBy", cascade = CascadeType.ALL)
	private List<Color> colorLastModifiedBy;

	@JsonIgnore
	@OneToMany(mappedBy = "createdBy", cascade = CascadeType.ALL)
	private List<Product> productCreatedBy;

	@JsonIgnore
	@OneToMany(mappedBy = "lastModifiedBy", cascade = CascadeType.ALL)
	private List<Product> productLastModifiedBy;
	
	@JsonIgnore
	@OneToMany(mappedBy = "user", cascade = CascadeType.ALL)
	private List<Like> likes;

	public User() {
		super();
		// TODO Auto-generated constructor stub
	}

	public User(String id, @Email(message = "{email.email}") @NotBlank(message = "{notblank.email}") String email,
			String password, @Size(min = 5, message = "{size.fullName}") String fullName, Date birthDay, String address,
			String addressOrder, boolean gender, boolean role, boolean login, String avatar, Date createdDate,
			Date lastModifiedDate, Date lastLoginDate, List<Brand> brandCreatedBy, List<Brand> brandLastModifiedBy,
			List<CategoryBlog> categoryBlogCreatedBy, List<CategoryBlog> categoryBlogLastModifiedBy,
			List<CategoryProduct> categoryProductCreatedBy, List<CategoryProduct> categoryProductLastModifiedBy,
			List<Color> colorCreatedBy, List<Color> colorLastModifiedBy, List<Product> productCreatedBy,
			List<Product> productLastModifiedBy, List<Like> likes) {
		super();
		this.id = id;
		this.email = email;
		this.password = password;
		this.fullName = fullName;
		this.birthDay = birthDay;
		this.address = address;
		this.addressOrder = addressOrder;
		this.gender = gender;
		this.role = role;
		this.login = login;
		this.avatar = avatar;
		this.createdDate = createdDate;
		this.lastModifiedDate = lastModifiedDate;
		this.lastLoginDate = lastLoginDate;
		this.brandCreatedBy = brandCreatedBy;
		this.brandLastModifiedBy = brandLastModifiedBy;
		this.categoryBlogCreatedBy = categoryBlogCreatedBy;
		this.categoryBlogLastModifiedBy = categoryBlogLastModifiedBy;
		this.categoryProductCreatedBy = categoryProductCreatedBy;
		this.categoryProductLastModifiedBy = categoryProductLastModifiedBy;
		this.colorCreatedBy = colorCreatedBy;
		this.colorLastModifiedBy = colorLastModifiedBy;
		this.productCreatedBy = productCreatedBy;
		this.productLastModifiedBy = productLastModifiedBy;
		this.likes = likes;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
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

	public String getFullName() {
		return fullName;
	}

	public void setFullName(String fullName) {
		this.fullName = fullName;
	}

	public Date getBirthDay() {
		return birthDay;
	}

	public void setBirthDay(Date birthDay) {
		this.birthDay = birthDay;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getAddressOrder() {
		return addressOrder;
	}

	public void setAddressOrder(String addressOrder) {
		this.addressOrder = addressOrder;
	}

	public boolean isGender() {
		return gender;
	}

	public void setGender(boolean gender) {
		this.gender = gender;
	}

	public boolean isRole() {
		return role;
	}

	public void setRole(boolean role) {
		this.role = role;
	}

	public boolean isLogin() {
		return login;
	}

	public void setLogin(boolean login) {
		this.login = login;
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

	public Date getLastLoginDate() {
		return lastLoginDate;
	}

	public void setLastLoginDate(Date lastLoginDate) {
		this.lastLoginDate = lastLoginDate;
	}

	public List<Brand> getBrandCreatedBy() {
		return brandCreatedBy;
	}

	public void setBrandCreatedBy(List<Brand> brandCreatedBy) {
		this.brandCreatedBy = brandCreatedBy;
	}

	public List<Brand> getBrandLastModifiedBy() {
		return brandLastModifiedBy;
	}

	public void setBrandLastModifiedBy(List<Brand> brandLastModifiedBy) {
		this.brandLastModifiedBy = brandLastModifiedBy;
	}

	public List<CategoryBlog> getCategoryBlogCreatedBy() {
		return categoryBlogCreatedBy;
	}

	public void setCategoryBlogCreatedBy(List<CategoryBlog> categoryBlogCreatedBy) {
		this.categoryBlogCreatedBy = categoryBlogCreatedBy;
	}

	public List<CategoryBlog> getCategoryBlogLastModifiedBy() {
		return categoryBlogLastModifiedBy;
	}

	public void setCategoryBlogLastModifiedBy(List<CategoryBlog> categoryBlogLastModifiedBy) {
		this.categoryBlogLastModifiedBy = categoryBlogLastModifiedBy;
	}

	public List<CategoryProduct> getCategoryProductCreatedBy() {
		return categoryProductCreatedBy;
	}

	public void setCategoryProductCreatedBy(List<CategoryProduct> categoryProductCreatedBy) {
		this.categoryProductCreatedBy = categoryProductCreatedBy;
	}

	public List<CategoryProduct> getCategoryProductLastModifiedBy() {
		return categoryProductLastModifiedBy;
	}

	public void setCategoryProductLastModifiedBy(List<CategoryProduct> categoryProductLastModifiedBy) {
		this.categoryProductLastModifiedBy = categoryProductLastModifiedBy;
	}

	public List<Color> getColorCreatedBy() {
		return colorCreatedBy;
	}

	public void setColorCreatedBy(List<Color> colorCreatedBy) {
		this.colorCreatedBy = colorCreatedBy;
	}

	public List<Color> getColorLastModifiedBy() {
		return colorLastModifiedBy;
	}

	public void setColorLastModifiedBy(List<Color> colorLastModifiedBy) {
		this.colorLastModifiedBy = colorLastModifiedBy;
	}

	public List<Product> getProductCreatedBy() {
		return productCreatedBy;
	}

	public void setProductCreatedBy(List<Product> productCreatedBy) {
		this.productCreatedBy = productCreatedBy;
	}

	public List<Product> getProductLastModifiedBy() {
		return productLastModifiedBy;
	}

	public void setProductLastModifiedBy(List<Product> productLastModifiedBy) {
		this.productLastModifiedBy = productLastModifiedBy;
	}

	public List<Like> getLikes() {
		return likes;
	}

	public void setLikes(List<Like> likes) {
		this.likes = likes;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	
}
