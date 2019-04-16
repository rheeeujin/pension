<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script>
$(function() {
    $('.header').on('click', '.search-toggle', function(e) {
      var selector = $(this).data('selector');
      $(selector).toggleClass('show').find('.search-input').focus();
      $(this).toggleClass('active');
      e.preventDefault();
    });
    $('.work').on('click',()=>{
    	alert("준비중입니다.")
    })
  })
</script>
<header role="banner">
        <div class="top-bar">
          <div class="container">
            <div class="row">
              <div class="col-9 social">
                <a href="index"><img src="images/logo.png" class="logo"></a>
              </div>
              <span id="header-3" class="header">
                  <nav class="header-nav">
                    <div class="search-button">
                      <a href="#" class="search-toggle" data-selector="#header-3"></a>
                    </div>
                    <ul class="menu social">
                      <li><a href="" class="work">고객센터</a></li>
                      <c:if test="${member.email ==null}">
                      <li><a href="terms">회원가입</a></li>
                      <li><a href="login">로그인</a></li>
                      </c:if>
                      <c:if test="${member.email !=null}">
                      <li><a href="mypage">내정보</a></li>
                      <li><a href="logout">로그아웃</a></li>
                      </c:if>
                    </ul>
                    <form action="search" method="get" class="search-box">
                      <input type="text" class="text search-input" name="search" placeholder="지역을 입력하세요." />
                    </form>
                  </nav>
                </span>
            </div>
          </div>
        </div>

        <div class="container logo-wrap">
          <div class="row pt-5">
            <div class="col-12 text-center">
              <a class="absolute-toggle d-block d-md-none" data-toggle="collapse" href="#navbarMenu" role="button" aria-expanded="false" aria-controls="navbarMenu"><span class="burger-lines"></span></a>
              <h3 class="absolute-toggle d-block d-md-none menu-text">Menu</h3>
            </div>
          </div>
        </div>
        <nav class="navbar navbar-expand-md  navbar-light bg-light">
          <div class="container">
            <div class="collapse navbar-collapse" id="navbarMenu">
              <ul class="navbar-nav">
                <li class="nav-item">
                  <a class="nav-link" href="list.do">지역별 펜션</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link work" href="">빈 방 검색</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="spa.do">스파 펜션</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="full.do">풀빌라 펜션</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="work.do">워크샾/MT 펜션</a>
                </li>
              </ul>
            </div>
          </div>
        </nav>
      </header>