// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package br.com.rogrs.web;

import br.com.rogrs.model.CustomerOrder;
import br.com.rogrs.service.api.CustomerOrderService;
import br.com.rogrs.web.CustomerOrdersCollectionJsonController;
import br.com.rogrs.web.CustomerOrdersItemJsonController;
import io.springlets.data.domain.GlobalSearch;
import java.util.Collection;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.mvc.method.annotation.MvcUriComponentsBuilder;
import org.springframework.web.util.UriComponents;

privileged aspect CustomerOrdersCollectionJsonController_Roo_JSON {
    
    declare @type: CustomerOrdersCollectionJsonController: @RestController;
    
    declare @type: CustomerOrdersCollectionJsonController: @RequestMapping(value = "/customerorders", name = "CustomerOrdersCollectionJsonController", produces = MediaType.APPLICATION_JSON_VALUE);
    
    /**
     * TODO Auto-generated attribute documentation
     * 
     */
    private CustomerOrderService CustomerOrdersCollectionJsonController.customerOrderService;
    
    /**
     * TODO Auto-generated constructor documentation
     * 
     * @param customerOrderService
     */
    @Autowired
    public CustomerOrdersCollectionJsonController.new(CustomerOrderService customerOrderService) {
        this.customerOrderService = customerOrderService;
    }

    /**
     * TODO Auto-generated method documentation
     * 
     * @return CustomerOrderService
     */
    public CustomerOrderService CustomerOrdersCollectionJsonController.getCustomerOrderService() {
        return customerOrderService;
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param customerOrderService
     */
    public void CustomerOrdersCollectionJsonController.setCustomerOrderService(CustomerOrderService customerOrderService) {
        this.customerOrderService = customerOrderService;
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param globalSearch
     * @param pageable
     * @return ResponseEntity
     */
    @GetMapping(name = "list")
    public ResponseEntity<Page<CustomerOrder>> CustomerOrdersCollectionJsonController.list(GlobalSearch globalSearch, Pageable pageable) {
        
        Page<CustomerOrder> customerOrders = getCustomerOrderService().findAll(globalSearch, pageable);
        return ResponseEntity.ok(customerOrders);
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @return UriComponents
     */
    public static UriComponents CustomerOrdersCollectionJsonController.listURI() {
        return MvcUriComponentsBuilder
            .fromMethodCall(
                MvcUriComponentsBuilder.on(CustomerOrdersCollectionJsonController.class).list(null, null))
            .build().encode();
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param customerOrder
     * @param result
     * @return ResponseEntity
     */
    @PostMapping(name = "create")
    public ResponseEntity<?> CustomerOrdersCollectionJsonController.create(@Valid @RequestBody CustomerOrder customerOrder, BindingResult result) {
        
        if (customerOrder.getId() != null || customerOrder.getVersion() != null) {        
            return ResponseEntity.status(HttpStatus.CONFLICT).build();
        }
        
        if (result.hasErrors()) {
            return ResponseEntity.status(HttpStatus.CONFLICT).body(result);
        }
        
        CustomerOrder newCustomerOrder = getCustomerOrderService().save(customerOrder);
        UriComponents showURI = CustomerOrdersItemJsonController.showURI(newCustomerOrder);
        
        return ResponseEntity.created(showURI.toUri()).build();
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param customerOrders
     * @param result
     * @return ResponseEntity
     */
    @PostMapping(value = "/batch", name = "createBatch")
    public ResponseEntity<?> CustomerOrdersCollectionJsonController.createBatch(@Valid @RequestBody Collection<CustomerOrder> customerOrders, BindingResult result) {
        
        if (result.hasErrors()) {
            return ResponseEntity.status(HttpStatus.CONFLICT).body(result);
        }
        
        getCustomerOrderService().save(customerOrders);
        
        return ResponseEntity.created(listURI().toUri()).build();
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param customerOrders
     * @param result
     * @return ResponseEntity
     */
    @PutMapping(value = "/batch", name = "updateBatch")
    public ResponseEntity<?> CustomerOrdersCollectionJsonController.updateBatch(@Valid @RequestBody Collection<CustomerOrder> customerOrders, BindingResult result) {
        
        if (result.hasErrors()) {
            return ResponseEntity.status(HttpStatus.CONFLICT).body(result);
        }
        
        getCustomerOrderService().save(customerOrders);
        
        return ResponseEntity.ok().build();
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param ids
     * @return ResponseEntity
     */
    @DeleteMapping(value = "/batch/{ids}", name = "deleteBatch")
    public ResponseEntity<?> CustomerOrdersCollectionJsonController.deleteBatch(@PathVariable("ids") Collection<Long> ids) {
        
        getCustomerOrderService().delete(ids);
        
        return ResponseEntity.ok().build();
    }
    
}
