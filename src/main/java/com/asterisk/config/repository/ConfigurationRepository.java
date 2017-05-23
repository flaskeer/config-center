package com.asterisk.config.repository;

import com.asterisk.config.entity.Configuration;
import org.springframework.data.repository.CrudRepository;

import java.util.List;
import java.util.Optional;

/**
 * @author dongh38@ziroom.com
 * @version 1.0.0
 */
public interface ConfigurationRepository extends CrudRepository<Configuration, String> {

    Optional<Configuration> findByAppIdAndKeyName(String appId,String keyName);

    Optional<List<Configuration>> findByAppId(String appId);

    Long deleteByAppId(String appId);

}
