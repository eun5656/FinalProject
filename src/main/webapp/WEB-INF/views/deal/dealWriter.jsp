<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var='path' value="${pageContext.request.contextPath}" />
<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote-lite.css" rel="stylesheet">
<style>
	
					.form-control{
						margin-bottom:20px;
					}
					#submit{
						margin-top:20px;
					}
					
					.container{
						margin-top:100px;
					}
</style>


<div class="container">
        <div class="col-sm-1"></div>
        <div class="col-sm-10">
            <div class="panel">

                    <div class="panel-body">
                            <div class="page-header">
                                    <h2> 게시판 글쓰기</h2>
                            </div>
                          <form id="articleForm" role="form" action="${path}/deal/dealWriteEnd.do?member_pk=${memberLoggedIn.memberPk}" method="post">
                       <br style="clear: both">
                       
                   <div class="form-group">
                   		 <label class="col-sm-2 control-label" for="subject">제목</label>
                   		 <div class="col-sm-10">
                         <input type="text" class="form-control" id="subject" name="subject" placeholder="subject" required>
                         </div>
                    </div>
                      <div class="form-group">
                   		 <label class="col-sm-2 control-label" for="deal_writer">작성자</label>
                   		 <div class="col-sm-10">
                         <input type="text" class="form-control" id="deal_writer" name="deal_writer" value="${memberLoggedIn.memberId }" readonly>
                         </div>
                    </div>
                    
                    
                    <div class="form-group">
                     <label class="col-sm-2 control-label" for="summernote">내용</label>
                     <div class="col-sm-10">
                         <textarea class="form-control" id="summernote" name="content" placeholder="content" maxlength="140" rows="7" ></textarea>
                          </div>
                    </div>
                     <div class="form-group">
                       <button type="submit" id="submit" name="submit" class="btn btn-warning pull-right" >작성 완료</button>
                     </div>
                  </form>
				

                      <script>
                      $(document).ready(function() {

                      
                              $('#summernote').summernote({
                                placeholder: '내용을 입력해주세요.',
                                toolbar: [
                                    // [groupName, [list of button]]
                                	   ['style', ['bold', 'italic', 'underline', 'clear']],
                                       ['font', ['strikethrough', 'superscript', 'subscript']],
                                       ['para', ['ul', 'ol']],
                                       ['picture',['picture']],
                                     	['hr', ['hr']],
                                     	['fullscreen',['fullscreen']],
                                     	['help',['help']]
                                       ],
                                	
                                tabsize: 2,
                                height: 300,
                                maxHeight:300,
                                focus:true,
                                callbacks: {
                                onImageUpload: function(files, editor, welEditable) {
                                      for (var i = files.length - 1; i >= 0; i--) {
                                         sendFile(files[i], this);
                                      }
                                  }
                             }
      
                              });
             
                      });
                      /* summernote에서 이미지 업로드시 실행할 함수 */
                       function sendFile(file, el) {
                            // 파일 전송을 위한 폼생성
                          var data = new FormData();
                           data.append("file", file);
                           $.ajax({ // ajax를 통해 파일 업로드 처리
                               data : data,
                               type : "POST",
                               url : "${path}/deal/dealImages.do",
                               cache : false,
                               contentType : false,
                               processData : false,
                               enctype:'multipart/form-data',
                               success : function(filename) { // 처리가 성공할 경우
                                 
                                //확인용   
                              /*  alert(filename); */
                                  $(el).summernote('editor.insertImage',"${path}/resources/images/test/"+filename);
                                 
                                  
                               }
                           });
                       }
                      
                   
                            </script>
                           

                        </div>
                </div>
              </div>

                <div class="col-sm-1"></div>
    </div>