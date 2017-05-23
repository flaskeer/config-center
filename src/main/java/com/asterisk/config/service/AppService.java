package com.asterisk.config.service;

import com.asterisk.config.entity.App;
import com.asterisk.config.entity.UserApp;
import com.asterisk.config.repository.AppRepository;
import com.asterisk.config.repository.UserAppRepository;
import com.asterisk.config.util.IdGenerator;
import com.datastax.driver.core.utils.UUIDs;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author dongh38@ziroom.com
 * @version 1.0.0
 */
@Service
@Slf4j
public class AppService {

    @Autowired
    private AppRepository appRepository;


    @Autowired
    private UserAppRepository userAppRepository;

    public boolean existApp(String appId,String userId) {
        return userAppRepository.findByAppIdAndUserId(appId,userId).isPresent();
    }

    public void addApp(String appName) {
        App app = App.builder().appName(appName).id(UUIDs.timeBased()).appId(IdGenerator.idGenerator(appName)).build();
        appRepository.save(app);
        log.info("create app:{}",app);
    }



}
