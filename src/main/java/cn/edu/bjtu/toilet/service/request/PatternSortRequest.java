package cn.edu.bjtu.toilet.service.request;

import lombok.Data;

import java.util.List;

@Data
public class PatternSortRequest {

    private String sortBy;

    private Boolean isDesc;

    private Integer pageIndex;

    private Integer pageSize;

    private List<Integer> patternIds;
}
