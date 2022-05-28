package cn.edu.bjtu.toilet.service.impl;

import cn.edu.bjtu.toilet.common.ToiletBizException;
import cn.edu.bjtu.toilet.constant.*;
import cn.edu.bjtu.toilet.converter.ProductConverter;
import cn.edu.bjtu.toilet.dao.ToiletPatternDao;
import cn.edu.bjtu.toilet.dao.ToiletProductDao;
import cn.edu.bjtu.toilet.dao.domain.ToiletPatternDO;
import cn.edu.bjtu.toilet.dao.domain.ToiletProductDO;
import cn.edu.bjtu.toilet.dao.request.ProductQueryRequest;
import cn.edu.bjtu.toilet.domain.dto.ProductParamsDTO;
import cn.edu.bjtu.toilet.domain.dto.ProductSearchConditionsDTO;
import cn.edu.bjtu.toilet.domain.dto.ToiletPatternDTO;
import cn.edu.bjtu.toilet.domain.dto.ToiletProductDTO;
import cn.edu.bjtu.toilet.service.ProductService;
import cn.edu.bjtu.toilet.domain.request.ProductSortRequest;
import cn.edu.bjtu.toilet.domain.response.ProductQueryResponse;
import com.google.common.collect.Lists;
import org.apache.commons.collections4.CollectionUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Component;
import org.springframework.transaction.support.TransactionTemplate;

import javax.annotation.Resource;
import java.util.LinkedList;
import java.util.List;
import java.util.Objects;
import java.util.stream.Collectors;

import static cn.edu.bjtu.toilet.constant.ToiletErrorCode.BIZ_ERROR;

@Component
public class ProductServiceImpl implements ProductService {

    public static final Integer DEFAULT_SORT_INDEX = 1;

    public static final String DEFAULT_SORT_USAGE = "default";

    @Resource
    private ToiletProductDao toiletProductDao;

    @Resource
    private ToiletPatternDao toiletPatternDao;

    @Resource
    private TransactionTemplate template;

    @Override
    public List<ToiletProductDTO> queryProductListByProfessor(String email) {
        ProductQueryRequest queryRequest = new ProductQueryRequest();
        queryRequest.setProfessorEmail(email);
        queryRequest.setSortBy("id");
        queryRequest.setIsDesc(false);
        queryRequest.setProductStatus(ProductStatus.PROCESSING);
        return toiletProductDao.queryAllProductsByPage(queryRequest).stream()
                .map(ProductConverter::toDTO)
                .collect(Collectors.toList());
    }

    @Override
    public List<ToiletProductDTO> queryAllProductList(String email) {
        List<ToiletProductDO> productDOS = toiletProductDao.queryAllProducts(email);
        return productDOS.stream().map(ProductConverter::toDTO).collect(Collectors.toList());
    }

    @Override
    public List<ToiletProductDTO> queryAllProductList(String email, List<ProductStatus> statuses) {
        List<ToiletProductDO> productDOS = toiletProductDao.queryAllProductsWithStatus(email, statuses);
        return productDOS.stream().map(ProductConverter::toDTO).collect(Collectors.toList());
    }

    @Override
    public ProductQueryResponse queryPageProduct(ProductSortRequest request) {
        ProductQueryResponse response = new ProductQueryResponse();

        ProductQueryRequest queryRequest = new ProductQueryRequest();
        BeanUtils.copyProperties(request, queryRequest);
        List<ToiletProductDTO> productDTOS = toiletProductDao.queryAllProductsByPage(queryRequest).stream()
                .map(ProductConverter::toDTO)
                .collect(Collectors.toList());

        Integer maxSize = toiletProductDao.queryAllProductsWithStatus("", Lists.newArrayList(request.getProductStatus())).size();
        response.setCurrentPage(request.getPageIndex());
        if(maxSize % request.getPageSize() != 0){
            response.setMaxPage(maxSize/request.getPageSize() + 1) ;
        }
        else{
            response.setMaxPage(maxSize/request.getPageSize());
        }
        response.setPageSize(request.getPageSize());
        response.setProductDTOList(productDTOS);

        return response;
    }

