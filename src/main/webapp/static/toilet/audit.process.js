
// 企业端提交状态请求
function submit(productId, statusCode) {
    const data = new FormData();
    data.append("productId", productId);
    data.append("statusCode", statusCode);

    $.ajax({
        url: "/toilet/company/product/audit/submit",
        type: "POST",
        dataType: "json",
        data: data,
        async: false,
        cache: false,
        contentType: false,
        processData: false,
        success: function (result) {
            if (result.success) {
                show("提交审核成功！");
                //TODO 去掉对应的提交审核按钮
            } else {
                show(result.errorMessage);
            }
        }
    });
}

// 企业端提交状态请求
function submitPattern(productId, statusCode) {
    const data = new FormData();
    data.append("patternId", productId);
    data.append("statusCode", statusCode);

    $.ajax({
        url: "/toilet/company/pattern/audit/submit",
        type: "POST",
        dataType: "json",
        data: data,
        async: false,
        cache: false,
        contentType: false,
        processData: false,
        success: function (result) {
            if (result.success) {
                show("提交审核成功！");
                //TODO 去掉对应的提交审核按钮
            } else {
                show(result.errorMessage);
            }
        }
    });
}