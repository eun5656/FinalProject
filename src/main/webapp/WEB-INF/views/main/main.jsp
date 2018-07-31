<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var='path' value="${pageContext.request.contextPath}"/> 
<link href="${path }/resources/css/naillist.css" rel="stylesheet">
<link href="${path }/resources/css/carousel.css" rel="stylesheet">   

<script type="text/javascript">
	
</script>

<div class="container-fluid">

    <div class="row">
      <div class="col-xs-12">
        <div id="myCarousel" class="carousel slide" data-ride="carousel">

          <ol class="carousel-indicators">
            <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
            <li data-target="#myCarousel" data-slide-to="1"></li>
          </ol>


          <div class="carousel-inner" role="listbox">
            <div class="item active">
              <img src="${path }/resources/images\slide-4-1-1920x780.jpg" alt="Image">
              <div class="carousel-caption">
                <h3>Sell $</h3>
                <p>Money Money.</p>
              </div>
            </div>

            <div class="item">
              <img src="${path }/resources/images\slide-4-1-1920x780.jpg" alt="Image">
              <div class="carousel-caption">
                <h3>More Sell $</h3>
                <p>Lorem ipsum...</p>
              </div>
            </div>
          </div>

          <script type="text/javascript">
            $(document).ready(function() {
              $('.myCarousel').carousel({
                interval: 1000
              });
            });
          </script>


          <!-- <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
        <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
        </a>
          <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
        <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
        </a> -->
        </div>

        <br>

        <!--작은 케러셀-->

        <div class="row">
          <div class="col-md-12">
            <span>
              <strong style="font-size:20pt; color:rgb(71, 51, 51)"><i class="fa fa-angellist" style="font-size:36px"></i>이달의 추천 네일</strong><span>
            <hr id="custom-hr">
          </div>
          <div class="col-xs-12" style="10px;" >

            <div class="controls pull-left">
                <a class="left fa fa-chevron-left btn  btn-outline-light text-dark" href="#carousel-example-generic"
                    data-slide="prev"></a>
            </div>
            <div class="controls pull-right">
              <a class="right fa fa-chevron-right btn  btn-outline-light text-dark" href="#carousel-example-generic"
                  data-slide="next"></a>
            </div>

      </div>
        </div>
        <div id="carousel-example-generic" class="carousel slide " data-ride="carousel">
          <!-- Wrapper for slides -->
          <div class="carousel-inner">
            <div class="item active">
              <div class="row">


                  <div class="col-sm-4">
                    <div class="col-item">
                      <div class="photo">
                        <img src="http://placehold.it/350x260" class="img-responsive" alt="a" />
                      </div>
                      <div class="info">
                        <div class="row">
                          <div class="price col-md-6">
                            <h5 style="margin-bottom:7px;">
                                                        1위 ****샵</h5>
                            <h5 class="price-text-color">
                                                        경기도 구리시</h5>
                          </div>
                          <div class="rating hidden-sm col-md-6">
                            <i class="price-text-color fa fa-star"></i><i class="price-text-color fa fa-star">
                                                     </i><i class="price-text-color fa fa-star"></i><i class="price-text-color fa fa-star">
                                                     </i><i class="fa fa-star"></i>
                          </div>

                        <div class="separator clear-left">

                          <p class="btn-add">
                          <button href="#" class="btn btn-danger good-btn selected" style="width:90%"><span class="glyphicon glyphicon-heart"></span> 좋아요</button>
            </p>


            <p class="btn-details">
              <button href="#" class="btn btn-info" style="width:90%"><span class="glyphicon glyphicon-comment"></span> 리뷰</button>

          </div>
        </div>
        <div class="clearfix">
        </div>
      </div>
    </div>
  </div>



  <div class="col-sm-4">
    <div class="col-item">
      <div class="photo">
        <img src="http://placehold.it/350x260" class="img-responsive" alt="a" />
      </div>
      <div class="info">
        <div class="row">
          <div class="price col-md-6">
            <h5 style="margin-bottom:7px;">
                                                        1위 ****샵</h5>
            <h5 class="price-text-color">
                                                        경기도 구리시</h5>
          </div>
          <div class="rating hidden-sm col-md-6">
            <i class="price-text-color fa fa-star"></i><i class="price-text-color fa fa-star">
                                                     </i><i class="price-text-color fa fa-star"></i><i class="price-text-color fa fa-star">
                                                     </i><i class="fa fa-star"></i>
          </div>
        </div>
        <div class="separator clear-left">
          <p class="btn-add">

            <button href="#" class="btn btn-danger good-btn selected " style="width:90%"><span class="glyphicon glyphicon-heart"></span> 좋아요</button>
          </p>
          <p class="btn-details">
            <button href="#" class="btn btn-info" style="width:90%"><span class="glyphicon glyphicon-comment"></span> 리뷰</button>
        </div>
        <div class="clearfix">
        </div>
      </div>
    </div>
  </div>


  <div class="col-sm-4">
    <div class="col-item">
      <div class="photo">
        <img src="http://placehold.it/350x260" class="img-responsive" alt="a" />
      </div>
      <div class="info">
        <div class="row">
          <div class="price col-md-6">
            <h5 style="margin-bottom:7px;">
                                                        1위 ****샵</h5>
            <h5 class="price-text-color">
                                                        경기도 구리시</h5>
          </div>
          <div class="rating hidden-sm col-md-6">
            <i class="price-text-color fa fa-star"></i><i class="price-text-color fa fa-star">
                                                     </i><i class="price-text-color fa fa-star"></i><i class="price-text-color fa fa-star">
                                                     </i><i class="fa fa-star"></i>
          </div>
        </div>
        <div class="separator clear-left">
          <p class="btn-add">
            <button href="#" class="btn btn-danger good-btn selected " style="width:90%" onclick="myFunction();"><span class="glyphicon glyphicon-heart"></span> 좋아요</button>
          </p>
          <p class="btn-details">
            <button href="#" class="btn btn-info" style="width:90%"><span class="glyphicon glyphicon-comment"></span> 리뷰</button>
        </div>
        <div class="clearfix">
        </div>
      </div>
    </div>
  </div>



  </div>
  </div>



  <div class="item">
    <div class="row">



      <div class="col-sm-4">
        <div class="col-item">
          <div class="photo">
            <img src="http://placehold.it/350x260" class="img-responsive" alt="a" />
          </div>
          <div class="info">
            <div class="row">
              <div class="price col-md-6">
                <h5 style="margin-bottom:7px;">
                                                        1위 ****샵</h5>
                <h5 class="price-text-color">
                                                        경기도 구리시</h5>
              </div>
              <div class="rating hidden-sm col-md-6">
                <i class="price-text-color fa fa-star"></i><i class="price-text-color fa fa-star">
                                                     </i><i class="price-text-color fa fa-star"></i><i class="price-text-color fa fa-star">
                                                     </i><i class="fa fa-star"></i>
              </div>
            </div>
            <div class="separator clear-left">
              <p class="btn-add">
                <a href="#" class="btn btn-danger good-btn selected " style="width:90%"><span class="glyphicon glyphicon-heart"></span> 좋아요</a>
              </p>
              <p class="btn-details">
                <button href="#" class="btn btn-info" style="width:90%"><span class="glyphicon glyphicon-comment"></span> 리뷰</button>
            </div>
            <div class="clearfix">
            </div>
          </div>
        </div>
      </div>


      <div class="col-sm-4">
        <div class="col-item">
          <div class="photo">
            <img src="http://placehold.it/350x260" class="img-responsive" alt="a" />
          </div>
          <div class="info">
            <div class="row">
              <div class="price col-md-6">
                <h5 style="margin-bottom:7px;">
                                        1위 ****샵</h5>
                <h5 class="price-text-color">
                                        경기도 구리시</h5>
              </div>
              <div class="rating hidden-sm col-md-6">
                <i class="price-text-color fa fa-star"></i><i class="price-text-color fa fa-star">
                                     </i><i class="price-text-color fa fa-star"></i><i class="price-text-color fa fa-star">
                                     </i><i class="fa fa-star"></i>
              </div>
            </div>
            <div class="separator clear-left">
              <p class="btn-add">
                <button href="#" class="btn btn-danger good-btn selected" style="width:90%"><span class="glyphicon glyphicon-heart"></span> 좋아요</button>
              </p>
              <p class="btn-details">
                <a href="#" class="btn btn-info" style="width:90%"><span class="glyphicon glyphicon-comment"></span> 리뷰</a>
            </div>
            <div class="clearfix">
            </div>
          </div>
        </div>
      </div>



      <div class="col-sm-4">
        <div class="col-item">
          <div class="photo">
            <img src="http://placehold.it/350x260" class="img-responsive" alt="a" />
          </div>
          <div class="info">
            <div class="row">
              <div class="price col-md-6">
                <h5 style="margin-bottom:7px;">
                                          1위 ****샵</h5>
                <h5 class="price-text-color">
                                          경기도 구리시</h5>
              </div>
              <div class="rating hidden-sm col-md-6">
                <i class="price-text-color fa fa-star"></i><i class="price-text-color fa fa-star">
                                       </i><i class="price-text-color fa fa-star"></i><i class="price-text-color fa fa-star">
                                       </i><i class="fa fa-star"></i>
              </div>
            </div>
            <div class="separator clear-left">
              <p class="btn-add">
                <button href="#" class="btn btn-danger good-btn selected " style="width:90%"><span class="glyphicon glyphicon-heart"></span> 좋아요</button>
              </p>
              <p class="btn-details">
                <a href="#" class="btn btn-info" style="width:90%"><span class="glyphicon glyphicon-comment"></span> 리뷰</a>
            </div>
            <div class="clearfix">
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  </div>
  </div>
  <br>



  <div class="w3-bar <w3-light-white></w3-light-white>" style="text-align:center;">

	<!-- 지우면 꺠짐 hiddien으로 해놨음 -->
    <div id="first-dropdown" class="w3-dropdown-hover">
      <button class="w3-button">Dropdown</button>
      <div class="w3-dropdown-content w3-card-4">
        <a href="#" class="w3-bar-item w3-button">Link 1</a>
        <a href="#" class="w3-bar-item w3-button">Link 2</a>
        <a href="#" class="w3-bar-item w3-button">Link 3</a>
        <a href="#" class="w3-bar-item w3-button">Link 3</a>
        <a href="#" class="w3-bar-item w3-button">Link 3</a>
      </div>
    </div>

    <!--nail 선택-->
    <div class="w3-dropdown-hover">
      <div class="w3-border w3-hover-border-pale-red  w3-round" style="padding-left:10px;">
        <img src="${path }/resources/images/all-color.jpg" class="w3-circle" alt="Cinque Terre" width="20" height="20"><button class="select-menu w3-button w3-round w3-hover-white">전체&nbsp;</button></div>
      <div id="nailing-color" class="w3-dropdown-content w3-card-12 w3-border w3-round">
        <!--media로 조정해주기 default는 height 3.5%-->
        <ul id="dropdown-menu">
          <li class="nail-color">
            <a>
              <div  style="text-align:center"><img src="https://www.colorcombos.com/images/colors/FF0000.png" class="w3-circle" alt="Cinque Terre" width="30" height="30"> </div>
              레드
            </a>
          </li>
          <li class="nail-color">
            <a>
              <div style="text-align:center"><img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAOAAAADhCAMAAADmr0l2AAAAA1BMVEX/tN+PJ63OAAAASElEQVR4nO3BMQEAAADCoPVPbQdvoAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAABOA8XBAAGwGMP0AAAAAElFTkSuQmCC" class="w3-circle"
                  alt="Cinque Terre" width="30" height="30"></div>
              핑크
            </a>
          </li>
          <li class="nail-color">
            <a>
              <div style="text-align:center"><img src="https://vignette.wikia.nocookie.net/symbolism/images/4/43/Orange.png/revision/latest?cb=20140818120046" class="w3-circle" alt="Cinque Terre" width="30" height="30"></div>
              오렌지
            </a>
          </li>
          <li class="nail-color">
            <a>
              <div style="text-align:center"><img src="http://bdfjade.com/data/out/119/6226995-yellow-images.gif" class="w3-circle" alt="Cinque Terre" width="30" height="30"></div>
              옐로우
            </a>
          </li>
          <li class="nail-color">
            <a>
              <div style="text-align:center"><img src="https://i.ytimg.com/vi/pNWz84Sn1oo/maxresdefault.jpg" class="w3-circle" alt="Cinque Terre" width="30" height="30"></div>
              그린
            </a>
          </li>
          <li class="nail-color">
            <a>
              <div style="text-align:center"><img src="https://wallpapertag.com/wallpaper/middle/7/5/8/143301-full-size-mint-green-background-1920x1419-for-iphone-6.jpg" class="w3-circle" alt="Cinque Terre" width="30" height="30"></div>
              민트
            </a>
          </li>
          <li class="nail-color">
            <a>
              <div style="text-align:center"><img src="https://vignette.wikia.nocookie.net/p__/images/4/4b/Solid_blue.svg.png/revision/latest?cb=20160330012046&path-prefix=protagonist" class="w3-circle" alt="Cinque Terre" width="30" height="30"></div>
              블루
            </a>
          </li>
          <li class="nail-color">
            <a>
              <div style="text-align:center"><img src="https://img.etsystatic.com/il/c7a8e4/1513338021/il_340x270.1513338021_9myj.jpg?version=0" class="w3-circle" alt="Cinque Terre" width="30" height="30"></div>
              라벤더
            </a>
          </li>
          <li class="nail-color">
            <a>
              <div style="text-align:center; "><img src="http://www.ignytebrands.com/wp-content/uploads/white.png" style="border:1px solid black;" class="w3-circle" alt="Cinque Terre" width="30" height="30"></div>
              화이트
            </a>
          </li>
          <li class="nail-color">
            <a>
              <div style="text-align:center"><img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAASwAAACoCAMAAABt9SM9AAAAA1BMVEWAgICQdD0xAAAAR0lEQVR4nO3BAQEAAACCIP+vbkhAAQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAO8GxYgAAb0jQ/cAAAAASUVORK5CYII=" class="w3-circle"
                  alt="Cinque Terre" width="30" height="30"></div>
              그레이
            </a>
          </li>
          <li class="nail-color">
            <a>
              <div style="text-align:center"><img src="https://upload.wikimedia.org/wikipedia/commons/thumb/2/21/Solid_black.svg/2000px-Solid_black.svg.png" class="w3-circle" alt="Cinque Terre" width="30" height="30"></div>
              블랙
            </a>
          </li>
          <li class="nail-color">
            <a>
              <div style="text-align:center"><img src="https://thumbs.dreamstime.com/b/natural-light-beige-recycled-paper-texture-seamless-square-back-natural-light-beige-recycled-paper-texture-seamless-square-104529523.jpg" class="w3-circle" alt="Cinque Terre" width="30" height="30"></div>
              베이지
            </a>
          </li>
          <li class="nail-color">
            <a>
              <div style="text-align:center"><img src="https://i.ytimg.com/vi/U5ILpOCoStI/maxresdefault.jpg" class="w3-circle" alt="Cinque Terre" width="30" height="30"></div>
              믹스
            </a>
          </li>
          <li class="nail-color">
            <a>
              <div style="text-align:center"><img src="https://www.colorcombos.com/images/colors/D7B740.png" class="w3-circle" alt="Cinque Terre" width="30" height="30"></div>
              골드
            </a>
          </li>
          <li class="nail-color">
            <a>
              <div style="text-align:center"><img src="https://vignette.wikia.nocookie.net/p__/images/7/74/Hd7S83Q.png/revision/latest?cb=20160331044639&path-prefix=protagonist" class="w3-circle" alt="Cinque Terre" width="30" height="30"></div>
              실버
            </a>
          </li>

        </ul>
      </div>

    </div>




    <div class="w3-dropdown-hover">
      <div class="w3-border w3-hover-border-pale-red  w3-round" style="padding-left:10px;">
        <img src="${path }/resources/images\nail-polish.png" class="w3-circle" alt="Cinque Terre" width="20" height="20"><button class="select-menu w3-button w3-round w3-hover-white">네일/패디</button></div>
      <div class="w3-dropdown-content w3-bar-block w3-card-4 w3-border w3-round">
        <a href="#" class="w3-bar-item w3-button">
          <div style="text-align:left"><img src="${path }/resources/images\beauty.png" class="w3-circle" alt="Cinque Terre" width="20" height="20"><button class="select-menu w3-button w3-round">네일</button></div>
        </a>
        <a href="#" class="w3-bar-item w3-button">
          <div style="text-align:left"><img src="${path }/resources/images\footprint.png" class="w3-circle" alt="Cinque Terre" width="20" height="20"><button class="select-menu w3-button w3-round">페디</button></div>
        </a>
      </div>

    </div>


    <div class="w3-dropdown-hover">
      <div class="w3-border w3-hover-border-pale-red  w3-round" style="padding-left:10px;">
        <button class="select-menu w3-button w3-round w3-hover-white"><i class="fa fa-plus-square-o"></i> 전체옵션</button></div>
      <div id="nailing-color" class="w3-dropdown-content w3-card-12 w3-border w3-round">

        <!--media로 조정해주기 default는 height 3.5%-->
        <ul id="dropdown-menu">
          <li class="nail-color">
            <a>
              <div style="text-align:center"><img src="http://www.cuded.com/wp-content/uploads/2015/04/21-French-Manicure.jpg" class="w3-circle" alt="Cinque Terre" width="30" height="30"></div>
              프렌치
            </a>
          </li>
          <li class="nail-color">
            <a>
              <div style="text-align:center"><img src="https://1.bp.blogspot.com/-6rVc4GNTKVU/Vtfa_wIBA5I/AAAAAAAAWnQ/tll1NnimnII/s1600/constellation-nail-art-3.jpg" class="w3-circle" alt="Cinque Terre" width="30" height="30"></div>
              아트
            </a>
          </li>
          <li class="nail-color">
            <a>
              <div style="text-align:center"><img src="https://s-media-cache-ak0.pinimg.com/originals/cf/28/fa/cf28fa8f1d236e4479e2eb3e3e3165fd.png" class="w3-circle" alt="Cinque Terre" width="30" height="30"></div>
              파츠
            </a>
          </li>
          <li class="nail-color">
            <a>
              <div style="text-align:center"><img src="https://i.ytimg.com/vi/IHjdyDyd7hk/hqdefault.jpg" class="w3-circle" alt="Cinque Terre" width="30" height="30"></div>
              글리터
            </a>
          </li>
          <li class="nail-color">
            <a>
              <div style="text-align:center"><img src="https://assets.teenvogue.com/photos/55829f6ca28d9d4e0540e581/master/pass/beauty-nails-2012-04-05-gradient-nail-tutorial.jpg" class="w3-circle" alt="Cinque Terre" width="30" height="30"></div>
              그라데이션
            </a>
          </li>
          <li class="nail-color">
            <a>
              <div style="text-align:center"><img src="http://katheryne.info/images5/0917L/full-color-acrylic-nail-designs/full-color-acrylic-nail-designs-44_13.jpg" class="w3-circle" alt="Cinque Terre" width="30" height="30"></div>
              풀컬러
            </a>
          </li>
          <li class="nail-color">
            <a>
              <div style="text-align:center"><img src="http://bebelushbeauty.com/uploads/best-marvel-nail-art-request-pict-for-cute-character-inspiration-and-names-trends_FILES_28561.jpg" class="w3-circle" alt="Cinque Terre" width="30" height="30"></div>
              캐릭터
            </a>
          </li>
        </ul>
      </div>

    </div>

				<script type="text/javascript">
						$(".nail-color").on("click", function(event) {	
							var color = $(this).find("img").attr('src');
							var value=$(this).find("img").attr('value');
							var main_nail=$("#main-nail-color");
							main_nail.attr('src', color);
							main_nail.val(value);
							
							
							
							
							alert(main_nail.attr('src'));
							alert(main_nail.val());
						})
					</script>


  </div>

  <!--네일 이미지시작-->


  <!--모달 틀
  <div class="modal fade pop-up-2" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel-1" aria-hidden="true">
    <div class="modal-dialog modal-lg">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
          <h4 class="modal-title" id="myLargeModalLabel-1">확대 이미지</h4>
        </div>
        <div class="modal-body">

            <div class="col-item">
              <div class="photo">
                <img id="modal-nail-img"  src="http://placehold.it/350x260" class="img-responsive img-rounded center-block" alt="" width="300" height="300">

              </div>
              <div class="info">
                <div class="row">
                  <div class="price col-md-6">
                    <h5 style="margin-bottom:7px;">
                                                                1위 ****샵</h5>
                    <h5 class="price-text-color">
                                                                경기도 구리시</h5>
                  </div>
                  <div class="rating hidden-sm col-md-6">
                    <i class="price-text-color fa fa-star"></i><i class="price-text-color fa fa-star">
                                                             </i><i class="price-text-color fa fa-star"></i><i class="price-text-color fa fa-star">
                                                             </i><i class="fa fa-star"></i>
                  </div>
                </div>
                <div class="separator clear-left">
                  <p class="btn-add">
                    <button href="#" class="btn btn-danger good-btn selected " style="width:90%" onclick="myFunction();"><span class="glyphicon glyphicon-heart"></span> 좋아요</button>
                  </p>
                  <p class="btn-details">
                    <button href="#" class="btn btn-info" style="width:90%"><span class="glyphicon glyphicon-comment"></span> 리뷰</button>
                </div>
                <div class="clearfix">
                </div>
              </div>
            </div>




        </div>
      </div>
      <!-- /.modal-content 
    </div>
    <!-- /.modal-dialog
  </div>
  <!-- /.modal mixer image -->


  <!--  <script type="text/javascript">
  function fn_nail_img(index) {


      var rimage=$('#nail-img'+index).attr('src');

       $("#modal-nail-img").attr("src",rimage);
     }
  </script>-->





  <a href="#" data-toggle="modal" data-target=".pop-up-2">
  <div class="cover-card col-sm-4">


    <div class="hovereffect">
      <img id='nail-img1' class="img-responsive nail-main-images" src="${path }/resourcesimages/image-7.jpg" >
      <div class="overlay" data-toggle="modal"  data-target=".pop-up-2" onclick="fn_nail_img(1)">
       <h2>Effect 13</h2>
        <p>
          <a href="#">LINK HERE</a>
        </p>
      </div>
    </div>
  </div>

  <div class="cover-card col-sm-2">
    <div class="hovereffect">
      <img class=" img-responsive nail-main-images" src="${path }/resources/images/image-6.jpg">
      <div class="overlay">
        <h2>Effect 13</h2>
        <p>
          <a href="#">LINK HERE</a>
        </p>
      </div>
    </div>
  </div>
  <div class="cover-card col-sm-6">
    <div class="hovereffect">
      <img class=" img-responsive nail-main-images" src="${path }/resources/images/image-100.jpg">
      <div class="overlay">
        <h2>Effect 13</h2>
        <p>
          <a href="#">LINK HERE</a>
        </p>
      </div>
    </div>
  </div>
  <div class="cover-card col-sm-3">
    <div class="hovereffect">
      <img class=" img-responsive nail-main-images" src="${path }/resources/images/image-8.jpg">
      <div class="overlay">
        <h2>Effect 13</h2>
        <p>
          <a href="#">LINK HERE</a>
        </p>
      </div>
    </div>
  </div>
  <div class="cover-card col-sm-4">
    <div class="hovereffect">
      <img class=" img-responsive nail-main-images" src="${path }/resources/images/image-9.jpg">
      <div class="overlay">
        <h2>Effect 13</h2>
        <p>
          <a href="#">LINK HERE</a>
        </p>
      </div>
    </div>
  </div>
  <div class="cover-card col-sm-3">
    <div class="hovereffect">
      <img class=" img-responsive nail-main-images" src="${path }/resources/images/image-10.jpg">
      <div class="overlay">
        <h2>Effect 13</h2>
        <p>
          <a href="#">LINK HERE</a>
        </p>
      </div>
    </div>
  </div>
  <div class="cover-card col-sm-2">
    <div class="hovereffect">
      <img class=" img-responsive nail-main-images" src="${path }/resources/images/image-11.jpg">
      <div class="overlay">
        <h2>Effect 13</h2>
        <p>
          <a href="#">LINK HERE</a>
        </p>
      </div>
    </div>
  </div>
  <div class="cover-card col-sm-3">
    <div class="hovereffect">
      <img class=" img-responsive nail-main-images" src="${path }/resources/images/image-11.jpg">
      <div class="overlay">
        <h2>Effect 13</h2>
        <p>
          <a href="#">LINK HERE</a>
        </p>
      </div>
    </div>
  </div>
  <div class="cover-card col-sm-5">
    <div class="hovereffect">
      <img class=" img-responsive nail-main-images" src="${path }/resources/images/image-9.jpg">
      <div class="overlay">
        <h2>Effect 13</h2>
        <p>
          <a href="#">LINK HERE</a>
        </p>
      </div>
    </div>
  </div>

  <div class="cover-card col-sm-4">
    <div class="hovereffect">
      <img class=" img-responsive nail-main-images" src="${path }/resources/images/image-13.png">
      <div class="overlay">
        <h2>Effect 13</h2>
        <p>
          <a href="#">LINK HERE</a>
        </p>
      </div>
    </div>
  </div>
  

  </div>
  </div>
  </div>
  </div>

  <!--</div>-->