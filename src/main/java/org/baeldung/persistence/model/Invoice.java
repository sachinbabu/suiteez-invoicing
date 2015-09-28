package org.baeldung.persistence.model;

import java.math.BigDecimal;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.baeldung.persistence.model.Customer;
import org.baeldung.validation.PasswordMatches;
import org.baeldung.validation.ValidEmail;
import org.baeldung.validation.ValidPassword;

@Entity
@Table(name="INVOICE")
public class Invoice {
	
	@Id
	@Column(name="id")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	
    private String product;

    private String description;

    private int quantity;
    
    private BigDecimal price;
    
    private BigDecimal tax;
    
    private BigDecimal amount;

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
		return "InvoiceDto [product=" + product + ", description="
				+ description + ", quantity=" + quantity + ", price=" + price
				+ ", tax=" + tax + ", amount=" + amount + "]";
	}
    
    
    
}
 