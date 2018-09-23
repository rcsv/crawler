# Nim Example
## Hello World
The code for a simple hello world program is as follows:
```nim
echo "Hello World"
```
Save this text as helloworld.nim. To compile and execute the program, the following command should be run

```nim
$ nim c -r --verbose:0 helloworld.nim
Hello World
```

The command has several elements:

* `c` is an alias for `compile`, which compiles the Nim sources into C and then imvokes the C compiler on them
* `-r` is an alias for `--run`, which runs the program
* `--verbosity:0` makes the compiler only output essential messages, since by default it also outputs some debugging messages. From now on, we assume that `--verbosity:0` is set
* `./helloworld.nim` is the path to the source you want to compile

## Variables
Nim supports three different types of variables, `let`, `var`, and `const`. As with most things, multiple variables can be declaredin the same section.

```nim
proc getAlphabet(): string =
  var accm = ""
  for letter in 'a'..'z': # see iterators
    accm.add(letter)
  return accm

# Computed at compilation time
const alphabet = getAlphabet()

# Mutable Variable
var
  a = "foo"
  b = 0
  # Works fine, initialized to 0
  c: int

# Immutable Variables
let
  d = "foo"
  e = 5
  # Compile-time error, must be initialized
  # f: float
# Works fine, 'a' is Mutable
a.add("bar")
b += 1
c = 3

#[ Compile-time error, const cannot be modified at run-time
alphabet = "abc"
]#

#[ Compile-time error, 'd' and 'e' are Immutable
d.add("bar")
e += 1]#
```

```sh
$ nim c --verbosity:2 ./variables.nim
variables.nim(22, 2) Error: 'let' symbol requires on initialization
  f:float
```
Without `--verbosity:2` only the error will be shown without the position cursor.

### Const
A `const` variable's value will be evaluated at compile-time, so if you inspect the C sources, you'll see the following line:

```nim
STRING_LITERAL(TMP129, "abcdefghijklmnopqrstuvwxyz", 26)
```

The only limitation with const is that compile-time evaluation cannot interface with C because there is no compile-time foreign function interface at this time.
