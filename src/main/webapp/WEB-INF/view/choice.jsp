<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="pingliangchuan@163.com">

    <title>Role App</title>

    <!-- Bootstrap Core CSS -->
    <link href="${pageContext.request.contextPath}/bower_components/bootstrap/dist/css/bootstrap.min.	css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="${pageContext.request.contextPath}/bower_components/metisMenu/dist/metisMenu.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="${pageContext.request.contextPath}/dist/css/sb-admin-2.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="${pageContext.request.contextPath}/bower_components/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    
    <script src="${pageContext.request.contextPath}/bower_components/jquery/dist/jquery.min.js"></script>
    
<script>
var deviceUrl ;

$(document).ready(function(){

	var isCompu = checkCompu();
	if(isCompu){
		deviceUrl = '${pageContext.request.contextPath}/loser/loser_pre/loser_pre';
	}else{
		deviceUrl = '${pageContext.request.contextPath}/loser/loser_pre/loser_pre_mobile';
	}
	 document.getElementById('loser_pre').setAttribute('href',deviceUrl);
});

function dataAnalysis(){
	alert("敬请期待");
}

function checkCompu(){
	  var userAgentInfo=navigator.userAgent; 
	  var Agents =new Array("Android","iPhone","SymbianOS","Windows Phone","iPad","iPod"); 
	  var flag=true; 
	  for(var v=0;v<Agents.length;v++) { 
	     if(userAgentInfo.indexOf(Agents[v])>0) { 
	       flag=false; 
	       break; 
	     } 
	   } 
	   return flag; 
} 


</script>

</head>

<body>

<div class="container">
    <div class="row">
        <div class="col-md-4 col-md-offset-4">
            <div class="login-panel panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title" style = "text-align:center">Role App</h3>
                </div>
                <div class="panel-body list-group" >
                  <ul class="nav"  >
                    <li>
                        <a href="${pageContext.request.contextPath}/publisher/publisher_pre" class="list-group-item list-group-item-info" style = "text-align:center; font-weight:bold" >Publisher</a>
                    </li>
                    <li>
                        <a id = "loser_pre"  class="list-group-item list-group-item-info" style = "text-align:center; font-weight:bold" >
                            Loser</a>
                    </li>
                    <li>
                        <a  href="#" onclick = "dataAnalysis()" class="list-group-item list-group-item-info" style = "text-align:center; font-weight:bold" >
                            Data Analysis</a>
                    </li>
                   </ul>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- jQuery -->
<script src="${pageContext.request.contextPath}/bower_components/jquery/dist/jquery.min.js"></script>

<!-- Bootstrap Core JavaScript -->
<script src="${pageContext.request.contextPath}/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>

<!-- Metis Menu Plugin JavaScript -->
<script src="${pageContext.request.contextPath}/bower_components/metisMenu/dist/metisMenu.min.js"></script>

<!-- Custom Theme JavaScript -->
<script src="${pageContext.request.contextPath}/dist/js/sb-admin-2.js"></script>

<!-- Background -->
<script src="${pageContext.request.contextPath}/bower_components/login/jquery.backstretch.min.js"></script>
<script src="${pageContext.request.contextPath}/bower_components/login/scripts.js"></script>

</body>

</html>
