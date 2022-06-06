package cn.edu.bjtu.toilet.service.impl;

import cn.edu.bjtu.toilet.common.ToiletBizException;
import cn.edu.bjtu.toilet.constant.*;
import cn.edu.bjtu.toilet.converter.ProductConverter;
import cn.edu.bjtu.toilet.dao.ToiletPatternDao;
import cn.edu.bjtu.toilet.dao.ToiletProductDao;
import cn.edu.bjtu.toilet.dao.domain.ToiletPatternDO;
import cn.edu.bjtu.toilet.dao.request.PatternQueryRequest;
import cn.edu.bjtu.toilet.domain.dto.*;
import cn.edu.bjtu.toilet.domain.response.PatternQueryResponse;
import cn.edu.bjtu.toilet.service.PatternService;
import cn.edu.bjtu.toilet.service.request.PatternSortRequest;
import com.alibaba.fastjson.JSON;
import com.google.common.collect.Lists;
import org.apache.commons.collections4.CollectionUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.stream.Collectors;

@Component
public class PatternServiceImpl implements PatternService {

    private static final List<String> ALLOWED_SORT_FIELDS = Lists.newArrayList("water_save_score", "tech_applicability_score", "tech_cost_score", "resource_utilization_score", "sanitation_score", "convenience_score", "comprehensive_score");

    @Resource
    private ToiletProductDao productDao;

    @Resource
    private ToiletPatternDao patternDao;

    @Override
    public List<ToiletPatternDTO> queryPatternWithStatus(PatternSortRequest request) {
        PatternQueryRequest patternQueryRequest = buildPatternQueryRequest(request);
        BeanUtils.copyProperties(request, patternQueryRequest);
        patternQueryRequest.setStatuses(request.getAuditStatuses().stream().map(AuditStatus::getCode).collect(Collectors.toList()));

        return patternDao.queryPatternByPageWithStatus(patternQueryRequest).stream().map(ProductConverter::toDTO).collect(Collectors.toList());
    }

    @Override
    public ToiletPatternDTO queryPatternById(String id) {
        Integer patternId = Integer.valueOf(id);
        ToiletPatternDO patternDO = patternDao.queryPatternById(patternId);
        return ProductConverter.toDTO(patternDO);
    }

    @Override
    public PatternQueryResponse sortPattern(PatternSortRequest request) {
        PatternQueryResponse response = new PatternQueryResponse();

        if (!ALLOWED_SORT_FIELDS.contains(request.getSortBy())) {
            throw new ToiletBizException("排序字段错误！", -1);
        }

        PatternQueryRequest patternQueryRequest = buildPatternQueryRequest(request);


        List<ToiletPatternDTO> patternDTOS = patternDao.queryAllPatternByPage(patternQueryRequest).stream()
                .map(ProductConverter::toDTO)
                .collect(Collectors.toList());
        Double maxSize = (double) patternDao.queryAllPattern().size();
        response.setCurrentPage(request.getPageIndex());
        response.setMaxPage((int) Math.ceil(maxSize/request.getPageSize()));
        response.setPatternDTOList(patternDTOS);
        return response;
    }

    @Override
    public PatternQueryResponse sortPatternWithCondition(PatternSortRequest request, ToiletPatternDTO condition) {
        PatternQueryResponse response = new PatternQueryResponse();
        LinkedList<ToiletPatternDTO> resultList = Lists.newLinkedList();
        Integer searchIndex = request.getPageIndex();

        double matchCount = 0L;
        Integer iteratorIndex = 1;
        request.setPageIndex(iteratorIndex);
        List<ToiletPatternDTO> patternDTOSFromDb;
        do {
            patternDTOSFromDb = sortPattern(request).getPatternDTOList();
            patternDTOSFromDb = matchPatternConditions(patternDTOSFromDb, condition);
            matchCount += patternDTOSFromDb.size();
            resultList.addAll(patternDTOSFromDb);
            if (resultList.size() > request.getPageSize() && !searchIndex.equals(iteratorIndex)) {
                for (int i=0; i<request.getPageSize();i++) {
                    resultList.removeFirst();
                }
            }
            iteratorIndex++;
            request.setPageIndex(iteratorIndex);
        } while (!CollectionUtils.isEmpty(sortPattern(request).getPatternDTOList()));

        if (resultList.size() > 20) {
            for (int i=20;i<resultList.size();i++) {
                resultList.removeFirst();
            }
        }
        response.setMaxPage((int) Math.ceil(matchCount/request.getPageSize()));
        response.setCurrentPage(iteratorIndex-1);
        response.setPatternDTOList(resultList);

        return response;
    }

