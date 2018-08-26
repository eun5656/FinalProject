<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var='path' value="${pageContext.request.contextPath}" />

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value=" " name="pageTitle" />
</jsp:include>


<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote-lite.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote-lite.js"></script>



<section id="dealForm1" style="padding-top: 100px;">
<div class="container">
        <div class="col-sm-1"></div>
        <div class="col-sm-10">
            <div class="panel">
            
            
   <script type="text/javascript">
     
   </script>
				<style>
	
					.form-control{
						margin-bottom:20px;
					}
					#submit{
						margin-top:20px;
					}
				</style>

                    <div class="panel-body">
                            <div class="page-header">
                                    <h2> 공지사항 작성하기</h2>
                            </div>
                          <form id="articleForm" role="form" action="${path}/customer/noticeFormEnd.do" method="post">
                       <br style="clear: both">
                       
                   <div class="form-group">
                   		 <label class="col-sm-2 control-label" for="noticeTitle">제목</label>
                   		 <div class="col-sm-10">
                         <input type="text" class="form-control" id="noticeTitle" name="noticeTitle" placeholder="제목을 입력하세요." required>
                         </div>
                    </div>
                      <div class="form-group">
                   		 <label class="col-sm-2 control-label" for="noticeWriter">작성자</label>
                   		 <div class="col-sm-10">
                         <input type="text" class="form-control" id="noticeWriter" name="noticeWriter" value="admin" readonly>
                         </div>
                    </div>
                    
                    
                    <div class="form-group">
                     <label class="col-sm-2 control-label" for="summernote">내용</label>
                     <div class="col-sm-10">
                         <textarea class="form-control" id="summernote" name="noticeContent" placeholder="" maxlength="140" rows="7"></textarea>
                          </div>
                    </div>
                     <div class="form-group">
                       <button type="submit" id="submit" name="submit" class="btn btn-warning pull-right" >작성 완료</button>
                     </div>
                  </form>
				


                      <script>
                      $(document).ready(function() {

                      
                              $('#summernote').summernote({
                                
                                toolbar: [
                                    // [groupName, [list of button]]
                                    ['style', ['bold', 'italic', 'underline', 'clear']],
                                    ['font', ['strikethrough', 'superscript', 'subscript']],
                                  	['hr', ['hr']],
                                  	['fullscreen',['fullscreen']],
                                  	['help',['help']]
                                    ],
                                	
                                tabsize: 2,
                                height: 300,
                                maxHeight:300,
                                minHeight:300,
                                focus:true
                               
                              });
             
                      });
                      
                      
                   
                            </script>
                           

                        </div>
                </div>
              </div>

                <div class="col-sm-1"></div>
    </div>



</section>









<jsp:include page="/WEB-INF/views/common/footer.jsp" />