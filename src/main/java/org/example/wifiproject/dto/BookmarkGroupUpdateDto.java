package org.example.wifiproject.dto;

import lombok.*;

@AllArgsConstructor
@Getter
@Setter
@Builder
public class BookmarkGroupUpdateDto {
    private Integer groupId;
    private String groupName;
    private Integer sequence;
}
