package org.baeldung.persistence.service;

import java.util.List;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.baeldung.persistence.model.Customer;
import org.baeldung.validation.PasswordMatches;
import org.baeldung.validation.ValidEmail;
import org.baeldung.validation.ValidPassword;

public class CustomerDto {
    @NotNull
    @Size(min = 1)
    private String firstName;

    @NotNull
    @Size(min = 1)
    private String lastName;

    @ValidEmail
    @NotNull
    @Size(min = 1)
    private String email;
    
    private List<Customer> listCustomers;

    public String getEmail() {
        return email;
    }

    public void setEmail(final String email) {
        this.email = email;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(final String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(final String lastName) {
        this.lastName = lastName;
    }
    
	public List<Customer> getListCustomers() {
		return listCustomers;
	}

	public void setListCustomers(List<Customer> listCustomers) {
		Customer  newCustomer = new Customer();
		newCustomer.setFirstName("firstName");
		newCustomer.setLastName("lastName"); 
		listCustomers.add(newCustomer);
		this.listCustomers = listCustomers;
	}

	@Override
	public String toString() {
		return "CustomerDto [firstName=" + firstName + ", lastName=" + lastName
				+ ", email=" + email +"]";
	}
    
}
 