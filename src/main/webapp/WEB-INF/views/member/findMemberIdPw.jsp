<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>    
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/findIdPw.css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<section>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td bgcolor="#999999"  style="padding:5px 10px;" class="white12bold">아이디/비밀번호 찾기</td>
	</tr>
</table>
<table width="450" border="0" cellspacing="0" cellpadding="0" class="grey12">
	<tr>
		<td style="padding:20px 0 0 0">
			<table width="420" border="0" align="center" cellpadding="0" cellspacing="0">
				<tr>
					<td style="padding:15px; border-top:2px #cccccc solid; border-right:2px #cccccc solid; border-bottom:2px #cccccc solid; border-left:2px #cccccc solid;">
						
						
						<form action="<%=request.getContextPath()%>/findId.do" method="post" >
						  <table width="380" border="0" cellspacing="0" cellpadding="0">
  							<tr>
  								<td class="stitle">아이디 찾기</td>
  							</tr>
  					  </table>
  						<table width="380" border="0" cellspacing="1" class="regtable">
  							<tr>
  								<td width="100" height="25" bgcolor="#f4f4f4">이름</td>
  								<td width="130">
  									<input type="text" name="memberName" id="memberName" tabindex="1"/>
  								</td>
  								<td rowspan="2" align="center"><div class="bts" ><input class="btn btn-primary" type="submit" id="join" value="아이디찾기" onclick="return fn_findId();" tabindex="4"></div></td>
  							</tr>
  							<tr>
  								<td height="25" bgcolor="#f4f4f4">e-Mail</td>
  								<td>
  									<input type="text" name="memberEmail" id="memberEmail" tabindex="2"/>
  								</td>
  							</tr>
						  </table>
					  </form>
						
						

						<form action="" method="post" >
  						<table width="380" border="0" cellspacing="0" cellpadding="0">
  						  <tr>
  								<td class="stitle">비밀번호 찾기</td>
  							</tr>
  						</table>
  						<table width="380" border="0" cellspacing="1" class="regtable">
  							<tr>
  								<td width="100" height="25" bgcolor="#f4f4f4">ID</td>
  								<td width="130">
  									<input type="text" name="memberId" id="memberId2" tabindex="5"/>
  								</td>
  								<td rowspan="2" align="center"><div class="bts"><input class="btn btn-primary" type="button" id="findpw" onclick="find_pw()" value="비밀번호찾기" tabindex="8"></div></td>
  							</tr>
  							<tr>
  								<td height="25" bgcolor="#f4f4f4">e-Mail</td>
  								<td>
  									<input type="text" name="memberEmail" id="memberEmail2" tabindex="6"/>
  								</td>
  							</tr>
  						</table>
            </form>
            
					</td>
				</tr>
			</table>
			<table border="0" align="right" cellpadding="0" cellspacing="0">
				<tr>
					<td height="40" style="padding:0 13px 0 0">
						<div class="bts"><a href="javascript:self.close();"><span style="width:50px">닫기</span></a></div>
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>
</section>

<script>

	function find_pw(){
	       $.ajax({
	          url: "<%=request.getContextPath()%>/findPw.do",
	            type:"post",
	            data:{
	            		memberId:$('#memberId2').val(),
	            		memberEmail:$('#memberEmail2').val()
	            		},
	            success : function(data){	
	            	
	            	alert(data);
	            	
	                  }      
	            });
	          }

</script>
