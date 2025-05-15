## 2025.5.15

- Add Wrapper types
  - type Fn
    ```dart
    final add = Fn.a2((Number a, Number b) => a + b);
    final result = add.call(Number(1), Number(2)); // 3
    ```
  - type Any
    ```dart
    Number add(Any a, Any b) => switch ((a.number, b.number)) {
      (Number a, Number b) => a + b,
      _ => Number(0),
    };
    ```
  - type Object
    ```dart
    final obj = Object();
    obj['key'] = String('value');
    ```
  - type Array
  - type Boolean
  - type Number
  - type String
  - type Promise

## 2025.5.8

- Initial version.
