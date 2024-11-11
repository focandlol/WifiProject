package org.example.wifiproject.dto;

import lombok.*;

@AllArgsConstructor
@Getter
@Setter
@Builder
public class AddBookmarkGroupSubmitDto {
    private String groupName;
    private Integer sequence;
}
