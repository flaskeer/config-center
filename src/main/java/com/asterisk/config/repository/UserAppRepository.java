package com.asterisk.config.repository;

import com.asterisk.config.entity.UserApp;
import org.springframework.data.repository.CrudRepository;

import java.util.List;
import java.util.Optional;

/**
 * @author dongh38@ziroom.com
 * @version 1.0.0
 */
public interface UserAppRepository extends CrudRepository<UserApp,String>{

    Optional<UserApp> findByAppIdAndUserId(String appId,Long userId);

    Optional<List<UserApp>> findByAppId(String appId);


}
