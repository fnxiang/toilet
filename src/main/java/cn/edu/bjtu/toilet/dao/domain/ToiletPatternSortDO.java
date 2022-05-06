package cn.edu.bjtu.toilet.dao.domain;

import java.io.Serializable;
import java.util.Date;

public class ToiletPatternSortDO implements Serializable {
    private Integer id;

    private Date gmtCreate;

    private Date gmtModified;

    private Integer waterSaveScore;

    private Integer techApplicabilityScore;

    private Integer techCostScore;

    private Integer resourceUtilizationScore;

    private Integer sanitationScore;

    private Integer convenienceScore;

    private Double comprehensiveScore;

    private Integer patternId;

    private String purpose;

    private Integer version;

    private String source;

    private Boolean deleted;

    private String attribute;

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

    public Integer getWaterSaveScore() {
        return waterSaveScore;
    }

    public void setWaterSaveScore(Integer waterSaveScore) {
        this.waterSaveScore = waterSaveScore;
    }

    public Integer getTechApplicabilityScore() {
        return techApplicabilityScore;
    }

    public void setTechApplicabilityScore(Integer techApplicabilityScore) {
        this.techApplicabilityScore = techApplicabilityScore;
    }

    public Integer getTechCostScore() {
        return techCostScore;
    }

    public void setTechCostScore(Integer techCostScore) {
        this.techCostScore = techCostScore;
    }

    public Integer getResourceUtilizationScore() {
        return resourceUtilizationScore;
    }

    public void setResourceUtilizationScore(Integer resourceUtilizationScore) {
        this.resourceUtilizationScore = resourceUtilizationScore;
    }

    public Integer getSanitationScore() {
        return sanitationScore;
    }

    public void setSanitationScore(Integer sanitationScore) {
        this.sanitationScore = sanitationScore;
    }

    public Integer getConvenienceScore() {
        return convenienceScore;
    }

    public void setConvenienceScore(Integer convenienceScore) {
        this.convenienceScore = convenienceScore;
    }

    public Double getComprehensiveScore() {
        return comprehensiveScore;
    }

    public void setComprehensiveScore(Double comprehensiveScore) {
        this.comprehensiveScore = comprehensiveScore;
    }

    public Integer getPatternId() {
        return patternId;
    }

    public void setPatternId(Integer patternId) {
        this.patternId = patternId;
    }

    public String getPurpose() {
        return purpose;
    }

    public void setPurpose(String purpose) {
        this.purpose = purpose == null ? null : purpose.trim();
    }

    public Integer getVersion() {
        return version;
    }

    public void setVersion(Integer version) {
        this.version = version;
    }

    public String getSource() {
        return source;
    }

    public void setSource(String source) {
        this.source = source == null ? null : source.trim();
    }

    public Boolean getDeleted() {
        return deleted;
    }

    public void setDeleted(Boolean deleted) {
        this.deleted = deleted;
    }

    public String getAttribute() {
        return attribute;
    }

    public void setAttribute(String attribute) {
        this.attribute = attribute == null ? null : attribute.trim();
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
        sb.append(", waterSaveScore=").append(waterSaveScore);
        sb.append(", techApplicabilityScore=").append(techApplicabilityScore);
        sb.append(", techCostScore=").append(techCostScore);
        sb.append(", resourceUtilizationScore=").append(resourceUtilizationScore);
        sb.append(", sanitationScore=").append(sanitationScore);
        sb.append(", convenienceScore=").append(convenienceScore);
        sb.append(", comprehensiveScore=").append(comprehensiveScore);
        sb.append(", patternId=").append(patternId);
        sb.append(", purpose=").append(purpose);
        sb.append(", version=").append(version);
        sb.append(", source=").append(source);
        sb.append(", deleted=").append(deleted);
        sb.append(", attribute=").append(attribute);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }
}