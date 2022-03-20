package cn.edu.bjtu.toilet.dao.impl;

import cn.edu.bjtu.toilet.common.ToiletSystemException;
import cn.edu.bjtu.toilet.dao.ToiletProductDao;
import cn.edu.bjtu.toilet.dao.domain.ToiletPatternDO;
import cn.edu.bjtu.toilet.dao.domain.ToiletProductDO;
import cn.edu.bjtu.toilet.dao.domain.ToiletProductDOSelective;
import cn.edu.bjtu.toilet.dao.mapper.ToiletPatternDOMapper;
import cn.edu.bjtu.toilet.dao.mapper.ToiletProductDOMapper;
import org.springframework.stereotype.Component;
import org.springframework.transaction.support.TransactionTemplate;
import org.springframework.util.CollectionUtils;
import org.springframework.util.StringUtils;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;
import java.util.Objects;

@Component
public class ToiletProductDaoImpl implements ToiletProductDao {

    @Resource
    private ToiletProductDOMapper productDOMapper;

    @Resource
    private ToiletPatternDOMapper patternDOMapper;

    @Resource
    private TransactionTemplate transactionTemplate;

    @Override
    public ToiletProductDO saveProductWithPattern(ToiletProductDO productDO, ToiletPatternDO patternDO) {
        ToiletProductDO toiletProductDO = queryProductByName(productDO.getProductName());

        if (toiletProductDO == null) {
            transactionTemplate.execute(status -> {
                int patternId = insertPattern(patternDO);
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

    public String insertProduct(ToiletProductDO productDO){

        if (StringUtils.isEmpty(productDO.getProductName())) {
            throw new ToiletSystemException("product name can not be null", "");
        }
        productDO.setGmtCreate(new Date());
        productDO.setGmtModified(new Date());
        productDO.setVersion(0);
        productDO.setDeleted(false);

        int c = productDOMapper.insert(productDO);

        if (c != 1) {
            throw new ToiletSystemException("insert error", "-1");
        }

        return productDO.getProductName();
    }


    public Integer insertPattern(ToiletPatternDO patternDO) {
        if (Objects.isNull(patternDO)
                || StringUtils.isEmpty(patternDO.getEnvConditions())
                || StringUtils.isEmpty(patternDO.getHumanFactors())
                || StringUtils.isEmpty(patternDO.getPipNetworkConditions())
                || StringUtils.isEmpty(patternDO.getResourceUtilization())) {
            throw new ToiletSystemException("content can not be null", "");
        }

        patternDO.setGmtCreate(new Date());
        patternDO.setGmtModified(new Date());
        patternDO.setDeleted(false);
        patternDO.setVersion(0);

        int c = patternDOMapper.insert(patternDO);

        if (c != 1) {
            throw new ToiletSystemException("insert error", "-1");
        }

        return patternDO.getId();

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
            throw new ToiletSystemException("update error", "-1");
        }
        return queryProductByName(productDO.getProductName());
    }

    public ToiletPatternDO updatePatternByName(ToiletPatternDO patternDO) {

        if (Objects.isNull(patternDO.getId())) {
            throw new ToiletSystemException("update pattern Id can not be null", "-1");
        }

        patternDO.setGmtModified(new Date());
        patternDO.setVersion(patternDO.getVersion() + 1);

        int c = patternDOMapper.updateByPrimaryKey(patternDO);

        if (c != 1) {
            throw new ToiletSystemException("update error", "-1");
        }
        return queryPatternById(patternDO.getId());
    }

    private ToiletProductDO queryProductByName(String productName) {

        if (StringUtils.isEmpty(productName)) {
            throw new ToiletSystemException("product name can not be null", "");
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
            throw new ToiletSystemException("too many results returned", "-1");
        }

        return productDOList.get(0);
    }

    @Override
    public ToiletPatternDO queryPatternById(Integer id) {

        if (Objects.isNull(id) || id < 1) {
            throw new ToiletSystemException("query pattern Id error", "-1");
        }

        return patternDOMapper.selectByPrimaryKey(id);
    }
}
