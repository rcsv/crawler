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
Nim supports three different types of variables, `let`, `var`, and `const`. As with most things,
