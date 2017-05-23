package com.asterisk.config.repository;

import com.asterisk.config.entity.App;
import org.springframework.data.repository.CrudRepository;

import java.util.Optional;

/**
 * @author dongh38@ziroom.com
 * @version 1.0.0
 */
public interface AppRepository extends CrudRepository<App, String> {

    Optional<App> findByAppId(String appId);
}
