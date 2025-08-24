package model;

public class Product {
	
	private int id;
	private String name;
	private String text;
	private float price;
	private int stock;
	private int caId;
	
	public Product() {
		
	}

	public Product(int id, String name, String text, float price, int stock, int caId) {
		super();
		this.id = id;
		this.name = name;
		this.text = text;
		this.price = price;
		this.stock = stock;
		this.caId = caId;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public float getPrice() {
		return price;
	}

	public void setPrice(float price) {
		this.price = price;
	}

	public int getStock() {
		return stock;
	}

	public void setStock(int stock) {
		this.stock = stock;
	}

	public int getCaId() {
		return caId;
	}

	public void setCaId(int caId) {
		this.caId = caId;
	}

	@Override
	public String toString() {
		return "Product [id=" + id + ", name=" + name + ", text=" + text + ", price=" + price + ", stock=" + stock
				+ ", caId=" + caId + "]";
	}
	
}
