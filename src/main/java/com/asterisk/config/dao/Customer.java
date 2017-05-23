package com.asterisk.config.dao;

import lombok.*;
import org.springframework.data.cassandra.mapping.PrimaryKey;
import org.springframework.data.cassandra.mapping.Table;

import java.util.UUID;

/**
 * @author dongh38@ziroom.com
 * @version 1.0.0
 */
@Table
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
public class Customer {

    @PrimaryKey
    private UUID id;

    private String firstName;

    private String lastName;

}
