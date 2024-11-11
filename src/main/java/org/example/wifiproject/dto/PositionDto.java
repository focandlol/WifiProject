package org.example.wifiproject.dto;

import lombok.*;

@AllArgsConstructor
@Getter
@Setter
@Builder
public class PositionDto {
    private Double lat;
    private Double lnt;
}
