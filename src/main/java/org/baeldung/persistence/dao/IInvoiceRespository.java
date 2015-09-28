/**
 * 
 */
package org.baeldung.persistence.dao;

import org.baeldung.persistence.model.Invoice;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * @author sachinbabujettipraksh
 *
 */
public interface IInvoiceRespository extends JpaRepository<Invoice, Long> {
	
	    @Override
	    void delete(Invoice invoice);

	

}
