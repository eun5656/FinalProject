<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var='path' value="${pageContext.request.contextPath}" />

  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote-lite.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote-lite.js"></script>

<div class="container">
        <div class="col-sm-2"></div>
        <div class="col-sm-8">
            <div class="panel">




                    <div class="panel-body">
                            <div class="page-header">
                                    <h2> 게시판 글쓰기</h2>
                            </div>
                            <div id="summernote"></div>
                            <br><br>

                            <div class="row1 text-right" id="btn-enroll">
                              <button type="button" class="btn btn-warning">작성</button>
                          </div>
 							<script>
                              $('#summernote').summernote({
                                placeholder: 'Hello stand alone ui',
                                tabsize: 2,
                                height: 300,
                                maxHeight:300,
                                focus:false

                              });
             
                            </script>
                           

                        </div>
                </div>
              </div>

                <div class="col-sm-2"></div>
    </div>