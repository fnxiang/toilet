package cn.edu.bjtu.toilet.dao.model;

import lombok.Data;

@Data
public class PageRequest {
    private Integer pageSize=20;
    private Integer pageIndex=1;
//    设置默认值
    private Boolean isDesc;
    private String sortBy;

    public void setPageSize(Integer pageSize) {
        if (pageSize == null || pageSize <= 0) {
            this.pageSize = 20;
        } else {
            this.pageSize = pageSize;
        }
    }

    public void setPageIndex(Integer index) {
        if (index == null || index<=0) {
            this.pageIndex = 1;
        } else {
            this.pageIndex = index;
        }
    }

    public int getOffset() {
        return (pageIndex - 1) * pageSize;
    }

    public int getLimit() {return pageSize;}

    public String getSortDirection() {
        return isDesc?"DESC":"ASC";
    }
}
