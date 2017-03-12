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

<script>
var loseRecord = ${loseRecords};
var studentId = loseRecord.studentId;
</script>
</head>

<body>
<!-- input name error modal -->

 <div id = "empty_modal" class="modal fade bs-example-modal-sm" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel">
  <div class="modal-dialog modal-sm" role="document">
    <div class="modal-content">
      <div class="modal-header">
				<h4 class="modal-title" id="myModalLabel"><strong><p style="color:green">Name can not be empty.</p></strong></h4>
			</div>
			<div class="modal-body">			    
			    <h4>please input the owner name of the card.</h4>
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
			    <h4>please input the owner name of the card.</h4>
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
            <h1 class="page-header">Found Info List <a style = "color:bule" >(${studentId})</a></h1>
        </div>
        <div class="panel-heading">
        </div>
        <div class="row">
            <div class="col-lg-12">
                <div class="panel panel-default">
                    <div class="panel-body">
                        <div class="dataTable_wrapper">
                            <table  class="table table-striped table-bordered table-hover" id="dataTables-example">
                                <thead>
                                <tr>
                                    <th style="display:none">loseId</th>
                                    <th>Card Number</th>
                                    <th>Info Time</th>
                                    <th>Status</th>
                                    <th>Name</th>
                                    <th>Check</th>
                                </tr>
                                </thead>
                                <tbody id = "tbody">
                                <c:forEach var="loseRecords" items="${loseRecords}">
                                    <tr>
                                        <td style="display:none">${loseRecords.recordId}</td>
                                        <td id = 'student_id'>${loseRecords.studentId}</td>
                                        <td>${loseRecords.findDate}</td> 
                                        <td><span class = 'status'>${loseRecords.cardStatus}</span></td>                                       
                                        <td>
                                            <div class="form-group">
                                               <input class="form-control" placeholder="姓名" name="studentId" autofocus>
                                            </div>                          
                                        </td>
                                        <td>                                           
                                              <button class="btn btn-block btn-primary" type="button" onclick = "addAttribute(this)">Check</button>                                           
                                        </td>
                                    </tr>
                                </c:forEach>                                
                                </tbody>
                            </table>                
                        </div>
                        <!-- /.table-responsive -->
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

<script type="text/javascript">


var gLoseId;

$(document).ready(function(){
 var isSuccess 
 var cardStatus  = $(".status");
 for(var i = 0; i<cardStatus.length; i++){
	 var span = cardStatus[i];
	 var spanValue = cardStatus[i].innerText;
	 if(spanValue == 'PUBLICED'){	
	 span.style = "color:blue";
	 }else if(spanValue == "PROCCESSING"){
     span.style = "color:green";
     }else{
     span.style = "color:red";
     }
     }
});

function addAttribute(input){	
	var contextPath = "${pageContext.request.contextPath}";
	var studentId = document.getElementById('student_id').innerText;
	var loseId = input.
	                  parentNode.
                         previousElementSibling.
                           previousElementSibling.
                             previousElementSibling.previousElementSibling.previousElementSibling.innerText;
	
	gLoseId = loseId;
	
	var studentName =  input.
	                    parentNode.
	                              previousElementSibling.
	                                       firstElementChild.
	                                          firstElementChild.
	                                               value;
    if(studentName == ""){
		$('#empty_modal').modal('show');
    }else{
    	var url = contextPath+"/loser/check?loseId="+loseId+"&studentId="+studentId+"&studentName="+studentName+"&format=json&jsoncallback=?"
    	    $.ajaxSetup({
   	    	    async:false
   	    	});
    		$.get(url,function callback(data){
    		var dataObj = String2Array(data);    	     	    
    	    isSuccess = dataObj[0];
    		var message = dataObj[1];
    		if(isSuccess == "true"){ 
    			var newUrl = contextPath+message+"?loseId="+gLoseId;
    			//window.location.assign(newUrl);
    			window.location.href = newUrl;
    		}else{
    			$('#incorrect_modal').modal('show');
      		}		
    	});
    }
    }
	
function String2Array(str){
	var i;
	var result = new Array();
	var newStr = str.substring(1, (str.length-1));
	var array = newStr.split(',');
	for(i=0 ; i< array.length; i++){
		var items = array[i].split(":");
		result[i] = items[1].substring(1,(items[1].length-1));
	}	
	return result;
}

</script>

</body>
</html>
