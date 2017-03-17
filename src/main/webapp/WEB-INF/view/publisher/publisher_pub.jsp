<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="author" content="liangchuan">

    <!-- Bootstrap Core CSS -->
    <link href="${pageContext.request.contextPath}/bower_components/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
   
    <!-- MetisMenu CSS -->
    <link href="${pageContext.request.contextPath}/bower_components/metisMenu/dist/metisMenu.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="${pageContext.request.contextPath}/dist/css/sb-admin-2.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="${pageContext.request.contextPath}/bower_components/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    
    <script src="${pageContext.request.contextPath}/bower_components/jquery/dist/jquery.min.js"></script>
    
    <!-- Bootstrap Core JavaScript -->
    <script src="${pageContext.request.contextPath}/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you util the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->


<script type="text/javascript">
var publisherName; 

function validZHName(name){
	return (/^[\u4e00-\u9fa5]{2,4}$/).test(name);
}

function validCardId(cardId){
	return (/^[a-zA-Z]{1}[0-9]{8}$/).test(cardId);
}

function checkMobileStrict(v) {
	var yd = ['134', '135', '136', '137', '138', '139', '150', '151', '152', '157', '158', '159', '187', '188']; 
	var lt = ['130', '131', '132', '155', '156', '185', '186']; 
	var dx = ['133', '153', '180', '189']; 
	var whole = []; whole = whole.concat(yd, lt, dx);
	if (v == '') return false; 
	if (v.length != 11) { return false; } 
	if (isNaN(v)) { return false; } 
    var phone_sect = v.substr(0, 3);
	var find = false; 
	var i = 0; 
	for (i = 0; (i < whole.length); i++) 
	{ if (phone_sect == whole[i]) { find = true; break; } } 
    return find;
}

function checkEmail(email){ 
	var reg = /^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(.[a-zA-Z0-9_-])+/; 
	return reg.test(email); 
} 

function checkComment(comment){
	return comment.length <=150;
}

function setConnectSuccess(){
    $("#publisherPhoneOut").addClass("has-success");
	$("#publisherWeChatOut").addClass("has-success");
	$("#publisherQQOut").addClass("has-success");
	$("#publisherEmailOut").addClass("has-success");
}

