package com.asterisk.config.dao;

import org.springframework.data.cassandra.repository.Query;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

/**
 * @author dongh38@ziroom.com
 * @version 1.0.0
 */
public interface CustomerRespo extends CrudRepository<Customer,String> {

    @Query("Select * from customer where firstname=?0")
    Customer findByFirstName(String firstName);

    @Query("Select * from customer where lastname=?0")
    List<Customer> findByLastName(String lastName);

}
