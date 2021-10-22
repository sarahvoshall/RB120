**Fake Operators**

What operators are actually methods? 

| Method | Operator                                                     | Description                                                  |
| :----- | :----------------------------------------------------------- | :----------------------------------------------------------- |
| no     | `.`, `::`                                                    | Method/constant resolution operators                         |
| yes    | `[]`, `[]=`                                                  | Collection element getter and setter.                        |
| yes    | `**`                                                         | Exponential operator                                         |
| yes    | `!`, `~`, `+`, `-`                                           | Not, complement, unary plus and minus (method names for the last two are +@ and -@) |
| yes    | `*`, `/`, `%`                                                | Multiply, divide, and modulo                                 |
| yes    | `+`, `-`                                                     | Plus, minus                                                  |
| yes    | `>>`, `<<`                                                   | Right and left shift                                         |
| yes    | `&`                                                          | Bitwise "and"                                                |
| yes    | `^`, `|`                                                     | Bitwise exclusive "or" and regular "or" (inclusive "or")     |
| yes    | `<=`, `<`, `>`, `>=`                                         | Less than/equal to, less than, greater than, greater than/equal to |
| yes    | `<=>`, `==`, `===`, `!=`, `=~`, `!~`                         | Equality and pattern matching (`!=` and `!~` cannot be directly defined) |
| no     | `&&`                                                         | Logical "and"                                                |
| no     | `||`                                                         | Logical "or"                                                 |
| no     | `..`, `...`                                                  | Inclusive range, exclusive range                             |
| no     | `? :`                                                        | Ternary if-then-else                                         |
| no     | `=`, `%=`, `/=`, `-=`, `+=`, `|=`, `&=`, `>>=`, `<<=`, `*=`, `&&=`, `||=`, `**=`, `{` | Assignment (and shortcuts) and block delimiter               |

Any of the above that are actually methods can be redefined by any class, this can end up producing unexpected consequences. 