function validationCheck(form){	
	$("#inputNameOut").removeClass("has-success");
	$("#inputIdOut").removeClass("has-success");
	$("#publisherNameOut").removeClass("has-success");
	$("#inputNameOut").removeClass("has-error");
	$("#inputIdOut").removeClass("has-error");
	$("#publisherNameOut").removeClass("has-error");
	
    $("#publisherPhoneOut").removeClass("has-error");
	$("#publisherWeChatOut").removeClass("has-error");
	$("#publisherQQOut").removeClass("has-error");
	$("#publisherEmailOut").removeClass("has-error");	
    $("#publisherPhoneOut").removeClass("has-success");
	$("#publisherWeChatOut").removeClass("has-success");
	$("#publisherQQOut").removeClass("has-success");
	$("#publisherEmailOut").removeClass("has-success");
	
	var corrent = true;
	var cardId = document.getElementById('inputCardId').value;
	var cardName =  document.getElementById('inputName').value;
	var name = document.getElementById('publisherName').value;
	var phoneNumber = document.getElementById('publisherPhone').value;
	var weChat = document.getElementById('publisherWeChat').value;
	var qq = document.getElementById('publisherQQ').value;
	var email = document.getElementById('inputEmail').value;
	var comment = document.getElementById('inputComment').value;;
	
	if(cardName == "" || !validZHName(cardName)){
		$("#inputNameOut").addClass("has-error");
		corrent = false;
	}else{
		$("#inputNameOut").addClass("has-success");
	}
	
	if(cardId == "" || !validCardId(cardId)){
		$("#inputIdOut").addClass("has-error");
		corrent = false;
	}else{
		$("#inputIdOut").addClass("has-success");
	}
	
	if(name == ""){
		$("#publisherNameOut").addClass("has-error");
		corrent = false;		
	}else{
		$("#publisherNameOut").addClass("has-success");
	}
	
	if(phoneNumber != "" || email != ""){
		if(phoneNumber != "" ){
		   if(!checkMobileStrict(phoneNumber)){
			$("#publisherPhoneOut").addClass("has-error");
			corrent = false;
		   }else{
			   setConnectSuccess();
		   }
		}
		if(email != ""){
		if(!checkEmail(email)){
			$("#publisherEmailOut").addClass("has-error");
			corrent = false;
		}else{
			   setConnectSuccess();
		}
	    }
	}else if(comment != ""){
		if(!checkComment(comment)){
			corrent = false;
			alert("input out of length");
			}else{
				   setConnectSuccess();
			}		
	}else{
		if(weChat=="" && qq==""){	
			$("#publisherPhoneOut").addClass("has-error");
			$("#publisherWeChatOut").addClass("has-error");
			$("#publisherQQOut").addClass("has-error");
			$("#publisherEmailOut").addClass("has-error");
			corrent = false;
		}else{
			   setConnectSuccess();
		}
	}

	if(corrent == true){
	var formobj = new Object();
	formobj.cardId = cardId;
	formobj.cardName = cardName;
	
	formobj.name = name;
	formobj.phoneNumber = phoneNumber;
	formobj.weChat = weChat;
	formobj.qq = qq;
	formobj.email = email;
    formobj.comment = comment;
		
	var jsonform = JSON.stringify(formobj);
	$.ajax({
		   Async: false,
		   type: "POST",
		   contentType: "application/json; charset=utf-8",  
		   url: "${pageContext.request.contextPath}/publisher/publish",
		   data: JSON.stringify(formobj),  		   
		   dataType: "json",	
		   success: function(message){			 
	        	
			     $('#empty_modal').modal("show");
			     $("#inputName").replaceWith("<p class="+"form-control-static"+ "><strong>"+cardName+"</strong></p>");
			     $("#remind").attr("style","display:none");
			    // $("#inputName").replaceWith("<p class="+"form-control-static"+">"+cardName+"</p>");
			     $("#inputCardId").replaceWith("<p class="+"form-control-static"+" ><strong>"+cardId+"</strong></p>");
			     $("#publisherName").replaceWith("<p class="+"form-control-static"+" ><strong>"+cardId+"</strong></p>");
			     $("#publisherPhone").replaceWith("<p class="+"form-control-static"+" ><strong>"+phoneNumber+"</strong></p>");
			     $("#publisherWeChat").replaceWith("<p class="+"form-control-static"+" ><strong>"+weChat+"</strong></p>");
			     $("#publisherQQ").replaceWith("<p class="+"form-control-static"+" ><strong>"+qq+"</strong></p>");
			     $("#inputEmail").replaceWith("<p class="+"form-control-static"+" ><strong>"+email+"</strong></p>");			  
			     $("#inputComment").replaceWith("<p class="+"form-control-static"+"><strong>"+comment+"</strong></p>");
			     $("#publishButton").attr("style","display:none");
		
				 document.getElementById('publisher').innerHTML = message.publisherName ;
			
			   }
		});
	}
}
</script>
</head>

<body>
<!-- input name error modal -->

 <div id = "empty_modal" class="modal fade bs-example-modal-sm" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel">
  <div class="modal-dialog modal-sm" role="document">
    <div class="modal-content">
      <div class="modal-header">
				<h4 class="modal-title" id="myModalLabel"><strong><p style="color:green">Publish Successfully</p></strong></h4>
			</div>
			<div class="modal-body">			    
			    <h4>Hi, <span id = "publisher"></span>, Thank you for you publish.</h4>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			</div>
    </div>
  </div>
</div>

<div id = "incorrect_modal" class="modal fade bs-example-modal-sm" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel">
  <div class="modal-dialog modal-sm" role="document">
    <div class="modal-content">
      <div class="modal-header">
				<h4 class="modal-title" id="myModalLabel"><strong><p style="color:green">The name is incorrect.</p></strong></h4>
			</div>
			<div class="modal-body">			    
			    <h4>Hi <span id = "publisher"></span>please input the owner name of the card.</h4>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			</div>
    </div>
  </div>
</div>
    
<jsp:include page="/WEB-INF/view/loser/nav.jsp"></jsp:include>

