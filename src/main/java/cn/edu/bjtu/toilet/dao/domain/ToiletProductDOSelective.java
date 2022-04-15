package cn.edu.bjtu.toilet.dao.domain;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class ToiletProductDOSelective {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public ToiletProductDOSelective() {
        oredCriteria = new ArrayList<Criteria>();
    }

    public void setOrderByClause(String orderByClause) {
        this.orderByClause = orderByClause;
    }

    public String getOrderByClause() {
        return orderByClause;
    }

    public void setDistinct(boolean distinct) {
        this.distinct = distinct;
    }

    public boolean isDistinct() {
        return distinct;
    }

    public List<Criteria> getOredCriteria() {
        return oredCriteria;
    }

    public void or(Criteria criteria) {
        oredCriteria.add(criteria);
    }

    public Criteria or() {
        Criteria criteria = createCriteriaInternal();
        oredCriteria.add(criteria);
        return criteria;
    }

    public Criteria createCriteria() {
        Criteria criteria = createCriteriaInternal();
        if (oredCriteria.size() == 0) {
            oredCriteria.add(criteria);
        }
        return criteria;
    }

    protected Criteria createCriteriaInternal() {
        Criteria criteria = new Criteria();
        return criteria;
    }

    public void clear() {
        oredCriteria.clear();
        orderByClause = null;
        distinct = false;
    }

    protected abstract static class GeneratedCriteria {
        protected List<Criterion> criteria;

        protected GeneratedCriteria() {
            super();
            criteria = new ArrayList<Criterion>();
        }

        public boolean isValid() {
            return criteria.size() > 0;
        }

        public List<Criterion> getAllCriteria() {
            return criteria;
        }

        public List<Criterion> getCriteria() {
            return criteria;
        }

        protected void addCriterion(String condition) {
            if (condition == null) {
                throw new RuntimeException("Value for condition cannot be null");
            }
            criteria.add(new Criterion(condition));
        }

        protected void addCriterion(String condition, Object value, String property) {
            if (value == null) {
                throw new RuntimeException("Value for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value));
        }

        protected void addCriterion(String condition, Object value1, Object value2, String property) {
            if (value1 == null || value2 == null) {
                throw new RuntimeException("Between values for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value1, value2));
        }

        public Criteria andIdIsNull() {
            addCriterion("id is null");
            return (Criteria) this;
        }

        public Criteria andIdIsNotNull() {
            addCriterion("id is not null");
            return (Criteria) this;
        }

        public Criteria andIdEqualTo(Integer value) {
            addCriterion("id =", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotEqualTo(Integer value) {
            addCriterion("id <>", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdGreaterThan(Integer value) {
            addCriterion("id >", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdGreaterThanOrEqualTo(Integer value) {
            addCriterion("id >=", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdLessThan(Integer value) {
            addCriterion("id <", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdLessThanOrEqualTo(Integer value) {
            addCriterion("id <=", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdIn(List<Integer> values) {
            addCriterion("id in", values, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotIn(List<Integer> values) {
            addCriterion("id not in", values, "id");
            return (Criteria) this;
        }

        public Criteria andIdBetween(Integer value1, Integer value2) {
            addCriterion("id between", value1, value2, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotBetween(Integer value1, Integer value2) {
            addCriterion("id not between", value1, value2, "id");
            return (Criteria) this;
        }

        public Criteria andGmtCreateIsNull() {
            addCriterion("gmt_create is null");
            return (Criteria) this;
        }

        public Criteria andGmtCreateIsNotNull() {
            addCriterion("gmt_create is not null");
            return (Criteria) this;
        }

        public Criteria andGmtCreateEqualTo(Date value) {
            addCriterion("gmt_create =", value, "gmtCreate");
            return (Criteria) this;
        }

        public Criteria andGmtCreateNotEqualTo(Date value) {
            addCriterion("gmt_create <>", value, "gmtCreate");
            return (Criteria) this;
        }

        public Criteria andGmtCreateGreaterThan(Date value) {
            addCriterion("gmt_create >", value, "gmtCreate");
            return (Criteria) this;
        }

        public Criteria andGmtCreateGreaterThanOrEqualTo(Date value) {
            addCriterion("gmt_create >=", value, "gmtCreate");
            return (Criteria) this;
        }

        public Criteria andGmtCreateLessThan(Date value) {
            addCriterion("gmt_create <", value, "gmtCreate");
            return (Criteria) this;
        }

        public Criteria andGmtCreateLessThanOrEqualTo(Date value) {
            addCriterion("gmt_create <=", value, "gmtCreate");
            return (Criteria) this;
        }

        public Criteria andGmtCreateIn(List<Date> values) {
            addCriterion("gmt_create in", values, "gmtCreate");
            return (Criteria) this;
        }

        public Criteria andGmtCreateNotIn(List<Date> values) {
            addCriterion("gmt_create not in", values, "gmtCreate");
            return (Criteria) this;
        }

        public Criteria andGmtCreateBetween(Date value1, Date value2) {
            addCriterion("gmt_create between", value1, value2, "gmtCreate");
            return (Criteria) this;
        }

        public Criteria andGmtCreateNotBetween(Date value1, Date value2) {
            addCriterion("gmt_create not between", value1, value2, "gmtCreate");
            return (Criteria) this;
        }

        public Criteria andGmtModifiedIsNull() {
            addCriterion("gmt_modified is null");
            return (Criteria) this;
        }

        public Criteria andGmtModifiedIsNotNull() {
            addCriterion("gmt_modified is not null");
            return (Criteria) this;
        }

        public Criteria andGmtModifiedEqualTo(Date value) {
            addCriterion("gmt_modified =", value, "gmtModified");
            return (Criteria) this;
        }

        public Criteria andGmtModifiedNotEqualTo(Date value) {
            addCriterion("gmt_modified <>", value, "gmtModified");
            return (Criteria) this;
        }

        public Criteria andGmtModifiedGreaterThan(Date value) {
            addCriterion("gmt_modified >", value, "gmtModified");
            return (Criteria) this;
        }

        public Criteria andGmtModifiedGreaterThanOrEqualTo(Date value) {
            addCriterion("gmt_modified >=", value, "gmtModified");
            return (Criteria) this;
        }

        public Criteria andGmtModifiedLessThan(Date value) {
            addCriterion("gmt_modified <", value, "gmtModified");
            return (Criteria) this;
        }

        public Criteria andGmtModifiedLessThanOrEqualTo(Date value) {
            addCriterion("gmt_modified <=", value, "gmtModified");
            return (Criteria) this;
        }

        public Criteria andGmtModifiedIn(List<Date> values) {
            addCriterion("gmt_modified in", values, "gmtModified");
            return (Criteria) this;
        }

        public Criteria andGmtModifiedNotIn(List<Date> values) {
            addCriterion("gmt_modified not in", values, "gmtModified");
            return (Criteria) this;
        }

        public Criteria andGmtModifiedBetween(Date value1, Date value2) {
            addCriterion("gmt_modified between", value1, value2, "gmtModified");
            return (Criteria) this;
        }

        public Criteria andGmtModifiedNotBetween(Date value1, Date value2) {
            addCriterion("gmt_modified not between", value1, value2, "gmtModified");
            return (Criteria) this;
        }

        public Criteria andProductNameIsNull() {
            addCriterion("product_name is null");
            return (Criteria) this;
        }

        public Criteria andProductNameIsNotNull() {
            addCriterion("product_name is not null");
            return (Criteria) this;
        }

        public Criteria andProductNameEqualTo(String value) {
            addCriterion("product_name =", value, "productName");
            return (Criteria) this;
        }

        public Criteria andProductNameNotEqualTo(String value) {
            addCriterion("product_name <>", value, "productName");
            return (Criteria) this;
        }

        public Criteria andProductNameGreaterThan(String value) {
            addCriterion("product_name >", value, "productName");
            return (Criteria) this;
        }

        public Criteria andProductNameGreaterThanOrEqualTo(String value) {
            addCriterion("product_name >=", value, "productName");
            return (Criteria) this;
        }

        public Criteria andProductNameLessThan(String value) {
            addCriterion("product_name <", value, "productName");
            return (Criteria) this;
        }

        public Criteria andProductNameLessThanOrEqualTo(String value) {
            addCriterion("product_name <=", value, "productName");
            return (Criteria) this;
        }

        public Criteria andProductNameLike(String value) {
            addCriterion("product_name like", value, "productName");
            return (Criteria) this;
        }

        public Criteria andProductNameNotLike(String value) {
            addCriterion("product_name not like", value, "productName");
            return (Criteria) this;
        }

        public Criteria andProductNameIn(List<String> values) {
            addCriterion("product_name in", values, "productName");
            return (Criteria) this;
        }

        public Criteria andProductNameNotIn(List<String> values) {
            addCriterion("product_name not in", values, "productName");
            return (Criteria) this;
        }

        public Criteria andProductNameBetween(String value1, String value2) {
            addCriterion("product_name between", value1, value2, "productName");
            return (Criteria) this;
        }

        public Criteria andProductNameNotBetween(String value1, String value2) {
            addCriterion("product_name not between", value1, value2, "productName");
            return (Criteria) this;
        }

        public Criteria andStatusIsNull() {
            addCriterion("status is null");
            return (Criteria) this;
        }

        public Criteria andStatusIsNotNull() {
            addCriterion("status is not null");
            return (Criteria) this;
        }

        public Criteria andStatusEqualTo(Integer value) {
            addCriterion("status =", value, "status");
            return (Criteria) this;
        }

        public Criteria andStatusNotEqualTo(Integer value) {
            addCriterion("status <>", value, "status");
            return (Criteria) this;
        }

        public Criteria andStatusGreaterThan(Integer value) {
            addCriterion("status >", value, "status");
            return (Criteria) this;
        }

        public Criteria andStatusGreaterThanOrEqualTo(Integer value) {
            addCriterion("status >=", value, "status");
            return (Criteria) this;
        }

        public Criteria andStatusLessThan(Integer value) {
            addCriterion("status <", value, "status");
            return (Criteria) this;
        }

        public Criteria andStatusLessThanOrEqualTo(Integer value) {
            addCriterion("status <=", value, "status");
            return (Criteria) this;
        }

        public Criteria andStatusIn(List<Integer> values) {
            addCriterion("status in", values, "status");
            return (Criteria) this;
        }

        public Criteria andStatusNotIn(List<Integer> values) {
            addCriterion("status not in", values, "status");
            return (Criteria) this;
        }

        public Criteria andStatusBetween(Integer value1, Integer value2) {
            addCriterion("status between", value1, value2, "status");
            return (Criteria) this;
        }

        public Criteria andStatusNotBetween(Integer value1, Integer value2) {
            addCriterion("status not between", value1, value2, "status");
            return (Criteria) this;
        }

        public Criteria andManufacturerNameIsNull() {
            addCriterion("manufacturer_name is null");
            return (Criteria) this;
        }

        public Criteria andManufacturerNameIsNotNull() {
            addCriterion("manufacturer_name is not null");
            return (Criteria) this;
        }

        public Criteria andManufacturerNameEqualTo(String value) {
            addCriterion("manufacturer_name =", value, "manufacturerName");
            return (Criteria) this;
        }

        public Criteria andManufacturerNameNotEqualTo(String value) {
            addCriterion("manufacturer_name <>", value, "manufacturerName");
            return (Criteria) this;
        }

        public Criteria andManufacturerNameGreaterThan(String value) {
            addCriterion("manufacturer_name >", value, "manufacturerName");
            return (Criteria) this;
        }

        public Criteria andManufacturerNameGreaterThanOrEqualTo(String value) {
            addCriterion("manufacturer_name >=", value, "manufacturerName");
            return (Criteria) this;
        }

        public Criteria andManufacturerNameLessThan(String value) {
            addCriterion("manufacturer_name <", value, "manufacturerName");
            return (Criteria) this;
        }

        public Criteria andManufacturerNameLessThanOrEqualTo(String value) {
            addCriterion("manufacturer_name <=", value, "manufacturerName");
            return (Criteria) this;
        }

        public Criteria andManufacturerNameLike(String value) {
            addCriterion("manufacturer_name like", value, "manufacturerName");
            return (Criteria) this;
        }

        public Criteria andManufacturerNameNotLike(String value) {
            addCriterion("manufacturer_name not like", value, "manufacturerName");
            return (Criteria) this;
        }

        public Criteria andManufacturerNameIn(List<String> values) {
            addCriterion("manufacturer_name in", values, "manufacturerName");
            return (Criteria) this;
        }

        public Criteria andManufacturerNameNotIn(List<String> values) {
            addCriterion("manufacturer_name not in", values, "manufacturerName");
            return (Criteria) this;
        }

        public Criteria andManufacturerNameBetween(String value1, String value2) {
            addCriterion("manufacturer_name between", value1, value2, "manufacturerName");
            return (Criteria) this;
        }

        public Criteria andManufacturerNameNotBetween(String value1, String value2) {
            addCriterion("manufacturer_name not between", value1, value2, "manufacturerName");
            return (Criteria) this;
        }

        public Criteria andManufacturerCellIsNull() {
            addCriterion("manufacturer_cell is null");
            return (Criteria) this;
        }

        public Criteria andManufacturerCellIsNotNull() {
            addCriterion("manufacturer_cell is not null");
            return (Criteria) this;
        }

        public Criteria andManufacturerCellEqualTo(String value) {
            addCriterion("manufacturer_cell =", value, "manufacturerCell");
            return (Criteria) this;
        }

        public Criteria andManufacturerCellNotEqualTo(String value) {
            addCriterion("manufacturer_cell <>", value, "manufacturerCell");
            return (Criteria) this;
        }

        public Criteria andManufacturerCellGreaterThan(String value) {
            addCriterion("manufacturer_cell >", value, "manufacturerCell");
            return (Criteria) this;
        }

        public Criteria andManufacturerCellGreaterThanOrEqualTo(String value) {
            addCriterion("manufacturer_cell >=", value, "manufacturerCell");
            return (Criteria) this;
        }

        public Criteria andManufacturerCellLessThan(String value) {
            addCriterion("manufacturer_cell <", value, "manufacturerCell");
            return (Criteria) this;
        }

        public Criteria andManufacturerCellLessThanOrEqualTo(String value) {
            addCriterion("manufacturer_cell <=", value, "manufacturerCell");
            return (Criteria) this;
        }

        public Criteria andManufacturerCellLike(String value) {
            addCriterion("manufacturer_cell like", value, "manufacturerCell");
            return (Criteria) this;
        }

        public Criteria andManufacturerCellNotLike(String value) {
            addCriterion("manufacturer_cell not like", value, "manufacturerCell");
            return (Criteria) this;
        }

        public Criteria andManufacturerCellIn(List<String> values) {
            addCriterion("manufacturer_cell in", values, "manufacturerCell");
            return (Criteria) this;
        }

        public Criteria andManufacturerCellNotIn(List<String> values) {
            addCriterion("manufacturer_cell not in", values, "manufacturerCell");
            return (Criteria) this;
        }

        public Criteria andManufacturerCellBetween(String value1, String value2) {
            addCriterion("manufacturer_cell between", value1, value2, "manufacturerCell");
            return (Criteria) this;
        }

        public Criteria andManufacturerCellNotBetween(String value1, String value2) {
            addCriterion("manufacturer_cell not between", value1, value2, "manufacturerCell");
            return (Criteria) this;
        }

        public Criteria andProductTypeIsNull() {
            addCriterion("product_type is null");
            return (Criteria) this;
        }

        public Criteria andProductTypeIsNotNull() {
            addCriterion("product_type is not null");
            return (Criteria) this;
        }

        public Criteria andProductTypeEqualTo(Integer value) {
            addCriterion("product_type =", value, "productType");
            return (Criteria) this;
        }

        public Criteria andProductTypeNotEqualTo(Integer value) {
            addCriterion("product_type <>", value, "productType");
            return (Criteria) this;
        }

        public Criteria andProductTypeGreaterThan(Integer value) {
            addCriterion("product_type >", value, "productType");
            return (Criteria) this;
        }

        public Criteria andProductTypeGreaterThanOrEqualTo(Integer value) {
            addCriterion("product_type >=", value, "productType");
            return (Criteria) this;
        }

        public Criteria andProductTypeLessThan(Integer value) {
            addCriterion("product_type <", value, "productType");
            return (Criteria) this;
        }

        public Criteria andProductTypeLessThanOrEqualTo(Integer value) {
            addCriterion("product_type <=", value, "productType");
            return (Criteria) this;
        }

        public Criteria andProductTypeIn(List<Integer> values) {
            addCriterion("product_type in", values, "productType");
            return (Criteria) this;
        }

        public Criteria andProductTypeNotIn(List<Integer> values) {
            addCriterion("product_type not in", values, "productType");
            return (Criteria) this;
        }

        public Criteria andProductTypeBetween(Integer value1, Integer value2) {
            addCriterion("product_type between", value1, value2, "productType");
            return (Criteria) this;
        }

        public Criteria andProductTypeNotBetween(Integer value1, Integer value2) {
            addCriterion("product_type not between", value1, value2, "productType");
            return (Criteria) this;
        }

        public Criteria andPatternTypeIsNull() {
            addCriterion("pattern_type is null");
            return (Criteria) this;
        }

        public Criteria andPatternTypeIsNotNull() {
            addCriterion("pattern_type is not null");
            return (Criteria) this;
        }

        public Criteria andPatternTypeEqualTo(String value) {
            addCriterion("pattern_type =", value, "patternType");
            return (Criteria) this;
        }

        public Criteria andPatternTypeNotEqualTo(String value) {
            addCriterion("pattern_type <>", value, "patternType");
            return (Criteria) this;
        }

        public Criteria andPatternTypeGreaterThan(String value) {
            addCriterion("pattern_type >", value, "patternType");
            return (Criteria) this;
        }

        public Criteria andPatternTypeGreaterThanOrEqualTo(String value) {
            addCriterion("pattern_type >=", value, "patternType");
            return (Criteria) this;
        }

        public Criteria andPatternTypeLessThan(String value) {
            addCriterion("pattern_type <", value, "patternType");
            return (Criteria) this;
        }

        public Criteria andPatternTypeLessThanOrEqualTo(String value) {
            addCriterion("pattern_type <=", value, "patternType");
            return (Criteria) this;
        }

        public Criteria andPatternTypeLike(String value) {
            addCriterion("pattern_type like", value, "patternType");
            return (Criteria) this;
        }

        public Criteria andPatternTypeNotLike(String value) {
            addCriterion("pattern_type not like", value, "patternType");
            return (Criteria) this;
        }

        public Criteria andPatternTypeIn(List<String> values) {
            addCriterion("pattern_type in", values, "patternType");
            return (Criteria) this;
        }

        public Criteria andPatternTypeNotIn(List<String> values) {
            addCriterion("pattern_type not in", values, "patternType");
            return (Criteria) this;
        }

        public Criteria andPatternTypeBetween(String value1, String value2) {
            addCriterion("pattern_type between", value1, value2, "patternType");
            return (Criteria) this;
        }

        public Criteria andPatternTypeNotBetween(String value1, String value2) {
            addCriterion("pattern_type not between", value1, value2, "patternType");
            return (Criteria) this;
        }

        public Criteria andPatternIdIsNull() {
            addCriterion("pattern_id is null");
            return (Criteria) this;
        }

        public Criteria andPatternIdIsNotNull() {
            addCriterion("pattern_id is not null");
            return (Criteria) this;
        }

        public Criteria andPatternIdEqualTo(Integer value) {
            addCriterion("pattern_id =", value, "patternId");
            return (Criteria) this;
        }

        public Criteria andPatternIdNotEqualTo(Integer value) {
            addCriterion("pattern_id <>", value, "patternId");
            return (Criteria) this;
        }

        public Criteria andPatternIdGreaterThan(Integer value) {
            addCriterion("pattern_id >", value, "patternId");
            return (Criteria) this;
        }

        public Criteria andPatternIdGreaterThanOrEqualTo(Integer value) {
            addCriterion("pattern_id >=", value, "patternId");
            return (Criteria) this;
        }

        public Criteria andPatternIdLessThan(Integer value) {
            addCriterion("pattern_id <", value, "patternId");
            return (Criteria) this;
        }

        public Criteria andPatternIdLessThanOrEqualTo(Integer value) {
            addCriterion("pattern_id <=", value, "patternId");
            return (Criteria) this;
        }

        public Criteria andPatternIdIn(List<Integer> values) {
            addCriterion("pattern_id in", values, "patternId");
            return (Criteria) this;
        }

        public Criteria andPatternIdNotIn(List<Integer> values) {
            addCriterion("pattern_id not in", values, "patternId");
            return (Criteria) this;
        }

        public Criteria andPatternIdBetween(Integer value1, Integer value2) {
            addCriterion("pattern_id between", value1, value2, "patternId");
            return (Criteria) this;
        }

        public Criteria andPatternIdNotBetween(Integer value1, Integer value2) {
            addCriterion("pattern_id not between", value1, value2, "patternId");
            return (Criteria) this;
        }

        public Criteria andPatternNameIsNull() {
            addCriterion("pattern_name is null");
            return (Criteria) this;
        }

        public Criteria andPatternNameIsNotNull() {
            addCriterion("pattern_name is not null");
            return (Criteria) this;
        }

        public Criteria andPatternNameEqualTo(String value) {
            addCriterion("pattern_name =", value, "patternName");
            return (Criteria) this;
        }

        public Criteria andPatternNameNotEqualTo(String value) {
            addCriterion("pattern_name <>", value, "patternName");
            return (Criteria) this;
        }

        public Criteria andPatternNameGreaterThan(String value) {
            addCriterion("pattern_name >", value, "patternName");
            return (Criteria) this;
        }

        public Criteria andPatternNameGreaterThanOrEqualTo(String value) {
            addCriterion("pattern_name >=", value, "patternName");
            return (Criteria) this;
        }

        public Criteria andPatternNameLessThan(String value) {
            addCriterion("pattern_name <", value, "patternName");
            return (Criteria) this;
        }

        public Criteria andPatternNameLessThanOrEqualTo(String value) {
            addCriterion("pattern_name <=", value, "patternName");
            return (Criteria) this;
        }

        public Criteria andPatternNameLike(String value) {
            addCriterion("pattern_name like", value, "patternName");
            return (Criteria) this;
        }

        public Criteria andPatternNameNotLike(String value) {
            addCriterion("pattern_name not like", value, "patternName");
            return (Criteria) this;
        }

        public Criteria andPatternNameIn(List<String> values) {
            addCriterion("pattern_name in", values, "patternName");
            return (Criteria) this;
        }

        public Criteria andPatternNameNotIn(List<String> values) {
            addCriterion("pattern_name not in", values, "patternName");
            return (Criteria) this;
        }

        public Criteria andPatternNameBetween(String value1, String value2) {
            addCriterion("pattern_name between", value1, value2, "patternName");
            return (Criteria) this;
        }

        public Criteria andPatternNameNotBetween(String value1, String value2) {
            addCriterion("pattern_name not between", value1, value2, "patternName");
            return (Criteria) this;
        }

        public Criteria andCompanyEmailIsNull() {
            addCriterion("company_email is null");
            return (Criteria) this;
        }

        public Criteria andCompanyEmailIsNotNull() {
            addCriterion("company_email is not null");
            return (Criteria) this;
        }

        public Criteria andCompanyEmailEqualTo(String value) {
            addCriterion("company_email =", value, "companyEmail");
            return (Criteria) this;
        }

        public Criteria andCompanyEmailNotEqualTo(String value) {
            addCriterion("company_email <>", value, "companyEmail");
            return (Criteria) this;
        }

        public Criteria andCompanyEmailGreaterThan(String value) {
            addCriterion("company_email >", value, "companyEmail");
            return (Criteria) this;
        }

        public Criteria andCompanyEmailGreaterThanOrEqualTo(String value) {
            addCriterion("company_email >=", value, "companyEmail");
            return (Criteria) this;
        }

        public Criteria andCompanyEmailLessThan(String value) {
            addCriterion("company_email <", value, "companyEmail");
            return (Criteria) this;
        }

        public Criteria andCompanyEmailLessThanOrEqualTo(String value) {
            addCriterion("company_email <=", value, "companyEmail");
            return (Criteria) this;
        }

        public Criteria andCompanyEmailLike(String value) {
            addCriterion("company_email like", value, "companyEmail");
            return (Criteria) this;
        }

        public Criteria andCompanyEmailNotLike(String value) {
            addCriterion("company_email not like", value, "companyEmail");
            return (Criteria) this;
        }

        public Criteria andCompanyEmailIn(List<String> values) {
            addCriterion("company_email in", values, "companyEmail");
            return (Criteria) this;
        }

        public Criteria andCompanyEmailNotIn(List<String> values) {
            addCriterion("company_email not in", values, "companyEmail");
            return (Criteria) this;
        }

        public Criteria andCompanyEmailBetween(String value1, String value2) {
            addCriterion("company_email between", value1, value2, "companyEmail");
            return (Criteria) this;
        }

        public Criteria andCompanyEmailNotBetween(String value1, String value2) {
            addCriterion("company_email not between", value1, value2, "companyEmail");
            return (Criteria) this;
        }

        public Criteria andApplicableProvinceIsNull() {
            addCriterion("applicable_province is null");
            return (Criteria) this;
        }

        public Criteria andApplicableProvinceIsNotNull() {
            addCriterion("applicable_province is not null");
            return (Criteria) this;
        }

        public Criteria andApplicableProvinceEqualTo(String value) {
            addCriterion("applicable_province =", value, "applicableProvince");
            return (Criteria) this;
        }

        public Criteria andApplicableProvinceNotEqualTo(String value) {
            addCriterion("applicable_province <>", value, "applicableProvince");
            return (Criteria) this;
        }

        public Criteria andApplicableProvinceGreaterThan(String value) {
            addCriterion("applicable_province >", value, "applicableProvince");
            return (Criteria) this;
        }

        public Criteria andApplicableProvinceGreaterThanOrEqualTo(String value) {
            addCriterion("applicable_province >=", value, "applicableProvince");
            return (Criteria) this;
        }

        public Criteria andApplicableProvinceLessThan(String value) {
            addCriterion("applicable_province <", value, "applicableProvince");
            return (Criteria) this;
        }

        public Criteria andApplicableProvinceLessThanOrEqualTo(String value) {
            addCriterion("applicable_province <=", value, "applicableProvince");
            return (Criteria) this;
        }

        public Criteria andApplicableProvinceLike(String value) {
            addCriterion("applicable_province like", value, "applicableProvince");
            return (Criteria) this;
        }

        public Criteria andApplicableProvinceNotLike(String value) {
            addCriterion("applicable_province not like", value, "applicableProvince");
            return (Criteria) this;
        }

        public Criteria andApplicableProvinceIn(List<String> values) {
            addCriterion("applicable_province in", values, "applicableProvince");
            return (Criteria) this;
        }

        public Criteria andApplicableProvinceNotIn(List<String> values) {
            addCriterion("applicable_province not in", values, "applicableProvince");
            return (Criteria) this;
        }

        public Criteria andApplicableProvinceBetween(String value1, String value2) {
            addCriterion("applicable_province between", value1, value2, "applicableProvince");
            return (Criteria) this;
        }

        public Criteria andApplicableProvinceNotBetween(String value1, String value2) {
            addCriterion("applicable_province not between", value1, value2, "applicableProvince");
            return (Criteria) this;
        }

        public Criteria andApplicableTemperatureIsNull() {
            addCriterion("`applicable _temperature` is null");
            return (Criteria) this;
        }

        public Criteria andApplicableTemperatureIsNotNull() {
            addCriterion("`applicable _temperature` is not null");
            return (Criteria) this;
        }

        public Criteria andApplicableTemperatureEqualTo(String value) {
            addCriterion("`applicable _temperature` =", value, "applicableTemperature");
            return (Criteria) this;
        }

        public Criteria andApplicableTemperatureNotEqualTo(String value) {
            addCriterion("`applicable _temperature` <>", value, "applicableTemperature");
            return (Criteria) this;
        }

        public Criteria andApplicableTemperatureGreaterThan(String value) {
            addCriterion("`applicable _temperature` >", value, "applicableTemperature");
            return (Criteria) this;
        }

        public Criteria andApplicableTemperatureGreaterThanOrEqualTo(String value) {
            addCriterion("`applicable _temperature` >=", value, "applicableTemperature");
            return (Criteria) this;
        }

        public Criteria andApplicableTemperatureLessThan(String value) {
            addCriterion("`applicable _temperature` <", value, "applicableTemperature");
            return (Criteria) this;
        }

        public Criteria andApplicableTemperatureLessThanOrEqualTo(String value) {
            addCriterion("`applicable _temperature` <=", value, "applicableTemperature");
            return (Criteria) this;
        }

        public Criteria andApplicableTemperatureLike(String value) {
            addCriterion("`applicable _temperature` like", value, "applicableTemperature");
            return (Criteria) this;
        }

        public Criteria andApplicableTemperatureNotLike(String value) {
            addCriterion("`applicable _temperature` not like", value, "applicableTemperature");
            return (Criteria) this;
        }

        public Criteria andApplicableTemperatureIn(List<String> values) {
            addCriterion("`applicable _temperature` in", values, "applicableTemperature");
            return (Criteria) this;
        }

        public Criteria andApplicableTemperatureNotIn(List<String> values) {
            addCriterion("`applicable _temperature` not in", values, "applicableTemperature");
            return (Criteria) this;
        }

        public Criteria andApplicableTemperatureBetween(String value1, String value2) {
            addCriterion("`applicable _temperature` between", value1, value2, "applicableTemperature");
            return (Criteria) this;
        }

        public Criteria andApplicableTemperatureNotBetween(String value1, String value2) {
            addCriterion("`applicable _temperature` not between", value1, value2, "applicableTemperature");
            return (Criteria) this;
        }

        public Criteria andVersionIsNull() {
            addCriterion("version is null");
            return (Criteria) this;
        }

        public Criteria andVersionIsNotNull() {
            addCriterion("version is not null");
            return (Criteria) this;
        }

        public Criteria andVersionEqualTo(Integer value) {
            addCriterion("version =", value, "version");
            return (Criteria) this;
        }

        public Criteria andVersionNotEqualTo(Integer value) {
            addCriterion("version <>", value, "version");
            return (Criteria) this;
        }

        public Criteria andVersionGreaterThan(Integer value) {
            addCriterion("version >", value, "version");
            return (Criteria) this;
        }

        public Criteria andVersionGreaterThanOrEqualTo(Integer value) {
            addCriterion("version >=", value, "version");
            return (Criteria) this;
        }

        public Criteria andVersionLessThan(Integer value) {
            addCriterion("version <", value, "version");
            return (Criteria) this;
        }

        public Criteria andVersionLessThanOrEqualTo(Integer value) {
            addCriterion("version <=", value, "version");
            return (Criteria) this;
        }

        public Criteria andVersionIn(List<Integer> values) {
            addCriterion("version in", values, "version");
            return (Criteria) this;
        }

        public Criteria andVersionNotIn(List<Integer> values) {
            addCriterion("version not in", values, "version");
            return (Criteria) this;
        }

        public Criteria andVersionBetween(Integer value1, Integer value2) {
            addCriterion("version between", value1, value2, "version");
            return (Criteria) this;
        }

        public Criteria andVersionNotBetween(Integer value1, Integer value2) {
            addCriterion("version not between", value1, value2, "version");
            return (Criteria) this;
        }

        public Criteria andDeletedIsNull() {
            addCriterion("deleted is null");
            return (Criteria) this;
        }

        public Criteria andDeletedIsNotNull() {
            addCriterion("deleted is not null");
            return (Criteria) this;
        }

        public Criteria andDeletedEqualTo(Boolean value) {
            addCriterion("deleted =", value, "deleted");
            return (Criteria) this;
        }

        public Criteria andDeletedNotEqualTo(Boolean value) {
            addCriterion("deleted <>", value, "deleted");
            return (Criteria) this;
        }

        public Criteria andDeletedGreaterThan(Boolean value) {
            addCriterion("deleted >", value, "deleted");
            return (Criteria) this;
        }

        public Criteria andDeletedGreaterThanOrEqualTo(Boolean value) {
            addCriterion("deleted >=", value, "deleted");
            return (Criteria) this;
        }

        public Criteria andDeletedLessThan(Boolean value) {
            addCriterion("deleted <", value, "deleted");
            return (Criteria) this;
        }

        public Criteria andDeletedLessThanOrEqualTo(Boolean value) {
            addCriterion("deleted <=", value, "deleted");
            return (Criteria) this;
        }

        public Criteria andDeletedIn(List<Boolean> values) {
            addCriterion("deleted in", values, "deleted");
            return (Criteria) this;
        }

        public Criteria andDeletedNotIn(List<Boolean> values) {
            addCriterion("deleted not in", values, "deleted");
            return (Criteria) this;
        }

        public Criteria andDeletedBetween(Boolean value1, Boolean value2) {
            addCriterion("deleted between", value1, value2, "deleted");
            return (Criteria) this;
        }

        public Criteria andDeletedNotBetween(Boolean value1, Boolean value2) {
            addCriterion("deleted not between", value1, value2, "deleted");
            return (Criteria) this;
        }

        public Criteria andSourceIsNull() {
            addCriterion("source is null");
            return (Criteria) this;
        }

        public Criteria andSourceIsNotNull() {
            addCriterion("source is not null");
            return (Criteria) this;
        }

        public Criteria andSourceEqualTo(String value) {
            addCriterion("source =", value, "source");
            return (Criteria) this;
        }

        public Criteria andSourceNotEqualTo(String value) {
            addCriterion("source <>", value, "source");
            return (Criteria) this;
        }

        public Criteria andSourceGreaterThan(String value) {
            addCriterion("source >", value, "source");
            return (Criteria) this;
        }

        public Criteria andSourceGreaterThanOrEqualTo(String value) {
            addCriterion("source >=", value, "source");
            return (Criteria) this;
        }

        public Criteria andSourceLessThan(String value) {
            addCriterion("source <", value, "source");
            return (Criteria) this;
        }

        public Criteria andSourceLessThanOrEqualTo(String value) {
            addCriterion("source <=", value, "source");
            return (Criteria) this;
        }

        public Criteria andSourceLike(String value) {
            addCriterion("source like", value, "source");
            return (Criteria) this;
        }

        public Criteria andSourceNotLike(String value) {
            addCriterion("source not like", value, "source");
            return (Criteria) this;
        }

        public Criteria andSourceIn(List<String> values) {
            addCriterion("source in", values, "source");
            return (Criteria) this;
        }

        public Criteria andSourceNotIn(List<String> values) {
            addCriterion("source not in", values, "source");
            return (Criteria) this;
        }

        public Criteria andSourceBetween(String value1, String value2) {
            addCriterion("source between", value1, value2, "source");
            return (Criteria) this;
        }

        public Criteria andSourceNotBetween(String value1, String value2) {
            addCriterion("source not between", value1, value2, "source");
            return (Criteria) this;
        }

        public Criteria andAttributesIsNull() {
            addCriterion("attributes is null");
            return (Criteria) this;
        }

        public Criteria andAttributesIsNotNull() {
            addCriterion("attributes is not null");
            return (Criteria) this;
        }

        public Criteria andAttributesEqualTo(String value) {
            addCriterion("attributes =", value, "attributes");
            return (Criteria) this;
        }

        public Criteria andAttributesNotEqualTo(String value) {
            addCriterion("attributes <>", value, "attributes");
            return (Criteria) this;
        }

        public Criteria andAttributesGreaterThan(String value) {
            addCriterion("attributes >", value, "attributes");
            return (Criteria) this;
        }

        public Criteria andAttributesGreaterThanOrEqualTo(String value) {
            addCriterion("attributes >=", value, "attributes");
            return (Criteria) this;
        }

        public Criteria andAttributesLessThan(String value) {
            addCriterion("attributes <", value, "attributes");
            return (Criteria) this;
        }

        public Criteria andAttributesLessThanOrEqualTo(String value) {
            addCriterion("attributes <=", value, "attributes");
            return (Criteria) this;
        }

        public Criteria andAttributesLike(String value) {
            addCriterion("attributes like", value, "attributes");
            return (Criteria) this;
        }

        public Criteria andAttributesNotLike(String value) {
            addCriterion("attributes not like", value, "attributes");
            return (Criteria) this;
        }

        public Criteria andAttributesIn(List<String> values) {
            addCriterion("attributes in", values, "attributes");
            return (Criteria) this;
        }

        public Criteria andAttributesNotIn(List<String> values) {
            addCriterion("attributes not in", values, "attributes");
            return (Criteria) this;
        }

        public Criteria andAttributesBetween(String value1, String value2) {
            addCriterion("attributes between", value1, value2, "attributes");
            return (Criteria) this;
        }

        public Criteria andAttributesNotBetween(String value1, String value2) {
            addCriterion("attributes not between", value1, value2, "attributes");
            return (Criteria) this;
        }
    }

    public static class Criteria extends GeneratedCriteria {

        protected Criteria() {
            super();
        }
    }

    public static class Criterion {
        private String condition;

        private Object value;

        private Object secondValue;

        private boolean noValue;

        private boolean singleValue;

        private boolean betweenValue;

        private boolean listValue;

        private String typeHandler;

        public String getCondition() {
            return condition;
        }

        public Object getValue() {
            return value;
        }

        public Object getSecondValue() {
            return secondValue;
        }

        public boolean isNoValue() {
            return noValue;
        }

        public boolean isSingleValue() {
            return singleValue;
        }

        public boolean isBetweenValue() {
            return betweenValue;
        }

        public boolean isListValue() {
            return listValue;
        }

        public String getTypeHandler() {
            return typeHandler;
        }

        protected Criterion(String condition) {
            super();
            this.condition = condition;
            this.typeHandler = null;
            this.noValue = true;
        }

        protected Criterion(String condition, Object value, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.typeHandler = typeHandler;
            if (value instanceof List<?>) {
                this.listValue = true;
            } else {
                this.singleValue = true;
            }
        }

        protected Criterion(String condition, Object value) {
            this(condition, value, null);
        }

        protected Criterion(String condition, Object value, Object secondValue, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.secondValue = secondValue;
            this.typeHandler = typeHandler;
            this.betweenValue = true;
        }

        protected Criterion(String condition, Object value, Object secondValue) {
            this(condition, value, secondValue, null);
        }
    }
}