package cn.edu.bjtu.toilet.domain.dto;

import lombok.Data;

@Data
public class EnvConditionsDTO {
    private String temperature;

    private String waterResource;

    private String terrain;

    private String geolocation;

    private String ecotope;
}
