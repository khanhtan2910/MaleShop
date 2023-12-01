package com.example.model;

import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotBlank;

import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.Parameter;
import org.springframework.format.annotation.DateTimeFormat;

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
@Table(name = "products")
public class Product extends Auditable<User> {
	@Id
	@GeneratedValue(generator = "UUID")
	@GenericGenerator(name = "UUID", strategy = "org.hibernate.id.UUIDGenerator", parameters = {
			@Parameter(name = "uuid_gen_strategy_class", value = "org.hibernate.id.uuid.CustomVersionOneStrategy") })
	@Column(name = "id")
	private String id;

	@NotBlank(message = "{notblank.name}")
	@Column(name = "name")
	private String name;

	@Column(name = "price")
	private float price = 0;

	@Column(name = "discount")
	private float discount = 0;
	
	@Column(name = "start_day_discount")
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date startDayDiscount;

//	@EndDayDiscount(before = "startDayDiscount", after= "endDayDiscount")
	@Column(name = "end_day_discount")
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date endDayDiscount;

	@Column(name = "views")
	private int views = 0;

	@Column(name = "quantity")
	private int quantity = 0;

	@Column(name = "active")
	private boolean active = true;

	@Column(name = "description")
	private String description;

	@Column(name = "width")
	private float width = 0;

	@Column(name = "height")
	private float height = 0;

	@Column(name = "depth")
	private float depth = 0;

	@Column(name = "weight")
	private float weight = 0;
	
	@Column(name = "banner")
	private String banner = "noImage.png";

	@ManyToOne
	@JoinColumn(name = "id_brand")
	private Brand brand;

	@ManyToOne
	@JoinColumn(name = "id_category_product")
	private CategoryProduct categoryProduct;

	@ManyToOne
	@JoinColumn(name = "id_color")
	private Color color;

	@JsonIgnore
	@OneToMany(mappedBy = "product", cascade = CascadeType.ALL)
	private List<ImageProduct> imageProducts;
	
	@JsonIgnore
	@OneToMany(mappedBy = "product", cascade = CascadeType.ALL)
	private List<Review> reviews;
	
	@JsonIgnore
	@OneToMany(mappedBy = "product", cascade = CascadeType.ALL)
	private List<Like> likes;
	
	@JsonIgnore
	@OneToMany(mappedBy = "product", cascade = CascadeType.ALL)
	private List<OrderDetail> OrderDetail;

	public Product() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Product(User createdBy, Date createdDate, User lastModifiedBy, Date lastModifiedDate) {
		super(createdBy, createdDate, lastModifiedBy, lastModifiedDate);
		// TODO Auto-generated constructor stub
	}

	public Product(String id, @NotBlank(message = "{notblank.name}") String name, float price, float discount,
			Date startDayDiscount, Date endDayDiscount, int views, int quantity, boolean active, String description,
			float width, float height, float depth, float weight, String banner, Brand brand,
			CategoryProduct categoryProduct, Color color, List<ImageProduct> imageProducts, List<Review> reviews,
			List<Like> likes, List<com.example.model.OrderDetail> orderDetail) {
		super();
		this.id = id;
		this.name = name;
		this.price = price;
		this.discount = discount;
		this.startDayDiscount = startDayDiscount;
		this.endDayDiscount = endDayDiscount;
		this.views = views;
		this.quantity = quantity;
		this.active = active;
		this.description = description;
		this.width = width;
		this.height = height;
		this.depth = depth;
		this.weight = weight;
		this.banner = banner;
		this.brand = brand;
		this.categoryProduct = categoryProduct;
		this.color = color;
		this.imageProducts = imageProducts;
		this.reviews = reviews;
		this.likes = likes;
		OrderDetail = orderDetail;
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

	public Date getStartDayDiscount() {
		return startDayDiscount;
	}

	public void setStartDayDiscount(Date startDayDiscount) {
		this.startDayDiscount = startDayDiscount;
	}

	public Date getEndDayDiscount() {
		return endDayDiscount;
	}

	public void setEndDayDiscount(Date endDayDiscount) {
		this.endDayDiscount = endDayDiscount;
	}

	public int getViews() {
		return views;
	}

	public void setViews(int views) {
		this.views = views;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public boolean isActive() {
		return active;
	}

	public void setActive(boolean active) {
		this.active = active;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public float getWidth() {
		return width;
	}

	public void setWidth(float width) {
		this.width = width;
	}

	public float getHeight() {
		return height;
	}

	public void setHeight(float height) {
		this.height = height;
	}

	public float getDepth() {
		return depth;
	}

	public void setDepth(float depth) {
		this.depth = depth;
	}

	public float getWeight() {
		return weight;
	}

	public void setWeight(float weight) {
		this.weight = weight;
	}

	public String getBanner() {
		return banner;
	}

	public void setBanner(String banner) {
		this.banner = banner;
	}

	public Brand getBrand() {
		return brand;
	}

	public void setBrand(Brand brand) {
		this.brand = brand;
	}

	public CategoryProduct getCategoryProduct() {
		return categoryProduct;
	}

	public void setCategoryProduct(CategoryProduct categoryProduct) {
		this.categoryProduct = categoryProduct;
	}

	public Color getColor() {
		return color;
	}

	public void setColor(Color color) {
		this.color = color;
	}

	public List<ImageProduct> getImageProducts() {
		return imageProducts;
	}

	public void setImageProducts(List<ImageProduct> imageProducts) {
		this.imageProducts = imageProducts;
	}

	public List<Review> getReviews() {
		return reviews;
	}

	public void setReviews(List<Review> reviews) {
		this.reviews = reviews;
	}

	public List<Like> getLikes() {
		return likes;
	}

	public void setLikes(List<Like> likes) {
		this.likes = likes;
	}

	public List<OrderDetail> getOrderDetail() {
		return OrderDetail;
	}

	public void setOrderDetail(List<OrderDetail> orderDetail) {
		OrderDetail = orderDetail;
	}
	
	
}
