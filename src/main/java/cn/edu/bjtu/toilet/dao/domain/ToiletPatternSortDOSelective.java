package cn.edu.bjtu.toilet.dao.domain;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class ToiletPatternSortDOSelective {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public ToiletPatternSortDOSelective() {
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

        public Criteria andWaterSaveScoreIsNull() {
            addCriterion("water_save_score is null");
            return (Criteria) this;
        }

        public Criteria andWaterSaveScoreIsNotNull() {
            addCriterion("water_save_score is not null");
            return (Criteria) this;
        }

        public Criteria andWaterSaveScoreEqualTo(Integer value) {
            addCriterion("water_save_score =", value, "waterSaveScore");
            return (Criteria) this;
        }

        public Criteria andWaterSaveScoreNotEqualTo(Integer value) {
            addCriterion("water_save_score <>", value, "waterSaveScore");
            return (Criteria) this;
        }

        public Criteria andWaterSaveScoreGreaterThan(Integer value) {
            addCriterion("water_save_score >", value, "waterSaveScore");
            return (Criteria) this;
        }

        public Criteria andWaterSaveScoreGreaterThanOrEqualTo(Integer value) {
            addCriterion("water_save_score >=", value, "waterSaveScore");
            return (Criteria) this;
        }

        public Criteria andWaterSaveScoreLessThan(Integer value) {
            addCriterion("water_save_score <", value, "waterSaveScore");
            return (Criteria) this;
        }

        public Criteria andWaterSaveScoreLessThanOrEqualTo(Integer value) {
            addCriterion("water_save_score <=", value, "waterSaveScore");
            return (Criteria) this;
        }

        public Criteria andWaterSaveScoreIn(List<Integer> values) {
            addCriterion("water_save_score in", values, "waterSaveScore");
            return (Criteria) this;
        }

        public Criteria andWaterSaveScoreNotIn(List<Integer> values) {
            addCriterion("water_save_score not in", values, "waterSaveScore");
            return (Criteria) this;
        }

        public Criteria andWaterSaveScoreBetween(Integer value1, Integer value2) {
            addCriterion("water_save_score between", value1, value2, "waterSaveScore");
            return (Criteria) this;
        }

        public Criteria andWaterSaveScoreNotBetween(Integer value1, Integer value2) {
            addCriterion("water_save_score not between", value1, value2, "waterSaveScore");
            return (Criteria) this;
        }

        public Criteria andTechApplicabilityScoreIsNull() {
            addCriterion("tech_applicability_score is null");
            return (Criteria) this;
        }

        public Criteria andTechApplicabilityScoreIsNotNull() {
            addCriterion("tech_applicability_score is not null");
            return (Criteria) this;
        }

        public Criteria andTechApplicabilityScoreEqualTo(Integer value) {
            addCriterion("tech_applicability_score =", value, "techApplicabilityScore");
            return (Criteria) this;
        }

        public Criteria andTechApplicabilityScoreNotEqualTo(Integer value) {
            addCriterion("tech_applicability_score <>", value, "techApplicabilityScore");
            return (Criteria) this;
        }

        public Criteria andTechApplicabilityScoreGreaterThan(Integer value) {
            addCriterion("tech_applicability_score >", value, "techApplicabilityScore");
            return (Criteria) this;
        }

        public Criteria andTechApplicabilityScoreGreaterThanOrEqualTo(Integer value) {
            addCriterion("tech_applicability_score >=", value, "techApplicabilityScore");
            return (Criteria) this;
        }

        public Criteria andTechApplicabilityScoreLessThan(Integer value) {
            addCriterion("tech_applicability_score <", value, "techApplicabilityScore");
            return (Criteria) this;
        }

        public Criteria andTechApplicabilityScoreLessThanOrEqualTo(Integer value) {
            addCriterion("tech_applicability_score <=", value, "techApplicabilityScore");
            return (Criteria) this;
        }

        public Criteria andTechApplicabilityScoreIn(List<Integer> values) {
            addCriterion("tech_applicability_score in", values, "techApplicabilityScore");
            return (Criteria) this;
        }

        public Criteria andTechApplicabilityScoreNotIn(List<Integer> values) {
            addCriterion("tech_applicability_score not in", values, "techApplicabilityScore");
            return (Criteria) this;
        }

        public Criteria andTechApplicabilityScoreBetween(Integer value1, Integer value2) {
            addCriterion("tech_applicability_score between", value1, value2, "techApplicabilityScore");
            return (Criteria) this;
        }

        public Criteria andTechApplicabilityScoreNotBetween(Integer value1, Integer value2) {
            addCriterion("tech_applicability_score not between", value1, value2, "techApplicabilityScore");
            return (Criteria) this;
        }

        public Criteria andTechCostScoreIsNull() {
            addCriterion("tech_cost_score is null");
            return (Criteria) this;
        }

        public Criteria andTechCostScoreIsNotNull() {
            addCriterion("tech_cost_score is not null");
            return (Criteria) this;
        }

        public Criteria andTechCostScoreEqualTo(Integer value) {
            addCriterion("tech_cost_score =", value, "techCostScore");
            return (Criteria) this;
        }

        public Criteria andTechCostScoreNotEqualTo(Integer value) {
            addCriterion("tech_cost_score <>", value, "techCostScore");
            return (Criteria) this;
        }

        public Criteria andTechCostScoreGreaterThan(Integer value) {
            addCriterion("tech_cost_score >", value, "techCostScore");
            return (Criteria) this;
        }

        public Criteria andTechCostScoreGreaterThanOrEqualTo(Integer value) {
            addCriterion("tech_cost_score >=", value, "techCostScore");
            return (Criteria) this;
        }

        public Criteria andTechCostScoreLessThan(Integer value) {
            addCriterion("tech_cost_score <", value, "techCostScore");
            return (Criteria) this;
        }

        public Criteria andTechCostScoreLessThanOrEqualTo(Integer value) {
            addCriterion("tech_cost_score <=", value, "techCostScore");
            return (Criteria) this;
        }

        public Criteria andTechCostScoreIn(List<Integer> values) {
            addCriterion("tech_cost_score in", values, "techCostScore");
            return (Criteria) this;
        }

        public Criteria andTechCostScoreNotIn(List<Integer> values) {
            addCriterion("tech_cost_score not in", values, "techCostScore");
            return (Criteria) this;
        }

        public Criteria andTechCostScoreBetween(Integer value1, Integer value2) {
            addCriterion("tech_cost_score between", value1, value2, "techCostScore");
            return (Criteria) this;
        }

        public Criteria andTechCostScoreNotBetween(Integer value1, Integer value2) {
            addCriterion("tech_cost_score not between", value1, value2, "techCostScore");
            return (Criteria) this;
        }

        public Criteria andResourceUtilizationScoreIsNull() {
            addCriterion("resource_utilization_score is null");
            return (Criteria) this;
        }

        public Criteria andResourceUtilizationScoreIsNotNull() {
            addCriterion("resource_utilization_score is not null");
            return (Criteria) this;
        }

        public Criteria andResourceUtilizationScoreEqualTo(Integer value) {
            addCriterion("resource_utilization_score =", value, "resourceUtilizationScore");
            return (Criteria) this;
        }

        public Criteria andResourceUtilizationScoreNotEqualTo(Integer value) {
            addCriterion("resource_utilization_score <>", value, "resourceUtilizationScore");
            return (Criteria) this;
        }

        public Criteria andResourceUtilizationScoreGreaterThan(Integer value) {
            addCriterion("resource_utilization_score >", value, "resourceUtilizationScore");
            return (Criteria) this;
        }

        public Criteria andResourceUtilizationScoreGreaterThanOrEqualTo(Integer value) {
            addCriterion("resource_utilization_score >=", value, "resourceUtilizationScore");
            return (Criteria) this;
        }

        public Criteria andResourceUtilizationScoreLessThan(Integer value) {
            addCriterion("resource_utilization_score <", value, "resourceUtilizationScore");
            return (Criteria) this;
        }

        public Criteria andResourceUtilizationScoreLessThanOrEqualTo(Integer value) {
            addCriterion("resource_utilization_score <=", value, "resourceUtilizationScore");
            return (Criteria) this;
        }

        public Criteria andResourceUtilizationScoreIn(List<Integer> values) {
            addCriterion("resource_utilization_score in", values, "resourceUtilizationScore");
            return (Criteria) this;
        }

        public Criteria andResourceUtilizationScoreNotIn(List<Integer> values) {
            addCriterion("resource_utilization_score not in", values, "resourceUtilizationScore");
            return (Criteria) this;
        }

        public Criteria andResourceUtilizationScoreBetween(Integer value1, Integer value2) {
            addCriterion("resource_utilization_score between", value1, value2, "resourceUtilizationScore");
            return (Criteria) this;
        }

        public Criteria andResourceUtilizationScoreNotBetween(Integer value1, Integer value2) {
            addCriterion("resource_utilization_score not between", value1, value2, "resourceUtilizationScore");
            return (Criteria) this;
        }

        public Criteria andSanitationScoreIsNull() {
            addCriterion("sanitation_score is null");
            return (Criteria) this;
        }

        public Criteria andSanitationScoreIsNotNull() {
            addCriterion("sanitation_score is not null");
            return (Criteria) this;
        }

        public Criteria andSanitationScoreEqualTo(Integer value) {
            addCriterion("sanitation_score =", value, "sanitationScore");
            return (Criteria) this;
        }

        public Criteria andSanitationScoreNotEqualTo(Integer value) {
            addCriterion("sanitation_score <>", value, "sanitationScore");
            return (Criteria) this;
        }

        public Criteria andSanitationScoreGreaterThan(Integer value) {
            addCriterion("sanitation_score >", value, "sanitationScore");
            return (Criteria) this;
        }

        public Criteria andSanitationScoreGreaterThanOrEqualTo(Integer value) {
            addCriterion("sanitation_score >=", value, "sanitationScore");
            return (Criteria) this;
        }

        public Criteria andSanitationScoreLessThan(Integer value) {
            addCriterion("sanitation_score <", value, "sanitationScore");
            return (Criteria) this;
        }

        public Criteria andSanitationScoreLessThanOrEqualTo(Integer value) {
            addCriterion("sanitation_score <=", value, "sanitationScore");
            return (Criteria) this;
        }

        public Criteria andSanitationScoreIn(List<Integer> values) {
            addCriterion("sanitation_score in", values, "sanitationScore");
            return (Criteria) this;
        }

        public Criteria andSanitationScoreNotIn(List<Integer> values) {
            addCriterion("sanitation_score not in", values, "sanitationScore");
            return (Criteria) this;
        }

        public Criteria andSanitationScoreBetween(Integer value1, Integer value2) {
            addCriterion("sanitation_score between", value1, value2, "sanitationScore");
            return (Criteria) this;
        }

        public Criteria andSanitationScoreNotBetween(Integer value1, Integer value2) {
            addCriterion("sanitation_score not between", value1, value2, "sanitationScore");
            return (Criteria) this;
        }

        public Criteria andConvenienceScoreIsNull() {
            addCriterion("convenience_score is null");
            return (Criteria) this;
        }

        public Criteria andConvenienceScoreIsNotNull() {
            addCriterion("convenience_score is not null");
            return (Criteria) this;
        }

        public Criteria andConvenienceScoreEqualTo(Integer value) {
            addCriterion("convenience_score =", value, "convenienceScore");
            return (Criteria) this;
        }

        public Criteria andConvenienceScoreNotEqualTo(Integer value) {
            addCriterion("convenience_score <>", value, "convenienceScore");
            return (Criteria) this;
        }

        public Criteria andConvenienceScoreGreaterThan(Integer value) {
            addCriterion("convenience_score >", value, "convenienceScore");
            return (Criteria) this;
        }

        public Criteria andConvenienceScoreGreaterThanOrEqualTo(Integer value) {
            addCriterion("convenience_score >=", value, "convenienceScore");
            return (Criteria) this;
        }

        public Criteria andConvenienceScoreLessThan(Integer value) {
            addCriterion("convenience_score <", value, "convenienceScore");
            return (Criteria) this;
        }

        public Criteria andConvenienceScoreLessThanOrEqualTo(Integer value) {
            addCriterion("convenience_score <=", value, "convenienceScore");
            return (Criteria) this;
        }

        public Criteria andConvenienceScoreIn(List<Integer> values) {
            addCriterion("convenience_score in", values, "convenienceScore");
            return (Criteria) this;
        }

        public Criteria andConvenienceScoreNotIn(List<Integer> values) {
            addCriterion("convenience_score not in", values, "convenienceScore");
            return (Criteria) this;
        }

        public Criteria andConvenienceScoreBetween(Integer value1, Integer value2) {
            addCriterion("convenience_score between", value1, value2, "convenienceScore");
            return (Criteria) this;
        }

        public Criteria andConvenienceScoreNotBetween(Integer value1, Integer value2) {
            addCriterion("convenience_score not between", value1, value2, "convenienceScore");
            return (Criteria) this;
        }

        public Criteria andComprehensiveScoreIsNull() {
            addCriterion("comprehensive_score is null");
            return (Criteria) this;
        }

        public Criteria andComprehensiveScoreIsNotNull() {
            addCriterion("comprehensive_score is not null");
            return (Criteria) this;
        }

        public Criteria andComprehensiveScoreEqualTo(Double value) {
            addCriterion("comprehensive_score =", value, "comprehensiveScore");
            return (Criteria) this;
        }

        public Criteria andComprehensiveScoreNotEqualTo(Double value) {
            addCriterion("comprehensive_score <>", value, "comprehensiveScore");
            return (Criteria) this;
        }

        public Criteria andComprehensiveScoreGreaterThan(Double value) {
            addCriterion("comprehensive_score >", value, "comprehensiveScore");
            return (Criteria) this;
        }

        public Criteria andComprehensiveScoreGreaterThanOrEqualTo(Double value) {
            addCriterion("comprehensive_score >=", value, "comprehensiveScore");
            return (Criteria) this;
        }

        public Criteria andComprehensiveScoreLessThan(Double value) {
            addCriterion("comprehensive_score <", value, "comprehensiveScore");
            return (Criteria) this;
        }

        public Criteria andComprehensiveScoreLessThanOrEqualTo(Double value) {
            addCriterion("comprehensive_score <=", value, "comprehensiveScore");
            return (Criteria) this;
        }

        public Criteria andComprehensiveScoreIn(List<Double> values) {
            addCriterion("comprehensive_score in", values, "comprehensiveScore");
            return (Criteria) this;
        }

        public Criteria andComprehensiveScoreNotIn(List<Double> values) {
            addCriterion("comprehensive_score not in", values, "comprehensiveScore");
            return (Criteria) this;
        }

        public Criteria andComprehensiveScoreBetween(Double value1, Double value2) {
            addCriterion("comprehensive_score between", value1, value2, "comprehensiveScore");
            return (Criteria) this;
        }

        public Criteria andComprehensiveScoreNotBetween(Double value1, Double value2) {
            addCriterion("comprehensive_score not between", value1, value2, "comprehensiveScore");
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

        public Criteria andUsageIsNull() {
            addCriterion("usage is null");
            return (Criteria) this;
        }

        public Criteria andUsageIsNotNull() {
            addCriterion("usage is not null");
            return (Criteria) this;
        }

        public Criteria andUsageEqualTo(String value) {
            addCriterion("usage =", value, "usage");
            return (Criteria) this;
        }

        public Criteria andUsageNotEqualTo(String value) {
            addCriterion("usage <>", value, "usage");
            return (Criteria) this;
        }

        public Criteria andUsageGreaterThan(String value) {
            addCriterion("usage >", value, "usage");
            return (Criteria) this;
        }

        public Criteria andUsageGreaterThanOrEqualTo(String value) {
            addCriterion("usage >=", value, "usage");
            return (Criteria) this;
        }

        public Criteria andUsageLessThan(String value) {
            addCriterion("usage <", value, "usage");
            return (Criteria) this;
        }

        public Criteria andUsageLessThanOrEqualTo(String value) {
            addCriterion("usage <=", value, "usage");
            return (Criteria) this;
        }

        public Criteria andUsageLike(String value) {
            addCriterion("usage like", value, "usage");
            return (Criteria) this;
        }

        public Criteria andUsageNotLike(String value) {
            addCriterion("usage not like", value, "usage");
            return (Criteria) this;
        }

        public Criteria andUsageIn(List<String> values) {
            addCriterion("usage in", values, "usage");
            return (Criteria) this;
        }

        public Criteria andUsageNotIn(List<String> values) {
            addCriterion("usage not in", values, "usage");
            return (Criteria) this;
        }

        public Criteria andUsageBetween(String value1, String value2) {
            addCriterion("usage between", value1, value2, "usage");
            return (Criteria) this;
        }

        public Criteria andUsageNotBetween(String value1, String value2) {
            addCriterion("usage not between", value1, value2, "usage");
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

        public Criteria andAttributeIsNull() {
            addCriterion("attribute is null");
            return (Criteria) this;
        }

        public Criteria andAttributeIsNotNull() {
            addCriterion("attribute is not null");
            return (Criteria) this;
        }

        public Criteria andAttributeEqualTo(String value) {
            addCriterion("attribute =", value, "attribute");
            return (Criteria) this;
        }

        public Criteria andAttributeNotEqualTo(String value) {
            addCriterion("attribute <>", value, "attribute");
            return (Criteria) this;
        }

        public Criteria andAttributeGreaterThan(String value) {
            addCriterion("attribute >", value, "attribute");
            return (Criteria) this;
        }

        public Criteria andAttributeGreaterThanOrEqualTo(String value) {
            addCriterion("attribute >=", value, "attribute");
            return (Criteria) this;
        }

        public Criteria andAttributeLessThan(String value) {
            addCriterion("attribute <", value, "attribute");
            return (Criteria) this;
        }

        public Criteria andAttributeLessThanOrEqualTo(String value) {
            addCriterion("attribute <=", value, "attribute");
            return (Criteria) this;
        }

        public Criteria andAttributeLike(String value) {
            addCriterion("attribute like", value, "attribute");
            return (Criteria) this;
        }

        public Criteria andAttributeNotLike(String value) {
            addCriterion("attribute not like", value, "attribute");
            return (Criteria) this;
        }

        public Criteria andAttributeIn(List<String> values) {
            addCriterion("attribute in", values, "attribute");
            return (Criteria) this;
        }

        public Criteria andAttributeNotIn(List<String> values) {
            addCriterion("attribute not in", values, "attribute");
            return (Criteria) this;
        }

        public Criteria andAttributeBetween(String value1, String value2) {
            addCriterion("attribute between", value1, value2, "attribute");
            return (Criteria) this;
        }

        public Criteria andAttributeNotBetween(String value1, String value2) {
            addCriterion("attribute not between", value1, value2, "attribute");
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