package org.baeldung.persistence.service;

import java.math.BigDecimal;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

public class InvoiceDto {
	
	@NotNull
    @Size(min = 1)
    private int id;
	
    @Size(min = 1)
    private String product;

    @NotNull
    @Size(min = 1)
    private String description;

    @NotNull
    @Size(min = 1)
    private int quantity;
    
    @NotNull
    @Size(min = 1)
    private BigDecimal price;
    
    @NotNull
    @Size(min = 1)
    private BigDecimal tax;
    
    @NotNull
    @Size(min = 1)
    private BigDecimal amount;
    
   
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getProduct() {
		return product;
	}

	public void setProduct(String product) {
		this.product = product;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public BigDecimal getPrice() {
		return price;
	}

	public void setPrice(BigDecimal price) {
		this.price = price;
	}

	public BigDecimal getTax() {
		return tax;
	}

	public void setTax(BigDecimal tax) {
		this.tax = tax;
	}

	public BigDecimal getAmount() {
		return amount;
	}

	public void setAmount(BigDecimal amount) {
		this.amount = amount;
	}

	@Override
	public String toString() {
		return "InvoiceDto [id=" + id + ", product=" + product
				+ ", description=" + description + ", quantity=" + quantity
				+ ", price=" + price + ", tax=" + tax + ", amount=" + amount
				+ "]";
	}

	
}
 