package com.example.model;

import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotBlank;

import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.Parameter;

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
@Table(name = "brands")
public class Brand extends Auditable<User> {
	@Id
	@GeneratedValue(generator = "UUID")
	@GenericGenerator(name = "UUID", strategy = "org.hibernate.id.UUIDGenerator", parameters = {
			@Parameter(name = "uuid_gen_strategy_class", value = "org.hibernate.id.uuid.CustomVersionOneStrategy") })
	@Column(name = "id")
	private String id;

	@NotBlank(message = "{notblank.name}")
	@Column(name = "name")
	private String name;

	@JsonIgnore
	@OneToMany(mappedBy = "brand", cascade = CascadeType.ALL)
	private List<Product> products;

	public Brand() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Brand(User createdBy, Date createdDate, User lastModifiedBy, Date lastModifiedDate) {
		super(createdBy, createdDate, lastModifiedBy, lastModifiedDate);
		// TODO Auto-generated constructor stub
	}

	public Brand(String id, @NotBlank(message = "{notblank.name}") String name, List<Product> products) {
		super();
		this.id = id;
		this.name = name;
		this.products = products;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public List<Product> getProducts() {
		return products;
	}

	public void setProducts(List<Product> products) {
		this.products = products;
	}
	
	
}
