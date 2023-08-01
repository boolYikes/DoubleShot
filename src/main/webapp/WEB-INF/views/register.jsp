<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<c:set var="cpath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>

    <style>
        @font-face {
            font-family: 'SUITE-Regular';
            src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2304-2@1.0/SUITE-Regular.woff2') format('woff2');
            font-weight: 100, 200, 300, 400, 500, 600, 700, 800, 900;
            font-style: normal;
        }

        body {
            font-family: 'SUITE-Regular';
            color: #333;
        }

        /* 매장카드 감싸는 스타일 */
        .main_projcard-container1 {
            display: flex;
            /* 요소들을 가로로 배치하기 위해 추가합니다 */
            background-color: #fff;
            width: 850px;
            height: 350px;
            position: relative;
            margin-bottom: 80px;
            border-radius: 10px;
            margin-left: 49%;
            margin-top: 5%;
            cursor: pointer;
            box-shadow: 0px 0px 5px 0px rgba(0, 0, 0, .66);
            font-size: 50px;
            font-weight: 800;
        }

        /* 포장카드 감싸는 스타일 */
        .main_projcard-container2 {
            display: flex;
            /* 요소들을 가로로 배치하기 위해 추가합니다 */
            background-color: #fff;
            width: 850px;
            height: 350px;
            position: relative;
            margin-bottom: 80px;
            border-radius: 10px;
            margin-left: 49%;
            margin-top: 16%;
            cursor: pointer;
            box-shadow: 0px 0px 5px 0px rgba(0, 0, 0, .66);
            font-size: 50px;
            font-weight: 800;
        }

        /* 매장 옆 이미지*/
        .main_coffee {
            margin-top: 4%;
            margin-left: 10%;
            height: 270px;
            width: 200px;
        }

        /* 포장 옆 이미지 */
        .main_mug {
            height: 170px;
            width: 170px;
        }

        /* 매장~~~*/
        /* 포장~~~ */
        .main_textbox,
        .main_textbox1 {
            margin-top: 11%;
            margin-left: 5%;
        }

        /* store : '매장' */
        /* takeout : 포장' */
        .main_store,
        .main_takeout {
            color: red;
            margin-left: 3%;
            font-size: 70px;
            font-weight: 800;
        }

        /* 매장~~~*/
        .main_textbox {
            display: inline;
            /* 블록 레벨에서 인라인 레벨로 변경합니다. */
            white-space: nowrap;
            /* 개행을 막습니다. */
        }

        .main_textbox1 {
            display: inline;
            white-space: nowrap;
        }

     

        /* '간편하게 주문하세요' */
        .main_screen {
            margin-left: 26%;
            font-size: 4ch;
            font-weight: bolder;
        }

        /* 메가커피 로고 */
        .main_logo-img {
            margin-left: 13%;
            margin-top: 40%;
            width: 70%;
        }

        /* '포장여부를 선택하세요' */
        .main_order {
            position: absolute;
            font-size: 40px;
            font-weight: bold;
            top: 47%;
            left: 49%;
            width: 42.5%;
            height: 4%;
            display: flex;
            /* 가운데 정렬을 위해 추가 */
            justify-content: center;
            /* 가운데 정렬을 위해 추가 */
            align-items: center;
            /* 가운데 정렬을 위해 추가 */
            background-color: #ffdc00;
            /* 배경 색상을 노랑색으로 설정 */
            padding: 10px 20px;
            /* padding을 추가하여 글씨와 배경 사이 간격을 조정 */
            border-radius: 10px;
        }

        /* arrow1 화살표아래방향 */
        /* arrow2 화살표 위 방향 */

        .main_arrow1 {
            position: absolute;
            left: 70%;
            top: calc(50% + 40px);
            /* 더 내려가려면 값을 증가시킵니다 */
            transform: translate(-50%, -50%);
        }

        .main_arrow2 {
            position: absolute;
            left: 70%;
            top: calc(50% - 115px);
            /* 더 올라가려면 값을 감소시킵니다 */
            transform: translate(-50%, -50%);
        }

        .main_arrow1::after {
            position: absolute;
            left: 0;
            top: 10%;
            content: '';
            width: 70px;
            /* 사이즈 */
            height: 70px;
            /* 사이즈 */
            border-top: 8px solid #2f2f2b8e;
            /* 선 두께 */
            border-right: 8px solid #2f2f2b8e;
            /* 선 두께 */
            transform: rotate(135deg);
            /* 각도 */
        }

        .main_arrow2::after {
            position: absolute;
            left: 0;
            top: 0;
            content: '';
            width: 70px;
            /* 사이즈 */
            height: 70px;
            /* 사이즈 */
            border-top: 8px solid #2f2f2b8e;
            /* 선 두께 */
            border-right: 8px solid #2f2f2b8e;
            /* 선 두께 */
            transform: rotate(315deg);
            /* 각도 */
        }

        .main_projcard-container1.clicked,
        .main_projcard-container2.clicked {
            transform: translate(0px, -3px);
            box-shadow: 0 2px 4px 2px rgba(0, 0, 0, .66);
        }

   .main_left-content {
            height: 100%;
            width: 42%;
            border-top-right-radius: 10px;
            border-bottom-right-radius: 10px;
            position: absolute;
            top: 0;
            left: 0;
		    background-color: #2a2a2a;
		  color: #E8E8E9;
		  display: flex;
		  justify-content: center;
		  overflow: hidden;
        }

