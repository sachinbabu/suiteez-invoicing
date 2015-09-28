/**
 * 
 */
package org.baeldung.persistence.dao;

import org.baeldung.persistence.model.Product;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * @author sachinbabujettipraksh
 *
 */
public interface ProductRespository extends JpaRepository<Product, Integer> {
	
	    @Override
	    void delete(Product product);

	

}
