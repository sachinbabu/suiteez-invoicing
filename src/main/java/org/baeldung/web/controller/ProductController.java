package org.baeldung.web.controller;

import org.baeldung.persistence.model.Product;
import org.baeldung.persistence.service.IProductService;
import org.baeldung.persistence.service.IUserService;
import org.baeldung.persistence.service.ProductDto;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationEventPublisher;
import org.springframework.context.MessageSource;
import org.springframework.core.env.Environment;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ProductController {
    private final Logger LOGGER = LoggerFactory.getLogger(getClass());

    @Autowired
    private IUserService userService;
    
    @Autowired
    private IProductService productService;
    
    @Autowired
    private MessageSource messages;

    @Autowired
    private JavaMailSender mailSender;

    @Autowired
    private ApplicationEventPublisher eventPublisher;

    @Autowired
    private UserDetailsService userDetailsService;

    @Autowired
    private Environment env;

    public ProductController() {
        super();
    }

   
  /*  @RequestMapping(value = "/products", method = RequestMethod.GET)
    public String listExisitingproducts(Model model) {
        LOGGER.debug("Get all the products");
        
        model.addAttribute("productForm", new Product());
        model.addAttribute("incomeAccount", productService.listProductNames());

        return "product";
    }
    */
    
    @RequestMapping(value = "/products", method = RequestMethod.GET)
    public ModelAndView showProductForm(Model model) {
    	
    	//model.addAttribute("incomeAccount", productService.listProductNames());
        return new ModelAndView("product", "productForm", new Product());
    }
    

    @RequestMapping(value = "/product/add", method = RequestMethod.POST)
    public String addProduct(final ProductDto productDto, Model model){
        LOGGER.debug("Registering user account with information: {}", productDto);

          productService.createNewProduct(productDto);
          model.addAttribute("productForm", new Product());
          
        return "redirect:/products";
    }
    
    @RequestMapping("/remove/product/{id}")
    public String removePerson(@PathVariable("id") int id){
		
    	Product product = productService.findProduct(id);
    	
    	productService.deleteProduct(product);
   
        return "redirect:/products";
    }
  
}
