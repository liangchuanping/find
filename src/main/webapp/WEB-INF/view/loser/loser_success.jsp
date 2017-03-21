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

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you util the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>
<body>
<jsp:include page="/WEB-INF/view/loser/nav.jsp"></jsp:include>
<script>
  $(document).ready(function(){
		var loseStatus = document.getElementById('cardstatus').innerText;
        if(loseStatus == "CLOSED"){
        	 $("#closeButton").attr("style","display:none");
 		     $("#helpBlock1").attr("style","display:none");
 		    $("#helpBlock2").attr("style","display:none");
        }
	   
	});
	
   function closeRecord(){
		var loseId = document.getElementById('loseId').innerText;
		var loseStatus = document.getElementById('cardstatus').innerText;
		var url = "${pageContext.request.contextPath}/loser/closeRecord?loseId="+loseId+"&loseStatus="+loseStatus;
		$.get(url,function callback(data){
			 document.getElementById('cardstatus').innerHTML = "CLOSED";
		     $("#closeButton").attr("style","display:none");
		     $("#helpBlock1").attr("style","display:none");
		     $("#helpBlock2").attr("style","display:none");
    	});
   }
</script>

<div id="page-wrapper">
    <div class="container-fluid">
        <div>
            <h1 class="page-header">Check Result List</h1>
        </div>
        <div class="panel-heading">
        </div>
        <div class="row">
            <div class="col-lg-12">
                <div class="panel panel-default">
                    <div class="panel-body">
                            <table  class="table table-striped table-bordered table-hover" id="dataTables-example"> 
                                <thead>
                                  <tr>
                                    <td class= "col-lg-2" >Basic Lose Info</td>
                                    <td id  = "loseId" style="display:none">${loseRecord.recordId}</td>
                                  </tr>                                
                                </thead>
                                <tbody>                                                              
                                    <tr>
                                     <td>Card Id: </td>    
                                     <td >${loseRecord.studentId}</td>                   
                                    </tr>   
                                    <tr>                                                                       
                                     <td>Name: </td>    
                                     <td>${loseRecord.name}</td> 
                                    <tr>                                                                                                                
                                    <td>Info Time: </td>
                                    <td>${loseRecord.findDate}</td>        
                                    </tr>      
                                    <tr>                                                                                                                
                                    <td>Record Status: </td>
                                    <td id = "cardstatus">${loseRecord.cardStatus}</td>        
                                    </tr>                                          
                                </tbody>
                            </table>                
                            
                              <table  class="table table-striped table-bordered table-hover" id="dataTables-example"> 
                                <thead>
                                  <tr>
                                    <td class= "col-lg-2">The Finder Info</td>
                                    <td style="display:none"></td>
                                  </tr>                                
                                </thead>
                                <tbody>                                                            
                                    <tr>
                                     <td>Name:</td>  
                                     <td>${findInfo.name}</td>                               
                                    </tr>                                                                                                                 
                                    <tr>
                                    <td>Phone Number:</td>
                                    <td>${findInfo.phoneNumber}</td>
                                    </tr>  
                                    <tr>
                                    <td>WeChat:</td>                                     
                                    <td>${findInfo.weChat}</td>
                                    </tr>
                                    <tr>     
                                    <td>QQ:</td>                                     
                                    <td>${findInfo.qq}</td>
                                    </tr>
                                    <tr>     
                                    <td>Email:</td>                                     
                                    <td>${findInfo.email}</td>
                                    </tr>
                                    <tr>     
                                    <td>comment:</td>                                     
                                    <td>${findInfo.comment}</td>
                                    </tr>                                          
                                </tbody>
                            </table>      
                        <!-- /.table-responsive -->
                     <button id = "closeButton" class = "btn btn-primary" type="button" onclick = "closeRecord()">Close Record</button>  
                     <span id="helpBlock1" class="help-block">Please close this record if you find you card back, this will help us do some statistical work.</span>
                      <span id="helpBlock2" class="help-block">you can still visit the page after closed the record.</span>                      
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
</body>
</html>
