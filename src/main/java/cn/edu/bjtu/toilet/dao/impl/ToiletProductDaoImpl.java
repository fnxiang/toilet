package cn.edu.bjtu.toilet.dao.impl;

import cn.edu.bjtu.toilet.common.ToiletBizException;
import cn.edu.bjtu.toilet.dao.ToiletProductDao;
import cn.edu.bjtu.toilet.dao.domain.ToiletProductDO;
import cn.edu.bjtu.toilet.dao.domain.ToiletProductDOSelective;
import cn.edu.bjtu.toilet.dao.mapper.ToiletProductDOMapper;
import cn.edu.bjtu.toilet.dao.request.ProductQueryRequest;
import org.springframework.stereotype.Component;
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

    @Override
    public List<ToiletProductDO> queryAllProducts(String email) {

        ToiletProductDOSelective toiletProductDOSelective = new ToiletProductDOSelective();
        ToiletProductDOSelective.Criteria criteria = toiletProductDOSelective.createCriteria();
        if (!StringUtils.isEmpty(email)) {
            criteria.andCompanyEmailEqualTo(email);
        }
        criteria.andDeletedNotEqualTo(true);

        return productDOMapper.selectByExampleWithBLOBs(toiletProductDOSelective);
    }

    @Override
    public List<ToiletProductDO> queryAllProductsByPage(ProductQueryRequest request) {

        ToiletProductDOSelective toiletProductDOSelective = new ToiletProductDOSelective();
        ToiletProductDOSelective.Criteria criteria = toiletProductDOSelective.createCriteria();
        toiletProductDOSelective.setOrderByClause(request.getSortBy() + " " + request.getSortDirection() + " limit " + request.getOffset() + "," + request.getLimit());

        if (!StringUtils.isEmpty(request.getEmail())) {
            criteria.andCompanyEmailEqualTo(request.getEmail());
        }
        criteria.andDeletedNotEqualTo(true);

        return productDOMapper.selectByExampleWithBLOBs(toiletProductDOSelective);
    }

    @Override
    public ToiletProductDO insertProduct(ToiletProductDO productDO){

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

        return productDO;
    }


    @Override
    public ToiletProductDO updateProductBySource(ToiletProductDO productDO) {
        productDO.setGmtModified(new Date());
        productDO.setVersion(productDO.getVersion() + 1);

        ToiletProductDOSelective productDOSelective = new ToiletProductDOSelective();
        ToiletProductDOSelective.Criteria criteria = productDOSelective.createCriteria();

        criteria.andSourceEqualTo(productDO.getSource());
        criteria.andDeletedNotEqualTo(true);

        int c = productDOMapper.updateByExampleSelective(productDO, productDOSelective);

        if (c != 1) {
            throw new ToiletBizException("update error", BIZ_ERROR);
        }
        return queryProductBySource(productDO.getSource());
    }

    @Override
    public ToiletProductDO queryProductBySource(String source) {
        if (StringUtils.isEmpty(source)) {
            throw new ToiletBizException("source can not be null", BIZ_ERROR);
        }

        ToiletProductDOSelective toiletProductDOSelective = new ToiletProductDOSelective();
        ToiletProductDOSelective.Criteria criteria = toiletProductDOSelective.createCriteria();

        criteria.andSourceEqualTo(source);
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
    public ToiletProductDO queryProductById(Integer id) {
        if (Objects.isNull(id) || id < 1) {
            throw new ToiletBizException("query pattern Id error", BIZ_ERROR);
        }

        return productDOMapper.selectByPrimaryKey(id);
    }

    @Override
    public List<ToiletProductDO> queryProductByPatternId(Integer patternId) {
        if (Objects.isNull(patternId) || patternId < 1) {
            throw new ToiletBizException("query pattern Id error", BIZ_ERROR);
        }

        ToiletProductDOSelective toiletProductDOSelective = new ToiletProductDOSelective();
        ToiletProductDOSelective.Criteria criteria = toiletProductDOSelective.createCriteria();

        criteria.andPatternIdLike("%;"+patternId+";%");
        criteria.andDeletedNotEqualTo(true);

        return productDOMapper.selectByExampleWithBLOBs(toiletProductDOSelective);
    }
}
