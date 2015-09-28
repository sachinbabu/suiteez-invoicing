package org.baeldung.persistence.service;

import java.util.List;

import org.baeldung.persistence.model.Product;

public interface IProductService {

    Product createNewProduct(ProductDto productDto);

    List<Product> listProducts();
    
    List<String> listProductNames();
    List<String> listProductIncomeAmount();

    void deleteProduct(Product product);

	Product findProduct(int id);
   
}
