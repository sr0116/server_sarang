<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<%@ include file="../common/head.jsp" %>
<script src="https://cdnjs.cloudflare.com/ajax/libs/dayjs/1.11.13/dayjs.min.js" integrity="sha512-FwNWaxyfy2XlEINoSnZh1JQ5TRRtGow0D6XcmAWmYCRgvqOUTnzCxPc9uF35u5ZEpirk1uhlPVA19tflhvnW1g==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/dayjs/1.11.13/locale/ko.min.js" integrity="sha512-ycjm4Ytoo3TvmzHEuGNgNJYSFHgsw/TkiPrGvXXkR6KARyzuEpwDbIfrvdf6DwXm+b1Y+fx6mo25tBr1Icg7Fw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/dayjs/1.11.13/plugin/relativeTime.min.js" integrity="sha512-MVzDPmm7QZ8PhEiqJXKz/zw2HJuv61waxb8XXuZMMs9b+an3LoqOqhOEt5Nq3LY1e4Ipbbd/e+AWgERdHlVgaA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
</head>

<body>
<%@ include file="../common/header.jsp" %>
<%@ include file="../common/nav.jsp" %>

<div class="container p-0">
    <main>
    <div class="small border-bottom border-3 border-secondary p-0 pb-2">
                    <a href="#" class="small">
                        <span class="text-primary">
                            <c:forEach items="${cate}" var="c">
                                <c:if test="${c.cno == cri.cno}">
                                    ${c.cname}
                                </c:if>
                            </c:forEach>
                        </span> 
                        카테고리
                    </a>
                   </div>
        
<!-- 보드 -->
       
           <div class="small p-0 py-2">
                <span class="px-2 border-end border-1">잡담</span>
                <span class="px-2">${board.title}</span> 
                <div class="float-end small me-3">
                    <span class="text-muted"><i class="fa-solid fa-eye"></i> ${board.cnt}</span>
                    <span class="text-muted"><i class="fa-regular fa-comment-dots"></i> ${board.replyCnt}</span>
                </div>
            </div>
            
            <div class="p-0 py-2 bg-light small border-top border-2 border-muted">
                <span class="px-2">${board.id}</span>
                <a href="#" class="text-muted small">board.html</a>
                <span class="float-end text-muted small me-3">${board.regdate}</span>
            </div>
            
            <div class="small p-0 py-5 ps-1 border-bottom border-1 border-muted">
               ${board.content}
            </div>
            
            <div class="ps-0 pe-0">
                <a href="list?${cri.qs2}" class="btn btn-secondary btn-sm"><i class="fa-solid fa-list-ul"></i> 목록</a>
                <a href="modify?bno=${board.bno}&${cri.qs2}" class="btn btn-warning btn-sm"><i class="fa-solid fa-pen-to-square"></i> 수정</a>
                <a href="remove?bno=${board.bno}&${cri.qs2}" class="btn btn-danger btn-sm"  onclick="return confirm('삭제하시겠습니까?')"><i class="fa-regular fa-trash-can"></i> 삭제</a>
               
                <div class="float-end">
                    <button class="btn btn-outline-secondary btn-sm"><i class="fa-solid fa-share-nodes"></i> 공유</button>
                    <button class="btn btn-outline-secondary btn-sm"><i class="fa-solid fa-clipboard"></i> 스크랩</button>
                </div>
            </div>
            <%-- ${board.attachs} 첨부파일이 없는데도 목록을 띄운다면!! 무슨 값이 있길래? 로그 찍어봐! --%>
<!-- 첨부파일 유무 -->
        <c:if test="${fn:length(board.attachs) > 0}"> 
			<div class="d-grid my-2 attach-area">
				<div class="small my-1 border-bottom border-1 border-muted p-0 pb-2"><i class="fa-solid fa-paperclip"></i> 첨부파일</div>
				<!-- <label class="btn btn-info">파일 첨부<input type="file" multiple="" class="d-none" id="f1"></label> -->
				<ul class="list-group my-2 attach-list">
					<c:forEach items="${board.attachs}" var="a">
					<li class="list-group-item d-flex align-items-center justify-content-between" 
						data-uuid="${a.uuid}" 
						data-origin="${a.origin}"
						data-image="${a.image}"
						data-path="${a.path}"
						data-size="${a.size}"
						data-odr="${a.odr}">
						<a href="/pbl/download?uuid=${a.uuid}&origin=${a.origin}&path=${a.path}">${a.origin}</a>
						<!-- <i class="fa-solid fa-xmark float-end text-danger"></i> -->
					</li>
					</c:forEach>
				</ul>  
