<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang=""> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8" lang=""> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9" lang=""> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js" lang=""> <!--<![endif]-->
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>后台管理系统</title>
    <meta name="description" content="Ela Admin - HTML5 Admin Template">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="shortcut icon" href="${pageContext.request.contextPath}/static/manage/res/logo.ico">

    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/manage/assets/css/normalize.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/static/manage/assets/css/bootstrap.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/static/manage/assets/css/font-awesome.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/static/manage/assets/css/themify-icons.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/static/manage/assets/css/pe-icon-7-filled.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/manage/assets/css/flag-icon.min.css"><link rel="stylesheet" href="${pageContext.request.contextPath}/static/manage/assets/css/cs-skin-elastic.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/manage/assets/css/lib/datatable/dataTables.bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/manage/assets/css/style.css">

    <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,600,700,800' rel='stylesheet' type='text/css'>

    <!-- <script type="text/javascript" src="https://cdn.jsdelivr.net/html5shiv/3.7.3/html5shiv.min.js"></script> -->

</head>
<body>
    <!-- Left Panel -->

    <aside id="left-panel" class="left-panel">
        <nav class="navbar navbar-expand-sm navbar-default">

            <div id="main-menu" class="main-menu collapse navbar-collapse">
                <ul class="nav navbar-nav">
                    <li>
                        <a href="${pageContext.request.contextPath}/toPage?url=company_back1" style="padding-top: 20px; padding-bottom: 20px;"><i class="menu-icon fa fa-laptop"></i>我的申请</a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/toPage?url=company_back2" style="padding-top: 20px; padding-bottom: 20px;"><i class="menu-icon fa fa-glass"></i>企业基本信息</a>
                    </li>
					<li class="active">
                        <a href="#" style="padding-top: 20px; padding-bottom: 20px;"><i class="menu-icon fa fa-tasks"></i>产品信息录入</a>
                    </li>
					<li>
                        <a href="${pageContext.request.contextPath}/toPage?url=company_back4" style="padding-top: 20px; padding-bottom: 20px;"><i class="menu-icon fa fa-cogs"></i>修改密码</a>
                    </li>
                </ul>
            </div><!-- /.navbar-collapse -->
        </nav>
    </aside><!-- /#left-panel -->

    <!-- Left Panel -->

    <!-- Right Panel -->

    <div id="right-panel" class="right-panel">

        <!-- Header-->
        <header id="header" class="header">
            <div class="top-left">
                <div class="navbar-header">
                    <a class="navbar-brand" href="${pageContext.request.contextPath}/company/index"><img src="${pageContext.request.contextPath}/static/manage/res/logo.png" alt="Logo"></a>
                    <a class="navbar-brand hidden" href="./"><img src="images/logo2.png" alt="Logo"></a>
                    <a id="menuToggle" class="menutoggle"><i class="fa fa-bars"></i></a>
                </div>
            </div>
            <div class="top-right">
                <div class="header-menu">

                    <div class="user-area dropdown float-right">
                        <a href="#" class="dropdown-toggle active" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <img class="user-avatar rounded-circle" src="${pageContext.request.contextPath}/static/manage/./res/logo.png" alt="User Avatar">
                        </a>

                        <div class="user-menu dropdown-menu">
                            <a class="nav-link" href=".${pageContext.request.contextPath}/toPage?url=company_back2"><i class="fa fa-user"></i>企业信息管理</a>

                            <a class="nav-link" href="${pageContext.request.contextPath}/toPage?url=company_back4"><i class="fa fa-cog"></i>设置</a>

                            <a class="nav-link" href="${pageContext.request.contextPath}"><i class="fa fa-power-off"></i>注销</a>
                        </div>
                    </div>
                </div>
            </div>
        </header><!-- /header -->
        <!-- Header-->

		<div class="breadcrumbs">
            <div class="breadcrumbs-inner">
                <div class="row m-0">
                    <div class="col-sm-4">
                        <div class="page-header float-left">
                            <div class="page-title">
                                <h1>产品信息录入</h1>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-8">
                        <div class="page-header float-right">
                            <div class="page-title">
                                <ol class="breadcrumb text-right">
                                    <li><a href="${pageContext.request.contextPath}/company/index">后台</a></li>
                                    <li class="active">产品信息录入</li>
                                </ol>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="content">
            <div class="animated fadeIn">
                <div class="row">

                    <div class="col-md-12">
                        <div class="card">
                            <div class="card-header">
                                <strong class="card-title">产品信息录入</strong>
                            </div>
							<div class="card-body card-block">
                                <form action="#" method="post" enctype="multipart/form-data" class="form-horizontal">
                                    <div class="row form-group">
                                        <div class="col col-md-3"><label for="text-input" class=" form-control-label">产品名称
											<i id="product_name_tips" class="fa fa-question-circle" data-toggle="tooltip" data-placement="top" title="输入注意事项"></i></label></div>
                                        <div class="col-12 col-md-9"><input type="text" id="text-input" name="text-input" placeholder="请输入产品名称" class="form-control"></div>
                                    </div>
									<div class="row form-group">
                                        <div class="col col-md-3"><label for="text-input" class=" form-control-label">厂家
											<i id="producer_name_tips" class="fa fa-question-circle" data-toggle="tooltip" data-placement="top" title="输入注意事项"></i></label></div>
                                        <div class="col-12 col-md-9"><input type="text" id="text-input" name="text-input" placeholder="请输入厂家名称" class="form-control"></div>
                                    </div>
									<div class="row form-group">
                                        <div class="col col-md-3"><label for="text-input" class=" form-control-label">联系方式
											<i id="contact_name_tips" class="fa fa-question-circle" data-toggle="tooltip" data-placement="top" title="输入注意事项"></i></label></div>
                                        <div class="col-12 col-md-9"><input type="text" id="text-input" name="text-input" placeholder="请输入正确的联系方式" class="form-control"></div>
                                    </div>
									<div class="row form-group">
                                        <div class="col col-md-3"><label for="select" class=" form-control-label">产品类型
											<i id="product_type_tips" class="fa fa-question-circle" data-toggle="tooltip" data-placement="top" title="输入注意事项"></i></label></div>
                                        <div class="col-12 col-md-9">
                                            <select name="select" id="select" class="form-control">
                                                <option value="0">完整下水道式厕所</option>
                                                <option value="1">三格化粪池式厕所</option>
                                                <option value="2">双瓮漏斗式厕所</option>
                                                <option value="3">三联沼气池式厕所</option>
												<option value="4">复合生物反应微水冲厕所</option>
												<option value="5">真空负压厕所</option>
												<option value="6">多级生化组合电催化氧化厕所</option>
												<option value="7">膜生物反应器（MBR）厕所</option>
												<option value="8">堆肥式生态厕所</option>
												<option value="9">双坑交替式厕所</option>
												<option value="10">粪尿分集式生态旱厕</option>
												<option value="11">粪污生态菌发酵</option>
												<option value="12">可生物降解泡沫冲洗厕所</option>
												<option value="13">其他类型</option>
                                            </select>
                                        </div>
                                    </div>
									<div class="row form-group">
                                        <div class="col col-md-3"><label for="multiple-select" class=" form-control-label">模式类型
											<i id="model_type_tips" class="fa fa-question-circle" data-toggle="tooltip" data-placement="top" title="输入注意事项"></i></label></div>
                                        <div class="col col-md-9">
                                            <select name="multiple-select" id="multiple-select" multiple="" class="form-control">
                                                <option value="1">收集：集中收集</option>
                                                <option value="2">转运：抽排设备</option>
                                                <option value="3">处理：无害化处理</option>
                                                <option value="4">资源化利用：发酵池</option>
                                            </select>
                                        </div>
                                    </div>
									<hr>
									<div class="row form-group">
                                        <div class="col col-md-3"><label class=" form-control-label">是否添加新模式</label></div>
                                        <div class="col col-md-9">
                                            <div class="form-check-inline form-check">
                                                <label for="newmoderadios1" class="form-check-label">
                                                    <input type="radio" id="newmoderadios1" name="newmoderadios" value="showNewMode" class="form-check-input">是&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                </label>
                                                <label for="newmoderadios2" class="form-check-label">
                                                    <input type="radio" id="newmoderadios2" name="newmoderadios" value="hideNewMode" class="form-check-input">否
                                                </label>
                                            </div>
                                        </div>
                                    </div>

									<div class="row form-group">
										<div class="col col-md-1"><label class=" form-control-label"></label></div>
										<div class="col col-md-11"><p>如果添加新模式请勾选是，并按照提示要求进行填写。</p></div>
									</div>


									<!--  style="display:none;"  -->
									<div id="newModeAdding" style="">
										<div class="row form-group">
											<div class="col col-md-3"><label for="text-input" class=" form-control-label">新模式名称
												<i id="new_model_name_tips" class="fa fa-question-circle" data-toggle="tooltip" data-placement="top" title="输入注意事项"></i></label></div>
											<div class="col-12 col-md-4"><input type="text" id="text-input" name="text-input" placeholder="一级名称" class="form-control"></div>
											<div class="col-12 col-md-4 offset-md-1"><input type="text" id="text-input" name="text-input" placeholder="二级名称" class="form-control"></div>
										</div>


										<div class="custom-tab">
											<nav>
												<div class="nav nav-tabs" id="nav-tab" role="tablist">
													<a class="nav-item nav-link active show" id="custom-nav-nature-tab" data-toggle="tab" href="#custom-nav-nature" role="tab" aria-controls="custom-nav-nature" aria-selected="true">适用条件：自然环境条件</a>
												</div>
											</nav>
											<div class="tab-content pl-3 pt-2" id="nav-tabContent">
												<div class="tab-pane fade active show" id="custom-nav-nature" role="tabpanel" aria-labelledby="custom-nav-nature-tab">

													<div class="row form-group">
														<div class="col col-md-3"><label for="select" class=" form-control-label">温度条件：
															<i class="fa fa-question-circle" data-toggle="tooltip" data-placement="top" title="输入注意事项"></i></label></div>
														<div class="col-12 col-md-9">
															<select name="select" id="select" class="form-control">
																<option value="0">高寒</option>
																<option value="1">无特殊</option>
															</select>
														</div>
													</div>
													<div class="row form-group">
														<div class="col col-md-3"><label for="select" class=" form-control-label">水资源条件：
															<i class="fa fa-question-circle" data-toggle="tooltip" data-placement="top" title="输入注意事项"></i></label></div>
														<div class="col-12 col-md-9">
															<select name="select" id="select" class="form-control">
																<option value="0">缺水</option>
																<option value="1">良好</option>
															</select>
														</div>
													</div>
													<div class="row form-group">
														<div class="col col-md-3"><label for="select" class=" form-control-label">地形条件：
															<i class="fa fa-question-circle" data-toggle="tooltip" data-placement="top" title="输入注意事项"></i></label></div>
														<div class="col-12 col-md-9">
															<select name="select" id="select" class="form-control">
																<option value="0">平坦</option>
																<option value="1">山区</option>
																<option value="2">丘陵</option>
																<option value="3">无特殊</option>
															</select>
														</div>
													</div>
													<div class="row form-group">
														<div class="col col-md-3"><label for="select" class=" form-control-label">地理位置条件：
															<i class="fa fa-question-circle" data-toggle="tooltip" data-placement="top" title="输入注意事项"></i></label></div>
														<div class="col-12 col-md-9">
															<select name="select" id="select" class="form-control">
																<option value="0">城市近郊</option>
																<option value="1">城中村</option>
																<option value="2">中心城镇地区</option>
																<option value="3">其他</option>
															</select>
														</div>
													</div>
													<div class="row form-group">
														<div class="col col-md-3"><label for="select" class=" form-control-label">生态限制条件：
															<i class="fa fa-question-circle" data-toggle="tooltip" data-placement="top" title="输入注意事项"></i></label></div>
														<div class="col-12 col-md-9">
															<select name="select" id="select" class="form-control">
																<option value="0">生态保护区</option>
																<option value="1">水源保护区</option>
																<option value="2">一般地区</option>
															</select>
														</div>
													</div>
												</div>
											</div>
										</div>

										<div class="custom-tab">
											<nav>
												<div class="nav nav-tabs" id="nav-tab" role="tablist">
													<a class="nav-item nav-link active show" id="custom-nav-people-tab" data-toggle="tab" href="#custom-nav-people" role="tab" aria-controls="custom-nav-people" aria-selected="true">适用条件：人文因素
														<i class="fa fa-question-circle" data-toggle="tooltip" data-placement="top" title="输入注意事项"></i></a>
												</div>
											</nav>
											<div class="tab-content pl-3 pt-2" id="nav-tabContent">
												<div class="tab-pane fade active show" id="custom-nav-people" role="tabpanel" aria-labelledby="custom-nav-people-tab">

													<div class="row form-group">
														<div class="col col-md-3"><label for="select" class=" form-control-label">人口密集程度：
															<i class="fa fa-question-circle" data-toggle="tooltip" data-placement="top" title="输入注意事项"></i></label></div>
														<div class="col-12 col-md-9">
															<select name="select" id="select" class="form-control">
																<option value="0">聚集</option>
																<option value="1">分散</option>
																<option value="2">一般</option>
															</select>
														</div>
													</div>
													<div class="row form-group">
														<div class="col col-md-3"><label for="select" class=" form-control-label">液态肥使用习惯：
															<i class="fa fa-question-circle" data-toggle="tooltip" data-placement="top" title="输入注意事项"></i></label></div>
														<div class="col-12 col-md-9">
															<select name="select" id="select" class="form-control">
																<option value="0">是</option>
																<option value="1">否</option>
																<option value="2">均可</option>
															</select>
														</div>
													</div>
												</div>
											</div>
										</div>
										<div class="custom-tab">
											<nav>
												<div class="nav nav-tabs" id="nav-tab" role="tablist">
													<a class="nav-item nav-link active show" id="custom-nav-pip-tab" data-toggle="tab" href="#custom-nav-pip" role="tab" aria-controls="custom-nav-pip" aria-selected="true">适用条件：管网条件
														<i class="fa fa-question-circle" data-toggle="tooltip" data-placement="top" title="输入注意事项"></i></a>
												</div>
											</nav>
											<div class="tab-content pl-3 pt-2" id="nav-tabContent">
												<div class="tab-pane fade active show" id="custom-nav-pip" role="tabpanel" aria-labelledby="custom-nav-pip-tab">

													<div class="row form-group">
														<div class="col col-md-3"><label for="select" class=" form-control-label">具有污水管道：
															<i class="fa fa-question-circle" data-toggle="tooltip" data-placement="top" title="输入注意事项"></i></label></div>
														<div class="col-12 col-md-9">
															<select name="select" id="select" class="form-control">
																<option value="0">是</option>
																<option value="1">否</option>
															</select>
														</div>
													</div>
													<div class="row form-group">
														<div class="col col-md-3"><label for="select" class=" form-control-label">具有完整城镇污水处理系统：
															<i class="fa fa-question-circle" data-toggle="tooltip" data-placement="top" title="输入注意事项"></i></label></div>
														<div class="col-12 col-md-9">
															<select name="select" id="select" class="form-control">
																<option value="0">是</option>
																<option value="1">否</option>
															</select>
														</div>
													</div>
												</div>
											</div>
										</div>
										<div class="custom-tab">
											<nav>
												<div class="nav nav-tabs" id="nav-tab" role="tablist">
													<a class="nav-item nav-link active show" id="custom-nav-resource-tab" data-toggle="tab" href="#custom-nav-resource" role="tab" aria-controls="custom-nav-resource" aria-selected="true">适用条件：资源化利用
														<i class="fa fa-question-circle" data-toggle="tooltip" data-placement="top" title="输入注意事项"></i></a>
												</div>
											</nav>
											<div class="tab-content pl-3 pt-2" id="nav-tabContent">
												<div class="tab-pane fade active show" id="custom-nav-resource" role="tabpanel" aria-labelledby="custom-nav-resource-tab">

													<div class="row form-group">
														<div class="col col-md-3"><label for="select" class=" form-control-label">具有沼气利用工程：
															<i class="fa fa-question-circle" data-toggle="tooltip" data-placement="top" title="输入注意事项"></i></label></div>
														<div class="col-12 col-md-9">
															<select name="select" id="select" class="form-control">
																<option value="0">是</option>
																<option value="1">否</option>
															</select>
														</div>
													</div>
													<div class="row form-group">
														<div class="col col-md-3"><label for="select" class=" form-control-label">计划与其他生活污水混合处理：
															<i class="fa fa-question-circle" data-toggle="tooltip" data-placement="top" title="输入注意事项"></i></label></div>
														<div class="col-12 col-md-9">
															<select name="select" id="select" class="form-control">
																<option value="0">是</option>
																<option value="1">否</option>
															</select>
														</div>
													</div>
													<div class="row form-group">
														<div class="col col-md-3"><label for="select" class=" form-control-label">计划与畜禽粪污、餐厨垃圾、农作物秸秆、尾菜等一并处理：
															<i class="fa fa-question-circle" data-toggle="tooltip" data-placement="top" title="输入注意事项"></i></label></div>
														<div class="col-12 col-md-9">
															<select name="select" id="select" class="form-control">
																<option value="0">是</option>
																<option value="1">否</option>
															</select>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
									<hr>

									<div class="row form-group">
                                        <div class="col col-md-3"><label for="text-input" class=" form-control-label">适用省份
											<i class="fa fa-question-circle" data-toggle="tooltip" data-placement="top" title="输入注意事项"></i></label></div>
                                        <div class="col-12 col-md-9"><input type="text" id="text-input" name="text-input" placeholder="输入省份名称" class="form-control"><small class="form-text text-muted">输入省份名称，以逗号间隔</small></div>
                                    </div>
									<div class="row form-group">
                                        <div class="col col-md-3"><label for="text-input" class=" form-control-label">适用温度范围
											<i class="fa fa-question-circle" data-toggle="tooltip" data-placement="top" title="输入注意事项"></i></label></div>
                                        <div class="col-12 col-md-9"><input type="text" id="text-input" name="text-input" placeholder="输入适用温度范围" class="form-control"></div>
                                    </div>
									<div class="row form-group">
                                        <div class="col col-md-3"><label for="textarea-input" class=" form-control-label">用途
											<i id="use_for" class="fa fa-question-circle" data-toggle="tooltip"
											   data-placement="top" title="输入用途的注意事项"></i></label></div>
                                        <div class="col-12 col-md-9"><textarea name="textarea-input" id="textarea-input" rows="5" placeholder="用途..." class="form-control"></textarea></div>
                                    </div>
									<div class="row form-group">
                                        <div class="col col-md-3"><label for="textarea-input" class=" form-control-label">产品参数
											<i class="fa fa-question-circle" data-toggle="tooltip" data-placement="top" title="输入注意事项"></i></label></div>
                                        <div class="col-12 col-md-9"><textarea name="textarea-input" id="textarea-input" rows="9" placeholder="产品参数..." class="form-control"></textarea></div>
                                    </div>
									<div class="row form-group">
                                        <div class="col col-md-3"><label for="file-input" class=" form-control-label">质量保障材料
											<i class="fa fa-question-circle" data-toggle="tooltip" data-placement="top" title="输入注意事项"></i> </label></div>
                                        <div class="col-12 col-md-9"><input type="file" id="file-input" name="file-input" class="form-control-file"><small class="form-text text-muted">请选择PDF文件上传</small></div>
                                    </div>
									<div class="row form-group">
                                        <div class="col col-md-3"><label for="file-input" class=" form-control-label">使用说明
											<i class="fa fa-question-circle" data-toggle="tooltip" data-placement="top" title="输入注意事项"></i></label></div>
                                        <div class="col-12 col-md-9"><input type="file" id="file-input" name="file-input" class="form-control-file"><small class="form-text text-muted">请选择PDF文件上传</small></div>
                                    </div>
									<div class="row form-group">
                                        <div class="col col-md-3"><label for="textarea-input" class=" form-control-label">产品特点
											<i class="fa fa-question-circle" data-toggle="tooltip" data-placement="top" title="输入注意事项"></i></label></div>
                                        <div class="col-12 col-md-9"><textarea name="textarea-input" id="textarea-input" rows="9" placeholder="产品特点..." class="form-control"></textarea></div>
                                    </div>
									<div class="row form-group">
                                        <div class="col col-md-3"><label for="file-input" class=" form-control-label">使用图片
											<i class="fa fa-question-circle" data-toggle="tooltip" data-placement="top" title="输入注意事项"></i></label></div>
                                        <div class="col-12 col-md-9"><input type="file" id="file-input" name="file-input" class="form-control-file"><small class="form-text text-muted">请选择PNG文件作为主要展示图片</small></div>
                                    </div>
									<!--
                                    <div class="row form-group">
                                        <div class="col col-md-3"><label for="file-multiple-input" class=" form-control-label">Multiple File input</label></div>
                                        <div class="col-12 col-md-9"><input type="file" id="file-multiple-input" name="file-multiple-input" multiple="" class="form-control-file"></div>
                                    </div>
									-->
                                </form>

								<hr>
                                <div class="card-text text-lg-center">
									<button type="button" class="btn btn-outline-secondary">保存草稿</button>
									<button type="button" class="btn btn-outline-secondary offset-md-2">确认提交</button>
                                </div>

                            </div>

                        </div>
                    </div>


                </div>
            </div><!-- .animated -->
        </div><!-- .content -->


        <div class="clearfix"></div>

        <footer class="site-footer">
            <div class="footer-inner bg-white">
                <div class="row">
                    <div class="col-sm-6">
                        Copyright &copy; 亚太建设科技信息研究院
                    </div>
                    <div class="col-sm-6 text-right"> Designed by Amose
                    </div>
                </div>
            </div>
        </footer>

    </div><!-- /#right-panel -->

    <!-- Right Panel -->

    <!-- Scripts -->
    <script src="${pageContext.request.contextPath}/static/manage/assets/js/vendor/jquery-2.1.4.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/manage/assets/js/popper.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/manage/assets/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/manage/assets/js/jquery.matchHeight.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/manage/assets/js/main.js"></script>


    <script src="${pageContext.request.contextPath}/static/manage/assets/js/lib/data-table/datatables.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/manage/assets/js/lib/data-table/dataTables.bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/manage/assets/js/lib/data-table/dataTables.buttons.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/manage/assets/js/lib/data-table/buttons.bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/manage/assets/js/lib/data-table/jszip.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/manage/assets/js/lib/data-table/vfs_fonts.js"></script>
    <script src="${pageContext.request.contextPath}/static/manage/assets/js/lib/data-table/buttons.html5.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/manage/assets/js/lib/data-table/buttons.print.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/manage/assets/js/lib/data-table/buttons.colVis.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/manage/assets/js/init/datatables-init.js"></script>


    <script type="text/javascript">

		<%--	文字提示	--%>
		$('use_for').tooltip({ boundary: 'window' });

        $(document).ready(function() {
			$('#bootstrap-data-table-export').DataTable();
		} );

		$(document).ready(function() {
			$('input[type=radio][name=newmoderadios]').change(function() {
				if (this.value == 'showNewMode') {
					var modediv = document.getElementById("newModeAdding");
					modediv.style.cssText = "";
				}
				else if (this.value == 'hideNewMode') {
					var modediv = document.getElementById("newModeAdding");
					modediv.style.cssText = "display:none;"
				}
			});
		});




	</script>


</body>
</html>