    @Override
    public ProductQueryResponse queryPageProductWithCondition(ProductSortRequest request, ProductSearchConditionsDTO searchConditions) {
        ProductQueryResponse response = new ProductQueryResponse();
        LinkedList<ToiletProductDTO> resultList = Lists.newLinkedList();
        Integer searchIndex = request.getPageIndex();

        double matchCount = 0L;
        Integer iteratorIndex = 1;
        request.setPageIndex(iteratorIndex);
        List<ToiletProductDTO> productDTOSFromDb;
        do {
            productDTOSFromDb = queryPageProduct(request).getProductDTOList();
            productDTOSFromDb = matchConditions(productDTOSFromDb, searchConditions);
            matchCount += productDTOSFromDb.size();
            resultList.addAll(productDTOSFromDb);
            if (resultList.size() > request.getPageSize() && !searchIndex.equals(iteratorIndex)) {
                for (int i=0; i<request.getPageSize();i++) {
                    resultList.removeFirst();
                }
            }
            iteratorIndex++;
            request.setPageIndex(iteratorIndex);
        } while (!CollectionUtils.isEmpty(queryPageProduct(request).getProductDTOList()));

        if (resultList.size() > 20) {
            for (int i=20;i<resultList.size();i++) {
                resultList.removeFirst();
            }
        }
        response.setMaxPage((int) Math.ceil(matchCount/request.getPageSize()));
        response.setCurrentPage(iteratorIndex-1);
        response.setPageSize(request.getPageSize());
        response.setProductDTOList(resultList);

        return response;
    }

    private List<ToiletProductDTO> matchConditions(List<ToiletProductDTO> productDTOS, ProductSearchConditionsDTO searchConditions) {
        return productDTOS.stream().map(productDTO -> {
            ProductParamsDTO productParamsDTO = productDTO.getProductParameters();
            if (ProductStandardType.of(productParamsDTO.getStandard()).equals(searchConditions.getStandardType())
                    && ProductTextureType.ofTypeName(productParamsDTO.getTexture()).equals(searchConditions.getTextureType())
                    && ProductLifeCycleType.of(Integer.valueOf(productParamsDTO.getServiceLife())).equals(searchConditions.getLifeCycleType())
                    && ProductPriceType.of(productParamsDTO.getPrice()).equals(searchConditions.getPriceType())
                    && ProductCleanCycleType.of(Integer.valueOf(productParamsDTO.getCleanupCycle())).equals(searchConditions.getCleanCycleType())) {
                return productDTO;
            } else {
                return null;
            }

        }).filter(Objects::nonNull).collect(Collectors.toList());
    }

    @Override
    public List<ToiletProductDTO> queryProductListByPattern(Integer patternId) {

        if (patternId == null || patternId <= 0) {
            return null;
        }
        return toiletProductDao.queryProductByPatternId(patternId).stream()
                .map(ProductConverter::toDTO)
                .collect(Collectors.toList());
    }

    @Override
    public ToiletProductDTO queryToiletById(String id) {
        ToiletProductDTO productDTOFromDb;
        ToiletProductDO productDO = toiletProductDao.queryProductById(Integer.valueOf(id));
        productDTOFromDb = ProductConverter.toDTO(productDO);
        return productDTOFromDb;
    }

    @Override
    public List<ToiletPatternDTO> queryAllPattern() {
        return toiletPatternDao.queryAllPattern().stream().map(ProductConverter::toDTO).filter(item -> item.getPatternType() != null).collect(Collectors.toList());
    }

    @Override
    public ToiletProductDTO updateProduct(ToiletProductDTO productDTO) {
        ToiletProductDO productDO = ProductConverter.toDO(productDTO);
        ToiletProductDO productDOFromDb = toiletProductDao.queryProductById(productDO.getId());

        productDO.setSource(productDOFromDb.getSource());
        productDO.setPatternId(productDOFromDb.getPatternId());
        productDO.setVersion(productDOFromDb.getVersion());
        productDO.setDeleted(productDOFromDb.getDeleted());

        productDO = toiletProductDao.updateProductBySource(productDO);
        return ProductConverter.toDTO(productDO);
    }

