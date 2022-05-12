package cn.edu.bjtu.toilet.dao.model;

import lombok.Data;
import org.springframework.util.StringUtils;

@Data
public class PageRequest {
    private Integer pageSize=12;
    private Integer pageIndex=1;
//    设置默认值
    private Boolean isDesc=false;
    private String sortBy;

    public void setPageSize(Integer pageSize) {
        if (pageSize == null || pageSize <= 0) {
            this.pageSize = 12;
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

    public void setSortBy(String value) {
        if (!StringUtils.isEmpty(value)) {
            this.sortBy = value;
        } else {
            this.sortBy = "id";
        }

    }

    public void setIsDesc(Boolean isDesc) {
        if (isDesc != null) {
            this.isDesc = isDesc;
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
