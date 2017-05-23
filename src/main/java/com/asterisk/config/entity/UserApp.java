package com.asterisk.config.entity;

import lombok.*;
import org.springframework.data.cassandra.mapping.PrimaryKey;

import java.util.UUID;

/**
 * @author dongh38@ziroom.com
 * @version 1.0.0
 */
@Setter
@Getter
@Builder
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class UserApp {

    @PrimaryKey
    private UUID id;

    private Long userId;

    private String username;

    private String appId;

    private String keyRole;


}
