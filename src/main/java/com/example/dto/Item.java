package com.example.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
public class Item {
	private String product_id;
	private String name;
	private String image;
	private float price;
	private float discount = 0;
	private int quantity;
	public Item() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Item(String product_id, String name, String image, float price, float discount, int quantity) {
		super();
		this.product_id = product_id;
		this.name = name;
		this.image = image;
		this.price = price;
		this.discount = discount;
		this.quantity = quantity;
	}
	public String getProduct_id() {
		return product_id;
	}
	public void setProduct_id(String product_id) {
		this.product_id = product_id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public float getPrice() {
		return price;
	}
	public void setPrice(float price) {
		this.price = price;
	}
	public float getDiscount() {
		return discount;
	}
	public void setDiscount(float discount) {
		this.discount = discount;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	
	
}
