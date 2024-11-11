package org.example.wifiproject.dto;

import lombok.*;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@Builder
public class AddBookmarkSubmitDto {
    private Integer bookmarkId;
    private Integer wifiId;
}
