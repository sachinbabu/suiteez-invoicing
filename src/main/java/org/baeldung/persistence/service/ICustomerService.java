package org.baeldung.persistence.service;

import java.util.List;

import org.baeldung.persistence.model.Customer;
import org.baeldung.persistence.model.User;
import org.baeldung.validation.EmailExistsException;

public interface ICustomerService {

    Customer registerNewCustomerAccount(CustomerDto customerDto) throws EmailExistsException;

    List<Customer> listCustomers();

    void deleteCustomer(Customer customer);


	Customer findCustomer(int id);
   
}