.main_left-content::before {
  content: "";
  display: block;
  position: absolute;
  background-color: #7157F9;
  width: 400vw;
  height: 100vh;
  top: 0;
  left: 50%;
  z-index: -1;
  transform: skewX(-45deg) translateX(-100%) scaleX(0);
  will-change: transform;
  animation: revealBG 1400ms cubic-bezier(0.19, 1, 0.22, 1) forwards;
}

.Title {
margin-top:200px;
  font-size: 5rem;
  opacity: 0;
  transform: translate(0%, 100%) matrix(1, 0, 0, 1, 0, 0);
  will-change: opacity, transform;
  animation: revealText 1000ms cubic-bezier(0.7, 0, 0.3, 1) forwards 400ms;
}

.Title-mask {
  display: block;
  position: relative;
  text-align: start;
  overflow: hidden;
}

.Title-line {
  display: inline-block;
  opacity: 0;
  transform: translate(0%, 100%) matrix(1, 0, 0, 1, 0, 0);
  will-change: opacity, transform;
  animation: revealText 1000ms cubic-bezier(0.7, 0, 0.3, 1) forwards;
}

.Title-dot {
  color: #fff;
  transform-origin: 50% 80%;
  transform: scale(0);
  display: inline-block;
  animation: revealDot 300ms cubic-bezier(0.19, 1, 0.22, 1) forwards 2000ms;
}

.Title-mask:nth-child(1) .Title-line {
  animation-delay: 400ms;
}

.Title-mask:nth-child(2) .Title-line {
  animation-delay: 800ms;
}

.Title-mask:nth-child(3) .Title-line {
  animation-delay: 1200ms;
}

@keyframes revealBG {
  from {
    transform: skewX(-45deg) translateX(-100%) scaleX(0);
  }
  to {
    transform: skewX(-45deg) translateX(-100%) scaleX(1);
  }
}
@keyframes revealDot {
  from {
    transform: scale(0);
  }
  to {
    transform: scale(1);
  }
}
@keyframes revealText {
  from {
    opacity: 0;
    transform: translate(0%, 100%) matrix(1, 0, 0, 1, 0, 0);
  }
  to {
    opacity: 1;
    transform: translate(0%, 0%) matrix(1, 0, 0, 1, 0, 0);
  }
}
    </style>
	</head>

<body>
    <c:set var="targetPage" value="${cpath}/main?category_seq=1" />

    <c:if test="${order_age >= 50}">
        <c:set var="targetPage" value="${cpath}/omain?category_seq=1" />
    </c:if>

    <div class="main_left-content">
    	<h1 data-linecount="3" class="Title">Welcome<br> to<br> DoubleShot <span class="Title-dot">!!</span>
    	<img style="width: 450px; display: table-footer-group; margin-top: 400px;" src="resources/img/ds_logo.png"> </h1>
    </div>

    <div class="main_projcard-container1" onclick="location.href='${targetPage}'">
        <img src="resources/img/next_takein.png" style="width: 160px; height: 160px; margin-top: 90px; margin-left: 50px;">
        <div class="main_textbox">
            <span class="main_store">매장</span>
            을 이용하실 분은 <br>
            <div class="main_textbox">여기를 터치하세요</div>
        </div>
    </div>

    <div class="main_arrow1">
        <span></span>
    </div>
    <div class="main_arrow2">
        <span></span>
    </div>

    <div class="main_order">주문 방식을 선택해주세요.</div>
    <div class="main_projcard-container2" onclick="location.href='${targetPage}'">
        <img src="resources/img/next_takeout.png" style="width: 160px; height: 160px; margin-top: 90px; margin-left: 50px;">
        <div class="main_textbox1">
            <span class="main_takeout">포장</span>
            을 이용하실 분은 <br>
            <div class="main_textbox1">여기를 터치하세요</div>
        </div>
    </div>
    </div>
</body>

<script>
		var listHTML = $(".Title").html();
		var listItems = listHTML.split("<br>");
		$(".Title").html("");
		$.each(listItems, function(i, v) {
		  var item =
		    '<div class="Title-mask"><span class="Title-line">' + v + "</span></div>";
		  $(".Title").append(item);
		});


    document.addEventListener('DOMContentLoaded', function() {
        const projCards = document.querySelectorAll('.main_projcard-container1, .main_projcard-container2');

        projCards.forEach(function(card) {
            card.addEventListener('click', function() {
                // 클릭한 카드에 clicked 클래스를 추가합니다.
                card.classList.toggle('clicked');
            });
        });
    });
</script>

</body>

</html>