package com.asterisk.config.repository;

import com.asterisk.config.entity.User;
import org.springframework.data.repository.CrudRepository;

import java.util.Optional;

/**
 * @author dongh38@ziroom.com
 * @version 1.0.0
 */
public interface UserRepository extends CrudRepository<User, String> {

   Optional<User> findByUsername(String username);
}
