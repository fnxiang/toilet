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
                    <li class="active">
                        <a href="${pageContext.request.contextPath}/toPage?url=professor_back1" style="padding-top: 20px; padding-bottom: 20px;"><i class="menu-icon fa fa-laptop"></i>产品信息审核列表</a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/toPage?url=professor_back2" style="padding-top: 20px; padding-bottom: 20px;"><i class="menu-icon fa fa-glass"></i>模式审核列表</a>
                    </li>
					<li>
                        <a href="${pageContext.request.contextPath}/toPage?url=professor_back3" style="padding-top: 20px; padding-bottom: 20px;"><i class="menu-icon fa fa-tasks"></i>基本信息</a>
                    </li>
					<li>
                        <a href="${pageContext.request.contextPath}/toPage?url=professor_back4" style="padding-top: 20px; padding-bottom: 20px;"><i class="menu-icon fa fa-cogs"></i>修改密码</a>
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
                    <a class="navbar-brand" href="#"><img src="${pageContext.request.contextPath}/static/manage/res/logo.png" alt="Logo"></a>
                    <a class="navbar-brand hidden" href=""><img src="${pageContext.request.contextPath}/static/manage/images/logo2.png" alt="Logo"></a>
                    <a id="menuToggle" class="menutoggle"><i class="fa fa-bars"></i></a>
                </div>
            </div>
            <div class="top-right">
                <div class="header-menu">
                    

                    <div class="user-area dropdown float-right">
                        <a href="#" class="dropdown-toggle active" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <img class="user-avatar rounded-circle" src="${pageContext.request.contextPath}/static/manage/res/logo.png" alt="User Avatar">
                        </a>

                        <div class="user-menu dropdown-menu">
                            <a class="nav-link" href="${pageContext.request.contextPath}/toPage?url=professor_back3"><i class="fa fa-user"></i>个人信息管理</a>

                            <a class="nav-link" href="${pageContext.request.contextPath}/toPage?url=professor_back4"><i class="fa fa-cog"></i>设置</a>

                            <a class="nav-link" href="#"><i class="fa fa-power-off"></i>注销</a>
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
                                <h1>专家后台管理系统</h1>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-8">
                        <div class="page-header float-right">
                            <div class="page-title">
                                <ol class="breadcrumb text-right">
                                    <li><a href="${pageContext.request.contextPath}/toPage?url=professor_back1">后台</a></li>
                                    <li class="active">产品信息审核</li>
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
                                <strong class="card-title">产品信息审核</strong>
                            </div>
                            <div class="card-body">
                                
								
								<div id="newModeAdding" style="">
									

									<div class="custom-tab">
										<nav>
											<div class="nav nav-tabs" id="nav-tab" role="tablist">
												<a class="nav-item nav-link active show" id="custom-nav-basic-tab" data-toggle="tab" href="#custom-nav-basic" role="tab" aria-controls="custom-nav-basic" aria-selected="true">基础信息</a>
											</div>
										</nav>
										<div class="tab-content pl-3 pt-2" id="nav-tabContent">
											<div class="tab-pane fade active show" id="custom-nav-basic" role="tabpanel" aria-labelledby="custom-nav-basic-tab">
												<div class="row form-group">
												
													<!-- 承载大图片的div -->
													<div id="outerdiv" style="position:fixed;top:0;left:0;background:rgba(0,0,0,0.7);z-index:2;width:100%;height:100%;display:none;">
													　　<div id="innerdiv" style="position:absolute;">
													　　　　<img id="bigimg" style="border:5px solid #fff;" src="" />
													　　</div>
													</div>
												
													<div class="col col-md-5">
														<div class="col-12 col-md-12">
															<img class="card-img-top" src="${pageContext.request.contextPath}/static/manage/res/2.png" alt="Card image cap" id="sampleimg" onclick="showbigpic(this)">
														</div>
														<div class="col-12 col-md-12">
															<img class="card-img-top col-md-3" src="${pageContext.request.contextPath}/static/manage/res/1.png" alt="Card image cap" onclick="changeimg(this)">
															<img class="card-img-top col-md-3" src="${pageContext.request.contextPath}/static/manage/res/2.png" alt="Card image cap" onclick="changeimg(this)">
															<img class="card-img-top col-md-3" src="${pageContext.request.contextPath}/static/manage/res/3.png" alt="Card image cap" onclick="changeimg(this)">
														</div>
														
													</div>
													<div class="col-12 col-md-7">
														<div class="row form-group">
															<div class="col col-md-3"><label for="text-input" class=" form-control-label">产品名称</label></div>
															<div class="col-12 col-md-9"><input type="text" id="text-input" name="text-input" placeholder="" class="form-control" value="三格化粪池" disabled></div>
														</div>
														<div class="row form-group">
															<div class="col col-md-3"><label for="text-input" class=" form-control-label">价格</label></div>
															<div class="col-12 col-md-9"><input type="text" id="text-input" name="text-input" placeholder="" class="form-control" value="1.8万元" disabled></div>
														</div>
														<div class="row form-group">
															<div class="col col-md-3"><label for="text-input" class=" form-control-label">企业名称</label></div>
															<div class="col-12 col-md-9"><input type="text" id="text-input" name="text-input" placeholder="" class="form-control" value="某某某科技股份有限公司" disabled></div>
														</div>
														<div class="row form-group">
															<div class="col col-md-3"><label for="text-input" class=" form-control-label">联系方式</label></div>
															<div class="col-12 col-md-9"><input type="text" id="text-input" name="text-input" placeholder="" class="form-control" value="1234567890" disabled></div>
														</div>
														<div class="row form-group">
															<div class="col col-md-3"><label for="text-input" class=" form-control-label">地址</label></div>
															<div class="col-12 col-md-9"><input type="text" id="text-input" name="text-input" placeholder="" class="form-control" value="北京市海淀区上园村3号" disabled></div>
														</div>
														<div class="row form-group">
															<div class="col col-md-3"><label for="text-input" class=" form-control-label">最后更新</label></div>
															<div class="col-12 col-md-9"><input type="text" id="text-input" name="text-input" placeholder="" class="form-control" value="2021年9月23日" disabled></div>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
									
									<div class="custom-tab">
										<nav>
											<div class="nav nav-tabs" id="nav-tab" role="tablist">
												<a class="nav-item nav-link active show" id="custom-nav-condition-tab" data-toggle="tab" href="#custom-nav-condition" role="tab" aria-controls="custom-nav-condition" aria-selected="true">适用条件</a>
											</div>
										</nav>
										<div class="tab-content pl-3 pt-2" id="nav-tabContent">
											<div class="tab-pane fade active show" id="custom-nav-condition" role="tabpanel" aria-labelledby="custom-nav-condition-tab">
												<div class="row form-group">
													<div class="col col-md-3"><label for="text-input" class=" form-control-label">适用省份</label></div>
													<div class="col-12 col-md-9"><input type="text" id="text-input" name="text-input" placeholder="" class="form-control" value="山西，河北，河南" disabled></div>
												</div>
												<div class="row form-group">
													<div class="col col-md-3"><label for="text-input" class=" form-control-label">适用温度范围</label></div>
													<div class="col-12 col-md-9"><input type="text" id="text-input" name="text-input" placeholder="" class="form-control" value="20~25℃" disabled></div>
												</div>
												<div class="row form-group">
													<div class="col col-md-3"><label for="textarea-input" class=" form-control-label">用途</label></div>
													<div class="col-12 col-md-9"><textarea name="textarea-input" id="textarea-input" rows="5" placeholder="" class="form-control" disabled>用途。。。</textarea></div>
												</div>
											</div>
										</div>
									</div>
									
									<div class="custom-tab">
										<nav>
											<div class="nav nav-tabs" id="nav-tab" role="tablist">
												<a class="nav-item nav-link active show" id="custom-nav-parameter-tab" data-toggle="tab" href="#custom-nav-parameter" role="tab" aria-controls="custom-nav-parameter" aria-selected="true">产品参数</a>
											</div>
										</nav>
										<div class="tab-content pl-3 pt-2" id="nav-tabContent">
											<div class="tab-pane fade active show" id="custom-nav-parameter" role="tabpanel" aria-labelledby="custom-nav-parameter-tab">
												
												<div class="row form-group">
													<div class="col col-md-3"><label for="textarea-input" class=" form-control-label">产品参数</label></div>
													<div class="col-12 col-md-9"><textarea name="textarea-input" id="textarea-input" rows="9" placeholder="" class="form-control" disabled>产品参数</textarea></div>
												</div>
												
											</div>
										</div>
									</div>
									<div class="custom-tab">
										<nav>
											<div class="nav nav-tabs" id="nav-tab" role="tablist">
												<a class="nav-item nav-link active show" id="custom-nav-features-tab" data-toggle="tab" href="#custom-nav-features" role="tab" aria-controls="custom-nav-features" aria-selected="true">产品特点</a>
											</div>
										</nav>
										<div class="tab-content pl-3 pt-2" id="nav-tabContent">
											<div class="tab-pane fade active show" id="custom-nav-features" role="tabpanel" aria-labelledby="custom-nav-features-tab">
												<div class="row form-group">
													<div class="col col-md-3"><label for="textarea-input" class=" form-control-label">产品特点</label></div>
													<div class="col-12 col-md-9"><textarea name="textarea-input" id="textarea-input" rows="9" placeholder="" class="form-control" disabled>产品特点..</textarea></div>
												</div>
												<div class="row form-group">
													<div class="col col-md-3"><label for="textarea-input" class=" form-control-label">使用图片</label></div>
													
													<!-- 承载大图片的div -->
													<div id="outerdiv" style="position:fixed;top:0;left:0;background:rgba(0,0,0,0.7);z-index:2;width:100%;height:100%;display:none;">
													　　<div id="innerdiv" style="position:absolute;">
													　　　　<img id="bigimg" style="border:5px solid #fff;" src="" />
													　　</div>
													</div>
													
													<div class="col-12 col-md-9">
														<img class="card-img-top col-md-3" src="${pageContext.request.contextPath}/static/manage/res/1.png" alt="Card image cap" onclick="showbigpic(this)">
														<img class="card-img-top col-md-3" src="${pageContext.request.contextPath}/static/manage/res/2.png" alt="Card image cap" onclick="showbigpic(this)">
														<img class="card-img-top col-md-3" src="${pageContext.request.contextPath}/static/manage/res/3.png" alt="Card image cap" onclick="showbigpic(this)">
													</div>
												</div>
											</div>
										</div>
									</div>
									<div class="custom-tab">
										<nav>
											<div class="nav nav-tabs" id="nav-tab" role="tablist">
												<a class="nav-item nav-link active show" id="custom-nav-quality-tab" data-toggle="tab" href="#custom-nav-quality" role="tab" aria-controls="custom-nav-quality" aria-selected="true">质量保障</a>
											</div>
										</nav>
										<div class="tab-content pl-3 pt-2" id="nav-tabContent">
											<div class="tab-pane fade active show" id="custom-nav-quality" role="tabpanel" aria-labelledby="custom-nav-quality-tab">
												<iframe src="${pageContext.request.contextPath}/static/manage/res/PR_final.pdf" width="100%" height="100%" style="height: 500px;"></iframe>
											</div>
										</div>
									</div>
									
									<div class="custom-tab">
										<nav>
											<div class="nav nav-tabs" id="nav-tab" role="tablist">
												<a class="nav-item nav-link active show" id="custom-nav-use-tab" data-toggle="tab" href="#custom-nav-use" role="tab" aria-controls="custom-nav-use" aria-selected="true">使用说明</a>
											</div>
										</nav>
										<div class="tab-content pl-3 pt-2" id="nav-tabContent">
											<div class="tab-pane fade active show" id="custom-nav-use" role="tabpanel" aria-labelledby="custom-nav-use-tab">
												<iframe src="${pageContext.request.contextPath}/static/manage/res/PR_final.pdf" width="100%" height="100%" style="height: 500px;"></iframe>
											</div>
										</div>
									</div>
									
								</div>
								
								
								
								
								
								
								
								
								<hr>
								<form action="#" method="post" enctype="multipart/form-data" class="form-horizontal">
									<div class="row form-group">
										<div class="col col-md-3"><label for="select" class=" form-control-label">是否通过</label></div>
										<div class="col-12 col-md-9">
											<select name="select" id="select" class="form-control">
												<option value="0">通过</option>
												<option value="1">不通过</option>
												<option value="2">修改后重新审查</option>
											</select>
										</div>
									</div>
									<div class="row form-group">
                                        <div class="col col-md-3"><label for="textarea-input" class=" form-control-label">审核意见</label></div>
                                        <div class="col-12 col-md-9"><textarea name="textarea-input" id="textarea-input" rows="9" placeholder="审核意见..." class="form-control"></textarea></div>
                                    </div>
								</form>
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
        $(document).ready(function() {
          $('#bootstrap-data-table-export').DataTable();
      } );
	</script>
	
	<script type="text/javascript">
		function showbigpic(obj){
		    var _this = $(obj);//将当前的pimg元素作为_this传入函数
		    imgShow("#outerdiv", "#innerdiv", "#bigimg", _this);
		}

		function imgShow(outerdiv, innerdiv, bigimg, _this){
		    var src = _this.attr("src");//获取当前点击的pimg元素中的src属性
		    $(bigimg).attr("src", src);//设置#bigimg元素的src属性
		 
		        /*获取当前点击图片的真实大小，并显示弹出层及大图*/
		    $("<img/>").attr("src", src).load(function(){
		        var windowW = $(window).width();//获取当前窗口宽度
		        var windowH = $(window).height();//获取当前窗口高度
		        var realWidth = this.width;//获取图片真实宽度
		        var realHeight = this.height;//获取图片真实高度
		        var imgWidth, imgHeight;
		        var scale = 0.9;//缩放尺寸，当图片真实宽度和高度大于窗口宽度和高度时进行缩放
		        
		        if(realHeight>windowH*scale) {//判断图片高度
		            imgHeight = windowH*scale;//如大于窗口高度，图片高度进行缩放
		            imgWidth = imgHeight/realHeight*realWidth;//等比例缩放宽度
		            if(imgWidth>windowW*scale) {//如宽度扔大于窗口宽度
		                imgWidth = windowW*scale;//再对宽度进行缩放
		            }
		        } else if(realWidth>windowW*scale) {//如图片高度合适，判断图片宽度
		            imgWidth = windowW*scale;//如大于窗口宽度，图片宽度进行缩放
		                        imgHeight = imgWidth/realWidth*realHeight;//等比例缩放高度
		        } else {//如果图片真实高度和宽度都符合要求，高宽不变
		            imgWidth = realWidth;
		            imgHeight = realHeight;
		        }
		                $(bigimg).css("width",imgWidth);//以最终的宽度对图片缩放
		        
		        var w = (windowW-imgWidth)/2;//计算图片与窗口左边距
		        var h = (windowH-imgHeight)/2;//计算图片与窗口上边距
		        $(innerdiv).css({"top":h, "left":w});//设置#innerdiv的top和left属性
		        $(outerdiv).fadeIn("fast");//淡入显示#outerdiv及.pimg
		    });
		    
		    $(outerdiv).click(function(){//再次点击淡出消失弹出层
		        $(this).fadeOut("fast");
		    });
		}
	
	</script>
	
	<script type="text/javascript">
		function changeimg(obj){
			var _this = $(obj);
			var src = _this.attr("src");
			$("#sampleimg").attr("src",src);
		}

	</script>
</body>
</html>
