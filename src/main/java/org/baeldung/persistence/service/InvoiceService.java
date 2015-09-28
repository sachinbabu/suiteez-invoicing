package org.baeldung.persistence.service;

import javax.transaction.Transactional;

import org.baeldung.persistence.dao.IInvoiceRespository;
import org.baeldung.persistence.model.Invoice;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
@Transactional
public class InvoiceService implements IInvoiceService {

	@Autowired
	private IInvoiceRespository repository;
	
	@Override
	public Invoice addNewInvoice(InvoiceDto invoiceDto) {
		
		final Invoice invoice = new Invoice();
		
		invoice.setProduct(invoiceDto.getProduct());
		invoice.setDescription(invoiceDto.getDescription());
		invoice.setPrice(invoiceDto.getPrice());
		invoice.setQuantity(invoiceDto.getQuantity());
		invoice.setTax(invoiceDto.getTax());
		
		return repository.save(invoice);
	}

	@Override
	public void deleteInvoice(Invoice invoice) {
		
		repository.delete(invoice); 
	}
	
}