<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="cpath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8" />
    <link rel="apple-touch-icon" sizes="76x76" href="resources/img/apple-icon.png">
    <link rel="icon" type="image/png" href="resources/img/favicon.png">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <title>DoubleShot</title>
    <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no' name='viewport' />
    <!--     Fonts and icons     -->
    <!-- <link href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" rel="stylesheet"> -->
    <!-- CSS Files -->
    <link href="resources/css/bootstrap.min.css" rel="stylesheet" />
    <link href="resources/css/paper-dashboard.css?v=2.0.1" rel="stylesheet" />
    <!-- CSS Just for demo purpose, don't include it in your project -->
    <link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css" />

    <style>
        @import url("https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800;900&display=swap");

        @font-face {
            font-family: 'SUITE-Regular';
            src:
                url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2304-2@1.0/SUITE-Regular.woff2') format('woff2');
            font-weight: 600;
            font-style: normal;
        }

        *,
        *:after,
        *:before {
            box-sizing: border-box;
        }

        body {
            font-family: "SUITE-Regular";
            font-weight: bolder;
            line-height: 1.5;
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            background-color: #f8f8f9;
        }

        .radio-group {
            display: flex;
            flex-wrap: wrap;
            width: 90%;
            margin-top: 0px;
            margin-left: 110px;
            margin-right: auto;
            max-width: 600px;
            user-select: none;
            margin-top: 20px;
        }

        .radio-group>* {
            margin: 0.5rem 0.5rem;
        }

        .radio-group-legend {
            font-size: 1.5rem;
            font-weight: 700;
            color: #9c9c9c;
            text-align: center;
            line-height: 1.125;
            margin-bottom: 1.25rem;
        }

        .radio-input {
            clip: rect(0, 0, 0, 0);
            clip-path: inset(100%);
            height: 1px;
            overflow: hidden;
            position: absolute;
            white-space: nowrap;
            width: 1px;
        }

        /* 라디오 버튼 스타일 */
        .radio-input:checked+.radio-tile {
            border-color: #555555;
            box-shadow: 0 5px 10px rgba(0, 0, 0, 0.1);
            color: #555555;
        }

        .radio-input:checked+.radio-tile:before {
            transform: scale(1);
            opacity: 1;
            background-color: #353535;
            border-color: #353535;
        }

        .radio-input:checked+.radio-tile .radio-icon,
        .radio-input:checked+.radio-tile .radio-label {
            color: #555555;
        }

        .radio-input:focus+.radio-tile {
            border-color: #555555;
            box-shadow: 0 5px 10px rgba(0, 0, 0, 0.1), 0 0 0 4px #cfcfcf;
        }

        .radio-input:focus+.radio-tile:before {
            transform: scale(1);
            opacity: 1;
        }

        .radio-tile {
            /* 기존 체크박스 타일 스타일 */
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            width: 7rem;
            min-height: 7rem;
            border-radius: 0.5rem;
            border: 2px solid #cfcfcf;
            background-color: #fff;
            box-shadow: 0 3px 5px rgba(0, 0, 0, 0.1);
            transition: 0.15s ease;
            cursor: pointer;
            position: relative;
        }

        .radio-tile.not {
            /* 기존 체크박스 타일 스타일 */
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            width: 7rem;
            min-height: 3.5rem;
            border-radius: 0.5rem;
            border: 2px solid #cfcfcf;
            background-color: #fff;
            box-shadow: 0 3px 5px rgba(0, 0, 0, 0.1);
            transition: 0.15s ease;
            cursor: pointer;
            position: relative;
        }

        .radio-tile:before {
            /* 기존 체크박스 타일 아이콘 스타일 */
            content: "";
            position: absolute;
            display: block;
            width: 1.25rem;
            height: 1.25rem;
            border: 2px solid #555555;
            background-color: #fff;
            border-radius: 50%;
            top: 0.25rem;
            left: 0.25rem;
            opacity: 0;
            transform: scale(0);
            transition: 0.25s ease;
            background-image:
                url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='192' height='192' fill='%23FFFFFF' viewBox='0 0 256 256'%3E%3Crect width='256' height='256' fill='none'%3E%3C/rect%3E%3Cpolyline points='216 72.005 104 184 48 128.005' fill='none' stroke='%23FFFFFF' stroke-linecap='round' stroke-linejoin='round' stroke-width='32'%3E%3C/polyline%3E%3C/svg%3E");
            background-size: 12px;
            background-repeat: no-repeat;
            background-position: 50% 50%;
        }

        .radio-tile:hover {
            /* 호버 스타일 */
            border-color: #555555;
        }

        .radio-tile:hover:before {
            /* 호버 아이콘 스타일 */
            transform: scale(1);
            opacity: 1;
        }

        .radio-icon {
            /* 아이콘 스타일 */
            transition: 0.375s ease;
            color: #dbdbdb;
        }

        .radio-icon svg {
            /* 아이콘 크기 */
            width: 3.5rem;
            height: 4rem;
        }

        .radio-label {
            /* 라벨 스타일 */
            font-size: 16px;
            color: #707070;
            transition: 0.375s ease;
            text-align: center;
        }

        .option_title {
            font-size: 20px;
            font-weight: 600;
            color: #F42C2C;
            margin-top: 0px;
            margin-bottom: 18px;
        }

        .option_empty {
            font-size: 20px;
            font-weight: 600;
            color: #fff;
            margin-top: 0px;
            margin-bottom: 18px;
        }

        .content {
            position: relative;
        }

        .swiper-button-prev,
        .swiper-button-next {
            position: absolute;
            top: 50%;
            transform: translateY(-50%);
            z-index: 10;
        }

        .swiper-button-prev {
            left: 10px;
        }

        .swiper-button-next {
            right: 10px;
        }

        .loader {
            color: #000000;
            font-size: 90px;
            text-indent: -9999em;
            overflow: hidden;
            width: 1em;
            height: 1em;
            border-radius: 50%;
            margin: 72px auto;
            position: relative;
            -webkit-transform: translateZ(0);
            -ms-transform: translateZ(0);
            transform: translateZ(0);
            -webkit-animation: load6 1.7s infinite ease, round 1.7s infinite ease;
            animation: load6 1.7s infinite ease, round 1.7s infinite ease;
        }

        @ -webkit-keyframes load6 {
            0% {
                box-shadow: 0 -0.83em 0 -0.4em, 0 -0.83em 0 -0.42em, 0 -0.83em 0 -0.44em,
                    0 -0.83em 0 -0.46em, 0 -0.83em 0 -0.477em;
            }

            5 %,
            95 % {
                box-shadow:
                    0 -0.83em 0 -0.4em,
                    0 -0.83em 0 -0.42em,
                    0 -0.83em 0 -0.44em,
                    0 -0.83em 0 -0.46em,
                    0 -0.83em 0 -0.477em;
            }

            10 %,
            59 % {
                box-shadow:
                    0 -0.83em 0 -0.4em,
                    -0.087em -0.825em 0 -0.42em,
                    -0.173em -0.812em 0 -0.44em,
                    -0.256em -0.789em 0 -0.46em,
                    -0.297em -0.775em 0 -0.477em;
            }

            20 % {
                box-shadow:
                    0 -0.83em 0 -0.4em,
                    -0.338em -0.758em 0 -0.42em,
                    -0.555em -0.617em 0 -0.44em,
                    -0.671em -0.488em 0 -0.46em,
                    -0.749em -0.34em 0 -0.477em;
            }

            38 % {
                box-shadow:
                    0 -0.83em 0 -0.4em,
                    -0.377em -0.74em 0 -0.42em,
                    -0.645em -0.522em 0 -0.44em,
                    -0.775em -0.297em 0 -0.46em,
                    -0.82em -0.09em 0 -0.477em;
            }

            100 % {
                box-shadow:
                    0 -0.83em 0 -0.4em,
                    0 -0.83em 0 -0.42em,
                    0 -0.83em 0 -0.44em,
                    0 -0.83em 0 -0.46em,
                    0 -0.83em 0 -0.477em;
            }
        }

        @ keyframes load6 {
            0% {
                box-shadow: 0 -0.83em 0 -0.4em, 0 -0.83em 0 -0.42em, 0 -0.83em 0 -0.44em,
                    0 -0.83em 0 -0.46em, 0 -0.83em 0 -0.477em;
            }

            5 %,
            95 % {
                box-shadow:
                    0 -0.83em 0 -0.4em,
                    0 -0.83em 0 -0.42em,
                    0 -0.83em 0 -0.44em,
                    0 -0.83em 0 -0.46em,
                    0 -0.83em 0 -0.477em;
            }

            10 %,
            59 % {
                box-shadow:
                    0 -0.83em 0 -0.4em,
                    -0.087em -0.825em 0 -0.42em,
                    -0.173em -0.812em 0 -0.44em,
                    -0.256em -0.789em 0 -0.46em,
                    -0.297em -0.775em 0 -0.477em;
            }

            20 % {
                box-shadow:
                    0 -0.83em 0 -0.4em,
                    -0.338em -0.758em 0 -0.42em,
                    -0.555em -0.617em 0 -0.44em,
                    -0.671em -0.488em 0 -0.46em,
                    -0.749em -0.34em 0 -0.477em;
            }

            38 % {
                box-shadow:
                    0 -0.83em 0 -0.4em,
                    -0.377em -0.74em 0 -0.42em,
                    -0.645em -0.522em 0 -0.44em,
                    -0.775em -0.297em 0 -0.46em,
                    -0.82em -0.09em 0 -0.477em;
            }

            100 % {
                box-shadow:
                    0 -0.83em 0 -0.4em,
                    0 -0.83em 0 -0.42em,
                    0 -0.83em 0 -0.44em,
                    0 -0.83em 0 -0.46em,
                    0 -0.83em 0 -0.477em;
            }
        }

        @ -webkit-keyframes round {
            0% {
                -webkit-transform: rotate(0deg);
                transform: rotate(0deg);
            }

            100 % {
                -webkit-transform:
                    rotate(360deg);
                transform:
                    rotate(360deg);
            }
        }

        @ keyframes round {
            0% {
                -webkit-transform: rotate(0deg);
                transform: rotate(0deg);
            }

            100 % {
                -webkit-transform:
                    rotate(360deg);
                transform:
                    rotate(360deg);
            }
        }
    </style>
</head>

