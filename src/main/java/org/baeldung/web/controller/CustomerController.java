package org.baeldung.web.controller;

import javax.validation.Valid;

import org.baeldung.persistence.model.Customer;
import org.baeldung.persistence.service.CustomerDto;
import org.baeldung.persistence.service.ICustomerService;
import org.baeldung.validation.EmailExistsException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class CustomerController {
    private final Logger LOGGER = LoggerFactory.getLogger(getClass());

    @Autowired
    private ICustomerService customerSerivce;

    public CustomerController() {
        super();
    }

   
    @RequestMapping(value = "/customer/customers", method = RequestMethod.GET)
    public String listCustomers(Model model) {
        LOGGER.debug("Get all the customers");
        
        model.addAttribute("Customer", new Customer());
        model.addAttribute("listCustomers", customerSerivce.listCustomers());

        return "customer";
    }
    
    
    @RequestMapping(value = "/customers", method = RequestMethod.GET)
    public String listExisitingCustomers(Model model) {
        LOGGER.debug("Get all the customers");
        
        model.addAttribute("existingCustomer", new Customer());
        model.addAttribute("listCustomers", customerSerivce.listCustomers());

        return "existingCustomer";
    }
    

    @RequestMapping(value = "/customer/add", method = RequestMethod.POST)
    public String addCustomer(@Valid final CustomerDto customerDto) throws EmailExistsException {
        LOGGER.debug("Registering user account with information: {}", customerDto);

          customerSerivce.registerNewCustomerAccount(customerDto);
//        final String appUrl = "http://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath();
//        eventPublisher.publishEvent(new OnRegistrationCompleteEvent(registered, request.getLocale(), appUrl));

        return "redirect:/customers";
    }
    
    @RequestMapping("/remove/{id}")
    public String removePerson(@PathVariable("id") int id){
		
    	Customer customer = customerSerivce.findCustomer(id);
    	
    	customerSerivce.deleteCustomer(customer);
   
   
        return "redirect:/customers";
    }
  
}
