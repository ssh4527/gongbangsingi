<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*"%>
<%
	ArrayList<String> categoryList=(ArrayList<String>)request.getAttribute("categoryList");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01
 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2afbe1f7936e7a946254f01d5b3a8e79&libraries=services"></script>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<style>
#outer {
	width: 1000px;
	height: 100%;
	/* div를 화면 가운데로 오게 하기 */
	margin: auto;
	padding: 3%;
}

.font {
	font-size: 30px;
	color: black;
	margin-left: 40%;
}

.font_underline {
	color: #fbd6db;
}

#business_p1 {
	font-size: 30px;
	float: left;
}

.tab {
	white-space: pre;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>사업자로 회원전환</title>
</head>
<body>
<%@ include file="/views/common/menubar.jsp"%>
	<% if(loginUser!=null){%>
	<script>
		function addrSearchFunc() {
			new daum.Postcode({
				oncomplete : function(data) {
					var addr = data.address; // 최종 주소 변수
					document.getElementById("b_address").value = addr;

				}
			}).open();
		}
	</script>
	
	<div id="outer">
	
		<form action="<%= request.getContextPath() %>/request.sh" name="form" method="post">
			<input type="hidden" name="c_id" value="<%=loginUser.getUserId()%>">
			<input type="hidden" name="snsNum" id="snsNum" value="1">
			<%int snsNum=1;%>
			<table width="100%" height="100%">
				<tr>
					<td width="100%"><font class="font_underline"> <u><p class="font">사업자로 회원전환</p></u></font></td>
				</tr>

				<tr>
					<td width="100%" height="50%" align="center">
						<p align="left">
							<span style="padding-left: 160px" id="business_p1">
								GONGBANGSINGI 공방 사업자 약관동의</span>
						</p> <textarea rows="10" cols="90">
*공방 사업자 등록, 클래스 등록은 무료입니다. 단, 수익금 수수료 0.05%*

가. 수집하는 개인정보의 항목첫째, 회사는 회원가 입, 원활한 고객상담, 각종 서비스의 제공을 위해 최초 회원가입 당시 아래와 같은 최소한의 개인정보를 필수항목으로 수집하고 있습니다.
회원가입
- 이름, 생년월일, 성별, 아이디, 비밀번호, 별명, 연락처(메일주소, 휴대폰 번호 중 선택), 가입인증정보
만14세 미만 아동 회원가입
- 이름, 생년월일, 성별, 법정대리인 정보, 아이디, 비밀번호, 연락처 (메일주소, 휴대폰 번호 중 선택), 가입인증정보
단체아이디 회원가입
- 단체아이디, 회사명, 대표자명, 대표 전화번호, 대표 이메일 주소, 단체주소, 관리자 아이디, 관리자 연락처, 관리자 부서/직위
- 선택항목 : 대표 홈페이지, 대표 팩스번호
둘째, 서비스 이용과정이나 사업처리 과정에서 아래와 같은 정보들이 자동으로 생성되어 수집될 수 있습니다.
- IP Address, 쿠키, 방문 일시, 서비스 이용 기록, 불량 이용 기록
셋째, 네이버 아이디를 이용한 부가 서비스 및 맞춤식 서비스 이용 또는 이벤트 응모 과정에서 해당 서비스의 이용자에 한해서만 개인정보 추가 수집이 발생할 수 있으며, 이러한 경우 별도의 동의를 받습니다.
넷째, 성인컨텐츠, 유료/게임 등 일부 서비스 이용시 관련 법률 준수를 위해 본인인증이 필요한 경우, 아래와 같은 정보들이 수집될 수 있습니다.
- 이름, 생년월일, 성별, 중복가입확인정보(DI), 암호화된 동일인 식별정보(CI), 휴대폰 번호(선택), 아이핀 번호(아이핀 이용시), 내/외국인 정보
다섯째, 유료 서비스 이용 과정에서 아래와 같은 결제 정보들이 수집될 수 있습니다.
- 신용카드 결제시 : 카드사명, 카드번호 등
- 휴대전화 결제시 : 이동전화번호, 통신사, 결제승인번호 등
- 계좌이체시 : 은행명, 계좌번호 등
- 상품권 이용시 : 상품권 번호
나. 개인정보 수집방법회사는 다음과 같은 방법으로 개인정보를 수집합니다.
- 홈페이지, 서면양식, 팩스, 전화, 상담 게시판, 이메일, 이벤트 응모, 배송요청
- 협력회사로부터의 제공
- 생성정보 수집 툴을 통한 수집
   </textarea> <br> <input type="checkbox" name="req"> 개인정보 수집 및 이용에
						동의합니다.
					</td>
				</tr>
				<tr>
					<td><br> <br> <br> <br></td>
				</tr>
				<tr>
					<td>※ 대표자명 &nbsp;<input type="text" name="business_name"
						id="b_name" value="<%=loginUser.getUserName() %>" size="15" readonly>
					</td>
				</tr>
				<tr>
					<td><br></td>
				</tr>

				<tr>
					<td>※ 공방 이름 &nbsp;<input type="text"
						name="businessmember_name" id="b_name2" size="15">
					</td>
				</tr>
				<tr>
				
					<td><br></td>
				</tr>
				<tr>
					<td>※ 카테고리 &nbsp; <input type="text" name="category" id="category"  readonly>
					<select class="btn btn-info dropdown-toggle" name="categoryCh"
						id="categoryCh" >
							<option class="dropdown-item">선택해주세요</option>
							<%for(String cg: categoryList){ %>
								<option class="dropdown-item" value="<%=cg%>"><%=cg%></option>
							<%} %>
							<option class="dropdown-item" value="기타">기타</option>
					</select> 
					<script>
					$(function(){
						$('#categoryCh').change(function() {
							console.log("dd");
							if($(this).val()=="기타"){
								$('#category').attr({"placeholder":"입력해주세요","readonly":false}).val("");
							} else {
								$('#category').val($(this).val());

							}

						});
					});		
				</script>
					</td>
				</tr>
				<tr>
					<td><br></td>
				</tr>
				<tr>
					<td>※ 공방 주소 &nbsp; <input type="text" name="business_address"
						size="30" id="b_address" placeholder="주소" readonly> &nbsp;<input
						type="button" class="btn btn-secondary" name="addrSearch"
						value="주소 검색" id="addrSearch" onclick="addrSearchFunc();">
						<br> <span class="tab">&#9;</span><span class="tab">&#9;</span>&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="text" name="business_address2" id="b_address2"
						placeholder="상세주소 입력">
					</td>
				</tr>

				<tr>
					<td><br></td>
				</tr>
				<tr>
					<td>※ SNS 계정 &nbsp; <input type=text " name="business_sns1"
						id="b_sns1" size="30" placeholder="계정이 있으시면 입력해주세요!">
						<select class="btn btn-info dropdown-toggle" name="sns1" id="sns1">
							<option class="dropdown-item">선택해주세요</option>
							<option class="dropdown-item" value="페이스북">페이스북</option>
							<option class="dropdown-item" value="인스타그램">인스타그램</option>
							<option class="dropdown-item" value="카카오톡">카카오톡</option>
							</select>
							<input type="button" id="add" value="추가"><input type="button" id="remove" value="삭제">
							<script>
							var num=1;
							$("#add").click(function(){
								num++;
								 $('<div><br><span class="tab">&#9;</span><span class="tab">&#9;</span>&nbsp;&nbsp;&nbsp;&nbsp;'+
								 '<input type=text " name="business_sns'+num+'" id="b_sns'+num+'" size="30"> &nbsp;'+
								 '<select class="btn btn-info dropdown-toggle" name="sns'+num+'" id="sns'+num+'">'+
								 '<option class="dropdown-item">선택해주세요</option>'+
											'<option class="dropdown-item" value="페이스북">페이스북</option>'+
											'<option class="dropdown-item" value="인스타그램">인스타그램</option>'+'<option class="dropdown-item" value="카카오톡">카카오톡</option>'
											+'</select></div>').insertAfter('input[value="삭제"]').css("display","inline-block");
								 
								 <%snsNum++;%>
								 console.log(num);
								 $('#snsNum').val(num);
								 console.log( $('#snsNum').val());
							})
							
							$('#remove').click(function(){
								 $('#remove').next().remove();
								 /* $('#remove').next().remove();
								 $('#remove').next().remove();
								 $('#remove').next().remove();
								 $('#remove').next().remove();
								 $('#remove').next().remove(); */
								 <%if(snsNum>2)snsNum--;%>
								if(num>2) {num--;
								 $('#snsNum').val(num)};
							})
							
							
							</script>
					</td>
				</tr>
				<tr>
					<td><br></td>
				</tr>


				<tr>
					<td>※ 공방 전화번호 &nbsp; <input type="text" name="tel1" id="tel1"
						maxlength="3">- <input type="text" name="tel2" id="tel2"
						maxlength="4">- <input type="text" name="tel3" id="tel3"
						maxlength="4">
					</td>
				</tr>
				<tr>
					<td><br></td>
				</tr>

				<tr>
					<td>※ 사업자 등록번호 &nbsp; <input type="text" name="num1" id="num1"
						maxlength="3">- <input type="text" name="num2" id="num2"
						maxlength="2">- <input type="text" name="num3" id="num3"
						maxlength="5">
					</td>
				</tr>
				<tr>
					<td><br></td>
				</tr>
				<tr>
					<td>※ 계좌번호 &nbsp; <input type="text" name="account" id="account" size="20" placeholder="-를 제외한 번호를 입력">
						<select class="btn btn-info dropdown-toggle" name="bank" id="bank">
							<option class="dropdown-item">은행 선택</option>
							<option class="dropdown-item" value="신한은행">신한은행</option>
							<option class="dropdown-item" value="우리은행">우리은행</option>
							<option class="dropdown-item" value="NH농협">NH농협</option>
							<option class="dropdown-item" value="KB국민은행">KB국민은행</option>
							<option class="dropdown-item" value="KB국민은행">KEB하나은행</option>
						</select>
					</td>
				</tr>
				<tr>
					<td><br></td>
				</tr>
				<tr>
					<td>※ 공방 소개글  &nbsp;(자유롭게 작성해주세요) <br><textarea name="intro" id="intro" cols="50" rows="3"></textarea> </td>
				</tr>
				<tr>
					<td><br><br><br><br></td>
				</tr>

				<tr>
					<td align="center" valign="top"><input type="submit"
						class="btn btn-outline-secondary" value="사업자 회원전환 하기"
						onclick="return check()" />&nbsp;&nbsp;&nbsp; <input type="button"
						class="btn btn-outline-secondary" value="뒤로가기"
						onclick="javascript:history.back();" /></td>
				</tr>
			</table>
		</form>
	</div>
<script>
	function check() {
		var req = document.form.req.checked;
		var name = document.getElementById('b_name'); // 대표자명 2글자 이상
		var name2 = document.getElementById('b_name2'); // 공방이름 1글자 이상
		var category = document.getElementById('category');//카테고리
		var categoryCh = document.getElementById('categoryCh');//카테고리
		
		var address = document.getElementById('b_address'); // 공방 주소
		var address2 = document.getElementById('b_address2'); // 공방 주소
		
		var tel1 = document.getElementById('tel1'); // 공방 전화번호1
		var tel2 = document.getElementById('tel2'); // 공방 전화번호2
		var tel3 = document.getElementById('tel3'); // 공방 전화번호3
		var num1 = document.getElementById('num1'); // 사업자 등록번호1
		var num2 = document.getElementById('num2'); // 사업자 등록번호2
		var num3 = document.getElementById('num3'); // 사업자 등록번호3

		//var snsNum=document.getElementById('snsNum');
		
		
		var account=document.getElementById('account');// account
		var bank=document.getElementById('bank');// bank
		var intro=document.getElementById('intro');// intro
		
		if (!chk(/^{2,}$/, name, "한글로 2글자 이상을 넣으세요~"))
			return false;
		
		if (category.value==""){
			alert("카테고리를 선택해주세요!");
			return false;
		}
		if (address.value==""){
			alert("주소를 입력해주세요!");
			return false;
		}
		if (address2.value==""){
			alert("상세주소를 입력해주세요!");
			return false;
		}
		
		var snsNum=1;
		<%for(int i=1;i<snsNum+1;i++){%>
		snsNum=<%=i%>;
		if($('#sns'+snsNum).val()=="선택해주세요"&&$('#b_sns'+snsNum).val()!=""){
				alert("sns를 선택하세요!");
				return false;
			}
			if ($('#sns'+snsNum).val()!="선택해주세요"&&$('#b_sns'+snsNum).val()==""){
				alert("sns 계정을 입력하세요!");
				return false;
			}
		<%}%> 
		
		if (!chk(/^[0-9]{3}$/, tel1, "공방 전화번호1 : 3자리 번호 입력"))
			return false;
		if (!chk(/^[0-9]{4}$/, tel2, "공방 전화번호2 : 4자리 번호 입력"))
			return false;
		if (!chk(/^[0-9]{4}$/, tel3, "공방 전화번호3 : 4자리 번호 입력"))
			return false;
		
		if (!chk(/^[0-9]{3}$/, num1, "사업자 등록번호1 : 3자리 번호 입력"))
			return false;
		if (!chk(/^[0-9]{2}$/, num2, "사업자 등록번호2 : 2자리 번호 입력"))
			return false;
		if (!chk(/^[0-9]{5}$/, num3, "사업자 등록번호3 : 5자리 번호 입력"))
			return false;
		
		if (bank.value!="은행 선택"&&account==""){
			alert("계좌번호를 입력하세요!");
			return false;
		}
		if (bank.value=="은행 선택"&&account!=""){
			alert("해당 계좌의 은행을 선택하세요!");
			return false;
		}
		
		
		if (intro.value==""){
			alert("소개글을 입력하세요! 짧아도 좋아요");
			return false;
		}
		
		function chk(re, e, msg) { //정규식, element, 메세지
			if (re.test(e.value)) {
				return true;
			} else {
				alert(msg);
				e.value = "";
				e.focus();
				return false;
			}
		}

		if (req == true) {
			prompt("입력하신 정보가 확실합니까?")
			return true;
		}else{
			alert("개인정보 약관에 동의하셔야 합니다.");
			return false;
		}
	}
	
</script>
	<%@ include file="/views/common/footbar.jsp"%>
	<%}else{ %><div>로그인 후 이용바랍니다.</div><%} %>
</body>
</html>