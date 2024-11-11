package org.example.wifiproject.dto;

import lombok.*;

import java.time.LocalDateTime;

@AllArgsConstructor
@Getter
@Setter
@Builder
public class BookmarkGroupDto {
    private Integer groupId;
    private String groupName;
    private Integer sequence;
    private LocalDateTime created;
    private LocalDateTime modified;
}
