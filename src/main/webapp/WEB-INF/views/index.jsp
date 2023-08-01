<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<c:set var="cpath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">

<head>
    <title>index</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
    <link href="resources/css/mycss.css" rel="stylesheet" type="text/css">
    <link rel="icon" type="image/png" href="resources/img/favicon.png">
    <style type="text/css">
     @font-face {
            font-family: 'SUITE-Regular';
            src:
                url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2304-2@1.0/SUITE-Regular.woff2') format('woff2');
            font-weight: 600;
            font-style: normal;
        }

        body {
            font-family: "SUITE-Regular";
        }
        
        .back {
          position: fixed;
          top: 50%;
          left: 50%;
          transform: translate(-50%, -50%);
          margin: 1em auto;
          z-index: 3; /* 로딩 표시가 다른 요소들 위에 나타나도록 설정 */
        }
        .back span {
          font-size:3em;
          color:#F2C640;
          background:#262B37;
          display:table-cell;
          box-shadow:inset 0 0 5px rgba(0,0,0,0.3), 0 5px 0 #ccc;
          padding: 0 15px;
          line-height: 100px;
          animation:jumb 2s infinite;
        }
        @keyframes jumb {
          0% {
            transform:translateY(0px)
          }
          50% {
            transform:translateY(-30px);
            box-shadow:0 15px 0 rgb(242, 198, 64);
          }
          100% {
            transform:translateY(0px) 
          }
        }
        .back span:nth-child(1) {
          animation-delay:0s;
        }
        .back span:nth-child(2) {
          animation-delay:.1s;  
        }
        .back span:nth-child(3) {
          animation-delay:.2s;
        }
        .back span:nth-child(4) {
          animation-delay:.3s;  
        }
        .back span:nth-child(5) {
          animation-delay:.4s;
        }
        .back span:nth-child(6) {
          animation-delay:.5s;  
        }
        .back span:nth-child(7) {
          animation-delay:.6s;
        }
    </style>
</head>

<body onclick="nextPage()">
<div class="overlay" style="position: fixed; top: 0; left: 0; width: 100%; height: 100%; background-color: rgba(0, 0, 0, 0.5); z-index: 2; display: none"></div>
    <div id="demo" class="carousel slide" data-ride="carousel" data-interval="3000">
        <div class="carousel-inner">
            <div class="carousel-item active">
                <img class="main_image" src=resources/img/img1.png>
                <div class="carousel-caption">
                    <h3 class="touch_order" style="color: rgb(139, 204, 241);">주문하시려면 터치해 주세요</h3>
                </div>
            </div>
            <div class="carousel-item">
                <img class="main_image" src="resources/img/img2.png">
                <div class="carousel-caption">
                    <h3 class="touch_order" style="color: rgb(255, 255, 255);">주문하시려면 터치해 주세요</h3>
                </div>
            </div>
            <div class="carousel-item">
                <img class="main_image" src="resources/img/img3.png">
                <div class="carousel-caption">
                    <h3 class="touch_order" style="color: rgb(180, 133, 3);">주문하시려면 터치해 주세요</h3>
                </div>
            </div>
        </div>
    </div>
		
	<span class="back" style="display: none;">
    <span>L</span>
    <span>o</span>
    <span>a</span>
    <span>d</span>
    <span>i</span>
    <span>n</span>
    <span>g</span>
  </span>
</body>
<script src="resources/js/core/jquery.min.js"></script>
    <script>
    
	    var isButtonClicked = false;
    
        function nextPage() {
		    if (isButtonClicked) return; 
			
		    isButtonClicked = true;
		    
		    $(".back").show();
		    $(".overlay").show();
		    $(".touch_order").hide();
	    
        	 $.ajax({
                url: 'http://127.0.0.1:5000/look',
                success: function(response) {
                    console.log('예측된 나이:', response);
                    response = 50;
                    var redirectURL = '${cpath}/next?order_age=' + response;
                    location.href = redirectURL;
                },
                error: function(xhr, textStatus, error) {
                    console.error("AJAX 요청 실패: ", error);
                    console.log("상태 코드: ", xhr.status);
                    console.log("에러 메시지: ", textStatus);
                }
            });
        }
    </script>
</html>