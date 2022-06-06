package cn.edu.bjtu.toilet.dao.impl;

import cn.edu.bjtu.toilet.common.ToiletBizException;
import cn.edu.bjtu.toilet.dao.ToiletPatternDao;
import cn.edu.bjtu.toilet.dao.domain.ToiletPatternDO;
import cn.edu.bjtu.toilet.dao.domain.ToiletPatternDOSelective;
import cn.edu.bjtu.toilet.dao.domain.ToiletPatternSortDO;
import cn.edu.bjtu.toilet.dao.domain.ToiletPatternSortDOSelective;
import cn.edu.bjtu.toilet.dao.mapper.ToiletPatternDOMapper;
import cn.edu.bjtu.toilet.dao.mapper.ToiletPatternSortDOMapper;
import cn.edu.bjtu.toilet.dao.request.PatternQueryRequest;
import com.google.common.collect.Lists;
import org.springframework.stereotype.Component;
import org.springframework.util.CollectionUtils;
import org.springframework.util.StringUtils;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;
import java.util.Objects;
import java.util.stream.Collectors;

import static cn.edu.bjtu.toilet.constant.ToiletErrorCode.BIZ_ERROR;

@Component
public class ToiletPatternDaoImpl implements ToiletPatternDao {

    @Resource
    private ToiletPatternSortDOMapper patternSortDOMapper;

    @Resource
    private ToiletPatternDOMapper patternDOMapper;

    @Override
    public ToiletPatternSortDO queryPatternSortId(Integer patternId, String usage) {
        if (StringUtils.isEmpty(usage) || patternId == null) {
            throw new ToiletBizException("pattern id and usage can not be null", BIZ_ERROR);
        }

        ToiletPatternSortDOSelective toiletPatternSortDOSelective = new ToiletPatternSortDOSelective();
        ToiletPatternSortDOSelective.Criteria criteria = toiletPatternSortDOSelective.createCriteria();

        criteria.andPurposeEqualTo(usage);
        criteria.andPatternIdEqualTo(patternId);
        criteria.andDeletedNotEqualTo(true);

        List<ToiletPatternSortDO> patternSortDOS = patternSortDOMapper.selectByExample(toiletPatternSortDOSelective);

        if (CollectionUtils.isEmpty(patternSortDOS)) {
            return  null;
        }

        if (patternSortDOS.size() != 1) {
            throw new ToiletBizException("too many results returned", BIZ_ERROR);
        }

        return patternSortDOS.get(0);
    }

    @Override
    public ToiletPatternSortDO queryPatternSortById(Integer id) {
        if (id == null) {
            throw new ToiletBizException("pattern sort id can not be null", BIZ_ERROR);
        }

        return patternSortDOMapper.selectByPrimaryKey(id);
    }

    @Override
    public ToiletPatternDO queryPatternBySource(String source) {

        if (StringUtils.isEmpty(source)) {
            throw new ToiletBizException("query pattern Id error", BIZ_ERROR);
        }

        ToiletPatternDOSelective patternDOSelective = new ToiletPatternDOSelective();
        ToiletPatternDOSelective.Criteria criteria = patternDOSelective.createCriteria();

        criteria.andDeletedNotEqualTo(true);
        criteria.andSourceEqualTo(source);

        List<ToiletPatternDO> toiletPatternDOS = patternDOMapper.selectByExample(patternDOSelective);

        if (CollectionUtils.isEmpty(toiletPatternDOS)) {
            return null;
        }

        if (toiletPatternDOS.size() != 1) {
            throw new ToiletBizException("too many result returned ", BIZ_ERROR);
        }

        return toiletPatternDOS.get(0);
    }

    @Override
    public ToiletPatternDO updatePatternBySource(ToiletPatternDO patternDO, String source) {
        if (StringUtils.isEmpty(source)) {
            throw new ToiletBizException("updatePatternBySource -> source can not be null", BIZ_ERROR);
        }
        patternDO.setGmtModified(new Date());
        patternDO.setVersion(patternDO.getVersion() + 1);

        ToiletPatternDOSelective patternDOSelective = new ToiletPatternDOSelective();
        ToiletPatternDOSelective.Criteria criteria = patternDOSelective.createCriteria();

        criteria.andDeletedNotEqualTo(true);
        criteria.andSourceEqualTo(source);

        int count = patternDOMapper.updateByExampleWithBLOBs(patternDO, patternDOSelective);

        if (count != 1) {
            throw new ToiletBizException("update pattern error count:" + count , BIZ_ERROR);
        }

        return queryPatternBySource(patternDO.getSource());
    }

