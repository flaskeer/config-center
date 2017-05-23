package com.asterisk.config.service;

import com.asterisk.config.repository.AppRepository;
import com.asterisk.config.repository.UserAppRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author dongh38@ziroom.com
 * @version 1.0.0
 */
@Service
public class AppService {

    @Autowired
    private AppRepository appRepository;


    @Autowired
    private UserAppRepository userAppRepository;


}
