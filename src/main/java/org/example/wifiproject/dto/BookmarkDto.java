package org.example.wifiproject.dto;

import lombok.*;

import java.time.LocalDateTime;

@AllArgsConstructor
@Getter
@Setter
@Builder
public class BookmarkDto {

    private Integer bookmarkId;
    private String groupName;
    private String wifiName;
    private Integer wifiId;
    private LocalDateTime created;
}
