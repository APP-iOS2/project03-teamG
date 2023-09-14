# Nike Shoes

<img src="https://github.com/APPSCHOOL3-iOS/project03-teamG/assets/101550733/03e43bdb-cb20-4017-9b00-240205300975" width="250">
<img src="https://github.com/APPSCHOOL3-iOS/project03-teamG/assets/101550733/31607296-7cb6-4d10-a8cc-101e571f10b4" width="250">

## 프로젝트 소개

- Nike Shoes: 나이키 신발을 편리하게 구매할 수 있는 앱
- Nike Shoes Admin: Nike Shoes의 제품, 주문, 프로모션 코드를 관리하는 앱

## 팀 소개

- PM: 최소정
- 구매팀: 김형준(팀장), 박찬호, 안지영, 여성은, 이승준_2, 전민석, 정설아
- 유저팀: 김성준(팀장), 김성훈, 김윤지, 박형환, 이희찬, 장수지

## 프로젝트 실행 방법

```
[Nike Shoes]
- GoogleService-Info.plist 파일 필요
- 회원가입 인증코드: 12345678

[Nike Shoes Admin]
- GoogleService-Info.plist 파일 필요
- 관리자 ID: test22
- 관리자 PW: test33
```

## 활용 기술

<img src="https://img.shields.io/badge/Xcode-188EE8?style=for-the-badge&logo=xcode&logoColor=white"><img src="https://img.shields.io/badge/SwiftUI-0070FD?style=for-the-badge&logo=swift&logoColor=black"><img src="https://img.shields.io/badge/Swift-F05138?style=for-the-badge&logo=swift&logoColor=white"><img src="https://img.shields.io/badge/Firebase-FFCC30?style=for-the-badge&logo=firebase&logoColor=black"><img src="https://img.shields.io/badge/GitHub-000000?style=for-the-badge&logo=github&logoColor=white"><img src="https://img.shields.io/badge/Notion-FFFFFF?style=for-the-badge&logo=Notion&logoColor=black"><img src="https://img.shields.io/badge/Figma-000000?style=for-the-badge&logo=figma&logoColor=white">

## 커밋 컨벤션

```
- feat: 새로운 기능을 추가
- fix: 버그 수정
- design: css 등 사용자 UI 디자인 변경
- style: 코드 포맷팅, 세미콜론 누락, 코드 변경이 없는 경우
- refactor: 프로덕션 코드 리팩토링
- comment: 필요한 주석 추가 및 변경
- docs: 문서 수정
- test: 테스트 코드, 리팩토링 테스트 코드 추가, Production Code 변경 없음
- chore: 빌드 업무 수정, 패키지 매니저 수정, 패키지 관리자 구성 등 업데이트, Production Code 변경 없음
- rename: 파일 혹은 폴더명을 수정하거나 옮기는 경우
- remove: 파일을 삭제하는 작업만 수행한 경우
```

## 프로젝트 구조


## 앱 기능

### 소비자 앱

0. 회원가입 및 온보딩
- 단계별 회원가입 과정
- 지역, 언어, 관심사, 신발 사이즈 선택

1. 홈
- 사용자 맞춤형 정보 제공
- 나이키 소식

2. 구매하기
- 검색 및 필터 기능
- 성별 및 연령 / 모델명 카테고리
- 앱 전용 제품, 베스트 아이템, 최근 본 제품, 관심 제품 표시
- 추천 매장 및 사용자 현재 위치

3. 위시리스트
- 사용자의 위시 제품 리스트
- 장바구니로 연결

4. 장바구니
- 사용자가 담은 제품 리스트 (상세 정보 포함)
- 프로모션 코드 적용
- 상품 금액/할인 금액/배송비/총 결제 금액 표시
- 주문하기로 연결

5. 주문하기
- 배송지 선택 및 추가
- 결제 수단 (무통장 입금)
- 총 결제 금액 표시

6. 프로필
- 프로필 수정
- 주문 내역
- 알림 수신함
- 멤버 리워드
- 팔로잉 관심사
- 설정

7. 설정
- 개인정보 수정
- 배송지 관리
- 지역/언어 설정
- 위치/알림 설정
- 나이키 매장/고객센터
- 계정 삭제
- 로그아웃

### 관리자 앱
- 관리자 로그인
- 상품 등록
- 상품 상세 페이지 수정
- 결제 관리 (무통장 입금 확인)
- 멤버 리워드 제공
- 앱 전용 제품 및 신제품 출시 알림 전송
