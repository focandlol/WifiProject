package org.example.wifiproject.dto;

import lombok.*;

@AllArgsConstructor
@Getter
@Setter
@Builder
@ToString
public class WifiDto {
    private Integer wifiId;
    private String xSwifiMgrNo;
    private String xSwifiWrdofc;
    private String xSwifiMainNm;
    private String xSwifiAdres1;
    private String xSwifiAdres2;
    private String xSwifiInstlFloor;
    private String xSwifiInstlTy;
    private String xSwifiInstlMby;
    private String xSwifiSvcSe;
    private String xSwifiCmcwr;
    private String xSwifiCnstcYear;
    private String xSwifiInoutDoor;
    private String xSwifiRemars3;
    private Double lat;
    private Double lnt;
    private String workDttm;
    private Double distance;


}
