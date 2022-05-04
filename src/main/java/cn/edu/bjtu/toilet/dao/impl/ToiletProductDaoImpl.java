package cn.edu.bjtu.toilet.dao.impl;

import cn.edu.bjtu.toilet.common.ToiletBizException;
import cn.edu.bjtu.toilet.common.ToiletSystemException;
import cn.edu.bjtu.toilet.dao.ToiletProductDao;
import cn.edu.bjtu.toilet.dao.domain.ToiletPatternDO;
import cn.edu.bjtu.toilet.dao.domain.ToiletPatternDOSelective;
import cn.edu.bjtu.toilet.dao.domain.ToiletProductDO;
import cn.edu.bjtu.toilet.dao.domain.ToiletProductDOSelective;
import cn.edu.bjtu.toilet.dao.mapper.ToiletPatternDOMapper;
import cn.edu.bjtu.toilet.dao.mapper.ToiletProductDOMapper;
import cn.edu.bjtu.toilet.domain.dto.ToiletProductDTO;
import org.springframework.stereotype.Component;
import org.springframework.transaction.support.TransactionTemplate;
import org.springframework.util.CollectionUtils;
import org.springframework.util.StringUtils;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;
import java.util.Objects;

import static cn.edu.bjtu.toilet.constant.ToiletErrorCode.BIZ_ERROR;

@Component
public class ToiletProductDaoImpl implements ToiletProductDao {

    @Resource
    private ToiletProductDOMapper productDOMapper;

    @Resource
    private ToiletPatternDOMapper patternDOMapper;

    @Resource
    private TransactionTemplate transactionTemplate;

    @Override
    public List<ToiletProductDO> queryAllProducts(String email) {

        ToiletProductDOSelective toiletProductDOSelective = new ToiletProductDOSelective();
        ToiletProductDOSelective.Criteria criteria = toiletProductDOSelective.createCriteria();
        if (!StringUtils.isEmpty(email)) {
            criteria.andCompanyEmailEqualTo(email);
        }
        criteria.andDeletedNotEqualTo(true);

        List<ToiletProductDO> productDOList = productDOMapper.selectByExampleWithBLOBs(toiletProductDOSelective);

        return productDOList;
    }

    @Override
    public List<ToiletPatternDO> queryAllPattern() {

        ToiletPatternDOSelective toiletPatternDOSelective = new ToiletPatternDOSelective();
        ToiletPatternDOSelective.Criteria criteria = toiletPatternDOSelective.createCriteria();

        criteria.andDeletedNotEqualTo(true);

        return patternDOMapper.selectByExample(toiletPatternDOSelective);
    }

    @Override
    public ToiletPatternDO savePattern(ToiletPatternDO patternDO) {
        ToiletPatternDO patternDOFromDb = queryPatternByName(patternDO.getPatternType());
        if (patternDOFromDb != null) {
            throw new ToiletBizException("改模式名称已存在！", BIZ_ERROR);
        }

        int patternId = insertPattern(patternDO, buildSourceKey(patternDO));

        return queryPatternById(patternId);
    }

    @Override
    public ToiletProductDO saveProductWithPattern(ToiletProductDO productDO, ToiletPatternDO patternDO) {
        ToiletProductDO toiletProductDO = queryProductByName(productDO.getProductName());

        if (toiletProductDO == null) {
            transactionTemplate.execute(status -> {
                int patternId = insertPattern(patternDO, buildSourceKey(productDO));
                productDO.setPatternId(patternId);
                insertProduct(productDO);
                return null;
            });
        } else {
            transactionTemplate.execute(status -> {
                updatePatternByName(patternDO);
                updateProductByName(productDO);
                return null;
            });
        }

        return queryProductByName(productDO.getProductName());
    }

    private String buildSourceKey(ToiletProductDO productDO) {
        return String.format("%s-%s", productDO.getCompanyEmail(), productDO.getProductName());
    }

    private String buildSourceKey(ToiletPatternDO patternDO) {
        return String.format("%s-%s", patternDO.getSource(), patternDO.getPatternType());
    }

    public String insertProduct(ToiletProductDO productDO){

        if (StringUtils.isEmpty(productDO.getProductName())) {
            throw new ToiletBizException("product name can not be null", BIZ_ERROR);
        }
        productDO.setGmtCreate(new Date());
        productDO.setGmtModified(new Date());
        productDO.setVersion(0);
        productDO.setDeleted(false);

        int c = productDOMapper.insert(productDO);

        if (c != 1) {
            throw new ToiletBizException("insert error", BIZ_ERROR);
        }

        return productDO.getProductName();
    }


    public Integer insertPattern(ToiletPatternDO patternDO, String sourceKey) {
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
        patternDO.setSource(sourceKey);
        patternDO.setVersion(0);

        int c = patternDOMapper.insert(patternDO);

        if (c != 1) {
            throw new ToiletBizException("insert error", BIZ_ERROR);
        }

        return queryPatternBySource(sourceKey).getId();

    }

    public ToiletProductDO updateProductByName(ToiletProductDO productDO) {
        productDO.setGmtModified(new Date());
        productDO.setVersion(productDO.getVersion() + 1);

        ToiletProductDOSelective productDOSelective = new ToiletProductDOSelective();
        ToiletProductDOSelective.Criteria criteria = productDOSelective.createCriteria();

        criteria.andProductNameEqualTo(productDO.getProductName());
        criteria.andCompanyEmailEqualTo(productDO.getCompanyEmail());
        criteria.andDeletedNotEqualTo(true);

        int c = productDOMapper.updateByExampleSelective(productDO, productDOSelective);

        if (c != 1) {
            throw new ToiletBizException("update error", BIZ_ERROR);
        }
        return queryProductByName(productDO.getProductName());
    }

    public ToiletPatternDO updatePatternByName(ToiletPatternDO patternDO) {

        if (Objects.isNull(patternDO.getId())) {
            throw new ToiletBizException("update pattern Id can not be null", BIZ_ERROR);
        }

        patternDO.setGmtModified(new Date());
        patternDO.setVersion(patternDO.getVersion() + 1);

        int c = patternDOMapper.updateByPrimaryKey(patternDO);

        if (c != 1) {
            throw new ToiletBizException("update error", BIZ_ERROR);
        }
        return queryPatternBySource(patternDO.getSource());
    }

    private ToiletProductDO queryProductByName(String productName) {

        if (StringUtils.isEmpty(productName)) {
            throw new ToiletBizException("product name can not be null", BIZ_ERROR);
        }

        ToiletProductDOSelective toiletProductDOSelective = new ToiletProductDOSelective();
        ToiletProductDOSelective.Criteria criteria = toiletProductDOSelective.createCriteria();

        criteria.andProductNameEqualTo(productName);
        criteria.andDeletedNotEqualTo(true);

        List<ToiletProductDO> productDOList = productDOMapper.selectByExample(toiletProductDOSelective);

        if (CollectionUtils.isEmpty(productDOList)) {
            return  null;
        }

        if (productDOList.size() != 1) {
            throw new ToiletBizException("too many results returned", BIZ_ERROR);
        }

        return productDOList.get(0);
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
    public ToiletProductDO queryProductById(Integer id) {
        if (Objects.isNull(id) || id < 1) {
            throw new ToiletBizException("query pattern Id error", BIZ_ERROR);
        }

        return productDOMapper.selectByPrimaryKey(id);
    }
}
