
echo "What's your name?"
var name: string = readLine(stdin)

echo "Hi, ", name, "!"

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

#[
import httpclient, re

const url = "https://ja.wikipedia.org/wiki/特別:新着ファイル"

var client = newHttpClient()
var response = client.get(url)
var elements = response.body.findAll(re"<img(.*?)>")

for element in elements:
  var range = element.findBounds(re"""src=\"(.*?)\"""")
  #[

  ]#

  var attr = element[range.first..range.last]
  var image = attr[5..^2]
  if image[0..7] == "//upload":
    image = "https:" & image
    var splited = image.split(re"/")
    var fileName = splited[high(splited)]
    client.downloadFile(image, fileName)
]#
