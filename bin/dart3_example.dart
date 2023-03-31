/// 목차
/// 1. 다중 값 리턴
/// 2. 위젯 속성 제어 컨트롤. 가독성 향상?
/// 3. json 파싱할때 여러값을 한번에 가져오기
/// 4. switch - case 문의 기능 향상
/// 5. Class 종류 추가
///    a. base class - 상속 혹은 구현을 허용하지 않는 클래스
///    b. final class - 현재 Library 외부에서 상속, 구현, mixin 을 허용하지 않는 클래스
///    c. sealed class - 상속 또는 구현 클래스들의 계층에 제한을 둘 수 있는 클래스


void main() {
  // 1
  multiValueReturn();

  // 2
  /*
  /// 기존
  ListTile(
  leading ; const Icon(Icons.weekend),
  title : const Text('Welcome'),
  enabled : hasNextStep,
  subtitle : hasNextStep ? const Text('Tap to Advance.') : null,
  onTap : hasNextStep ? () { advance(); } : null,
  trailing : hasNextStep() ? null : const Icon(Icons.stop)
)

  //변경 후
  ListTile(
  leading : const Icon(Icons.weekend),
  title : const Text('Welcome'),
  enabled : hasNextStep,

  if (hasNextStep) ...(
    subtitle : const Text('Tap to Advance.') ,
    onTap : () { advance(); },
  ) else ...(
    trailing : const Icon(Icons.stop)
  )
)
   */

  //3
  /*
Json 에서 다중 파싱하기
var json = {'user' : ['Lily', 13]};

var name = json['user']![0];
var age = json['user']![1];
원래는 이런식으로 받겠죠 ?
 */

  var json = {
    'user': ['Lily', 13]
  };
  var {'user': [name, age]} = json;

  print(name);
  print(age);

  //4
  switchCase1();
  switchCase2();

}

/**
 * Swtich - case 문을 return
 */
bool switchCase1() {
  bool b = false;

  return switch(b){
    true => true,
    false => false
  };
}

/**
 * Switch - case 문에 내부 비교기능
 */
bool switchCase2(){
  final a = 1;
  final b = 2;

  String c = 'Flutter';

  bool result;

  switch(c){
    case 'Flutter' when a ==1 : result = true; break; // 조건절 when
    case '플러터' when b ==1 && a <0 : result = false; break;
    case '여러개' || '플루터' || '헬로': result = true; break; // case 여러개 묶기
    default: result = true;
  }

  return result;
}

/// 다중값 리턴
void multiValueReturn() {
  // 다중 값 리턴 받기
  final (a, b) = _multiValueReturnFunction();

  print(a);
  print(b);

  final multiValue = _multiValueReturnFunction();

  print(multiValue.$1);
  print(multiValue.$2);
}

(int, int) _multiValueReturnFunction() {
  return (3, 4);
}


sealed class Shape {}

class Square implements Shape {}

class Circle implements Shape {}
