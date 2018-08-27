<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.kh.spring.store.model.vo.Store"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	Store store = (Store) request.getAttribute("store");
%>
<!-- 해더부분 -->
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="NailStore" name="pageTitle" />
</jsp:include>
<c:set var="path" value="${pageContext.request.contextPath }" />
<!-- storeManage css -->
<link href="${path }/resources/css/storeManage.css?ver=7"
	rel="stylesheet" />
<script type="text/javascript">
// 외부 js 에서 쓰이는 변수 setting
var path = "${pageContext.request.contextPath }";
var store_pk="${store.store_pk}"
</script>

<!-- storeManage js -->
<script src="${path }/resources/js/storeManage.js?ver=3"></script>
<div>
	<div id="wrapper">
		<div id="left-side">
			<div id="fourth" class="active">
				<div class="row">
				<c:if test="${not empty list }">
					<div class="col-12">
						<h1 class="text-green mb-4 text-center">질문내역</h1>
					</div>
					</c:if>
					<c:if test="${empty list }">
						<div class="col-12">
							<h1 class="text-green mb-4 text-center">질문내역이 없어요</h1>
						</div>
					</c:if>
				</div>
				<div class="container">
					<div class="row">
						<div class="col-lg-10 col-md-10 col-sm-10 col-xs-10">
							<div class="panel-group" id="accordion" role="tablist"
								aria-multiselectable="true">
								<c:if test="${not empty list }">
								<c:forEach var='qna' items='${list}' varStatus="vs">
									<div class="panel panel-default">
										<div class="panel-heading" role="tab"
											id="${heading}${vs.index}">
											<h4 class="panel-title">
												<a class="" role="button" data-toggle="collapse"
													data-parent="#accordion" href="#${collapse}${vs.index}"
													aria-expanded='<c:if test="${vs.index==0 }">true</c:if><c:if test="${vs.index!=0 }">false</c:if>'
													aria-controls="${collapse}${vs.index}"> <i
													class="fa fa-comment"></i>Q${vs.count} ${qna.qna_title }
												</a>
											</h4>
										</div>
										<div id="${collapse}${vs.index}"
											class="panel-collapse collapse <c:if test="${vs.index==0}">in</c:if>" role="tabpanel"
											aria-labelledby="${heading}${vs.index}">
											<div class="panel-body">
												<div class="container">
														
													<div class="row">

														<div class="col-sm-4 col-md-4">
															<p contenteditable="contenteditable">질문내용:
																${qna.qna_content } <br>${qna.qna_date}<%-- <fmt:formatDate value="${qna.qna_date}"
															pattern="yyyy/MM/dd HH:mm" /> --%></p>
															<div class="panel panel-default">
																<div class="panel-body" id="resizable">
																	<form accept-charset="UTF-8" action="${path}/qna/answer.do?qna_pk=${qna.qna_pk}" method="POST">
																		<textarea id="fullfilled" class="form-control counted"
																			id="answer_content" name="answer_content"
																			placeholder="답변" rows="5"
																			style="margin-bottom: 10px;"></textarea>
																		<button class="btn btn-danger" type="submit" value="${qna.qna_pk}" onclick="return fn_submit(${qna.qna_pk});">전송</button>
																	</form>
																</div>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</c:forEach>
								</c:if>
								
							</div>
						</div>
					</div>
				</div>
				<div class="row text-center" id="paging">${pageBar}</div>

			</div>
		</div>
	
		<div id="right-side">
			<div id="border">
			<div id="line" class="four" style="position:fixed;"></div>
		</div>
			<div style="position: fixed;">
				<ul>
					<li class="shop active">
						<div class="icon active">
							<img src="${path }/resources/icons/shop.svg" alt="">
						</div> Shop
					</li>
					<li class="sales">
						<div class="icon">
							<img src="${path }/resources/icons/paper.svg" alt="">
						</div> 예약 리스트
					</li>
					<li class="reserve">
						<div class="icon">
							<img src="${path }/resources/icons/calander.svg" alt="">
						</div> Reserve(예약)
					</li>
					<li class="qna">
						<div class="icon">
							<img src="${path }/resources/icons/customer.svg" alt="">
						</div> QnA(문의)
					</li>
				</ul>
			</div>
		</div>
	</div>
	<!-- wrapper 끝 -->

</div>

<!-- 푸터부분 -->
<jsp:include page="/WEB-INF/views/common/footer.jsp" />