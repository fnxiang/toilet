package cn.edu.bjtu.toilet.domain.dto;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class CompanyDTO {

    private String companyName;

    private String contactPhone;

    private String companyAddress;
}