<!-- 첨부파일 유무 + 이미지 여부 -->				
				<div class="row justify-content-around w-75 mx-auto attach-thumb">
					<c:forEach items="${board.attachs}" var="a">
					<c:if test="${a.image}">
						<div class="my-2 col-12 col-sm-4 col-lg-2" 
							data-uuid="${a.uuid}">
							<div class="my-2 bg-primary" style="height: 150px; background-size: cover; 
								background-image:url('/pbl/display?uuid=t_${a.uuid}&path=${a.path}')">
								<!-- <i class="fa-solid fa-xmark float-end text-danger m-2"></i> -->
							</div>
						</div>
					</c:if>
					</c:forEach>
				</div> 
			</div>
		</c:if>
            
<!-- 댓글 -->
 		 <div class="small p-0 py-2 clearfix align-items-center d-flex border-top border-bottom border-1 border-muted mt-4">
            <div class="col">
	            <i class="fa-solid fa-comment-dots text-primary"></i><span class="px-1 text-primary">Reply</span> 
         	</div>
         	<div class="col text-end">
				<c:if test="${empty member}">
         		<a class="small text-primary" href="${cp}/member/login">댓글을 작성하려면 로그인이 필요합니다.</a>
	         	</c:if>
				<c:if test="${not empty member}">
	         	<button class="btn-write-form btn btn-sm btn-primary">댓글 작성</button>
	         	</c:if>
         	</div>
         </div>
         
         <ul class="list-group list-group-flush mt-3 reviews">
         	
       
         </ul>
        <div class="d-grid">
        	<button class="btn btn-primary btn-block btn-reply-more d-none">댓글 더보기</button>
        </div>
    </main>
</div>
    
<!-- The Modal -->
	<div class="modal" id="reviewModal">
	  <div class="modal-dialog">
	    <div class="modal-content">
	
    <!-- Modal Header -->
	      <div class="modal-header">
	        <h4 class="modal-title">Reply form</h4>
	        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
	      </div>
	
    <!-- Modal body -->
	      <div class="modal-body">
	        <form>
	            <div class="mb-3 mt-3">
	                <label for="content" class="form-label"><i class="fa-solid fa-comment text-primary"></i> Content</label>
	                <textarea class="resize-none form-control" id="content" placeholder="Enter content" name="content" rows="5"></textarea>
	            </div>
	            <div class="mb-3">
	                <label for="writer" class="form-label"><i class="fa-solid fa-user text-primary"></i> Writer</label>
	                <input type="text" class="form-control" id="writer" placeholder="Enter writer" name="writer" value="${member.id}" disabled="disabled">
	            </div>
	        </form>
	    </div>
	    
    <!-- Modal footer -->
	      <div class="modal-footer">
	        <button type="submit" class="btn btn-primary btn-sm btn-write-submit">write</button>
	        <button type="submit" class="btn btn-warning btn-sm btn-modify-submit">Modify</button>
	        <button type="button" class="btn btn-danger btn-sm" data-bs-dismiss="modal">Close</button>
	      </div>
	      
	 </div>
  </div>
</div>
    
