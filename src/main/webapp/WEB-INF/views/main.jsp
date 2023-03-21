<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>main</title>
<link rel="stylesheet" href="css/common.css"/>
<style type="text/css">

.row_c{
    width: 1200px;
    margin: 0 auto;
}
*{
    margin: 0;
    padding: 0;
}
body{
	heiht: 100%;
	font-family: 'Noto Sans KR', sans-serif;
	color: #333;
}
a{
    text-decoration: none;
    color: #333;
}
li{
    list-style: none;
}
img{
    border: 0
}
.clearfix::after{
    display: table;
    clear:  both;
    content: '';
}
header{
	padding-top: 10px;
}
.aud_title, .port_title, .com_title{
    display: flex;
    justify-content: space-between;
    margin-top: 100px;
    margin-bottom: 20px;
}
.port_title{
    margin-top: 50px;
}
.aud_txt , .port_txt, .com_txt{
    width: 80%;
    
}
.aud_txt h3, .port_txt h3, .com_txt h3{
    margin: 0;
    font-size: 36px;
}
.aud_txt p, .port_txt p, .com_txt p{
    font-size: 20px;
}
.aud_btn, .port_btn, .com_btn{
    padding-top: 20px;
    width: 20%;
}
.aud_btn a, .port_btn a, .com_btn a{
    display: block;
    width: 240px;
    text-align: center;
    border: 1px solid #333;
    border-radius: 10px;
    padding: 15px 0;
    transition: all 0.3s ease-in;
}
.aud_btn a:hover, .port_btn a:hover, .com_btn a:hover{
    color: #fff;
    background: #bbbbbb;
}
.aud_list ul{
    margin: 0;
    padding: 0;
    display: flex;
    justify-content: space-between;
    flex-flow: row wrap;
}
.aud_list ul li{
    width: 48%;
    border: 1px solid #333;
    border-radius: 10px;
    margin-bottom: 15px;
    padding: 15px;
    box-sizing: border-box;
}
.aud_list ul li a{
    display: flex;
    justify-content: space-between;
}
.aud_list .list_img{
    width: 45%;
    overflow: hidden;
}
.aud_list .list_img img{
    width: 200px;
    height: 180px;
    border-radius: 10px;
}
.aud_list .list_txt{
    width: 55%;
}
.list_txt p:nth-child(1){
    font-size: 20px;
    font-weight: bold;
    padding: 20px 0;
}
.list_txt p:nth-child(2){
    color: #777;
}
.portfolio{
    width: 100%;
    padding: 30px 0;
    margin: 100px auto;
}
.port_list ul{
    display: flex;
    padding: 50px 0;
    justify-content: space-between;
    flex-flow: row wrap;
}
.port_list ul li{
    width: 200px;
    margin-top: 20px;
    overflow: hidden;
    padding: 0 10px;
	
}
.port_list ul li a{
    display: block;
    overflow: hidden;
}
.port_list ul li a img{
    width: 100%;   
    height: 200px;
    object-fit: cover;
    border-radius: 50px;
    box-shadow: 0 17px 20px -18px rgba(0, 0, 0, 1);
    
}
.port_list ul li a p{
    padding: 10px 0;
    font-weight: bold;
    text-align: center;
}
.com_list{
    margin-top: 50px;
    margin-bottom: 130px;
}
.com_list ul{
    display: flex;
    justify-content: space-around;
    
}
.com_list ul li{
    width: 30%;
    border: 1px solid #333;
    border-radius: 15px;
    padding: 20px;
    box-sizing: border-box;
}
.com_list > ul > li > a{
    display: block;
}
.com_list > ul > li > a > p{
    font-size: 20px;
    font-weight: bold;
    padding-bottom: 20px ;
}
.com_list ul li a .com_list_txt{
    display: flex;
    justify-content: space-between;
}
.com_list ul li a .com_list_txt p{
    color: #777;
}
</style>
</head>
<body>
    <div id="main_wrap" align-i>
        <div class="row_c banner">
            <img src="./images/main_banner.png" alt="">
        </div>
        <div class="row_c audition">
            <div class="aud_title">
                <div class="aud_txt">
                    <h3>최신 오디션 공고</h3>
                    <p>오디션 공고에 지원하여 배우의 꿈을 이뤄보세요</p>
                </div>
                <div class="aud_btn">
                    <a href="nbslist.do">오디션 공고 더보기 ></a>
                </div>
            </div>
            <div class="aud_list">
                <ul>
                    <li>
                        <a href="nbsdetail.do?seq=2">
                            <div class="list_img"><img src="./images/film.jpg" alt="film"></div>
                            <div class="list_txt">
                                <p>미디어 프로덕션 동아리 ‘구미호’의 단편 영화 <불가사리,의>에서 주연 배우 3명을 모집합니다</p>
                                <p>미디어 프로덕션 동아리 구미호</p>
                            </div>
                        </a>
                    </li>
                    <li>
                        <a href="nbsdetail.do?seq=3">
                            <div class="list_img"><img src="./images/film.jpg" alt="film"></div>
                            <div class="list_txt">
                                <p>다랑 엔터테인먼트 장편상업영화 <마지막 연가>에서 17~28세 여자 배우를 모집합니다.</p>
                                <p>다랑 엔터테인먼트</p>
                            </div>
                        </a>
                    </li>
                    <li>
                        <a href="nbsdetail.do?seq=4">
                            <div class="list_img"><img src="./images/film.jpg" alt="film"></div>
                            <div class="list_txt">
                                <p>동국대학교 영화영상학과 졸업영화 <첨벙>에서 남자배우님을 모집합니다.</p>
                                <p>동국대학교 영화영상학과</p>
                            </div>
                        </a>
                    </li>
                    <li>
                        <a href="nbsdetail.do?seq=5">
                            <div class="list_img"><img src="./images/film.jpg" alt="film"></div>
                            <div class="list_txt">
                                <p>오징어게임 시즌2 프로필 많은 지원 바랍니다!</p>
                                <p>넷플릭스</p>
                            </div>
                        </a>
                    </li>
                </ul>
            </div>
        </div>

        <div class="portfolio">
            <div class="row_c">
                <div class="port_title">
                    <div class="port_txt">
                        <h3>배우 프로필</h3>
                        <p>많은 배우들이 작품을 기다리고있어요</p>
                    </div>
                    <div class="port_btn">
                        <a href="ppslist.do">더 많은 배우 보기 ></a>
                    </div>
                </div>
                <div class="port_list">
                    <ul>
                        <li><a href="ppsdetail.do?seq=5">
                            <img src="./images/portfolio1.jpg" alt="">
                            <p>차은우</p>
                        </a></li>
                        <li><a href="ppsdetail.do?seq=6">
                            <img src="./images/portfolio2.jpg" alt="">
                            <p>남지현</p>
                        </a></li>

                        <li><a href="ppsdetail.do?seq=7">
                            <img src="./images/portfolio3.png" alt="">
                            <p>남주혁</p>
                        </a></li>
                        <li><a href="ppsdetail.do?seq=8">
                            <img src="./images/portfolio4.jpg" alt="">
                            <p>배수지</p>
                        </a></li>
                            
                        <li><a href="ppsdetail.do?seq=9">
                            <img src="./images/portfolio5.jpg" alt="">
                            <p>최우식</p>
                        </a></li>
                        <li><a href="ppsdetail.do?seq=10">
                            <img src="./images/portfolio6.jpg" alt="">
                            <p>임지연</p>
                        </a></li>
                            
                        <li><a href="ppsdetail.do?seq=11">
                            <img src="./images/portfolio7.jpg" alt="">
                            <p>박해진</p>
                        </a></li>
                        <li><a href="ppsdetail.do?seq=12">
                            <img src="./images/portfolio8.jpg" alt="">
                            <p>전소민</p>
                        </a></li>
                            
                        <li><a href="ppsdetail.do?seq=13">
                            <img src="./images/portfolio9.jpg" alt="">
                            <p>신승호</p>
                        </a></li>
                        <li><a href="ppsdetail.do?seq=14">
                            <img src="./images/portfolio10.jpg" alt="">
                            <p>류혜영</p>
                        </a></li>
                    </ul>
                </div>
            </div>
        </div>

        <div class="row_c community">
            <div class="com_title">
                <div class="com_txt">
                    <h3>커뮤니티</h3>
                    <p>배우들과 커뮤니티를 통해 정보를 공유해보세요</p>
                </div>
                <div class="com_btn">
                    <a href="bbslist.do">커뮤니티 가기 ></a>
                </div>
            </div>
            <div class="com_list">
                <ul>
                    <li><a href="bbsdetail.do?seq=4">
                        <p>오디션 또 언제 열리는지 아시나요?</p>
                        <div class="com_list_txt">
                            <p>movielove</p>
                            <p>03-21</p>
                        </div>                        
                    </a></li>
                    <li><a href="bbsdetail.do?seq=5">
                        <p>프로필 사진 추천 좀 해주세요</p>
                        <div class="com_list_txt">
                            <p>yumyum</p>
                            <p>03-21</p>
                        </div>
                    </a></li>
                    <li><a href="bbsdetail.do?seq=6">
                        <p>연습실 여기 좋아요</p>                        
                        <div class="com_list_txt">
                            <p>practice</p>
                            <p>03-21</p>
                        </div>
                    </a></li>
                </ul>
            </div>
        </div>
    </div><!-- main_wrap -->

</body>
</html>