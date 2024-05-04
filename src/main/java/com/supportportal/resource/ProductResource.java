package com.supportportal.resource;

import static org.springframework.http.HttpStatus.OK;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.supportportal.domain.Product;
import com.supportportal.repository.ProductRepository;
@RestController
@RequestMapping(path = {"/product"})
public class ProductResource {
	 @Autowired
      private ProductRepository productRepository;
	   @GetMapping("/products")
	    public List<Product> getAllProducts() {
	        List<Product> products = productRepository.findAll();
	        return products;
	    }
	  
}
