// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package br.com.rogrs.model;

import br.com.rogrs.model.Category;
import br.com.rogrs.model.OrderDetail;
import br.com.rogrs.model.Product;
import java.util.Objects;
import java.util.Set;

privileged aspect Product_Roo_JavaBean {
    
    /**
     * Gets id value
     * 
     * @return Long
     */
    public Long Product.getId() {
        return this.id;
    }
    
    /**
     * Sets id value
     * 
     * @param id
     * @return Product
     */
    public Product Product.setId(Long id) {
        this.id = id;
        return this;
    }
    
    /**
     * Gets version value
     * 
     * @return Integer
     */
    public Integer Product.getVersion() {
        return this.version;
    }
    
    /**
     * Sets version value
     * 
     * @param version
     * @return Product
     */
    public Product Product.setVersion(Integer version) {
        this.version = version;
        return this;
    }
    
    /**
     * Gets name value
     * 
     * @return String
     */
    public String Product.getName() {
        return this.name;
    }
    
    /**
     * Sets name value
     * 
     * @param name
     * @return Product
     */
    public Product Product.setName(String name) {
        this.name = name;
        return this;
    }
    
    /**
     * Gets description value
     * 
     * @return String
     */
    public String Product.getDescription() {
        return this.description;
    }
    
    /**
     * Sets description value
     * 
     * @param description
     * @return Product
     */
    public Product Product.setDescription(String description) {
        this.description = description;
        return this;
    }
    
    /**
     * Gets categories value
     * 
     * @return Set
     */
    public Set<Category> Product.getCategories() {
        return this.categories;
    }
    
    /**
     * Sets categories value
     * 
     * @param categories
     * @return Product
     */
    public Product Product.setCategories(Set<Category> categories) {
        this.categories = categories;
        return this;
    }
    
    /**
     * Gets orderDetails value
     * 
     * @return Set
     */
    public Set<OrderDetail> Product.getOrderDetails() {
        return this.orderDetails;
    }
    
    /**
     * Sets orderDetails value
     * 
     * @param orderDetails
     * @return Product
     */
    public Product Product.setOrderDetails(Set<OrderDetail> orderDetails) {
        this.orderDetails = orderDetails;
        return this;
    }
    
    /**
     * This `equals` implementation is specific for JPA entities and uses 
     * the entity identifier for it, following the article in 
     * https://vladmihalcea.com/2016/06/06/how-to-implement-equals-and-hashcode-using-the-jpa-entity-identifier/
     * 
     * @param obj
     * @return Boolean
     */
    public boolean Product.equals(Object obj) {
        if (this == obj) {
            return true;
        }
        // instanceof is false if the instance is null
        if (!(obj instanceof Product)) {
            return false;
        }
        return getId() != null && Objects.equals(getId(), ((Product) obj).getId());
    }
    
    /**
     * This `hashCode` implementation is specific for JPA entities and uses a fixed `int` value to be able 
     * to identify the entity in collections after a new id is assigned to the entity, following the article in 
     * https://vladmihalcea.com/2016/06/06/how-to-implement-equals-and-hashcode-using-the-jpa-entity-identifier/
     * 
     * @return Integer
     */
    public int Product.hashCode() {
        return 31;
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @return String
     */
    public String Product.toString() {
        return "Product {" + 
                "id='" + id + '\'' + 
                ", version='" + version + '\'' + 
                ", name='" + name + '\'' + 
                ", description='" + description + '\'' + "}" + super.toString();
    }
    
}