    @Override
    public List<ToiletPatternDO> queryAllPattern() {

        ToiletPatternDOSelective toiletPatternDOSelective = new ToiletPatternDOSelective();
        ToiletPatternDOSelective.Criteria criteria = toiletPatternDOSelective.createCriteria();

        criteria.andDeletedNotEqualTo(true);

        return patternDOMapper.selectByExampleWithBLOBs(toiletPatternDOSelective);
    }

    @Override
    public List<ToiletPatternDO> queryAllPatternByPage(PatternQueryRequest request) {

        ToiletPatternSortDOSelective toiletPatternDOSelective = new ToiletPatternSortDOSelective();
        ToiletPatternSortDOSelective.Criteria criteria = toiletPatternDOSelective.createCriteria();

        criteria.andPurposeEqualTo(request.getUsage());
        criteria.andDeletedNotEqualTo(true);

        toiletPatternDOSelective.setOrderByClause(request.getSortBy() + " " + request.getSortDirection() + " limit " + request.getOffset() + ", " + request.getLimit());

        if (!CollectionUtils.isEmpty(request.getTargetPatternIds())) {
            criteria.andPatternIdIn(request.getTargetPatternIds());
        }

        List<ToiletPatternSortDO> patternSortDOS = patternSortDOMapper.selectByExample(toiletPatternDOSelective);

        if (CollectionUtils.isEmpty(patternSortDOS)) {
            return Lists.newArrayList();
        }

        List<Integer> patternIds = patternSortDOS.stream()
                .map(ToiletPatternSortDO::getPatternId)
                .collect(Collectors.toList());

        return patternIds.stream().map(id -> patternDOMapper.selectByPrimaryKey(id)).collect(Collectors.toList());
    }

    @Override
    public List<ToiletPatternDO> queryPatternByPageWithStatus(PatternQueryRequest request) {

        ToiletPatternDOSelective toiletPatternDOSelective = new ToiletPatternDOSelective();
        ToiletPatternDOSelective.Criteria criteria = toiletPatternDOSelective.createCriteria();

        criteria.andDeletedNotEqualTo(true);
        criteria.andStatusIn(request.getStatuses());
        criteria.andProfessorEmailEqualTo(request.getEmail());

        return patternDOMapper.selectByExampleWithBLOBs(toiletPatternDOSelective);

    }

    @Override
    public ToiletPatternDO savePattern(ToiletPatternDO patternDO) {
        return null;
    }

    private String buildSourceKey(ToiletPatternDO patternDO) {
        return String.format("%s-%s", patternDO.getProductType(), patternDO.getPatternType());
    }

    public ToiletPatternDO queryPatternByName(String name) {

        if (StringUtils.isEmpty(name)) {
            throw new ToiletBizException("query pattern by name error", BIZ_ERROR);
        }

        ToiletPatternDOSelective patternDOSelective = new ToiletPatternDOSelective();
        ToiletPatternDOSelective.Criteria criteria = patternDOSelective.createCriteria();

        criteria.andDeletedNotEqualTo(true);
        criteria.andPatternTypeEqualTo(name);

        List<ToiletPatternDO> toiletPatternDOS = patternDOMapper.selectByExample(patternDOSelective);

        if (CollectionUtils.isEmpty(toiletPatternDOS)) {
            return null;
        }

        if (toiletPatternDOS.size() != 1) {
            throw new ToiletBizException("too many result returned ", BIZ_ERROR);
        }

        return toiletPatternDOS.get(0);
    }

    @Override
    public ToiletPatternDO queryPatternById(Integer id) {

        if (Objects.isNull(id) || id < 1) {
            throw new ToiletBizException("query pattern Id error", BIZ_ERROR);
        }

        return patternDOMapper.selectByPrimaryKey(id);
    }

    @Override
    public ToiletPatternDO insertPattern(ToiletPatternDO patternDO) {
        if (Objects.isNull(patternDO)
                || StringUtils.isEmpty(patternDO.getEnvConditions())
                || StringUtils.isEmpty(patternDO.getHumanFactors())
                || StringUtils.isEmpty(patternDO.getPipNetworkConditions())
                || StringUtils.isEmpty(patternDO.getResourceUtilization())) {
            throw new ToiletBizException("content can not be null", BIZ_ERROR);
        }

        patternDO.setGmtCreate(new Date());
        patternDO.setGmtModified(new Date());
        patternDO.setDeleted(false);
        patternDO.setVersion(0);

        int c = patternDOMapper.insert(patternDO);

        if (c != 1) {
            throw new ToiletBizException("insert error", BIZ_ERROR);
        }

        return queryPatternBySource(patternDO.getSource());

    }
}