<body>
    <div class="wrapper">
        <div class="row big-row">
            <div class="sidebar col-lg-2" data-color="white" data-active-color="danger">
                <div class="sidebar-wrapper">
                    <ul class="nav">
                        <c:forEach items="${cate}" var="cate">
                            <c:set var="activeClass" value="${(param.category_seq eq cate.category_seq) ? 'active' : ''}" />
                            <li class="${activeClass}"><a href="${cpath}/main?category_seq=${cate.category_seq}" class="cats">
                                    <p>${cate.category_name}</p>
                                </a></li>
                        </c:forEach>
                    </ul>
                </div>
            </div>
            <!-- sidebar div ends -->
            <div class="main-panel col-lg-7">
                <div class="content">
                    <div class="swiper-container">
                        <div class="swiper-wrapper">
                            <div class="swiper-slide">
                                <div class="row">
                                    <c:forEach var="menu" items="${menu1}" varStatus="status">
                                        <div class="col-lg-3 col-md-6 col-sm-6 menu-box">
                                            <div class="card card-stats">
                                                <div class="card-body">
                                                    <div class="row">
                                                        <div class="col-lg-1"></div>
                                                        <div class="col-lg-12 col-md-4 menu-img">
                                                            <img class="megamenu_img" src="${menu.menu_img}" alt="coffee" onclick="openModal(this.src, `${menu.menu_desc}`, '${menu.menu_name}', ${menu.menu_seq}, ${menu.menu_price})">
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="card-footer"></div>
                                            </div>
                                            <div class="row menu-name">
                                                <div class="col-lg-12">${menu.menu_name}</div>
                                            </div>
                                            <div class="row menu-price">
                                                <div class="col-lg-12">${menu.menu_price}원</div>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </div>
                            </div>
                            <c:if test="${not empty menu2}">
                                <div class="swiper-slide">
                                    <div class="row">
                                        <c:forEach var="menu" items="${menu2}" varStatus="status">
                                            <div class="col-lg-3 col-md-6 col-sm-6 menu-box">
                                                <div class="card card-stats">
                                                    <div class="card-body">
                                                        <div class="row">
                                                            <div class="col-lg-1"></div>
                                                            <div class="col-lg-12 col-md-4 menu-img">
                                                                <img class="megamenu_img" src="${menu.menu_img}" alt="coffee" onclick="openModal(this.src, `${menu.menu_desc}`, '${menu.menu_name}', ${menu.menu_seq}, ${menu.menu_price})">
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="card-footer"></div>
                                                </div>
                                                <div class="row menu-name">
                                                    <div class="col-lg-12">${menu.menu_name}</div>
                                                </div>
                                                <div class="row menu-price">
                                                    <div class="col-lg-12">${menu.menu_price}원</div>
                                                </div>
                                            </div>
                                        </c:forEach>
                                    </div>
                                </div>
                            </c:if>
                        </div>
                        <div class="swiper-button-prev"></div>
                        <div class="swiper-button-next"></div>
                    </div>
                </div>
            </div>
            <!-- main panel ends-->

            <!-- orders panel -->
            <div class="container-fluid orders col-lg-3">

                <div class="row logo-reserved">
                    <div class="col-lg-4"></div>
                    <div class="col-lg-7"></div>
                    <div class="col-lg-1"></div>
                </div>

                <div class="row orders-title">
                    <span id="orders-title" style="margin-right: 130px;">선택한 상품</span>
                    <img class="logo_img" src="resources/img/main_logo.png" alt="logo" style="float: right;">
                </div>
                <hr>

                <div class="row orders-list-container">
                    <div id="ordersContainer" class="col-lg-12 orders-list-container scroll-box"></div>
                </div>

                <div class="footer check-out">
                    <hr>
                    <div class="row">
                        <div class="col-lg-4">
                            <span id="total" style="font-size: 25px">총 결제금액 </span>
                        </div>
                        <div class="col-lg-4"></div>
                        <div id="total_order_price" class="col-lg-4" style="margin-top: 80px; font-size: 30px; font-weight: bolder;">
                            <span id="priceSpan" style="font-size: 32px; font-weight: 900; float: right; margin-right: 20px; white-space: nowrap;"></span>
                        </div>
                        <input type="button" class="btn" style="background-color: #fff; color: #1c1c1b; font-size: 29px; margin-left: 30px; margin-right: 30px; width: 195px; box-shadow: 0px 0px 2px 0px rgba(0, 0, 0, 0.325); margin-top: 20px;" value="주문취소" onclick="cancelModal()">
                        <input id="show" type="button" class="btn" style="background-color: #ffdc00; color: #1c1c1b; font-size: 29px; width: 195px; margin-top: 20px;" value="주문하기" onclick="ordermodal()">
                    </div>
                </div>
            </div>
            <!-- orders panel ends-->

            <!-- OPTIONS MODAL -->
            <div class="background">
                <div class="window">
                    <div class="popup">
                        <img src="resources/img/main_logo.png" style="width: 150px; height: 45px; margin-left: 30px; margin-top: 20px;">
                        <div class="container">
                            <form id="orderList" onsubmit="return false">
                                <div class="left">
                                    <img id="modalImage" alt="음료 이미지">
                                    <div class="menu_n">
                                        <b id="modalName"></b>
                                    </div>
                                    <div class="explain">
                                        <div id="modalDescription"></div>
                                    </div>
                                    <div class="increase">
                                        <input type="button" onclick="decrease()" class="q_btn1" value="-"> <span name="menu_cnt" id="spanTag">1</span>
                                        <input type="button" onclick="increase()" class="q_btn2" value="+">
                                    </div>
                                    <div class="right">
                                        <!-- 메뉴 옵션 선택 -->
                                        <fieldset class="radio-group">
                                        </fieldset>
                                    </div>
                                </div>
                            </form>
                            <input type="button" id="cancel" class="btn" style="background-color: #fff; color: #1c1c1b; font-size: 30px; margin-left: 574px; margin-right: 30px; width: 190px; margin-bottom: 0px; margin-top: 20px; box-shadow: 0px 0px 2px 0px rgba(0, 0, 0, 0.325);" value="취소하기"> 
                            <input id="orderButton" type="button" class="btn" style="background-color: #ffdc00; color: #1c1c1b; font-size: 30px; width: 190px; height: 60px; margin-bottom: 0px; margin-top: 20px;" value="주문담기">
                        </div>
                    </div>
                </div>
            </div>

           <div class="md-container cont04">
	            <div class="md-dg">
	                <div class="row md-header">
	                    <div class="col-lg-12">
	                        <span>주문 확인</span>
	                    </div>
	                </div>
	
	                <div class="row md-body">
	                    <div class="col-lg-12 md-body-title-div1">
	                        <div class="row md-body-title">
	                            <div class="col-lg-4 title-menu">메뉴명</div>
	                            <div class="col-lg-4 title-num">수량</div>
	                            <div class="col-lg-4 title-price">금액</div>
	                        </div>
	                    </div>
	
	                    <div class="col-lg-12 md-body-order-div1" style="overflow: auto; width: 1200px; height: 500px; ">
						    <div class="row md-body-order">
						    </div>
						</div>

	
	                    <div class="row row-total" style="height: 80px;">
	                        <div class="col-lg-12 md-body-order-total" style="width:1300px; height:80px;">
	                            <div class="row total-num-price">
	                                <p class="col-lg-2 order-total-num" style="margin-left: 105px;">총 수량</p>
	                                <p class="col-lg-1" id="order-total-num" style="flex: 0 0 16%;"></p>
	                                <p class="col-lg-3 order-total-price" style="margin-left: 130px; ">총 결제금액</p>
	                                <p class="col-lg-3" id="order-total-price"></p>
	                            </div>
	                        </div>
	                    </div>
	
	                </div>
	
	                <div class="md-footer conf-recog row">
	                   <input type="button" class="col-lg-6 btn"  id="cancel1" style="background-color: #fff; color: #1c1c1b; font-size: 45px; box-shadow: 0px 0px 2px 0px rgba(0, 0, 0, 0.325); flex: 0 0 38%; margin-left: 115px;" value="취소하기">
                       <input type="button" class="col-lg-6 btn" style="background-color: #ffdc00; color: #1c1c1b; font-size: 45px; margin-left: 90px; flex: 0 0 38%;" value="결제하기" onclick="payModal()">
	                </div>
	            </div>
	        </div>

            <!-- 결제 창 모달창 -->
            <div class="background2">
                <div class="window2">
                    <div class="popup2">
                        <table>
                            <tr>
                                <div class="top">
                                    <div class="cal-12" style="text-align: center">
                                        <p class="step1">결제수단 선택</p>
                                    </div>
                                </div>
                            </tr>
                            <tr>
                                <p class="step1-text">아래 결제수단을 선택해 주세요.</p>
                            </tr>
                            <table>
                                <tr>
                                    <td rowspan="2">
                                        <button class="cardpay" id="cardButton">
                                            <img src="resources/img/card.png" alt="card">
                                        </button>
                                    </td>
                                    <td>
                                        <button class="kakaopay">
                                            <img src="resources/img/kakaopay.png" alt="kakaopay">
                                        </button>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <button class="naverpay">
                                            <img src="resources/img/naverpay.png" alt="naverpay">
                                        </button>
                                    </td>
                                </tr>
                            </table>
                            <table>
                                <td class="finalamount-container">
                                    <div class="finalamount">[ 총 결제금액 ]</div>
                                    <div class="finalpay"></div>
                                </td>
                            </table>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
            <!-- 카드 결제 모달창 -->
            <div class="background3">
                <div class="window3">
                    <div class="popup3">
                        <table>
                            <tr>
                                <div class="top">
                                    <div class="cal-12" style="text-align: center">
                                        <p class="step1">카드 결제</p>
                                    </div>
                                </div>
                            </tr>
                            <tr>
                                <p class="info">
                                    아래 키오스크 카드 투입구에 신용/체크카드를 넣어주세요.<br>(삼성페이는 핸드폰을 카드리더기에
                                    인식시켜주세요.)
                                </p>
                            </tr>
                            <tr>
                                <img class="credit" src="resources/img/creditcard.gif" alt="credit">
                            </tr>
                            <span style="display: flex; align-items: flex-start;">
                                <button type="button" class="btn" style="background-color: #fff; color: #1c1c1b; font-size: 32px; margin-left: 300px; margin-bottom: 0px; margin-right: 50px; width: 250px; box-shadow: 0px 0px 2px 0px rgba(0, 0, 0, 0.325);" onclick="canclePay()">취소</button>
                                <button type="button" class="btn" style="background-color: #ffdc00; color: #1c1c1b; font-size: 32px; width: 250px; margin-bottom: 0px; " id="paymentButton">승인요청</button>
                            </span>
                        </table>
                    </div>
                </div>
            </div>
            
            <div class="background4">
                <div class="window4">
                    <div class="popup4">
                        <div class="card-approval">
                            <p class="status-message"></p>
                            <progress id="progress" max="100" value="0" style="width: 80%; height: 20px;"></progress>
                            <h6 style="color: red; margin-left: 20px; text-align: center; margin-top: 60px;">결제가
                                완료될 때까지 카드를 빼지 마세요 !</h6>
                        </div>
                    </div>
                </div>
            </div>

            <div class="background5">
                <div class="window5">
                    <div class="popup5">
                        <div class="card-approval">
                            <p style="font-size: 30px;">주문을 취소하시겠습니까 ?</p>
                            <p style="color: red;">처음 페이지로 돌아갑니다.</p>
                            <button class="btn order_cancel" style="background-color: #fff; color: #1c1c1b; box-shadow: 0px 0px 2px 0px rgba(0, 0, 0, 0.325); font-size: 23px; margin-top: 38px; width: 140px;">취소</button>
                            <button class="btn order_cancel_success" style="background-color: #ffdc00; color: #1c1c1b; font-size: 23px; margin-left: 30px; margin-top: 38px; width: 140px;">확인</button>
                        </div>
                    </div>
                </div>
            </div>

            <div class="md-container cont01	">
                <div class="md-dg">
                    <div class="md-header row">
                        <!-- 여기의 div height는 안의 h1 폰트 크기로 결정됨 -->
                        <div class="col-lg-12">
                            <span class="success_pay_confirm">결제 완료</span>
                        </div>
                    </div>
                    <div class="md-body row">
                        <div class="col-lg-12">
                            <div class="row">
                                <div class="col-lg-12">
                                    <div class="row success_pay_notice">
                                        <p>결제가 정상적으로 처리 되었습니다.</p>
                                    </div>
                                </div>
                                <span class="col-lg-12">
                                    <img class="success_pay_img" src="resources/img/receipt.png" alt="the_image">
                                    <div class="success_pay_image-text">주문번호</div>
                                    <div class="success_pay_num"></div>
                                </span>
                                <div class="col-lg-12">
                                    <div class="row success_pay_pre">메뉴가 준비되면 안내해 드리겠습니다. </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>


            <!--   Core JS Files   -->
            <script src="resources/js/core/jquery.min.js"></script>
            <script src="resources/js/core/popper.min.js"></script>
            <script src="resources/js/core/bootstrap.min.js"></script>
            <!--  Notifications Plugin    -->
            <script src="resources/js/plugins/bootstrap-notify.js"></script>
            <!-- Control Center for Now Ui Dashboard: parallax effects, scripts for the example pages etc -->
            <script src="resources/js/paper-dashboard.min.js?v=2.0.1" type="text/javascript"></script>
            <!-- Paper Dashboard DEMO methods, don't include it in your project! -->
            <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>


            <script>
                function cancelModal() {
                    $(".background5").addClass("show5");

                    document.querySelector(".order_cancel").addEventListener("click", function() {
                        $(".background5").removeClass("show5");
                    });

                    document.querySelector(".order_cancel_success").addEventListener("click", function() {
                        $.ajax({
                            url: '${cpath}/orderCancle',
                            success: function(rsps) {},
                            error: function(xhr, status, error) {
                                console.error(error);
                                console.error(xhr);
                            }
                        });
                        $(".background5").removeClass("show5");

                        window.location.href = "http://localhost:8081/mega/";
                    });

                }

                // Store the selected payment method
                let selectedPaymentMethod = "";

                document.querySelector(".cardpay").addEventListener("click", function() {
                    selectedPaymentMethod = "c"; // Set the payment method as "Card"
                    console.log("결제 수단", selectedPaymentMethod)
                });

                // Event listener for the kakaopay button
                document.querySelector(".kakaopay").addEventListener("click", function() {
                    selectedPaymentMethod = "k"; // Set the payment method as "Kakaopay"
                    console.log("결제 수단", selectedPaymentMethod)

                    $.ajax({
                        url: '${cpath}/pay',
                        dataType: 'json',
                        success: function(rsps) {
                            location.href = rsps.next_redirect_pc_url;
                            processPayment();
                        },
                        error: function(xhr, status, error) {
                            console.error(error);
                            console.error(xhr);
                        }
                    });
                });

                // Event listener for the naverpay button
                document.querySelector(".naverpay").addEventListener("click", function() {
                    selectedPaymentMethod = "n"; // Set the payment method as "Naverpay"
                    console.log("결제 수단", selectedPaymentMethod)
                });

                // Function to fetch the total payment amount and send order details
                function processPayment() {
                    // Get the total payment amount from the HTML element
                    const totalAmountString = document.querySelector(".finalpay").innerText;
                    const totalAmount = parseFloat(totalAmountString.replace(/\D/g, ""));
                    // Send order details to the server using AJAX

                    const saveData = {
                        order_total_amount: totalAmount,
                        pay_method: selectedPaymentMethod,
                    };
                    // Add other relevant order details here
                    console.log("saveData", saveData)

                    const saveDataArray = [saveData];
                    // AJAX로 데이터를 서버에 전송
                    $.ajax({
                        type: "POST",
                        url: "${cpath}/saveOrder",
                        data: JSON.stringify(saveDataArray), // 배열 형태로 전송
                        contentType: 'application/json',
                        success: function(response) {
                            console.log("주문 데이터 전송 완료:", response);
                        },
                        error: function(error) {
                            console.error("주문 데이터 전송 실패:", error);
                        }
                    });

                };

                // 카드 결제 진행 다음 페이지 이동 로직 ************
                document.getElementById("paymentButton").addEventListener("click", function() {
                    $(".background4").addClass("show4");
                    $("#progress").addClass("show4");

                    var dots = ""; // 초기값으로 빈 문자열 설정
                    var counter = 0; // 카운터 변수 설정

                    var interval = setInterval(function() {
                        if (counter === 0) {
                            dots = "";
                        } else if (counter === 1) {
                            dots = ".";
                        } else if (counter === 2) {
                            dots = "..";
                        } else if (counter === 3) {
                            dots = "...";
                        }

                        document.querySelector(".status-message").textContent =
                            "카드 승인 요청 중입니다" + dots; // 동적으로 표시

                        counter++; // 카운터 증가

                        if (counter === 4) {
                            counter = 0; // 카운터 초기화
                        }
                    }, 200); // 0.5초마다 실행

                    // 프로그래스 바 동작
                    function updateProgressBar() {
                        const progressBar = document.getElementById("progress");
                        let progress = progressBar.value;

                        if (progress < 100) {
                            progress += 20;
                            progressBar.value = progress;

                            // 1초마다 updateProgressBar 함수 호출
                            setTimeout(updateProgressBar, 1000);
                        }
                    }

                    // 1초 후에 프로그래스 바 동작 시작
                    setTimeout(updateProgressBar, 1000);

                    setTimeout(function() {
                        clearInterval(interval);
                        // 5.5초 후 실행되는 코드
                        $(".popup4").html(`
							  <svg class="card_success" version="1.1" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 130.2 130.2">
							    <circle class="card_path card_circle" fill="none" stroke="#1A16D3" stroke-width="6" stroke-miterlimit="10" cx="65.1" cy="65.1" r="62.1"/>
							    <polyline class="card_path card_check" fill="none" stroke="#1A16D3" stroke-width="6" stroke-linecap="round" stroke-miterlimit="10" points="100.2,40.2 51.5,88.8 29.8,67.5"/>
							  </svg>
							  <p class="success" style="text-align: center;margin: 20px 0 60px;font-size: 1.25em;">승인 요청 완료 !</p>
							`);
                        setTimeout(function() {
                            // 2초 후 실행되는 코드
                            $(".background3").removeClass("show3");
                            $(".background4").removeClass("show4");
                            $(".md-container").addClass("md-on");

                            $.ajax({
                                type: "POST",
                                url: "${cpath}/getOrderseq",
                                success: function(response) {
                                    const success_pay = document.querySelector(".success_pay_num");
                                    success_pay.innerHTML = response

                                    console.log("전송 완료:", response);

                                },
                                error: function(error) {
                                    console.error("전송 실패:", error);
                                }
                            });

                            // ======== order테이블에 데이터 넣을 시기 ========
                            processPayment();

                            $("#progress").removeClass("show4");
                            setTimeout(function() {
                                $(".md-container").removeClass("md-on");
                                window.location.href = "http://localhost:8081/mega/"; // 페이지 이	동
                            }, 6000);
                        }, 2000);
                    }, 5500);
                });



                function canclePay() {
                    $(".background3").removeClass("show3");

                    $(".background2").addClass("show2");


                }


                // 결제 수단 선택 다음 페이지 이동 로직 ************
                document.getElementById("cardButton").addEventListener("click", function() {

                    $(".background2").removeClass("show2");

                    $(".background3").addClass("show3");

                });


                function payModal() {

                    $(".cont04").removeClass("md-on");

                    $(".background2").addClass("show2");
                    var totalPayment = $("#order-total-price").text();

                    // 결제금액을 finalpay 엘리먼트에 출력
                    $(".finalpay").text(totalPayment);

                }

                function ordermodal() {
                    document.querySelector(".cont04").className = "md-container cont04 md-on";

                    // AJAX를 사용하여 주문 정보를 서버로 전송
                    $.ajax({
                        type: 'POST',
                        url: '${cpath}/totalOrder',
                        success: function(response) {
                            console.log('주문 성공', response);

                            totalCount = 0;
                            totalPrice = 0;

                            // 데이터를 추가할 대상 엘리먼트 선택
                            var targetElement = $('.md-body-order-div1');

                            // 기존에 추가된 주문 정보 삭제
                            targetElement.empty();

                            // 각각의 주문 데이터에 대해 반복문 실행
                            for (var i = 0; i < response.length; i++) {
                                var order = response[i];

                                // 데이터를 추가할 행(tr) 엘리먼트 생성
                                var row = $('<div class="row md-body-order" style="margin-bottom:10px;">');

                                // 메뉴 이름 추가
                                var menuNameCell = $('<div class="col-md-3 order order-menu"><td>' + order.menu_name + '</td></div>');
                                row.append(menuNameCell);

                                // 수량 추가
                                var menuNumCell = $('<div class="col-md-3 order order-num"><td>' + order.menu_cnt + '</td></div>');
                                row.append(menuNumCell);

                                // 가격 추가
                                var menuPriceCell = $('<div class="col-md-3 order order-price"><td>' + (order.menu_cnt * order.menu_price) + '원</td></div>');
                                row.append(menuPriceCell);

                                targetElement.append(row);

                                totalCount += order.menu_cnt;

                                totalPrice += order.menu_cnt * order.menu_price;
                            }

                            // 총 수량 업데이트
                            $('#order-total-num').text(totalCount + '개');

                            // 총 결제금액 업데이트
                            $('#order-total-price').text(totalPrice + '원');
                        },
                        error: function(xhr, textStatus, error) {
                            console.error("실패: ", error);
                            console.log("상태 코드: ", xhr.status);
                            console.log("에러 메시지: ", textStatus);
                        }
                    });
                }


                function openModal(src, desc, name, menu_seq, price) {
                    document.querySelector(".background").className = "background show-modal";


                    /*  let currentUrl = new URL(window.location.href);
					currentUrl.searchParams.set('menu_seq', menu_seq);
					window.history.replaceState(null, null, currentUrl.href); */
                    $.ajax({
                        type: "POST",
                        url: "${cpath}/sendData", // 서버에서 옵션 데이터를 가져오는 URL을 정의합니다.
                        data: {
                            menu_seq: menu_seq,
                        },
                        success: function(data) {
                            resetRadioButtons();
                            // 서버로부터 받은 옵션 데이터(data)를 처리하는 로직을 작성합니다.
                            // 예를 들어, 받은 데이터를 기반으로 옵션 div를 동적으로 생성합니다.
                            $(".radio-group").empty();

                            for (const option of data) {
                            	
                            	if(option.op_size_s != null){
                                const optionDiv = '<div class="radio">' +
                                    '<p class="option_title">사이즈</p>' +
                                    '<label class="radio-wrapper"> <input type="radio" class="radio-input" name="od_size" value="' + option.op_size_s + '" checked /> <span class="radio-tile">' +
                                    '<span class="radio-icon"><svg class="s_size" xmlns="http://www.w3.org/2000/svg" fill="currentColor" viewBox="0 0 256 256">' +
                                    '<g transform="translate(0.000000,255.000000) scale(0.05 ,-0.036)" fill="#currentColor" stroke="currentColor">' +
                                    '<path d="M1427 4949 c-57 -13 -134 -56 -183 -101 -40 -37 -114 -162 -114 -193 ' +
                                    '0 -9 -35 -14 -127 -17 -147 -5 -198 -23 -268 -93 -66 -66 -90 -125 -89 -225 0 ' +
                                    '-93 18 -144 73 -211 38 -46 133 -96 199 -105 28 -3 52 -9 52 -11 0 -11 90 ' +
                                    '-731 95 -760 l6 -33 -71 0 c-62 0 -74 -3 -95 -25 -14 -13 -25 -33 -25 -45 0 ' +
                                    '-11 54 -452 120 -980 66 -528 120 -964 120 -970 0 -6 11 -22 25 -35 22 -22 32 ' +
                                    '-25 105 -25 44 0 80 -3 80 -6 0 -3 25 -203 55 -444 30 -241 55 -444 55 -450 0 ' +
                                    '-6 11 -22 25 -35 l24 -25 1071 0 1071 0 22 23 c21 20 27 57 75 447 29 234 55 ' +
                                    '440 59 458 l5 32 80 0 c131 0 104 -110 247 1031 97 779 121 991 112 1007 -17 ' +
                                    '33 -43 42 -116 42 l-66 0 6 33 c5 29 95 749 95 760 0 2 24 8 52 11 63 9 159 ' +
                                    '58 194 99 14 16 37 53 52 81 22 43 26 64 26 136 1 78 -2 90 -33 148 -38 69 ' +
                                    '-80 110 -151 144 -37 18 -68 22 -172 26 -93 3 -128 8 -128 17 0 7 -16 44 -35 ' +
                                    '82 -43 86 -103 144 -193 186 l-67 32 -1115 2 c-628 1 -1131 -3 -1153 -8z ' +
                                    'm2247 -161 c45 -13 146 -105 146 -132 0 -14 -123 -16 -1260 -16 -1137 0 -1260 ' +
                                    '2 -1260 16 0 24 101 119 140 131 53 17 2178 17 2234 1z m572 -334 c53 -39 69 ' +
                                    '-71 69 -134 0 -63 -16 -95 -69 -134 -27 -21 -29 -21 -1659 -24 -898 -1 -1647 ' +
                                    '0 -1665 3 -46 8 -108 71 -117 118 -15 77 23 154 90 183 25 11 323 13 1677 11 ' +
                                    '1646 -2 1647 -2 1674 -23z m-261 -486 c-5 -32 -95 -750 -95 -762 0 -3 -598 -6 ' +
                                    '-1330 -6 -731 0 -1330 3 -1330 6 0 12 -90 730 -95 762 l-6 32 1431 0 1431 0 ' +
                                    '-6 -32z m80 -960 c-5 -31 -215 -1711 -215 -1723 0 -3 -580 -5 -1290 -5 -710 0 ' +
                                    '-1290 2 -1290 5 0 12 -210 1692 -215 1723 l-6 32 1511 0 1511 0 -6 -32z m-440 ' +
                                    '-1920 c-5 -32 -95 -750 -95 -762 0 -3 -436 -6 -970 -6 -533 0 -970 3 -970 6 0 ' +
                                    '12 -90 730 -95 762 l-6 32 1071 0 1071 0 -6 -32z" />' +
                                    '<path d="M2434 2866 c-206 -47 -390 -218 -465 -433 -101 -289 -36 -606 166 ' +
                                    ' -808 295 -295 751 -224 965 149 38 68 67 150 86 244 69 356 -129 726 -446 832 ' +
                                    '-83 28 -222 35 -306 16z m259 -168 l37 -13 -121 -120 c-141 -140 -171 -189 ' +
                                    '-171 -277 0 -49 7 -74 41 -144 62 -131 64 -126 -92 -282 l-134 -134 -37 44 ' +
                                    'c-81 94 -136 251 -136 388 0 253 158 486 370 545 63 17 184 14 243 -7z m282 ' +
                                    '-262 c161 -326 1 -741 -315 -822 -72 -18 -167 -15 -233 8 l-37 13 121 120 ' +
                                    'c142 141 169 186 169 278 0 54 -6 76 -41 148 -23 46 -41 97 -41 113 1 24 25 ' +
                                    '54 134 163 l133 134 38 -42 c20 -23 53 -74 72 -113z" />' +
                                    '</g></svg></span> <span for="radio-1" class="radio-label">' + option.op_size_s + '</span>' +
                                    '</span></label></div>';
                                $(".radio-group").append(optionDiv);
                                }

                            	if(option.op_size_m != null){
                                const optionDiv1 = '<div class="radio">' +
                                    '<p class="option_empty">.</p>' +
                                    '<label class="radio-wrapper"> <input type="radio" class="radio-input" name="od_size" value="' + option.op_size_m + '" /> <span class="radio-tile">' +
                                    '<span class="radio-icon"><svg xmlns="http://www.w3.org/2000/svg" fill="currentColor" viewBox="0 0 256 256">' +
                                    '<g transform="translate(0.000000,255.000000) scale(0.05,-0.042)" fill="#currentColor" stroke="currentColor">' +
                                    '<path d="M1427 4949 c-57 -13 -134 -56 -183 -101 -40 -37 -114 -162 -114 -193 ' +
                                    '0 -9 -35 -14 -127 -17 -147 -5 -198 -23 -268 -93 -66 -66 -90 -125 -89 -225 0 ' +
                                    '-93 18 -144 73 -211 38 -46 133 -96 199 -105 28 -3 52 -9 52 -11 0 -11 90 ' +
                                    '-731 95 -760 l6 -33 -71 0 c-62 0 -74 -3 -95 -25 -14 -13 -25 -33 -25 -45 0 ' +
                                    '-11 54 -452 120 -980 66 -528 120 -964 120 -970 0 -6 11 -22 25 -35 22 -22 32 ' +
                                    '-25 105 -25 44 0 80 -3 80 -6 0 -3 25 -203 55 -444 30 -241 55 -444 55 -450 0 ' +
                                    '-6 11 -22 25 -35 l24 -25 1071 0 1071 0 22 23 c21 20 27 57 75 447 29 234 55 ' +
                                    '440 59 458 l5 32 80 0 c131 0 104 -110 247 1031 97 779 121 991 112 1007 -17 ' +
                                    '33 -43 42 -116 42 l-66 0 6 33 c5 29 95 749 95 760 0 2 24 8 52 11 63 9 159 ' +
                                    '58 194 99 14 16 37 53 52 81 22 43 26 64 26 136 1 78 -2 90 -33 148 -38 69 ' +
                                    '-80 110 -151 144 -37 18 -68 22 -172 26 -93 3 -128 8 -128 17 0 7 -16 44 -35 ' +
                                    '82 -43 86 -103 144 -193 186 l-67 32 -1115 2 c-628 1 -1131 -3 -1153 -8z ' +
                                    'm2247 -161 c45 -13 146 -105 146 -132 0 -14 -123 -16 -1260 -16 -1137 0 -1260 ' +
                                    '2 -1260 16 0 24 101 119 140 131 53 17 2178 17 2234 1z m572 -334 c53 -39 69 ' +
                                    '-71 69 -134 0 -63 -16 -95 -69 -134 -27 -21 -29 -21 -1659 -24 -898 -1 -1647 ' +
                                    '0 -1665 3 -46 8 -108 71 -117 118 -15 77 23 154 90 183 25 11 323 13 1677 11 ' +
                                    '1646 -2 1647 -2 1674 -23z m-261 -486 c-5 -32 -95 -750 -95 -762 0 -3 -598 -6 ' +
                                    '-1330 -6 -731 0 -1330 3 -1330 6 0 12 -90 730 -95 762 l-6 32 1431 0 1431 0 ' +
                                    '-6 -32z m80 -960 c-5 -31 -215 -1711 -215 -1723 0 -3 -580 -5 -1290 -5 -710 0 ' +
                                    '-1290 2 -1290 5 0 12 -210 1692 -215 1723 l-6 32 1511 0 1511 0 -6 -32z m-440 ' +
                                    '-1920 c-5 -32 -95 -750 -95 -762 0 -3 -436 -6 -970 -6 -533 0 -970 3 -970 6 0 ' +
                                    '12 -90 730 -95 762 l-6 32 1071 0 1071 0 -6 -32z" />' +
                                    '<path d="M2434 2866 c-206 -47 -390 -218 -465 -433 -101 -289 -36 -606 166 ' +
                                    '-808 295 -295 751 -224 965 149 38 68 67 150 86 244 69 356 -129 726 -446 832 ' +
                                    '-83 28 -222 35 -306 16z m259 -168 l37 -13 -121 -120 c-141 -140 -171 -189 ' +
                                    '-171 -277 0 -49 7 -74 41 -144 62 -131 64 -126 -92 -282 l-134 -134 -37 44 ' +
                                    'c-81 94 -136 251 -136 388 0 253 158 486 370 545 63 17 184 14 243 -7z m282 ' +
                                    '-262 c161 -326 1 -741 -315 -822 -72 -18 -167 -15 -233 8 l-37 13 121 120 ' +
                                    'c142 141 169 186 169 278 0 54 -6 76 -41 148 -23 46 -41 97 -41 113 1 24 25 ' +
                                    '54 134 163 l133 134 38 -42 c20 -23 53 -74 72 -113z" />' +
                                    '</g></svg></span> <span for="radio-1" class="radio-label">' + option.op_size_m + '(+500원)</span>' +
                                    '</span></label></div>';
                                $(".radio-group").append(optionDiv1);
                                }

                            	if(option.op_size_l != null){
                                const optionDiv2 =
                                    '<div class="radio">' +
                                    '<p class="option_empty">.</p>' +
                                    '<label class="radio-wrapper">' +
                                    '<input type="radio" class="radio-input" name="od_size" value="' +
                                    option.op_size_l +
                                    '" />' +
                                    '<span class="radio-tile">' +
                                    '<span class="radio-icon"><svg xmlns="http://www.w3.org/2000/svg" fill="currentColor" viewBox="0 0 256 256">' +
                                    '<g transform="translate(0.000000,255.000000) scale(0.05,-0.048)" fill="#currentColor" stroke="currentColor">' +
                                    '<path d="M1427 4949 c-57 -13 -134 -56 -183 -101 -40 -37 -114 -162 -114 -193 ' +
                                    '0 -9 -35 -14 -127 -17 -147 -5 -198 -23 -268 -93 -66 -66 -90 -125 -89 -225 0 ' +
                                    '-93 18 -144 73 -211 38 -46 133 -96 199 -105 28 -3 52 -9 52 -11 0 -11 90 ' +
                                    '-731 95 -760 l6 -33 -71 0 c-62 0 -74 -3 -95 -25 -14 -13 -25 -33 -25 -45 0 ' +
                                    '-11 54 -452 120 -980 66 -528 120 -964 120 -970 0 -6 11 -22 25 -35 22 -22 32 ' +
                                    '-25 105 -25 44 0 80 -3 80 -6 0 -3 25 -203 55 -444 30 -241 55 -444 55 -450 0 ' +
                                    '-6 11 -22 25 -35 l24 -25 1071 0 1071 0 22 23 c21 20 27 57 75 447 29 234 55 ' +
                                    '440 59 458 l5 32 80 0 c131 0 104 -110 247 1031 97 779 121 991 112 1007 -17 ' +
                                    '33 -43 42 -116 42 l-66 0 6 33 c5 29 95 749 95 760 0 2 24 8 52 11 63 9 159 ' +
                                    '58 194 99 14 16 37 53 52 81 22 43 26 64 26 136 1 78 -2 90 -33 148 -38 69 ' +
                                    '-80 110 -151 144 -37 18 -68 22 -172 26 -93 3 -128 8 -128 17 0 7 -16 44 -35 ' +
                                    '82 -43 86 -103 144 -193 186 l-67 32 -1115 2 c-628 1 -1131 -3 -1153 -8z ' +
                                    'm2247 -161 c45 -13 146 -105 146 -132 0 -14 -123 -16 -1260 -16 -1137 0 -1260 ' +
                                    '2 -1260 16 0 24 101 119 140 131 53 17 2178 17 2234 1z m572 -334 c53 -39 69 ' +
                                    '-71 69 -134 0 -63 -16 -95 -69 -134 -27 -21 -29 -21 -1659 -24 -898 -1 -1647 ' +
                                    '0 -1665 3 -46 8 -108 71 -117 118 -15 77 23 154 90 183 25 11 323 13 1677 11 ' +
                                    '1646 -2 1647 -2 1674 -23z m-261 -486 c-5 -32 -95 -750 -95 -762 0 -3 -598 -6 ' +
                                    '-1330 -6 -731 0 -1330 3 -1330 6 0 12 -90 730 -95 762 l-6 32 1431 0 1431 0 ' +
                                    '-6 -32z m80 -960 c-5 -31 -215 -1711 -215 -1723 0 -3 -580 -5 -1290 -5 -710 0 ' +
                                    '-1290 2 -1290 5 0 12 -210 1692 -215 1723 l-6 32 1511 0 1511 0 -6 -32z m-440 ' +
                                    '-1920 c-5 -32 -95 -750 -95 -762 0 -3 -436 -6 -970 -6 -533 0 -970 3 -970 6 0 ' +
                                    '12 -90 730 -95 762 l-6 32 1071 0 1071 0 -6 -32z" />' +
                                    '<path d="M2434 2866 c-206 -47 -390 -218 -465 -433 -101 -289 -36 -606 166 ' +
                                    '-808 295 -295 751 -224 965 149 38 68 67 150 86 244 69 356 -129 726 -446 832 ' +
                                    '-83 28 -222 35 -306 16z m259 -168 l37 -13 -121 -120 c-141 -140 -171 -189 ' +
                                    '-171 -277 0 -49 7 -74 41 -144 62 -131 64 -126 -92 -282 l-134 -134 -37 44 ' +
                                    'c-81 94 -136 251 -136 388 0 253 158 486 370 545 63 17 184 14 243 -7z m282 ' +
                                    '-262 c161 -326 1 -741 -315 -822 -72 -18 -167 -15 -233 8 l-37 13 121 120 ' +
                                    'c142 141 169 186 169 278 0 54 -6 76 -41 148 -23 46 -41 97 -41 113 1 24 25 ' +
                                    '54 134 163 l133 134 38 -42 c20 -23 53 -74 72 -113z" />' +
                                    '</g></svg></span>' +
                                    '<span for="radio-3" class="radio-label">' +
                                    option.op_size_l +
                                    ' (+1000원)</span>' +
                                    '</span></label>' +
                                    '</div>';
                                $(".radio-group").append(optionDiv2);
                                }
                                    
                                if(option.op_ice != null){
                                const optionDiv3 =
                                    '<div class="radio">' +
                                    '<p class="option_title">얼음 선택</p>' +
                                    '<label class="radio-wrapper">' +
                                    '<input type="radio" class="radio-input" name="od_ice" value="' +
                                    option.op_ice +
                                    '" checked />' +
                                    '<span class="radio-tile">' +
                                    '<span class="radio-icon">' +
                                    '<svg xmlns="http://www.w3.org/2000/svg" width="512" height="512" fill="currentColor" viewBox="0 0 512 512">' +
                                    '<g fill="#currentColor" stroke="currentColor">' +
                                    '<path d="M 511.5,258.5 C 511.5,278.5 511.5,298.5 511.5,318.5C 507.982,322.7 503.649,323.533 498.5,321C 497.874,320.25 497.374,319.416 497,318.5C 496.667,300.833 496.333,283.167 496,265.5C 495.727,263.671 494.893,262.171 493.5,261C 453.732,238.033 413.899,215.2 374,192.5C 334.272,214.614 294.772,237.114 255.5,260C 254.333,261.167 253.167,262.333 252,263.5C 251.833,286.5 251.667,309.5 251.5,332.5C 251.343,356.252 251.843,379.919 253,403.5C 292.921,427.212 333.088,450.545 373.5,473.5C 413.631,450.933 453.631,428.1 493.5,405C 495.004,403.509 495.837,401.676 496,399.5C 496.333,381.5 496.667,363.5 497,345.5C 501.829,340.232 506.663,340.232 511.5,345.5C 511.5,365.833 511.5,386.167 511.5,406.5C 509.845,410.346 507.512,413.846 504.5,417C 463.663,440.919 422.663,464.586 381.5,488C 373.239,490.355 365.573,489.021 358.5,484C 321.663,462.414 284.663,441.081 247.5,420C 241.349,416.521 237.516,411.354 236,404.5C 235.667,384.167 235.333,363.833 235,343.5C 212.915,356.46 190.748,369.293 168.5,382C 163.254,383.506 157.921,383.839 152.5,383C 104.873,356.52 57.54,329.52 10.5,302C 5.26851,298.664 1.60184,294.164 -0.5,288.5C -0.5,231.5 -0.5,174.5 -0.5,117.5C 1.78001,111.374 5.78001,106.541 11.5,103C 38.2509,87.2938 65.2509,72.1271 92.5,57.5C 100.921,60.9198 102.254,66.0864 96.5,73C 69.2548,88.2032 42.4215,104.037 16,120.5C 14.3506,174.122 14.0173,227.788 15,281.5C 15.5163,284.034 16.683,286.2 18.5,288C 64.33,314.081 109.997,340.414 155.5,367C 160.604,367.462 165.271,366.128 169.5,363C 191.58,350.545 213.413,337.712 235,324.5C 235.333,303.5 235.667,282.5 236,261.5C 237.129,255.364 240.295,250.531 245.5,247C 264.415,236.293 283.248,225.46 302,214.5C 302.667,183.167 302.667,151.833 302,120.5C 255.407,92.1167 208.241,64.6167 160.5,38C 156.619,38.4265 152.953,39.7599 149.5,42C 141.068,47.8827 132.068,52.7161 122.5,56.5C 114.397,53.8055 112.73,48.9722 117.5,42C 128.542,35.1455 139.876,28.8122 151.5,23C 158.392,21.0415 165.058,21.7082 171.5,25C 214.833,50 258.167,75 301.5,100C 309.421,103.586 314.921,109.42 318,117.5C 318.167,146.506 318.667,175.506 319.5,204.5C 334.296,196.2 348.963,187.7 363.5,179C 369.392,176.299 375.392,175.966 381.5,178C 422.167,201.333 462.833,224.667 503.5,248C 507.037,250.94 509.703,254.44 511.5,258.5 Z" />' +
                                    '<path d="M 105.5,77.5 C 115.536,78.1598 118.203,82.9931 113.5,92C 97.2462,101.959 80.5795,111.126 63.5,119.5C 57.0332,118.572 54.5332,114.905 56,108.5C 56.7845,106.714 57.9512,105.214 59.5,104C 75.0594,95.3924 90.3927,86.5591 105.5,77.5 Z" />' +
                                    '<path d="M 42.5,130.5 C 47.6184,129.889 52.2851,131.056 56.5,134C 90.7485,153.707 124.915,173.54 159,193.5C 195.085,172.54 231.252,151.707 267.5,131C 274.239,128.751 278.239,131.085 279.5,138C 279.097,140.887 277.764,143.221 275.5,145C 239.252,165.707 203.085,186.54 167,207.5C 166.667,232.167 166.333,256.833 166,281.5C 164.607,284.366 162.274,285.699 159,285.5C 154.167,285.668 151.5,283.335 151,278.5C 150.667,254.833 150.333,231.167 150,207.5C 114.412,186.288 78.5791,165.455 42.5,145C 37.3972,140.214 37.3972,135.381 42.5,130.5 Z" />' +
                                    '<path d="M 370.5,203.5 C 379.207,203.037 382.707,207.037 381,215.5C 364.994,226.587 348.161,236.254 330.5,244.5C 322.722,241.666 321.056,236.833 325.5,230C 340.563,221.14 355.563,212.307 370.5,203.5 Z" />' +
                                    '<path d="M 274.5,269.5 C 278.911,269.203 282.911,270.369 286.5,273C 315.5,289.833 344.5,306.667 373.5,323.5C 404.5,305.667 435.5,287.833 466.5,270C 475.164,269 478.664,272.834 477,281.5C 475.833,282.667 474.667,283.833 473.5,285C 443.167,302.5 412.833,320 382.5,337.5C 381.667,374.162 381.167,410.829 381,447.5C 380.626,448.416 380.126,449.25 379.5,450C 373.774,452.904 369.274,451.738 366,446.5C 365.667,410.167 365.333,373.833 365,337.5C 334.248,319.54 303.415,301.707 272.5,284C 268.062,278.373 268.729,273.54 274.5,269.5 Z" />' +
                                    '<path d="M 156.5,304.5 C 160.426,304.047 163.592,305.38 166,308.5C 166.667,317.833 166.667,327.167 166,336.5C 159.605,342.421 154.605,341.421 151,333.5C 150.095,325.089 150.428,316.755 152,308.5C 153.397,306.93 154.897,305.596 156.5,304.5 Z" />' +
                                    '</svg>' +
                                    '</span> <span for="radio-4" class="radio-label">' +
                                    option.op_ice +
                                    '</span>' +
                                    '</span>' +
                                    '</label>' +
                                    '</div>';
                                $(".radio-group").append(optionDiv3);
                                }
                                
                                if(option.op_ice_s != null){
                                const optionDiv4 =
                                    '<div class="radio">' +
                                    '<p class="option_empty">.</p>' +
                                    '<label class="radio-wrapper">' +
                                    '<input type="radio" class="radio-input" name="od_ice" value="' +
                                    option.op_ice_s +
                                    '" />' +
                                    '<span class="radio-tile">' +
                                    '<span class="radio-icon">' +
                                    '<svg xmlns="http://www.w3.org/2000/svg" width="512" height="512" fill="currentColor" viewBox="0 0 512 512">' +
                                    '<path d="M 256.5,97.5 C 263.409,97.311 269.743,99.1443 275.5,103C 313.5,125 351.5,147 389.5,169C 393.104,171.708 395.604,175.208 397,179.5C 397.667,199.5 397.667,219.5 397,239.5C 396.5,241.333 395.333,242.5 393.5,243C 389.013,244.378 385.513,243.212 383,239.5C 382.962,220.768 382.295,202.102 381,183.5C 340.978,159.655 300.644,136.321 260,113.5C 220.272,135.614 180.772,158.114 141.5,181C 140.333,182.167 139.167,183.333 138,184.5C 137.01,231.25 137.344,277.917 139,324.5C 178.921,348.212 219.088,371.545 259.5,394.5C 299.631,371.933 339.631,349.1 379.5,326C 381.004,324.509 381.837,322.676 382,320.5C 382.333,302.5 382.667,284.5 383,266.5C 387.667,261.167 392.333,261.167 397,266.5C 397.667,286.833 397.667,307.167 397,327.5C 396.194,330.446 394.861,333.112 393,335.5C 351.742,360.883 309.908,385.383 267.5,409C 259.239,411.355 251.573,410.021 244.5,405C 207.663,383.414 170.663,362.081 133.5,341C 127.349,337.521 123.516,332.354 122,325.5C 121.333,277.833 121.333,230.167 122,182.5C 123.129,176.364 126.295,171.531 131.5,168C 170.817,146.583 209.484,124.25 247.5,101C 250.571,99.7043 253.571,98.5377 256.5,97.5 Z" />' +
                                    '<path d="M 256.5,124.5 C 265.207,124.037 268.707,128.037 267,136.5C 250.994,147.587 234.161,157.254 216.5,165.5C 208.722,162.666 207.056,157.833 211.5,151C 226.563,142.14 241.563,133.307 256.5,124.5 Z" />' +
                                    '<path d="M 188.5,133.5 C 189.833,134.167 189.833,134.167 188.5,133.5 Z" />' +
                                    '<path d="M 160.5,190.5 C 164.911,190.203 168.911,191.369 172.5,194C 201.5,210.833 230.5,227.667 259.5,244.5C 290.5,226.667 321.5,208.833 352.5,191C 361.164,190 364.664,193.834 363,202.5C 361.833,203.667 360.667,204.833 359.5,206C 329.167,223.5 298.833,241 268.5,258.5C 267.667,295.162 267.167,331.829 267,368.5C 266.626,369.416 266.126,370.25 265.5,371C 259.774,373.904 255.274,372.738 252,367.5C 251.667,331.167 251.333,294.833 251,258.5C 220.248,240.54 189.415,222.707 158.5,205C 154.062,199.373 154.729,194.54 160.5,190.5 Z" />' +
                                    '</svg>' +
                                    '</span> <span for="radio-5" class="radio-label">' +
                                    option.op_ice_s +
                                    '</span>' +
                                    '</span>' +
                                    '</label>' +
                                    '</div>';
                                $(".radio-group").append(optionDiv4);
                                }

                                if(option.op_ice_l != null){
                                const optionDiv5 =
                                    '<div class="radio">' +
                                    '<p class="option_empty">.</p>' +
                                    '<label class="radio-wrapper">' +
                                    '<input type="radio" class="radio-input" name="od_ice" value="' +
                                    option.op_ice_l +
                                    '" />' +
                                    '<span class="radio-tile">' +
                                    '<span class="radio-icon">' +
                                    '<svg xmlns="file:///C:/Users/smhrd/Downloads/png2svg/ice_l.svg" width="512" height="512" fill="currentColor" viewBox="0 0 512 512">' +
                                    '<path d="M 187.5,68.5 C 193.602,67.7327 199.269,68.8993 204.5,72C 235.716,90.3863 267.049,108.386 298.5,126C 303.116,128.618 306.283,132.451 308,137.5C 308.333,158.5 308.667,179.5 309,200.5C 319.985,193.594 331.152,187.094 342.5,181C 346.167,180.333 349.833,180.333 353.5,181C 383.712,197.96 413.712,215.294 443.5,233C 444.304,234.771 445.471,236.271 447,237.5C 447.667,253.167 447.667,268.833 447,284.5C 443.26,287.413 439.926,287.08 437,283.5C 436.667,270.833 436.333,258.167 436,245.5C 435.691,244.234 435.191,243.067 434.5,242C 405.665,224.924 376.665,208.424 347.5,192.5C 318.126,209.425 288.959,226.425 260,243.5C 259.333,251.167 259.333,258.833 260,266.5C 265.262,270.099 270.762,273.265 276.5,276C 279.135,277.961 280.969,280.461 282,283.5C 282.667,295.833 282.667,308.167 282,320.5C 279,324.5 276,324.5 273,320.5C 272.667,309.5 272.333,298.5 272,287.5C 271.692,286.692 271.192,286.025 270.5,285.5C 246.884,271.688 223.217,257.855 199.5,244C 198.167,243.333 196.833,243.333 195.5,244C 173.5,256.667 151.5,269.333 129.5,282C 135.109,286.811 141.109,291.144 147.5,295C 164.245,304.121 180.745,313.621 197,323.5C 215.614,312.779 234.114,301.946 252.5,291C 259.978,289.143 262.644,291.81 260.5,299C 241.415,310.293 222.249,321.46 203,332.5C 202.667,355.167 202.333,377.833 202,400.5C 198.157,404.729 194.823,404.395 192,399.5C 191.667,377.167 191.333,354.833 191,332.5C 168.032,319.18 145.032,305.847 122,292.5C 121.333,318.833 121.333,345.167 122,371.5C 145.956,386.762 170.456,401.262 195.5,415C 196.833,415.667 198.167,415.667 199.5,415C 223.251,401.04 247.085,387.207 271,373.5C 272.293,361.596 272.96,349.596 273,337.5C 276,333.5 279,333.5 282,337.5C 282.185,344.747 282.685,351.913 283.5,359C 287.049,359.774 290.382,361.107 293.5,363C 311.518,373.92 329.685,384.42 348,394.5C 377.152,378.405 406.152,361.738 435,344.5C 436.281,330.568 436.948,316.568 437,302.5C 439.926,298.92 443.26,298.587 447,301.5C 447.667,317.5 447.667,333.5 447,349.5C 445.471,350.729 444.304,352.229 443.5,354C 413.722,371.705 383.722,389.038 353.5,406C 349.833,406.667 346.167,406.667 342.5,406C 322.357,394.851 302.523,383.351 283,371.5C 282.366,376.201 280.199,380.034 276.5,383C 252.1,396.706 227.766,410.706 203.5,425C 201.351,425.579 199.185,426.079 197,426.5C 189.728,424.281 182.895,421.114 176.5,417C 155.423,404.868 134.59,392.368 114,379.5C 113.027,377.608 112.36,375.608 112,373.5C 111.667,344.5 111.333,315.5 111,286.5C 101.883,281.027 92.7164,275.693 83.5,270.5C 81.1843,268.53 79.3509,266.196 78,263.5C 77.3333,220.833 77.3333,178.167 78,135.5C 79.2567,133.321 80.7567,131.321 82.5,129.5C 102.172,117.899 121.839,106.399 141.5,95C 148.333,93.8333 151.167,96.6667 150,103.5C 131.612,115.283 112.778,126.45 93.5,137C 90.8917,138.378 89.3917,140.545 89,143.5C 88.3333,180.833 88.3333,218.167 89,255.5C 89.3603,257.421 90.1936,259.088 91.5,260.5C 99.9225,265.069 108.256,269.902 116.5,275C 118.635,275.635 120.635,275.301 122.5,274C 133.323,267.537 143.823,261.371 154,255.5C 164.404,249.38 174.904,243.38 185.5,237.5C 186.833,225.833 186.833,214.167 185.5,202.5C 160.394,187.775 135.06,173.275 109.5,159C 104.605,155.336 104.272,151.336 108.5,147C 112.12,146.159 115.454,146.826 118.5,149C 142.82,163.969 167.654,178.136 193,191.5C 218.873,177.064 244.706,162.23 270.5,147C 275.711,145.439 279.044,147.272 280.5,152.5C 279.966,154.614 278.966,156.448 277.5,158C 251.275,172.773 225.109,187.94 199,203.5C 198.333,213.167 198.333,222.833 199,232.5C 215.106,241.222 231.106,250.222 247,259.5C 247.333,253.5 247.667,247.5 248,241.5C 249.034,236.383 251.867,232.549 256.5,230C 269.879,222.893 283.045,215.393 296,207.5C 296.667,185.167 296.667,162.833 296,140.5C 262.139,119.482 227.639,99.4818 192.5,80.5C 184.338,84.7467 176.338,89.2467 168.5,94C 161.625,94.4482 159.125,91.2815 161,84.5C 169.615,78.777 178.449,73.4437 187.5,68.5 Z" />' +
                                    '<path d="M 153.5,108.5 C 161.574,108.953 163.574,112.787 159.5,120C 147.847,127.16 135.847,133.66 123.5,139.5C 116.459,136.453 115.792,132.286 121.5,127C 132.457,121.032 143.124,114.865 153.5,108.5 Z" />' +
                                    '<path d="M 345.5,199.5 C 350.217,198.893 352.883,200.893 353.5,205.5C 353.674,207.693 353.007,209.527 351.5,211C 341.003,216.748 330.67,222.748 320.5,229C 311.844,230.319 309.177,226.985 312.5,219C 323.596,212.46 334.596,205.96 345.5,199.5 Z" />' +
                                    '<path d="M 197.5,245.5 C 198.833,246.167 198.833,246.167 197.5,245.5 Z" />' +
                                    '<path d="M 275.5,247.5 C 277.857,247.337 280.19,247.503 282.5,248C 304.219,260.946 326.052,273.779 348,286.5C 369.665,273.289 391.498,260.455 413.5,248C 420.83,246.334 423.997,249.167 423,256.5C 422.167,257.333 421.333,258.167 420.5,259C 398.353,271.801 376.187,284.634 354,297.5C 353.667,324.167 353.333,350.833 353,377.5C 350.503,379.478 347.669,379.978 344.5,379C 343.299,378.097 342.465,376.931 342,375.5C 341.833,349.16 341.333,322.827 340.5,296.5C 318.778,283.466 296.778,270.8 274.5,258.5C 271.673,254.482 272.006,250.815 275.5,247.5 Z" />' +
                                    '<path d="M 194.5,249.5 C 199.09,248.73 201.756,250.564 202.5,255C 202.102,256.899 201.102,258.399 199.5,259.5C 189.962,265.101 180.296,270.435 170.5,275.5C 164.756,272.945 164.089,269.445 168.5,265C 177.098,259.543 185.764,254.376 194.5,249.5 Z" />' +
                                    '</svg>' +
                                    '</span>' +
                                    '<span for="radio-6" class="radio-label">' +
                                    option.op_ice_l +
                                    '</span>' +
                                    '</span>' +
                                    '</label>' +
                                    '</div>';
                                $(".radio-group").append(optionDiv5);
                                }

                                if(option.op_shot != null){
                                const optionDiv6 =
                                    '<div class="radio">' +
                                    '<p class="option_title">샷추가</p>' +
                                    '<label class="radio-wrapper"> <input type="radio" class="radio-input" name="od_shot" value="' +
                                    option.op_shot +
                                    '" checked /> <span class="radio-tile">' +
                                    '<span class="radio-icon"> <svg xmlns="http://www.w3.org/2000/svg" fill="currentColor" viewBox="0 0 256 256">' +
                                    '<g transform="translate(0.000000,245.000000) scale(0.05,-0.048)" fill="#currentColor" stroke="currentColor">' +
                                    '<path d="M1340 3934 c-247 -28 -433 -97 -577 -214 -208 -168 -325 -462 -293 -737 66 -587 617 -1131 1277 -1264 80 -16 149 -22 266 -23 l157 -1 44 -90 c269 -547 1033 -630 1702 -184 139 93 343 293 432 426 230 340 303 703 201 1008 -43 130 -98 216 -203 320 -171 169 -348 241 -617 252 -291 12 -576 -68 -858 -239 -53 -32 -66 -36 -73 -24 -34 61 -149 199 -242 292 -229 226 -543 394 -849 453 -100 20 -298 33 -367 25z m311 -180 c376 -61 749 -301 982 -634 l45 -65 -102 -100 c-55 -56 -128 -137 -161 -180 -32 -44 -63 -84 -67 -89 -4 -6 -61 16 -135 52 -159 76 -264 111 -477 156 -91 20 -201 47 -244 62 -119 40 -276 118 -386 191 -94 63 -293 243 -338 306 l-20 28 74 72 c190 187 482 258 829 201z m-872 -546 c260 -249 549 -395 936 -474 71 -14 177 -41 234 -60 127 -42 314 -132 307 -148 -96 -221 -117 -305 -123 -508 l-6 -157 -45 -7 c-26 -4 -100 -2 -167 5 -359 35 -684 196 -947 470 -248 258 -376 567 -340 824 12 87 29 157 39 157 3 0 53 -46 112 -102z m3135 33 c99 -26 213 -82 267 -130 l41 -36 -104 -43 c-248 -102 -501 -289 -677 -502 -29 -35 -94 -125 -144 -200 -155 -233 -286 -371 -477 -500 -127 -86 -323 -180 -406 -196 -34 -6 -34 -6 -64 57 -46 100 -61 172 -61 294 -1 125 18 227 62 348 167 454 624 829 1124 922 115 21 334 14 439 -14z m456 -364 c61 -136 80 -277 56 -432 -19 -124 -44 -202 -106 -330 -191 -395 -596 -703 -1053 -801 -58 -13 -125 -18 -227 -18 -157 1 -246 18 -358 69 -68 31 -187 115 -175 124 4 4 35 18 68 31 196 77 395 204 550 352 129 123 195 203 305 368 178 269 360 442 608 577 84 46 265 122 290 123 7 0 26 -28 42 -63z" />' +
                                    '</g>' +
                                    '</svg>' +
                                    '</span>' +
                                    '<span for="radio-7" class="radio-label">' +
                                    option.op_shot +
                                    '</span>' +
                                    '</span>' +
                                    '</label>' +
                                    '</div>';
                                $(".radio-group").append(optionDiv6);
                                }

                                if(option.op_shot_s != null){
                                const optionDiv7 = '<div class="radio">' +
                                    '<p class="option_empty">.</p>' +
                                    '<label class="radio-wrapper"> <input type="radio" class="radio-input" name="od_shot" value="' +
                                    option.op_shot_s +
                                    '" /> <span class="radio-tile">' +
                                    '<span class="radio-icon"> <svg xmlns="http://www.w3.org/2000/svg" fill="currentColor" viewBox="0 0 256 256">' +
                                    '<g transform="translate(0.000000,245.000000) scale(0.05,-0.048)" fill="#currentColor" stroke="currentColor">' +
                                    '<path d="M2840 3989 c-152 -20 -428 -130 -527 -211 -23 -18 -76 -60 -119 -93 -111 -86 -418 -396 -490 -495 -186 -256 -289 -455 -370 -711 -134 -427 -52 -881 209 -1156 119 -126 239 -200 404 -249 78 -24 105 -27 238 -27 135 -1 159 2 240 27 185 56 367 152 556 292 115 86 325 289 413 402 277 353 458 784 497 1189 35 357 -86 677 -323 858 -74 56 -187 115 -258 136 -25 7 -50 17 -57 22 -12 9 -232 27 -308 25 -22 0 -69 -4 -105 -9z m372 -158 c105 -24 268 -103 268 -130 0 -18 -92 -88 -232 -177 -280 -176 -490 -349 -595 -489 -90 -119 -136 -233 -222 -542 -28 -101 -67 -227 -87 -280 -97 -261 -290 -565 -531 -838 l-51 -59 -47 38 c-134 110 -234 288 -282 501 -24 107 -21 325 6 451 80 379 314 774 653 1099 237 228 454 362 683 420 127 32 312 35 437 6z m442 -335 c19 -34 47 -99 62 -146 27 -81 28 -94 28 -275 0 -219 -12 -293 -89 -524 -132 -395 -394 -777 -701 -1022 -316 -252 -629 -374 -867 -339 -81 12 -187 45 -187 59 0 4 32 45 72 91 252 299 418 563 497 792 17 47 49 159 71 249 76 303 116 402 226 545 164 215 458 454 749 610 91 49 90 50 139 -40z" />' +
                                    '</g>' +
                                    '</svg>' +
                                    '</span>' +
                                    '<span for="radio-8" class="radio-label">' +
                                    option.op_shot_s +
                                    '</span>' +
                                    '</span>' +
                                    '</label>' +
                                    '</div>';
                                $(".radio-group").append(optionDiv7);
                                }

                                if(option.op_shot_l != null){
                                const optionDiv8 = '<div class="radio">' +
                                    '<p class="option_empty">.</p>' +
                                    '<label class="radio-wrapper"> <input type="radio" class="radio-input" name="od_shot" value="' +
                                    option.op_shot_l +
                                    '" /> <span class="radio-tile">' +
                                    '<span class="radio-icon"> <svg xmlns="http://www.w3.org/2000/svg" fill="currentColor" viewBox="0 0 256 256">' +
                                    '<g transform="translate(0.000000,245.000000) scale(0.05,-0.048)" fill="#currentColor" stroke="currentColor">' +
                                    '<path d="M3377 5104 c-100 -18 -210 -64 -302 -125 -88 -59 -245 -206 -326 -305 -137 -168 -272 -405 -335 -589 -15 -44 -30 -83 -33 -86 -3 -4 -49 24 -101 62 -178 128 -355 214 -553 267 -94 25 -116 27 -292 26 -174 0 -198 -2 -289 -27 -261 -70 -471 -240 -582 -472 -67 -137 -87 -225 -87 -380 0 -107 5 -151 27 -249 128 -553 484 -1051 992 -1386 172 -114 387 -216 546 -260 39 -11 72 -21 74 -22 1 -2 -13 -53 -31 -114 -134 -440 -54 -885 208 -1161 119 -126 239 -200 404 -249 78 -24 105 -27 238 -27 135 -1 159 2 240 27 185 56 367 152 556 292 115 86 325 289 413 402 277 353 458 784 497 1189 35 357 -86 677 -323 858 -74 56 -187 115 -258 136 -25 7 -47 14 -48 15 -2 1 19 41 47 89 146 246 239 485 298 765 14 67 18 131 18 300 0 190 -3 225 -23 305 -32 127 -81 239 -147 341 -136 209 -326 340 -550 379 -105 18 -174 18 -278 -1z m211 -139 c1 -1 -14 -38 -33 -81 -199 -434 -273 -781 -234 -1109 14 -117 0 -233 -42 -360 -29 -87 -121 -275 -158 -324 l-18 -24 -53 104 c-107 212 -247 406 -428 591 l-125 127 37 108 c153 447 499 858 800 951 77 23 233 34 254 17z m322 -124 c130 -98 247 -284 297 -476 23 -90 26 -118 26 -280 1 -157 -3 -196 -26 -305 -51 -244 -152 -494 -290 -720 l-64 -104 -139 -2 c-160 -2 -272 -26 -416 -89 -46 -20 -88 -39 -94 -41 -6 -3 -16 14 -23 39 l-13 44 62 94 c118 179 195 364 226 540 13 75 15 117 8 209 -22 287 1 484 87 740 40 120 115 303 165 403 l24 47 58 -29 c31 -16 82 -47 112 -70z m-2268 -641 c433 -89 878 -449 1203 -975 104 -168 215 -413 215 -474 0 -11 -19 -33 -47 -53 -88 -63 -231 -188 -272 -237 -22 -26 -60 -64 -85 -84 l-44 -36 -85 142 c-220 368 -402 541 -674 643 -314 118 -643 400 -962 826 l-43 57 29 26 c41 37 153 103 215 127 154 59 371 74 550 38z m-662 -585 c233 -272 513 -492 752 -592 163 -67 223 -99 298 -154 162 -120 311 -311 434 -558 l47 -92 -49 -62 c-69 -86 -170 -244 -232 -359 -38 -72 -57 -98 -71 -98 -43 0 -242 73 -364 134 -529 263 -934 727 -1110 1274 -98 303 -86 541 38 744 l28 47 76 -97 c42 -53 111 -137 153 -187z m2982 -824 c105 -24 268 -103 268 -130 0 -18 -92 -88 -232 -177 -280 -176 -490 -349 -595 -489 -90 -119 -136 -233 -222 -542 -28 -101 -67 -227 -87 -280 -97 -261 -290 -565 -531 -838 l-51 -59 -47 38 c-134 110 -234 288 -282 501 -24 107 -21 325 6 451 80 379 314 774 653 1099 237 228 454 362 683 420 127 32 312 35 437 6z m442 -335 c19 -34 47 -99 62 -146 27 -81 28 -94 28 -275 0 -219 -12 -293 -89 -524 -132 -395 -394 -777 -701 -1022 -316 -252 -629 -374 -867 -339 -81 12 -187 45 -187 59 0 4 32 45 72 91 252 299 418 563 497 792 17 47 49 159 71 249 76 303 116 402 226 545 164 215 458 454 749 610 91 49 90 50 139 -40z" />' +
                                    '</g>' +
                                    '</svg>' +
                                    '</span>' +
                                    '<span for="radio-9" class="radio-label">' +
                                    option.op_shot_l +
                                    ' (+500원)</span>' +
                                    '</span>' +
                                    '</label>' +
                                    '</div>';
                                $(".radio-group").append(optionDiv8);
                                }

                                const optionDiv9 = '<div class="radio">' +
                                    '<p class="option_title">컵 선택</p>' +
                                    '<label class="radio-wrapper"> <input type="radio" class="radio-input" name="od_cup" value="' +
                                    option.op_cup +
                                    '" checked />' +
                                    '<span class="radio-tile not"> <span class="radio-icon"> </span> <span for="radio-10" class="radio-label">' +
                                    option.op_cup +
                                    '</span>' +
                                    '</span>' +
                                    '</label>' +
                                    '</div>';

                                const optionDiv10 = '<div class="radio">' +
                                    '<p class="option_empty">.</p>' +
                                    '<label class="radio-wrapper"> <input type="radio" class="radio-input" name="od_cup" value="' +
                                    option.op_cup_t +
                                    '" /> <span class="radio-tile not">' +
                                    '<span class="radio-icon"> </span> <span for="radio-11" class="radio-label">' +
                                    option.op_cup_t +
                                    '</span>' +
                                    '</span>' +
                                    '</label>' +
                                    '</div>';

                                // 옵션 div를 해당 위치에 추가합니다.
                                $(".radio-group").append(optionDiv9, optionDiv10);
                            }
                        },
                        error: function(xhr, status, error) {
                            // 에러 처리 로직을 작성합니다.
                            console.error(error);
                        },
                    });

                    var modalImage = document.getElementById("modalImage");
                    var modalDescription = document.getElementById("modalDescription");
                    var modalName = document.getElementById("modalName");

                    modalImage.src = src;
                    modalDescription.innerText = desc;
                    modalName.innerText = name;

                    modalName.dataset.price = price;

                    updateTotalPrice();
                };

                // 메뉴 옵션창 닫기
                function cancel() {
                    document.querySelector(".background").className = "background";
                }

                function cancel1() {
                    document.querySelector(".cont04").className = "md-container cont04";
                }

                document.querySelector("#cancel1").addEventListener("click", cancel1);

                document.querySelector("#cancel").addEventListener("click", cancel);
                // 주문하기 클릭 시 닫기
                document.querySelector("#orderButton").addEventListener("click", cancel);


                let cnt = 0;
                let spanVal = document.getElementById('spanTag');
                const increase = () => {
                    let spanNum = Number(spanVal.innerText)
                    spanVal.innerText = spanNum + 1;
                }
                const decrease = () => {
                    let spanNum = Number(spanVal.innerText)
                    if (spanNum > 1) {
                        spanVal.innerText = spanNum - 1;
                    }
                }


                // 장바구니 수량 증가 함수
                function list_increase(element) {
                    let quantity = parseInt(element.textContent) || 0;
                    quantity += 1;
                    element.textContent = quantity;
                }

                // 장바구니 수량 감소 함수
                function list_decrease(element) {
                    let quantity = parseInt(element.textContent) || 0;
                    if (quantity > 1) {
                        quantity -= 1;
                        element.textContent = quantity;
                    }
                }



                var swiper = new Swiper('.swiper-container', {
                    slidesPerView: 'auto',
                    navigation: {
                        prevEl: '.swiper-button-prev',
                        nextEl: '.swiper-button-next'
                    }
                });

                // 옵션 모달 열기 전에 라디오 버튼 초기화
                function resetRadioButtons() {

                    const sizeRadios = document.querySelectorAll('input[name="od_size"]');
                    if (sizeRadios.length > 0) {
                        sizeRadios.forEach((radio) => {
                            radio.checked = false;
                            radio.addEventListener('change', updateTotalPrice); // onchange 이벤트 핸들러 추가
                        });
                        sizeRadios[0].checked = true;
                    }

                    const iceRadios = document.querySelectorAll('input[name="od_ice"]');
                    if (iceRadios.length > 0) {
                        iceRadios.forEach((radio) => {
                            radio.checked = false;
                        });
                        iceRadios[0].checked = true;
                    }

                    const shotRadios = document.querySelectorAll('input[name="od_shot"]');
                    if (shotRadios.length > 0) {
                        shotRadios.forEach((radio) => {
                            radio.checked = false;
                            radio.addEventListener('change', updateTotalPrice); // onchange 이벤트 핸들러 추가
                        });
                        shotRadios[0].checked = true;
                    }

                    const selectRadios = document.querySelectorAll('input[name="od_cup"]');
                    if (selectRadios.length > 0) {
                        selectRadios.forEach((radio) => {
                            radio.checked = false;
                        });
                        selectRadios[0].checked = true;
                    }

                    const quantitySpan = document.getElementById("spanTag");
                    if (quantitySpan) {
                        quantitySpan.innerText = "1";
                    }
                }



                $('#orderButton').on('click', () => {

                    let menuPrice = parseInt($('#modalName').data('price')); // 기본 가격

                    const sizeValue = $('input[name="od_size"]:checked').val();
                    if (sizeValue === "M") {
                        menuPrice += 500; // M 사이즈 선택 시 가격 추가
                    } else if (sizeValue === "L") {
                        menuPrice += 1000; // L 사이즈 선택 시 가격 추가
                    }

                    const shotSelect = $('input[name="od_shot"]:checked').val();
                    if (shotSelect === "진하게") {
                        menuPrice += 500; // 샷 추가 선택 시 가격 추가
                    }

                    const orderData = {
                        menu_name: $('#modalName').text(),
                        menu_cnt: parseInt($('#spanTag').text()),
                        menu_price: menuPrice,
                        ...$('#orderList').serializeArray().reduce((acc, {
                            name,
                            value
                        }) => ({
                            ...acc,
                            [name]: value
                        }), {})
                    };

                    $.ajax({
                        type: 'POST',
                        url: '${cpath}/order',
                        data: JSON.stringify(orderData),
                        dataType: "json",
                        contentType: 'application/json',
                        success: function(response) {
                            console.log("성공", response);
                            // 주문 성공 후 주문 목록을 동적으로 생성하고 추가하는 로직 호출
                            addOrderToCart(response);
                        },
                        error: function(xhr, textStatus, error) {
                            console.error("실패: ", error);
                            console.log("상태 코드: ", xhr.status);
                            console.log("에러 메시지: ", textStatus);
                        }
                    });

                });

                $(document).ready(function() {
                    const priceSpan = document.getElementById('priceSpan');
                    priceSpan.textContent = "0원"
                    $.ajax({
                        url: '${cpath}/orderList',
                        success: function(response) {
                            console.log("data: ", response);

                            for (let i = 0; i < response.length; i++) {
                                const order = response[i];
                                // 주문 목록을 동적으로 생성하고 추가하는 로직 호출
                                addOrderToCart(order);
                                updateTotalPrice();
                            }
                        },
                        error: function(xhr, textStatus, error) {
                            console.error("실패: ", error);
                            console.log("상태 코드: ", xhr.status);
                            console.log("에러 메시지: ", textStatus);
                        }
                    });
                });

                function addOrderToCart(order) {
                    const listItem = document.createElement('div');
                    listItem.classList.add('row', 'orders-list');
                    listItem.id = 'orders-list-' + order.od_seq;

                    const tagsDiv = document.createElement('div');
                    tagsDiv.classList.add('col-lg-7', 'tags');

                    // m-name 요소 생성
                    const mNameDiv = document.createElement('div');
                    mNameDiv.classList.add('row', 'm-name');
                    const mNameCol = document.createElement('div');
                    mNameCol.classList.add('col-lg-12');
                    const mNameSpan = document.createElement('span');
                    mNameSpan.textContent = order.menu_name;
                    mNameCol.appendChild(mNameSpan);
                    mNameDiv.appendChild(mNameCol);
                    tagsDiv.appendChild(mNameDiv);

                    // m-options 요소 생성
                    const mOptionsDiv = document.createElement('div');
                    mOptionsDiv.classList.add('row', 'm-options');
                    const mOptionsCol = document.createElement('div');
                    mOptionsCol.classList.add('col-lg-14', 'options');

                    const odSize = order.od_size;
                    const odIce = order.od_ice;
                    const odShot = order.od_shot;
                    const odCup = order.od_cup;

                    let mOptionsText = '▷ ';
                    if (odSize) {
                        mOptionsText += odSize + ' / ';
                    }
                    if (odIce) {
                        mOptionsText += odIce + ' / ';
                    }
                    if (odShot) {
                        mOptionsText += odShot + ' / ';
                    }
                    if (odCup) {
                        mOptionsText += odCup;
                    }

                    mOptionsCol.textContent = mOptionsText;
                    mOptionsDiv.appendChild(mOptionsCol);
                    tagsDiv.appendChild(mOptionsDiv);

                    listItem.appendChild(tagsDiv);

                    const quantityDiv = document.createElement('div');
                    quantityDiv.classList.add('col-lg-4');

                    // 주문 수량 표시를 동적으로 생성
                    const quantityRow = document.createElement('div');
                    quantityRow.classList.add('row');
                    const quantityInputGroup = document.createElement('div');
                    quantityInputGroup.classList.add('input-group', 'quantity');

                    // "-" 버튼
                    const minusButton = document.createElement('input');
                    minusButton.setAttribute('type', 'button');
                    minusButton.classList.add('q_btn1');
                    minusButton.value = '-';
                    minusButton.addEventListener('click', function(event) {
                        list_decrease(quantityText);
                        updateTotalPrice();

                        const quantityTextElement = event.currentTarget.parentElement.querySelector('.quantity-text');
                        const menuNameElement = event.currentTarget.closest('.orders-list').querySelector('.m-name span');

                        const menu_name = menuNameElement.textContent;
                        const menu_cnt = parseInt(quantityTextElement.textContent);

                        console.log("메뉴:", menu_name);
                        console.log("수량:", menu_cnt);

                        const orderData = {
                            menu_name: menu_name,
                            menu_cnt: menu_cnt,
                        };
                        console.log("orderdata", orderData)
                        const orderDataArray = [orderData]; // orderData를 배열로 감싸서 생성

                        $.ajax({
                            type: 'POST',
                            url: '${cpath}/updateData',
                            data: JSON.stringify(orderDataArray), // 배열 형태로 전송
                            contentType: 'application/json',
                            success: function(response) {
                                console.log('수량 변경 성공', response);
                                // 성공 시 처리 로직 작성
                            },
                            error: function(xhr, textStatus, error) {
                                console.error('주문 실패:', error);
                                console.log('상태 코드:', xhr.status);
                                console.log('에러 메시지:', textStatus);
                            }
                        });
                    });
                    quantityInputGroup.appendChild(minusButton);

                    // 수량 표시
                    const quantityText = document.createElement('span');
                    quantityText.classList.add('quantity-text');
                    quantityText.textContent = order.menu_cnt;
                    quantityInputGroup.appendChild(quantityText);

                    // "+" 버튼
                    const plusButton = document.createElement('input');
                    plusButton.setAttribute('type', 'button');
                    plusButton.classList.add('q_btn2');
                    plusButton.value = '+';
                    plusButton.addEventListener('click', function(event) {
                        list_increase(quantityText);
                        updateTotalPrice();
                        const quantityTextElement = event.currentTarget.parentElement.querySelector('.quantity-text');
                        const menuNameElement = event.currentTarget.closest('.orders-list').querySelector('.m-name span');

                        const menu_name = menuNameElement.textContent;
                        const menu_cnt = parseInt(quantityTextElement.textContent);

                        console.log("메뉴:", menu_name);
                        console.log("수량:", menu_cnt);

                        const orderData = {
                            menu_name: menu_name,
                            menu_cnt: menu_cnt,
                        };

                        const orderDataArray = [orderData]; // orderData를 배열로 감싸서 생성

                        $.ajax({
                            type: 'POST',
                            url: '${cpath}/updateData',
                            data: JSON.stringify(orderDataArray), // 배열 형태로 전송
                            contentType: 'application/json',
                            success: function(response) {
                                console.log('수량 변경 성공', response);
                                // 성공 시 처리 로직 작성
                            },
                            error: function(xhr, textStatus, error) {
                                console.error('주문 실패:', error);
                                console.log('상태 코드:', xhr.status);
                                console.log('에러 메시지:', textStatus);
                            }
                        });
                    });
                    quantityInputGroup.appendChild(plusButton);

                    quantityRow.appendChild(quantityInputGroup);
                    quantityDiv.appendChild(quantityRow);

                    listItem.appendChild(quantityDiv);

                    // 삭제 버튼
                    const deleteButton = document.createElement('button');
                    deleteButton.classList.add('deletebutton');
                    deleteButton.textContent = 'X';
                    const od_seq = order.od_seq; // 주문 메뉴의 od_seq 값을 가져옴
                    deleteButton.addEventListener('click', () => {
                        deleteOrderFromCart(od_seq); // 해당 주문 메뉴를 삭제하는 함수 호출
                        updateTotalPrice();
                    });
                    listItem.appendChild(deleteButton);

                    listItem.dataset.price = order.menu_price;

                    document.getElementById('ordersContainer').appendChild(listItem);

                    updateTotalPrice();
                }


                // 주문 메뉴 삭제 함수
                function deleteOrderFromCart(od_seq) {
                    $.ajax({
                        url: '${cpath}/deleteOrder',
                        data: {
                            od_seq: od_seq
                        },
                        success: function() {
                            console.log('주문 메뉴 삭제 성공');

                            removeOrderFromUI(od_seq);
                            updateTotalPrice();
                        },
                        error: function(xhr, textStatus, error) {
                            console.error('주문 메뉴 삭제 실패: ', error);
                            console.log('상태 코드: ', xhr.status);
                            console.log('에러 메시지: ', textStatus);
                        }
                    });
                }

                // 화면에서 주문 메뉴 제거
                function removeOrderFromUI(od_seq) {
                    const orderElement = document.getElementById('orders-list-' + od_seq);
                    if (orderElement) {
                        orderElement.remove();
                    }
                }

                // 장바구니에 가격 작성
                function updateTotalPrice() {
                    const orders = document.getElementsByClassName('orders-list');
                    let totalPrice = 0;

                    for (let i = 0; i < orders.length; i++) {
                        const order = orders[i];
                        const price = parseFloat(order.dataset.price);
                        const quantity = parseInt(order.querySelector('.quantity-text').textContent);

                        totalPrice += price * quantity; // 옵션 가격을 고려하여 총 가격 계산
                    }

                    const priceSpan = document.getElementById('priceSpan');
                    if (priceSpan) {
                        priceSpan.textContent = totalPrice.toFixed(0) + '원';
                    }
                }
            </script>
</body>

</html>