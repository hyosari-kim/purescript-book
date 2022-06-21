# Functions and Records
## Kind
값은 값의 타입에 따라 구분되듯이 타입은 타입의 종류(kind)에 따라 구분된다. 잘못된 타입의 값은 타입에러를 반환하듯이 잘못된 종류(kind) 타입은 종류에러를 반환하다.

Type이라 불리는 특별한 kind가 존재한다. 이 종류는 `Number`, `String` 같은 값들을 갖는 모든 타입을 나타낸다.

타입 생성자를 위한 kind 도 존재한다. 예를 들어 `Type->Type` kind 는 타입에서 타입으로 가는 함수를 나타낸다. 마치 `List` 와 같다.

```purescript
> import Data.List
> Nil :: List
In a type-annotated expression x :: t, the type t must have kind Type
```
이것은 kind 에러이다. List 생성자 `::`  는 head, tail 에  `Type`  kind 를 가져야 하나 List 의 kind 는 `Type->Type` 임으로 에러가 반환되었다.

## Point Free form
함수를 인자 레퍼런스 없이 표현하는 것.

## Infix Function Application
대부분의 함수는 prefix 함수입니다. 즉, 함수이름을 인자 이전에 사용합니다. 
그러나 여기서는 infix binary operators 를 살펴볼 것입니다. `==`  연산자와 같이 두 인자사이에 연산자가 위치합니다. 이러한 infix 연산자는 퓨어스크립트에서 prefix 구현의 인픽스 얼라이어스로 정의됩니다. 예를 들어 `==` 는 prefix `eq` 함수의 인픽스 얼라이어스로 정의됩니다.
```
infix 4 eq as ==
```
prefix function 을 백틱으로 감싸줌으로 infix function 으로 사용가능.
prefix function 을 infix operator alias 로 지정 가능
```
infixr 5 insertEntry as ++

- precedence 는 5
- right associative가 적용됨을 뜻하는 infixr
```

## 질문
1. :type show 는 
```
forall (a :: Type). Show a => a -> String
```
인데.. => 의 의미를 모르겠다.

2. <> 는 뭐죠?
    string concat
3. <<< 는 뭐죠?
    function composition operator
