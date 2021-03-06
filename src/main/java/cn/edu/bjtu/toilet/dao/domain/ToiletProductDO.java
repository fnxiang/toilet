package cn.edu.bjtu.toilet.dao.domain;

import org.springframework.util.StringUtils;

import java.io.Serializable;
import java.util.Date;

public class ToiletProductDO implements Serializable {
    private Integer id;

    private Date gmtCreate;

    private Date gmtModified;

    private String productName;

    private Integer status;

    private String manufacturerName;

    private String manufacturerCell;

    private String productType;

    private String patternType;

    private String patternId;

    private String patternName;

    private String companyEmail;

    private String applicableProvince;

    private String applicableTemperature;

    private Integer professorId;

    private String professorEmail;

    private Integer version;

    private Boolean deleted;

    private String source;

    private String attributes;

    private Integer patternSortId;

    private Double price;

    private Integer cleanCycle;

    private Integer serviceLife;

    private String productTheory;

    private String params;

    private String applicableCondition;

    private String purpose;

    private String productParameters;

    private String qualityAssuranceMaterialsFilePath;

    private String instructionFilePath;

    private String productFeatures;

    private String picsPath;

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

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName == null ? null : productName.trim();
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public String getManufacturerName() {
        return manufacturerName;
    }

    public void setManufacturerName(String manufacturerName) {
        this.manufacturerName = manufacturerName == null ? null : manufacturerName.trim();
    }

    public String getManufacturerCell() {
        return manufacturerCell;
    }

    public void setManufacturerCell(String manufacturerCell) {
        this.manufacturerCell = manufacturerCell == null ? null : manufacturerCell.trim();
    }

    public String getProductType() {
        return productType;
    }

    public void setProductType(String productType) {
        this.productType = productType == null ? null : productType.trim();
    }

    public String getPatternType() {
        return patternType;
    }

    public void setPatternType(String patternType) {
        this.patternType = patternType == null ? null : patternType.trim();
    }

    public String getPatternId() {
        return patternId;
    }

    public void setPatternId(String patternId) {
        this.patternId = patternId == null ? null : patternId.trim();
    }

    public void appendPatternId(Integer patternId) {
        if (StringUtils.isEmpty(this.patternId)) {
            this.patternId = ";" + patternId.toString() + ";";
        } else if (!this.patternId.contains(patternId.toString())){
            this.patternId = this.patternId + patternId.toString() + ";";
        }
    }

    public String getPatternName() {
        return patternName;
    }

    public void setPatternName(String patternName) {
        this.patternName = patternName == null ? null : patternName.trim();
    }

    public String getCompanyEmail() {
        return companyEmail;
    }

    public void setCompanyEmail(String companyEmail) {
        this.companyEmail = companyEmail == null ? null : companyEmail.trim();
    }

    public String getApplicableProvince() {
        return applicableProvince;
    }

    public void setApplicableProvince(String applicableProvince) {
        this.applicableProvince = applicableProvince == null ? null : applicableProvince.trim();
    }

    public String getApplicableTemperature() {
        return applicableTemperature;
    }

    public void setApplicableTemperature(String applicableTemperature) {
        this.applicableTemperature = applicableTemperature == null ? null : applicableTemperature.trim();
    }

    public Integer getProfessorId() {
        return professorId;
    }

    public void setProfessorId(Integer professorId) {
        this.professorId = professorId;
    }

    public String getProfessorEmail() {
        return professorEmail;
    }

    public void setProfessorEmail(String professorEmail) {
        this.professorEmail = professorEmail == null ? null : professorEmail.trim();
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

    public Integer getPatternSortId() {
        return patternSortId;
    }

    public void setPatternSortId(Integer patternSortId) {
        this.patternSortId = patternSortId;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public Integer getCleanCycle() {
        return cleanCycle;
    }

    public void setCleanCycle(Integer cleanCycle) {
        this.cleanCycle = cleanCycle;
    }

    public Integer getServiceLife() {
        return serviceLife;
    }

    public void setServiceLife(Integer serviceLife) {
        this.serviceLife = serviceLife;
    }

    public String getProductTheory() {
        return productTheory;
    }

    public void setProductTheory(String productTheory) {
        this.productTheory = productTheory == null ? null : productTheory.trim();
    }

    public String getParams() {
        return params;
    }

    public void setParams(String params) {
        this.params = params == null ? null : params.trim();
    }

    public String getApplicableCondition() {
        return applicableCondition;
    }

    public void setApplicableCondition(String applicableCondition) {
        this.applicableCondition = applicableCondition == null ? null : applicableCondition.trim();
    }

    public String getPurpose() {
        return purpose;
    }

    public void setPurpose(String purpose) {
        this.purpose = purpose == null ? null : purpose.trim();
    }

    public String getProductParameters() {
        return productParameters;
    }

    public void setProductParameters(String productParameters) {
        this.productParameters = productParameters == null ? null : productParameters.trim();
    }

    public String getQualityAssuranceMaterialsFilePath() {
        return qualityAssuranceMaterialsFilePath;
    }

    public void setQualityAssuranceMaterialsFilePath(String qualityAssuranceMaterialsFilePath) {
        this.qualityAssuranceMaterialsFilePath = qualityAssuranceMaterialsFilePath == null ? null : qualityAssuranceMaterialsFilePath.trim();
    }

    public String getInstructionFilePath() {
        return instructionFilePath;
    }

    public void setInstructionFilePath(String instructionFilePath) {
        this.instructionFilePath = instructionFilePath == null ? null : instructionFilePath.trim();
    }

    public String getProductFeatures() {
        return productFeatures;
    }

    public void setProductFeatures(String productFeatures) {
        this.productFeatures = productFeatures == null ? null : productFeatures.trim();
    }

    public String getPicsPath() {
        return picsPath;
    }

    public void setPicsPath(String picsPath) {
        this.picsPath = picsPath == null ? null : picsPath.trim();
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
        sb.append(", productName=").append(productName);
        sb.append(", status=").append(status);
        sb.append(", manufacturerName=").append(manufacturerName);
        sb.append(", manufacturerCell=").append(manufacturerCell);
        sb.append(", productType=").append(productType);
        sb.append(", patternType=").append(patternType);
        sb.append(", patternId=").append(patternId);
        sb.append(", patternName=").append(patternName);
        sb.append(", companyEmail=").append(companyEmail);
        sb.append(", applicableProvince=").append(applicableProvince);
        sb.append(", applicableTemperature=").append(applicableTemperature);
        sb.append(", professorId=").append(professorId);
        sb.append(", professorEmail=").append(professorEmail);
        sb.append(", version=").append(version);
        sb.append(", deleted=").append(deleted);
        sb.append(", source=").append(source);
        sb.append(", attributes=").append(attributes);
        sb.append(", patternSortId=").append(patternSortId);
        sb.append(", price=").append(price);
        sb.append(", cleanCycle=").append(cleanCycle);
        sb.append(", serviceLife=").append(serviceLife);
        sb.append(", productTheory=").append(productTheory);
        sb.append(", params=").append(params);
        sb.append(", applicableCondition=").append(applicableCondition);
        sb.append(", purpose=").append(purpose);
        sb.append(", productParameters=").append(productParameters);
        sb.append(", qualityAssuranceMaterialsFilePath=").append(qualityAssuranceMaterialsFilePath);
        sb.append(", instructionFilePath=").append(instructionFilePath);
        sb.append(", productFeatures=").append(productFeatures);
        sb.append(", picsPath=").append(picsPath);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }
}