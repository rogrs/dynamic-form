// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package br.com.rogrs.model.dod;

import br.com.rogrs.model.Product;
import br.com.rogrs.model.dod.ProductDataOnDemand;
import br.com.rogrs.model.dod.ProductFactory;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;

privileged aspect ProductDataOnDemand_Roo_JpaDataOnDemand {
    
    /**
     * Random generator for the entities index.
     * 
     */
    private Random ProductDataOnDemand.rnd = new SecureRandom();
    
    /**
     * List of created entities.
     * 
     */
    private List<Product> ProductDataOnDemand.data;
    
    /**
     * EntityManager to persist the entities.
     * 
     */
    private EntityManager ProductDataOnDemand.entityManager;
    
    /**
     * Number of elements to create and persist.
     * 
     */
    private int ProductDataOnDemand.size;
    
    /**
     * Factory to create entity instances.
     * 
     */
    private ProductFactory ProductDataOnDemand.factory = new ProductFactory();
    
    /**
     * TODO Auto-generated constructor documentation
     * 
     * @param entityManager
     */
    public ProductDataOnDemand.new(EntityManager entityManager) {
        this(entityManager, 10);
    }

    /**
     * TODO Auto-generated constructor documentation
     * 
     * @param entityManager
     * @param size
     */
    public ProductDataOnDemand.new(EntityManager entityManager, int size) {
        setEntityManager(entityManager);
        setSize(size);
    }

    /**
     * TODO Auto-generated method documentation
     * 
     * @return Random
     */
    public Random ProductDataOnDemand.getRnd() {
        return rnd;
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param rnd
     */
    public void ProductDataOnDemand.setRnd(Random rnd) {
        this.rnd = rnd;
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @return List
     */
    public List<Product> ProductDataOnDemand.getData() {
        return data;
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param data
     */
    public void ProductDataOnDemand.setData(List<Product> data) {
        this.data = data;
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @return EntityManager
     */
    public EntityManager ProductDataOnDemand.getEntityManager() {
        return entityManager;
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param entityManager
     */
    public void ProductDataOnDemand.setEntityManager(EntityManager entityManager) {
        this.entityManager = entityManager;
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @return Integer
     */
    public int ProductDataOnDemand.getSize() {
        return size;
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param size
     */
    public void ProductDataOnDemand.setSize(int size) {
        this.size = size;
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @return ProductFactory
     */
    public ProductFactory ProductDataOnDemand.getFactory() {
        return factory;
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param factory
     */
    public void ProductDataOnDemand.setFactory(ProductFactory factory) {
        this.factory = factory;
    }
    
    /**
     * Creates a new transient Product in a random index out of the initial list of the created entities,
     * with an index greater than {@link ProductDataOnDemand#getSize()} - 1.
     * 
     * @return Product the generated transient {@link Product}
     */
    public Product ProductDataOnDemand.getNewRandomTransientProduct() {
        int randomIndex = getSize() + getRnd().nextInt(Integer.MAX_VALUE - getSize());
        return getFactory().create(randomIndex);
    }
    
    /**
     * Returns a generated and persisted {@link Product} in a given index.
     * 
     * @param index the position of the {@link Product} to return
     * @return Product the specific {@link Product}
     */
    public Product ProductDataOnDemand.getSpecificProduct(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (getData().size() - 1)) {
            index = getData().size() - 1;
        }
        return getData().get(index);
    }
    
    /**
     * Returns a generated and persisted {@link Product} in a random index.
     * 
     * @return Product a random {@link Product}
     */
    public Product ProductDataOnDemand.getRandomProduct() {
        init();
        return getData().get(getRnd().nextInt(getData().size()));
    }
    
    /**
     * Creates the initial list of generated entities.
     * 
     */
    public void ProductDataOnDemand.init() {
        int from = 0;
        int to = 10;
        
        CriteriaBuilder cb = getEntityManager().getCriteriaBuilder();
        CriteriaQuery<Product> cq = cb.createQuery(Product.class);
        Root<Product> rootEntry = cq.from(Product.class);
        CriteriaQuery<Product> all = cq.select(rootEntry);
        TypedQuery<Product> allQuery = 
            getEntityManager().createQuery(all).setFirstResult(from).setMaxResults(to);
        setData(allQuery.getResultList());
        if (getData() == null) {
            throw new IllegalStateException(
                "Find entries implementation for 'Product' illegally returned null");
        }
        if (!getData().isEmpty()) {
            return;
        }
        
        setData(new ArrayList<Product>());
        for (int i = from; i < to; i++) {
            Product obj = getFactory().create(i);
            try {
                getEntityManager().persist(obj);
            } catch (final ConstraintViolationException e) {
                final StringBuilder msg = new StringBuilder();
                for (Iterator<ConstraintViolation<?>> iter = e.getConstraintViolations().iterator(); iter
                      .hasNext();) {
                    final ConstraintViolation<?> cv = iter.next();
                    msg.append("[").append(cv.getRootBean().getClass().getName()).append(".")
                    .append(cv.getPropertyPath()).append(": ").append(cv.getMessage())
                    .append(" (invalid value = ").append(cv.getInvalidValue()).append(")").append("]");
                }
                throw new IllegalStateException(msg.toString(), e);
            }
            getEntityManager().flush();
            getData().add(obj);
        }
    }
    
}
