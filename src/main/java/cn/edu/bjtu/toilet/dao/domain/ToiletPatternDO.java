package cn.edu.bjtu.toilet.dao.domain;

import java.io.Serializable;
import java.util.Date;

public class ToiletPatternDO implements Serializable {
    private Integer id;

    private Date gmtCreate;

    private Date gmtModified;

    private String productType;

    private String modeType;

    private Integer version;

    private Boolean deleted;

    private String source;

    private String attributes;

    private String envConditions;

    private String humanFactors;

    private String pipNetworkConditions;

    private String resourceUtilization;

    private static final long serialVersionUID = 1L;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Date getGmtCreate() {
        return gmtCreate;
    }

    public void setGmtCreate(Date gmtCreate) {
        this.gmtCreate = gmtCreate;
    }

    public Date getGmtModified() {
        return gmtModified;
    }

    public void setGmtModified(Date gmtModified) {
        this.gmtModified = gmtModified;
    }

    public String getProductType() {
        return productType;
    }

    public void setProductType(String productType) {
        this.productType = productType == null ? null : productType.trim();
    }

    public String getModeType() {
        return modeType;
    }

    public void setModeType(String modeType) {
        this.modeType = modeType == null ? null : modeType.trim();
    }

    public Integer getVersion() {
        return version;
    }

    public void setVersion(Integer version) {
        this.version = version;
    }

    public Boolean getDeleted() {
        return deleted;
    }

    public void setDeleted(Boolean deleted) {
        this.deleted = deleted;
    }

    public String getSource() {
        return source;
    }

    public void setSource(String source) {
        this.source = source == null ? null : source.trim();
    }

    public String getAttributes() {
        return attributes;
    }

    public void setAttributes(String attributes) {
        this.attributes = attributes == null ? null : attributes.trim();
    }

    public String getEnvConditions() {
        return envConditions;
    }

    public void setEnvConditions(String envConditions) {
        this.envConditions = envConditions == null ? null : envConditions.trim();
    }

    public String getHumanFactors() {
        return humanFactors;
    }

    public void setHumanFactors(String humanFactors) {
        this.humanFactors = humanFactors == null ? null : humanFactors.trim();
    }

    public String getPipNetworkConditions() {
        return pipNetworkConditions;
    }

    public void setPipNetworkConditions(String pipNetworkConditions) {
        this.pipNetworkConditions = pipNetworkConditions == null ? null : pipNetworkConditions.trim();
    }

    public String getResourceUtilization() {
        return resourceUtilization;
    }

    public void setResourceUtilization(String resourceUtilization) {
        this.resourceUtilization = resourceUtilization == null ? null : resourceUtilization.trim();
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", id=").append(id);
        sb.append(", gmtCreate=").append(gmtCreate);
        sb.append(", gmtModified=").append(gmtModified);
        sb.append(", productType=").append(productType);
        sb.append(", modeType=").append(modeType);
        sb.append(", version=").append(version);
        sb.append(", deleted=").append(deleted);
        sb.append(", source=").append(source);
        sb.append(", attributes=").append(attributes);
        sb.append(", envConditions=").append(envConditions);
        sb.append(", humanFactors=").append(humanFactors);
        sb.append(", pipNetworkConditions=").append(pipNetworkConditions);
        sb.append(", resourceUtilization=").append(resourceUtilization);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }
}