<%@ include file="../common/footer.jsp" %>
    <script>
    dayjs.extend(window.dayjs_plugin_relativeTime)
    dayjs.locale('ko');
    const dayForm = 'YYYY-MM-DD HH:mm:ss';
    
        $(function() {
        	const bno = '${board.bno}';
            const url = '${cp}' + '/reply/';
            const modal = new bootstrap.Modal($("#reviewModal").get(0),{});
            
            //makeReplyLi(reply) > str
           	
            function makeReplyLi(r) {
                return `
                    <li class="list-group-item ps-5 profile-img" data-rno="\${r.rno}">
                        <p class="small text-secondary">
                            <span class="me-3">\${r.id}</span>
                            <span class="mx-3">\${dayjs(r.regdate, dayForm).fromNow()}</span> 
                        </p>
                        <p class="small ws-pre-line">\${r.content}</p>
                        <button class="btn btn-danger btn-sm float-end btn-remove-submit">삭제</button>
                        <button class="btn btn-warning btn-sm float-end mx-3 btn-modify-form">수정</button>
                    </li>
                    `;
            } 
            
            function list(bno, lastRno) {
            	lastRno = lastRno ? ('/' + lastRno) : '';
            	let reqUrl = url + 'list/' + bno + lastRno;
            	
                $.ajax({
                    url : reqUrl,
                    success : function(data) {
                        if(!data || data.length === 0) { //undefined, null일 경우 안함.
                        	if($(".reviews li").length == 0) { //처음부터 댓글이 없는 상태일때
	                        	$(".reviews").html('<li class="list-group-item text-center text-muted"> 댓글이 없습니다 </li>');
                        	} else {
                        		$(".btn-reply-more").prop("disabled", true).text("추가 댓글이 없습니다");
                        	}
                     
                        	return;
                    	}
                        $(".btn-reply-more").removeClass("d-none");
                                                
                        let str = '';
                        for(let r of data) {
                            console.log(r);
							str += makeReplyLi(r);
                        }
                        $(".reviews").append(str);
                    }
                });
            }
            list(bno);
            // myModal.show();

            // 글쓰기 폼 활성화 btn-write-form
            $(".btn-write-form").click(function(){
                console.log("글쓰기");
                $("#reviewModal form").get(0).reset(); //폼안의 내용이 저장되는것 방지
                $("#reviewModal .modal-footer button").show().eq(1).hide();
                modal.show();
            });

            // 글쓰기 버튼 이벤트 btn-write-submit
            $(".btn-write-submit").click(function(){
                const result = confirm("등록하시겠습니까?")
                if(!result) return;

                const content = $("#content").val().trim();
                const id = $("#writer").val().trim();

                const obj = {content, id, bno};
                console.log(obj);
                console.log("글쓰기 전송");

                $.ajax({
                    url,
                    method : 'POST',
                    data : JSON.stringify(obj),
                    success : function(data) {
                        if(data.result) {
                            modal.hide();
                            // 댓글이 추가되면 최상단(맨앞)에 출력해야 하기 때문에 append가 아니라 prepend 사용
                            if(data.reply) { //reply가 현재 regdate를 안갖고 있기 때문에 현재 시간 등록해줌
	                            data.reply.regdate = dayjs().format(dayForm);
                            	const strLi = makeReplyLi(data.reply);
                            	$(".reviews").prepend(strLi);
                            }
                        }
                    }
                })
            });

            // 글수정 폼 활성화 btn-modify-form
            $(".reviews").on("click",".btn-modify-form", function(){
                console.log("글수정 폼");

                const rno = $(this).closest("li").data("rno");
                $.getJSON(url + rno, function(data){
                    $("#reviewModal .modal-footer button").show().eq(0).hide();
                    $("#content").val(data.content);
                    $("#writer").val(data.id);
                    $("#reviewModal").data("rno", rno);
                    console.log(data);
                    
                    modal.show();
                })
            })

            // 글수정 버튼 이벤트 btn-modify-submit
            $(".btn-modify-submit").click(function(){

                const result = confirm("수정하시겠습니까?")
                if(!result) return;

                const rno = $("#reviewModal").data("rno");

                const content = $("#content").val().trim();
                const id = $("#writer").val().trim();

                const obj = {content, id, rno};

                $.ajax({
                    url : url + rno,
                    method : 'PUT',
                    data : JSON.stringify(obj),
                    success : function(data) {
                        if(data.result) {
                            modal.hide();
							// get 재호출
							$.getJSON(url + rno, function(data) {
								console.log(data);
								// 문자열 생성
								/* makeReplyLi(data); */
								const strLi = makeReplyLi(data);
								// rno를 가지고 수정할 li 탐색
								const $li = $(`.reviews li[data-rno='\${rno}']`);
								/* console.log($li.html()); */
								// replaceWith로 내용 교체
								$li.replaceWith(strLi);
							})
                        }
                    }
                });
                console.log("글수정 전송");      
            });

            // 글삭제 버튼 이벤트 btn-remove-submit
            $(".reviews").on("click",".btn-remove-submit", function(){
                
                // return false; //기본이벤트 제어
                const result = confirm("삭제하시겠습니까?")
                if(!result) return;
                
                const $li = $(this).closest("li");
                const rno = $li.data("rno");
                console.log("글삭제 전송");
                $.ajax({
                    url : url + rno,
                    method : 'DELETE', //소문자도 동작하지만 대문자 쓰는게 좋다
                    success : function(data) { //이 시점 실제 DB에서 삭제 되었음
                        if(data.result) {
                        	$li.remove();
                        }
                    }
                })
            })
            
            
            // 댓글 더보기 버튼 이벤트
            $(".btn-reply-more").click(function() {
            	// 현재 댓글 목록 중 마지막 댓글의 댓글 번호를 가져오기
            	const lastRno = $(".reviews li:last").data("rno");
            	/* console.log(lastRno); */
            	list(bno, lastRno);
            });
            
            
        });
    </script>
</body>
</html>