    /**
     * 保存产品
     */
    @Override
    public ToiletProductDTO saveProduct(ToiletProductDTO productDTO, ToiletPatternDTO patternDTO) {
        ToiletProductDO productDO = ProductConverter.toDO(productDTO);
        if (productDTO.getIsNewPattern()) {
            template.execute(status -> {
                ToiletPatternDO patternDO = ProductConverter.toDO(patternDTO);
                patternDO.setSource(buildPatternSource(patternDTO));

                ToiletPatternDO patternDOFromDb = toiletPatternDao.queryPatternBySource(patternDO.getSource());

                if (patternDOFromDb != null) {
                    patternDO = toiletPatternDao.updatePatternBySource(patternDO, patternDO.getSource());
                } else {
                    patternDO = toiletPatternDao.insertPattern(patternDO);
                }

                // product 判断
                ToiletProductDO productDOFromDb = toiletProductDao.queryProductBySource(buildProductSource(productDTO));
                productDO.setSource(buildProductSource(productDTO));

                if (productDOFromDb == null) {
                    productDO.appendPatternId(patternDO.getId());
                    toiletProductDao.insertProduct(productDO);
                } else {
                    productDO.setVersion(productDOFromDb.getVersion());
                    productDO.setDeleted(productDOFromDb.getDeleted());
                    productDO.setId(productDOFromDb.getId());
                    productDO.setGmtCreate(productDOFromDb.getGmtCreate());
                    productDO.setPatternId(productDOFromDb.getPatternId());
                    productDO.appendPatternId(patternDO.getId());
                    toiletProductDao.updateProductBySource(productDO);
                }
                return null;
            });
        } else {
            template.execute(status -> {
                List<String> patternTypes = Lists.newArrayList(productDTO.getPatternType().split(","));
                List<Integer> patternIds = Lists.newArrayList();

                // 检查是否有不存在的ID
                for (String pType : patternTypes) {
                    ToiletPatternDO patternDOFromDb = toiletPatternDao.queryPatternBySource(String.format("%s-%s", productDTO.getProductType(), pType));

                    if (patternDOFromDb == null) {
                        throw new ToiletBizException(String.format("%s 模式不存在!", pType), BIZ_ERROR);
                    }
                    patternIds.add(patternDOFromDb.getId());
                }

                ToiletProductDO productDOFromDb = toiletProductDao.queryProductBySource(buildProductSource(productDTO));

                productDO.setSource(buildProductSource(productDTO));
                patternIds.forEach(productDO::appendPatternId);
                if (productDOFromDb == null) {
                    toiletProductDao.insertProduct(productDO);
                } else {
                    productDO.setVersion(productDOFromDb.getVersion());
                    productDO.setDeleted(productDOFromDb.getDeleted());
                    productDO.setId(productDOFromDb.getId());
                    productDO.setGmtCreate(productDOFromDb.getGmtCreate());
                    toiletProductDao.updateProductBySource(productDO);
                }
                return null;
            });

        }
        ToiletProductDO productDOFromDB = toiletProductDao.queryProductBySource(buildProductSource(productDTO));

        return ProductConverter.toDTO(productDOFromDB);
    }

    private String buildProductSource(ToiletProductDTO productDTO) {
        // 企业 + 产品名称 + 模式 + 规格
        return String.format("%s-%s-%s", productDTO.getCompanyEmail(), productDTO.getProductName(), productDTO.getProductParameters().getStandard());
    }

    private String buildPatternSource(ToiletPatternDTO patternDTO) {
        return String.format("%s-%s", patternDTO.getProductType(), patternDTO.getPatternType());
    }

    @Override
    public ToiletPatternDTO savePattern(ToiletPatternDTO patternDTO) {
        ToiletPatternDO patternDO = toiletPatternDao.savePattern(ProductConverter.toDO(patternDTO));

        patternDTO = ProductConverter.toDTO(patternDO);
        return patternDTO;
    }
}
