// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package br.com.rogrs.web;

import br.com.rogrs.model.CustomerOrder;
import br.com.rogrs.model.OrderDetail;
import br.com.rogrs.service.api.CustomerOrderService;
import br.com.rogrs.service.api.OrderDetailService;
import br.com.rogrs.web.CustomerOrdersItemDetailsItemJsonController;
import io.springlets.web.NotFoundException;
import java.util.Collections;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

privileged aspect CustomerOrdersItemDetailsItemJsonController_Roo_JSON {
    
    declare @type: CustomerOrdersItemDetailsItemJsonController: @RestController;
    
    declare @type: CustomerOrdersItemDetailsItemJsonController: @RequestMapping(value = "/customerorders/{customerOrder}/details/{details}", name = "CustomerOrdersItemDetailsItemJsonController", produces = MediaType.APPLICATION_JSON_VALUE);
    
    /**
     * TODO Auto-generated attribute documentation
     * 
     */
    private CustomerOrderService CustomerOrdersItemDetailsItemJsonController.customerOrderService;
    
    /**
     * TODO Auto-generated attribute documentation
     * 
     */
    private OrderDetailService CustomerOrdersItemDetailsItemJsonController.orderDetailService;
    
    /**
     * TODO Auto-generated constructor documentation
     * 
     * @param customerOrderService
     * @param orderDetailService
     */
    @Autowired
    public CustomerOrdersItemDetailsItemJsonController.new(CustomerOrderService customerOrderService, OrderDetailService orderDetailService) {
        this.customerOrderService = customerOrderService;
        this.orderDetailService = orderDetailService;
    }

    /**
     * TODO Auto-generated method documentation
     * 
     * @return CustomerOrderService
     */
    public CustomerOrderService CustomerOrdersItemDetailsItemJsonController.getCustomerOrderService() {
        return customerOrderService;
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param customerOrderService
     */
    public void CustomerOrdersItemDetailsItemJsonController.setCustomerOrderService(CustomerOrderService customerOrderService) {
        this.customerOrderService = customerOrderService;
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @return OrderDetailService
     */
    public OrderDetailService CustomerOrdersItemDetailsItemJsonController.getOrderDetailService() {
        return orderDetailService;
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param orderDetailService
     */
    public void CustomerOrdersItemDetailsItemJsonController.setOrderDetailService(OrderDetailService orderDetailService) {
        this.orderDetailService = orderDetailService;
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param id
     * @return CustomerOrder
     */
    @ModelAttribute
    public CustomerOrder CustomerOrdersItemDetailsItemJsonController.getCustomerOrder(@PathVariable("customerOrder") Long id) {
        CustomerOrder customerOrder = customerOrderService.findOne(id);
        if (customerOrder == null) {
            throw new NotFoundException(String.format("CustomerOrder with identifier '%s' not found",id));
        }
        return customerOrder;
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param id
     * @return OrderDetail
     */
    @ModelAttribute
    public OrderDetail CustomerOrdersItemDetailsItemJsonController.getDetails(@PathVariable("details") Long id) {
        OrderDetail details = orderDetailService.findOne(id);
        if (details == null) {
            throw new NotFoundException(String.format("OrderDetail with identifier '%s' not found",id));
        }
        return details;
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param customerOrder
     * @param orderDetail
     * @param model
     * @return ResponseEntity
     */
    @GetMapping(name = "show")
    public ResponseEntity<?> CustomerOrdersItemDetailsItemJsonController.show(@ModelAttribute CustomerOrder customerOrder, @ModelAttribute OrderDetail orderDetail, Model model) {
        return ResponseEntity.ok(orderDetail);
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param customerOrder
     * @param storedOrderDetail
     * @param orderDetail
     * @param result
     * @return ResponseEntity
     */
    @PutMapping(name = "update")
    public ResponseEntity<?> CustomerOrdersItemDetailsItemJsonController.update(@ModelAttribute CustomerOrder customerOrder, @ModelAttribute OrderDetail storedOrderDetail, @Valid @RequestBody OrderDetail orderDetail, BindingResult result) {
        
        if (result.hasErrors()) {
            return ResponseEntity.status(HttpStatus.CONFLICT).body(result);
        }
        orderDetail.setId(storedOrderDetail.getId());
        getOrderDetailService().save(orderDetail);
        return ResponseEntity.ok().build();
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param customerOrder
     * @param details
     * @return ResponseEntity
     */
    @DeleteMapping(name = "delete")
    public ResponseEntity<?> CustomerOrdersItemDetailsItemJsonController.delete(@ModelAttribute CustomerOrder customerOrder, @ModelAttribute OrderDetail details) {
        getCustomerOrderService().removeFromDetails(customerOrder,Collections.singleton(details.getId()));
        return ResponseEntity.ok().build();
    }
    
}
