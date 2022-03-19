package cn.edu.bjtu.toilet.dao.domain;

import java.io.Serializable;
import java.util.Date;

public class UserDO implements Serializable {
    private Integer id;

    private Date gmtCreate;

    private Date gmtModified;

    private String comanyName;

    private String creditCode;

    private String businessLicenseFilePath;

    private String enterpriseAddress;

    private String email;

    private String officalSite;

    private String contactName;

    private String country;

    private String contactPhone;

    private String password;

    private Integer version;

    private Boolean deleted;

    private String source;

    private Integer role;

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

    public String getComanyName() {
        return comanyName;
    }

    public void setComanyName(String comanyName) {
        this.comanyName = comanyName == null ? null : comanyName.trim();
    }

    public String getCreditCode() {
        return creditCode;
    }

    public void setCreditCode(String creditCode) {
        this.creditCode = creditCode == null ? null : creditCode.trim();
    }

    public String getBusinessLicenseFilePath() {
        return businessLicenseFilePath;
    }

    public void setBusinessLicenseFilePath(String businessLicenseFilePath) {
        this.businessLicenseFilePath = businessLicenseFilePath == null ? null : businessLicenseFilePath.trim();
    }

    public String getEnterpriseAddress() {
        return enterpriseAddress;
    }

    public void setEnterpriseAddress(String enterpriseAddress) {
        this.enterpriseAddress = enterpriseAddress == null ? null : enterpriseAddress.trim();
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email == null ? null : email.trim();
    }

    public String getOfficalSite() {
        return officalSite;
    }

    public void setOfficalSite(String officalSite) {
        this.officalSite = officalSite == null ? null : officalSite.trim();
    }

    public String getContactName() {
        return contactName;
    }

    public void setContactName(String contactName) {
        this.contactName = contactName == null ? null : contactName.trim();
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country == null ? null : country.trim();
    }

    public String getContactPhone() {
        return contactPhone;
    }

    public void setContactPhone(String contactPhone) {
        this.contactPhone = contactPhone == null ? null : contactPhone.trim();
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password == null ? null : password.trim();
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

    public Integer getRole() {
        return role;
    }

    public void setRole(Integer role) {
        this.role = role;
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
        sb.append(", comanyName=").append(comanyName);
        sb.append(", creditCode=").append(creditCode);
        sb.append(", businessLicenseFilePath=").append(businessLicenseFilePath);
        sb.append(", enterpriseAddress=").append(enterpriseAddress);
        sb.append(", email=").append(email);
        sb.append(", officalSite=").append(officalSite);
        sb.append(", contactName=").append(contactName);
        sb.append(", country=").append(country);
        sb.append(", contactPhone=").append(contactPhone);
        sb.append(", password=").append(password);
        sb.append(", version=").append(version);
        sb.append(", deleted=").append(deleted);
        sb.append(", source=").append(source);
        sb.append(", role=").append(role);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }
}