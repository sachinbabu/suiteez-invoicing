package org.baeldung.persistence.service;

import java.math.BigDecimal;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

public class ProductDto {
    @NotNull
    @Size(min = 1)
    private String productName;

    @NotNull
    @Size(min = 1)
    private String incomeAccount;

    @NotNull
    @Size(min = 1)
    private BigDecimal price;
    
    @Size(min = 10)
    private String description;
    
    

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String getIncomeAccount() {
		return incomeAccount;
	}

	public void setIncomeAccount(String incomeAccount) {
		this.incomeAccount = incomeAccount;
	}

	public BigDecimal getPrice() {
		return price;
	}

	public void setPrice(BigDecimal price) {
		this.price = price;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	@Override
	public String toString() {
		return "ProductDto [productName=" + productName + ", incomeAccount="
				+ incomeAccount + ", price=" + price + ", description="
				+ description + "]";
	}
    
       
}
 