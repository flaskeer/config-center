package com.asterisk.config.entity;

import lombok.*;
import org.springframework.data.cassandra.mapping.PrimaryKey;

import java.util.UUID;

/**
 * @author dongh38@ziroom.com
 * @version 1.0.0
 */
@Getter
@Setter
@Builder
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class Configuration {

    @PrimaryKey
    private UUID id;

    private String appId;

    private String keyName;

    private String valueData;

    private String description;
}
