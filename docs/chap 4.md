# 재귀, 맵 그리고 폴드

## 목표
- 알고리즘을 구현하는데 사용되는 재귀 함수들을 알아보자
	재귀는 함수형프로그래밍에서 가장 기본적인 테크닉.
- 퓨어스크립트 기본 라이브러리에서 제공하는 기본 함수들을 다뤄 볼 것.
	`map` `fold` `filter` `concatMap`  함수들을 알아보자.

### Tip
- `repl` 을 실행하는 디레토리에서 `.purs_repl`  파일에서  repl 실행시 자동으로 import 할 모듈을 설정 가능.
	```PureScript
	import Prelude
	import Data.Maybe 
	import Data.Array
	import Data.String
	import Data.Foldable
	```

## 재귀 소개
- 재귀를 이용하면 뮤터블한 상태를 줄일 수 있다.
- 재귀는 분할 정복법(*devide and conquer*)과 연관되어 있다.(ex. 팩토리얼, 피보나치)

## 배열에서 재귀
- 재귀를 이용하여 배열의 길이를 구하는 함수
- `for` 을 사용했다면 가변변수(뮤터블상태)를 업데이트하는 로직이 들어갔을 것이다.
```PureScript
import Prelude

import Data.Array (null, tail)
import Data.Maybe (fromMaybe)

length :: forall a. Array a -> Int
length arr =
  if null arr then
	0
  else
	1 + (length $ fromMaybe [] $ tail arr)
```

### Tip. 빈 어레이를 repl 에서 사용할 때
- 빈 어레이 `[]` 를 repl 에 직접 입력하면 에러가 뜬다. 빈 어레이 라도 타입을 지정해주면 에러가 뜨지 않는다.
```PureScript
-- repl
fromMaybe [] $ Nothing 

-- 예상은 [] 그러나 에러가 발생
-- 에러내용
  No type class instance was found for
					 
	Data.Show.Show t2
					 
  The instance head contains unknown type variables. Consider adding a type annotation.

-- 빈 어레이에 미리 타입을 지정
:paste
	empty :: Array Int
	empty = []
	
	fromMaybe [] $ Nothing

-- reple 결과
[]
```

## 맵(Maps)
- `map` 함수는 배열에 대한 재귀함수이다. 배열의 요소를 함수에 적용하여 그 값을 바꿔버린다.
- 즉, 배열의 "콘텐츠(content)"는 바꾸지만 "형태(shape)" 는 유지시킨다.

> 나중에 type class 를 배울 때 `map` 함수는 타입 컨스트럭터의 클래스(fuctor)를 변환하는 형태 보전 함수의 일반적인 패턴의 예라는 것을 배울 겁니다.
- `map` 첫번째 인수는 배열에 "맵핑" 되어야 하는 함수이고, 두번째 인수는 배열.

## 중위 연산자(Infix Operators)
- `map` 함수는 백틱으로 감싸면 맵핑하는 함수와 배열 사이에 위치할 수 있다.
```PureScript
(\n -> n + 1) `map` [1,2,3,4,5]
```
- 요런 문법을 *infix function application* 이라고 한다.
- 주로 2개의 인자를 받는 함수에 적용하는 것이 적절하다.
- `map` 과 동치인 중위연산자 `<$>` 
```PureScript
(\n -> n + 1) <$> [1,2,3,4,5]
```
- 중위 함수는 함수의 alias 이다.
	- Data.Array 모듈에서 중위 연산자 `(..)`  는 `range` 함수와 동의어이다.
- 중위 연산자 정의 할때는 우선순위와 결합방향(`infixl`, `infixr`)을 정할 수 있다.
- `infix`  는 우선순위가 같은 연산자에서 반드시 괄호를 사용해주어야 한다.
	
*중위 연산자는 도메인 언어를 정의하는데 좋은  도구이지만 너무 남용하면 익숙하지 않은 사람에게는 가독성이 떨어질 수 있다. 그러므로 새로운 연산자를 정의할 때는 주의하는 것이 좋다*

## 배열 필터링(Filter Arrays)
- `filter`  함수는 기존 배열에서 함수를 참으로 하는 요소들을 가진 새로운 배열을 만든다.

## 배열 병합(Flattening Arrays)
- `concat`  함수는 배열의 배열을 하나의 배열로 병합시킨다.
- `concatMap` 함수는 `concat`  함수와 `map` 함수 기능을 합친 형태

## 배열 표현식(Array Comperhensions)
  -

## Do 표기법(Do Notation)
WIP


### Tip. [자주 만나는 repl 에러](https://jordanmartinez.github.io/purescript-jordans-reference-site/content/01-Getting-Started/05-The-REPL.html#possible-outputted-repl-errors)
- `No Type class instance was found for Data.Show.Show [Type]"`
	- repl 에서 expression 을 `String` 으로 표현할 수 없을 때 발생한다.
	- 함수를 출력하려고 하거나 Nothing, 빈 어레이를 출력하려고 할 때 발생.
	- 해결방법은 `Show`  타입 클래스 인스턴스를 정의하라고 하는데... 아님 그냥 무시하기
	
	
## 질문
- 두 모듈을 import 하고 length 사용하면 컨플릭 뜨는데. 보통 어떻게 쓰나요.? 
```PureScript
import Data.Array 
import Data.List 
```
- 함수 합성 하기
```PureScript
{-
	Error 가 나는 이유? 

	Could not match type  
  
	Maybe  
	  
	with type  
	  
	t0 t1
-}
(Maybe.map isEven $ (head arr)) >>> fromMaybe false 
```
- Infix operator precedence 와 assosiativity 는 repl 에서 어떻게 확인할 수 있나요?



