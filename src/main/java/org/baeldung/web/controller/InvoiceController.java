package org.baeldung.web.controller;

import javax.validation.Valid;

import org.baeldung.persistence.service.IInvoiceService;
import org.baeldung.persistence.service.IProductService;
import org.baeldung.persistence.service.InvoiceDto;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class InvoiceController {
    private final Logger LOGGER = LoggerFactory.getLogger(getClass());

    @Autowired
    private IInvoiceService invoiceService;
    
    @Autowired
    private IProductService productService;
    
   
    public InvoiceController() {
        super();
    }

    @RequestMapping(value = "/invoices", method = RequestMethod.GET)
    public String listExisitingCustomers(Model model) {
        
        model.addAttribute("productList", productService.listProductNames());
        model.addAttribute("productName", productService.listProductNames());

        return "invoice";
    }
    

    @RequestMapping(value = "/invoice/add", method = RequestMethod.POST)
    public String saveInvoice(@Valid final InvoiceDto invoiceDto) {
        LOGGER.debug("Saving Invoice{}", invoiceDto);

          invoiceService.addNewInvoice(invoiceDto);
        return "invoice";
    }
    
    /*@RequestMapping("/remove/{id}/invoice")
    public String removeInvoice(@PathVariable("id") int id){
		
    	Invoice invoice = invoiceService.
    	Customer customer = customerSerivce.findCustomer(id);
    	
    	customerSerivce.deleteCustomer(customer);
   
   
        return "redirect:/customers";
    }
  */
     
}
