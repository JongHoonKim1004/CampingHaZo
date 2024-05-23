<h1 align="center"><img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTCZTZTvB-vLnxLnd_LZ8NoVuahm4Jbus2v36SAs0IPDQ&s" style="width=300; height: 300"></h1>
<h1 align="center">스프링 레거시 캠핑장 예약 프로젝트 - 5G캠핑</h1>
<br/><br/>

## 목차
 
  - [개요](https://github.com/JongHoonKim1004/CampingHaZo#-개요)

  - [팀원 소개](https://github.com/JongHoonKim1004/CampingHaZo#-개요)
  
  - [기술 스택](https://github.com/JongHoonKim1004/CampingHaZo#-기술-스택)
    
  - [프로젝트 설계](https://github.com/JongHoonKim1004/CampingHaZo#-프로젝트-설계)
    
  - [핵심 기능](https://github.com/JongHoonKim1004/CampingHaZo#-핵심-기능)
    
  - [주요기능 실행화면](https://github.com/JongHoonKim1004/CampingHaZo#-주요기능-실행화면)
    
  - [개선사항](https://github.com/JongHoonKim1004/CampingHaZo#-개선사항)

## 🚩 개요
- 프로젝트 목표 : 다양한 API 를 이용한 스프링 MVC를 이용한 캠핑장 예약 프로젝트
- 개발 기간 : 24/05/01 ~ 24/05/20

## 🙋‍♀️ 팀원 소개
- KIM JONGHOON <a href="https://github.com/JongHoonKim1004"><img src="https://img.shields.io/badge/GitHub-181717?style=plastic&logo=GitHub&logoColor=white"></a>
- LEE DONGHEE <a href="https://github.com/ehdgml123"><img src="https://img.shields.io/badge/GitHub-181717?style=plastic&logo=GitHub&logoColor=white"></a>

## 🔧 기술 스택
- API : `Kakao API`, `DAUM 주소 검색 API`, `Kakao MAP API`, `DateRangePicker`
- Language : `JAVA(11)`, `JavaScript(1.5)`
- Library & Framework : `Spring(5.2.7)`, `JUnit(4.12)`, `Spring Security(5.2.7)`
- Database : `Oracle(11g)`
- Target : `Web Browser`
- Tool : `Spring Tool Suite 3.9.18.RELEASE`
- ETC : `Git`

 ## 👾 프로젝트 설계, 구현 📂 PPT 📂 (ERD, USECASE)
 <details><summary>프로젝트 설계, 구현, PPT</summary>
  
 <div align="center">

  
  | ![1](https://github.com/JongHoonKim1004/CampingHaZo/assets/155927559/a4723a02-f244-42c1-8f1c-ca11d2aec38d) | ![2](https://github.com/JongHoonKim1004/CampingHaZo/assets/155927559/d41e94d3-0c91-4494-a4d4-bd5d47faeff1) |
  | :----------: | :----------: |
  | ![3](https://github.com/JongHoonKim1004/CampingHaZo/assets/155927559/99279afb-c8b1-4994-9c61-e958158ea8c9) | ![4](https://github.com/JongHoonKim1004/CampingHaZo/assets/155927559/9ac81bff-0cc0-49d5-8c76-6f7f9c6ef846) |
  | ![5](https://github.com/JongHoonKim1004/CampingHaZo/assets/155927559/58f94c82-bac4-4a64-abd4-4f0151a8aa3a) | ![6](https://github.com/JongHoonKim1004/CampingHaZo/assets/155927559/8a3eb19b-0dd9-4cd2-b4de-711b564b3dd3) |
  | ![7](https://github.com/JongHoonKim1004/CampingHaZo/assets/155927559/72574b08-64a4-4da5-bf0b-a6b1793d21ea) | ![8](https://github.com/JongHoonKim1004/CampingHaZo/assets/155927559/881d1521-2047-42b5-8e1e-69f1b0016444) |
  | ![9](https://github.com/JongHoonKim1004/CampingHaZo/assets/155927559/b207d113-7cdb-4822-925f-0929c2fc313f) | ![10](https://github.com/JongHoonKim1004/CampingHaZo/assets/155927559/9516338b-96fb-4b8f-9fdd-6b4be6a84771) |
  | ![11](https://github.com/JongHoonKim1004/CampingHaZo/assets/155927559/6ee5ac42-5e50-45b6-8107-8bc61149c3c6) | ![12](https://github.com/JongHoonKim1004/CampingHaZo/assets/155927559/23397a45-dee5-40fe-aaba-fdc83669535f) |
  | ![13](https://github.com/JongHoonKim1004/CampingHaZo/assets/155927559/167b78b9-e139-40eb-b69d-425fc2eb72a6) | ![14](https://github.com/JongHoonKim1004/CampingHaZo/assets/155927559/4e95dc2b-efb0-4b5b-95b3-6a25406cfe0e) |
  | ![15](https://github.com/JongHoonKim1004/CampingHaZo/assets/155927559/32c3e541-55c1-4ec8-8f51-596e9803972d) | ![16](https://github.com/JongHoonKim1004/CampingHaZo/assets/155927559/d21a8bc0-1625-4781-a8d4-96e74983a8ba) |
  | ![17](https://github.com/JongHoonKim1004/CampingHaZo/assets/155927559/f3015f06-e545-4120-9d27-2ea734f43570) | ![18](https://github.com/JongHoonKim1004/CampingHaZo/assets/155927559/4005ee2a-1c30-4293-bb34-61f47580ed1c) |
  | ![19](https://github.com/JongHoonKim1004/CampingHaZo/assets/155927559/29d3e244-005d-44bf-9a6f-1d32e0eb5940) | ![20](https://github.com/JongHoonKim1004/CampingHaZo/assets/155927559/f44fccfa-31ad-486e-b6d3-4edc4d79208e) |
  | ![21](https://github.com/JongHoonKim1004/CampingHaZo/assets/155927559/c96d7553-de5e-4e17-b989-2d80f5990c9e) | ![22](https://github.com/JongHoonKim1004/CampingHaZo/assets/155927559/c00611e2-1b47-4594-88e5-8007b0be1995) |
  | ![23](https://github.com/JongHoonKim1004/CampingHaZo/assets/155927559/7eb6ecad-ff87-4303-9627-13837e28f07e) | ![24](https://github.com/JongHoonKim1004/CampingHaZo/assets/155927559/79c2e284-5ad6-440b-a224-1b17c453aebc) |
  | ![25](https://github.com/JongHoonKim1004/CampingHaZo/assets/155927559/7d56ce56-230b-43f9-9c96-2cb127e71e5a) | ![26](https://github.com/JongHoonKim1004/CampingHaZo/assets/155927559/967d9ea5-8f8d-4778-af35-2c606588d19a) |
  | ![27](https://github.com/JongHoonKim1004/CampingHaZo/assets/155927559/7b81bde6-227e-46b6-9b64-cce858b5b6e8) | ![28](https://github.com/JongHoonKim1004/CampingHaZo/assets/155927559/7facceb5-2f6f-44e7-87fa-00ceb25ff2c7) |
  | ![29](https://github.com/JongHoonKim1004/CampingHaZo/assets/155927559/6b51492f-9249-4970-9f1d-3de4aca8ffe5) | ![30](https://github.com/JongHoonKim1004/CampingHaZo/assets/155927559/57bc38f5-30c4-4c1c-92a3-466338181d9f) |
  | ![31](https://github.com/JongHoonKim1004/CampingHaZo/assets/155927559/80d18575-8c50-49af-8da6-dc475beb5960) | ![32](https://github.com/JongHoonKim1004/CampingHaZo/assets/155927559/81e21321-9a48-40b0-b51a-0e006f7437f0) |
  | ![33](https://github.com/JongHoonKim1004/CampingHaZo/assets/155927559/433015e6-6120-432a-8bd1-ac2b302fb8b1) | ![34](https://github.com/JongHoonKim1004/CampingHaZo/assets/155927559/0355d207-e93e-4e27-9865-70a05cc6cdfe) |
  | ![35](https://github.com/JongHoonKim1004/CampingHaZo/assets/155927559/9b38d926-96e5-40ee-b230-1f21d965c500) | ![36](https://github.com/JongHoonKim1004/CampingHaZo/assets/155927559/11fcfb97-968b-4608-8e96-a67602df0233) |
  | ![37](https://github.com/JongHoonKim1004/CampingHaZo/assets/155927559/fefe6d32-d809-4542-b24c-fb81d3f284a9) | ![38](https://github.com/JongHoonKim1004/CampingHaZo/assets/155927559/7c07a6d6-e3d0-407e-a19d-ac69260b0c20) |
  | ![39](https://github.com/JongHoonKim1004/CampingHaZo/assets/155927559/9dd20067-54c9-4110-a6d9-b20158312928) | ![40](https://github.com/JongHoonKim1004/CampingHaZo/assets/155927559/f35c53ff-0ac9-4a33-89c3-6346423f0e79) |
  | ![41](https://github.com/JongHoonKim1004/CampingHaZo/assets/155927559/48111ae1-afce-4b8f-bcff-a4b086dffc24) | ![42](https://github.com/JongHoonKim1004/CampingHaZo/assets/155927559/52d1c43f-eb9a-4581-b6c0-bd700af42af4) |
  | ![43](https://github.com/JongHoonKim1004/CampingHaZo/assets/155927559/c6c0d6a2-b0d1-40cf-9a57-90ecab855310) | ![44](https://github.com/JongHoonKim1004/CampingHaZo/assets/155927559/ff8c476a-1994-421d-b2bd-a1569b1da9ed) |
  | ![45](https://github.com/JongHoonKim1004/CampingHaZo/assets/155927559/43e438fe-d93b-4a2d-8c7c-260d9464d30b) | ![46](https://github.com/JongHoonKim1004/CampingHaZo/assets/155927559/8e4af8b3-13dc-4322-a02f-b9e3be03ea91) |
  | ![47](https://github.com/JongHoonKim1004/CampingHaZo/assets/155927559/934bf2dd-d59f-4e78-9131-c1cc15b11206) | ![48](https://github.com/JongHoonKim1004/CampingHaZo/assets/155927559/57c6b08d-7c6b-4b7c-b710-1abaa8398a47) |
  | ![49](https://github.com/JongHoonKim1004/CampingHaZo/assets/155927559/e7ed736b-fd2c-4390-87d7-59caf5fb0d32) | ![50](https://github.com/JongHoonKim1004/CampingHaZo/assets/155927559/1d9f6c00-798a-465e-9a2f-a58ee7080b34) |
  | ![51](https://github.com/JongHoonKim1004/CampingHaZo/assets/155927559/6701a061-c0b9-4560-aad6-bea441c6419f) | ![52](https://github.com/JongHoonKim1004/CampingHaZo/assets/155927559/51faf18a-b586-4a1a-bed9-27dc861b5da3) |
  | ![53](https://github.com/JongHoonKim1004/CampingHaZo/assets/155927559/f9cbf104-3f5f-43cd-9ae5-47d4ea4135b5) | ![54](https://github.com/JongHoonKim1004/CampingHaZo/assets/155927559/f49ab2e7-21fa-449a-ab34-411d82078e88) |
  | ![55](https://github.com/JongHoonKim1004/CampingHaZo/assets/155927559/9a277607-2b6d-4f65-81d6-e83a2b737dc1) | ![56](https://github.com/JongHoonKim1004/CampingHaZo/assets/155927559/28fa330c-a783-4a2b-bdbf-7d76650ce393) |
  | ![57](https://github.com/JongHoonKim1004/CampingHaZo/assets/155927559/9277bafc-aaa9-4edf-8ad3-65ec712d934f) | |

 </div>
</details>

 ## 💻 핵심 기능

 #### 캠핑장 예약
 - 캠핑장 리스트와 함께 Kakao Map API로 호출된 지도에 마커 표시
 - 지도를 이동하면 지도 중심에서 20km 안에 있는 캠핑장 목록을 재호출
 - 캠핑장 선택 후 인원과 날짜를 선택하면 서버에서 예약 확인 후 예약 가능 여부 출력

#### 일반회원
- 소셜 로그인(카카오)
- 이메일 중복확인
- 비밀번호 암호화 처리
- DAUM 주소 검색 API를 통한 주소 검색
- 마이페이지
- 아이디, 비밀번호 찾기
- 리뷰 작성

#### 사업자
- 회원정보 변경
- 캠핑장 등록
- 등록한 캠핑장의 예약 확인

#### 관리자
- 새 사업자 등록
- 공지사항 작성
- 일반회원, 사업자 관리


## 🎇 주요기능 실행화면
<details>
 <summary>주요기능 실행장면</summary>

* **메인 페이지**
  
 * **로그인, 회원가입**
  * 메인 페이지 우측 상단의 `로그인`을 클릭하면 로그인 창이 나타난다.
  * `로그인` 옆의 `회원가입`을 클릭하면 회원가입 창이 나타난다. `중복 확인`을 클릭하면 아이디 중복 확인, `우편번호 찾기`를 클릭하면 DAUM 주소 찾기 API를 통한 주소 검색 페이지가 팝업창으로 나타난다.
    
  ![KakaoTalk_20240523_151436657](https://github.com/JongHoonKim1004/CampingHaZo/assets/155927559/1f8abb3e-5c8a-42bf-8fe0-f04f063590a0)


 * **소셜 로그인**
  * `로그인` 을 통해 나온 로그인 창에서 `카카오 로그인`을 클릭하여 카카오 계정을 통해 로그인 할 수 있다

  ![소셜 로그인](https://github.com/JongHoonKim1004/CampingHaZo/assets/155927559/e131833e-d172-467c-a7f8-0c858013d57d)

 * **캠핑장 검색**
  * 메인 페이지의 `전체`를 클릭하면 지도와 함께 캠핑장 목록이 호출된다. 또한, 지도에 목록이 있는 캠핑장의 위치가 마커로 표시된다
  * 지도를 움직하면 지도의 중심에서 20km 내의 캠핑장을 재호출하고, 마커로 새롭게 호출된다

  ![KakaoTalk_20240523_151428912](https://github.com/JongHoonKim1004/CampingHaZo/assets/155927559/de76a22f-d268-4814-8cb3-c13f6a0d8c5a)


 * **캠핑장 예약**
  * 캠핑장 목록에서 `예약`을 누르면 예약 페이지로 이동한다
  * `예약 날짜`를 클릭하면 DateRangePicker를 통해 달력을 불러온다
  * 시작일과 종료일을 정하면 서버에서 해당 기간에 예약이 존재하는지 확인 후 결과를 알려준다
 
  ![캠핑장 예약 (2)](https://github.com/JongHoonKim1004/CampingHaZo/assets/155927559/cd2740c4-97e1-49a0-96cf-d4765ad045a1)

 * **마이페이지 - 포인트 이력**
  * 일반회원으로 로그인 후 `마이페이지` -> 좌측 사이드바에서 `포인트`를 클릭하면 현재 포인트와 포인트 이력을 확인할 수 있다

  ![포인트 이력](https://github.com/JongHoonKim1004/CampingHaZo/assets/155927559/21a56917-12d5-42a8-9e98-76f0cd9c691c)

 * **리뷰**
  * 우측 상단의 `공지사항`을 통해 공지사항 페이지로 이동 후, 말풍선 아이콘을 클릭하여 리뷰 게시판으로 이동할 수 있다
  * 리뷰는 본인이 올린 글 외에는 수정, 삭제가 불가능하다

  ![리뷰작성](https://github.com/JongHoonKim1004/CampingHaZo/assets/155927559/f70a83e5-1fd5-47d2-a996-bffcbd8ed764)

 * **1:1 문의**
  *  1:1 문의 페이지는 헤더 우측의 `고객센터` 혹은 공지사항, 리뷰 게시판에서 좌측 편지 아이콘을 클릭하여 이동할 수 있다
  *  일반회원만 이 페이지에 접근할 수 있다

  ![1대1문의](https://github.com/JongHoonKim1004/CampingHaZo/assets/155927559/0eb1e10e-6e10-4e26-86ac-b591638db241)

* **사업자 페이지**
  
 * **사업자 로그인**
  * 사업자 로그인은 메인 페이지 하단의 `사업자 로그인` 을 통해 접근할 수 있다

  ![사업자 로그인](https://github.com/JongHoonKim1004/CampingHaZo/assets/155927559/d62dcebc-d25d-47fb-8162-954c3033f745)

 * **캠핑장 등록**
  * 사업자 페이지의 `캠핑장 등록` 을 통해서 새 캠핑장을 등록할 수 있다

  ![캠핑장 등록](https://github.com/JongHoonKim1004/CampingHaZo/assets/155927559/7798a1f5-0628-4369-a2ed-d514437bae88)


 
</details>