    private List<ToiletPatternDTO> matchPatternConditions(List<ToiletPatternDTO> patternDTOS, ToiletPatternDTO searchDTO) {

        return patternDTOS.stream().map(item -> {
            if (patternCompare(item, searchDTO)) {
                return item;
            }
            return null;
        }).filter(Objects::nonNull)
                .collect(Collectors.toList());
    }

    private Boolean patternCompare(ToiletPatternDTO patternDTODb, ToiletPatternDTO condition) {
        return compareEnvConditions(patternDTODb.getEnvConditions(), condition.getEnvConditions())
                && compareHumanFactors(patternDTODb.getHumanFactors(), condition.getHumanFactors())
                && comparePipNetworkConditions(patternDTODb.getPipNetworkConditions(), condition.getPipNetworkConditions())
                && compareResourceUtilization(patternDTODb.getResourceUtilization(), condition.getResourceUtilization());
    }

    private Boolean compareEnvConditions(EnvConditionsDTO envDb, EnvConditionsDTO conditions) {
        return (envDb.getEcotope().contains(conditions.getEcotope()) || conditions.getEcotope().equals("无限制"))
                && (envDb.getGeolocation().contains(conditions.getGeolocation()) || conditions.getGeolocation().equals("无限制"))
                && (envDb.getTemperature().contains(conditions.getTemperature()) || conditions.getTemperature().equals("无限制"))
                && (envDb.getTerrain().contains(conditions.getTerrain()) || conditions.getTerrain().equals("无限制"))
                && (envDb.getWaterResource().contains(conditions.getWaterResource()) || conditions.getWaterResource().equals("无限制"));
    }

    private Boolean compareHumanFactors(HumanFactorsDTO humanFactorsDTO, HumanFactorsDTO conditions) {
        return (humanFactorsDTO.getUsageHabits().contains(conditions.getUsageHabits()) || conditions.getUsageHabits().equals("均可"))
                && (humanFactorsDTO.getDensity().contains(conditions.getDensity()) || conditions.getDensity().equals("无限制"));
    }

    private Boolean comparePipNetworkConditions(PipNetworkConditionsDTO db, PipNetworkConditionsDTO conditions) {
        return (conditions.getHasSewageTreatment() == null || conditions.getHasSewageTreatment().equals(db.getHasSewageTreatment()))
                && (conditions.getHasSewerLines() == null || conditions.getHasSewerLines().equals(db.getHasSewerLines()));
    }

    private Boolean compareResourceUtilization(ResourceUtilizationDTO db, ResourceUtilizationDTO conditions) {
        return (conditions.getIsBiogasUtilization() == null || conditions.getIsBiogasUtilization().equals(db.getIsBiogasUtilization()))
                && (db.getMixedSewageTreatment().contains(conditions.getMixedSewageTreatment()) || conditions.getMixedSewageTreatment().equals("均可"))
                && (conditions.getOtherTreatment() == null || conditions.getOtherTreatment().equals(db.getOtherTreatment()));
    }

    private PatternQueryRequest buildPatternQueryRequest(PatternSortRequest request) {
        PatternQueryRequest patternQueryRequest = new PatternQueryRequest();
        patternQueryRequest.setIsDesc(request.getIsDesc());
        patternQueryRequest.setPageIndex(request.getPageIndex());
        patternQueryRequest.setPageSize(request.getPageSize());
        patternQueryRequest.setSortBy(request.getSortBy());
        return patternQueryRequest;
    }
}