<div id="page-wrapper">
    <div class="container-fluid">
        <div>
            <h1 class="page-header">Found Info From <a style = "color:bule" >(${studentId})</a></h1>
        </div>
        <div class="panel-heading">
        </div>
        <div class="row">
            <div class="col-lg-12">
                <div class="panel panel-default">
                    <div class="panel-body">
                        <form class="form-horizontal"  id ="publisherForm"
                                     action="${pageContext.request.contextPath}/publisher/publish" method="post">
                            <div class="form-group">
                                  <label for="inputName" class="col-sm-1 control-label">Info 1.</label>
                                       <div class="col-sm-5">
                                            <p class="form-control-static" style = "color:green"><strong>Card Basic Info</strong></p>
                                       </div>
                            </div>
                             
                             <div class="form-group" id  = "inputNameOut">
                                  <label id = "nameLabel" for="inputName" class="col-sm-1 control-label">Name<span style="color : red">*</span></label>
                                       <div class="col-sm-5">
                                          <input name = "cardName" type="text" required = "true"  class="form-control" id="inputName" placeholder="Card Name">
                                       </div>
                              </div>
                              
                              <div class="form-group" id = "inputIdOut">
                                  <label id = "IdLabel" for="inputCardId"  required = "true" class="col-sm-1 control-label">Card ID<span style="color:red">*</span></label>
                                       <div class="col-sm-5">
                                          <input name = "cardId" type="text" class="form-control" id="inputCardId" placeholder="Card ID">
                              </div>
                              
                              </div>
                                <div class="form-group">
                                  <label for = "publisherName" class="col-sm-1 control-label">Info 2.</label>
                                       <div class="col-sm-11">
                                            <p class="form-control-static" style = "color:green"><strong>Publisher Basic Info    </strong><span id = "remind">(At least one of contact information is needed)</span></p>                                           
                                       </div>
                               </div>   
                                 
                              <div class="form-group" id = "publisherNameOut">
                                   <label for="publisherName"  required = "true" class="col-sm-1 control-label">Name<h id = "pubNameLabel" style="color : red">*<h></label>
                                        <div class="col-sm-5">
                                           <input name = "name" type="text" class="form-control" id="publisherName" placeholder="Name">
                                         </div>
                               </div>
                                 
                               <div class="form-group" id = "publisherPhoneOut">
                                   <label for="publisherPhone" class="col-sm-1 control-label" id = "phoneLabel">Phone</label>
                                        <div class="col-sm-5">
                                           <input name = "phoneNumber" type="text" class="form-control" id="publisherPhone" placeholder="Phone Number">
                                         </div>
                               </div>
                               
                               <div class="form-group" id = "publisherWeChatOut">
                                   <label for="publisherWeChat" class="col-sm-1 control-label" id = "weChatLabel">WeChat</label>
                                        <div class="col-sm-5">
                                           <input name ="weChat" type="text" class="form-control" id="publisherWeChat" placeholder="WeChat">
                                         </div>
                               </div>    
                                 
                                <div class="form-group"  id = "publisherQQOut">
                                   <label for="publisherQQ" class="col-sm-1 control-label" id = "qqLabel">QQ</label>
                                        <div class="col-sm-5">
                                           <input name = "qq" type="text" class="form-control" id="publisherQQ" placeholder="QQ">
                                         </div>
                               </div>   
                                            
                               <div class="form-group" id = "publisherEmailOut">
                                   <label for="inputEmail" class="col-sm-1 control-label" id = "emailLabel">Email</label>
                                        <div class="col-sm-8">
                                           <input name = "email" type="email" class="form-control" id="inputEmail" placeholder="test@example.com">
                                         </div>
                               </div>
                               
                                <div class="form-group" id = "publisherCommentOut">
                                   <label for="inputComment" class="col-sm-1 control-label" id = "commentLabel">Comment</label>
                                        <div class="col-sm-8">
                                           <textarea name = "comment" class="form-control" rows="3" id = "inputComment" placeholder = "Comment (within 150)"></textarea>
                                         </div>
                               </div>
                               
                                <div class="form-group">
                                    <div class="col-sm-offset-1 col-sm-10">
                                       <button id = "publishButton" class = "btn btn-primary" type="button" onclick = "validationCheck(this)">Publish</button>       
                                       <span id="helpBlock" class="help-block">  </span>
                                                                 
                                        <span id="helpBlock" class="help-block"><li><i class="icon-pencil">We will protect your privacy and only the loser can view your Info.</i></li></span>
                                        <span id="helpBlock" class="help-block"><li><i class="icon-pencil">Thank you for your kindness.</i></li></span>
                                    </div>                             
                                </div>
                          </form>
                    </div>
                    <!-- /.panel-body -->
                </div>
                <!-- /.panel -->
            </div>
            <!-- /.col-lg-12 -->
        </div>
    </div>
    <!-- /.container-fluid -->
</div>
<!-- /#page-wrapper -->

<script src="${pageContext.request.contextPath}/bower_components/jquery/dist/jquery.min.js"></script>
<!-- Bootstrap Core JavaScript -->
<script src="${pageContext.request.contextPath}/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>

<!-- Metis Menu Plugin JavaScript -->
<script src="${pageContext.request.contextPath}/bower_components/metisMenu/dist/metisMenu.min.js"></script>

<!-- Custom Theme JavaScript -->
<script src="${pageContext.request.contextPath}/dist/js/sb-admin-2.js"></script>

<script src="${pageContext.request.contextPath}/bower_components/jquery/dist/jquery.min.js"></script>

<!--bootstrap modal.js -->
<script src="${pageContext.request.contextPath}/bower_components/bootstrap/js/modal.js" ></script>


</body>
</html>
