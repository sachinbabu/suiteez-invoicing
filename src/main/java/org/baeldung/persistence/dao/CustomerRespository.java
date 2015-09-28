/**
 * 
 */
package org.baeldung.persistence.dao;

import org.baeldung.persistence.model.Customer;
import org.baeldung.persistence.model.User;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * @author sachinbabujettipraksh
 *
 */
public interface CustomerRespository extends JpaRepository<Customer, Long> {
	
	    @Override
	    void delete(Customer customer);

	

}
