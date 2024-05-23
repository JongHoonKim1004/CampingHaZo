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
- API : `Kakao API`, `DAUM 주소 검색 API`, `Kakao MAP API`
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
  |






 </div>
