# <a name="top"></a>Python Basics
## Contents
* [Syntax](#syntax)
* [Numbers](#numbers)
* [Strings](#strings)
* [Operators](#operators)
* [Collections](#collections)
* [Lambda Functions](#lambda)
* [Classes](#classes)
* [Iterators](#iterators)
* [Modules](#modules)
* [JSON](#json)
* [RegEx](#regex)
* [Try/Except](#try)

## <a name="syntax"></a> Syntax
* Blocks of code are defined by indentation, not braces.
* No semicolon is required at the end of each line.
* **Variables** are created when they are assigned, and you don't have to specify the type.

```python
x = 3 
name = "Jimmy"
```

* Variables can even change type if you give them a different value later.
* Addition operator `+` can be used for strings or numbers.
* Multiple variables can be set in the same line. They can also be set to the same value.

```python
x, y, z = "Orange", "Banana", "Cherry"

print(x) #Orange
print(y) #Banana
print(z) #Cherry

x = y = z = "Orange"
print(x) #Orange
print(y) #Orange
print(z) #Orange
```

* **Comments** are specified by `#`.
* There are no real multi-line comments, but you can use multi-line strings with triple quotes and python will ignore it.

```python
"""
This is a multi-
line comment.
(kind of)
"""
```

### If-else statements

* Don't put conditionals in parenthesis.
* Use a colon after the condition. `if a < b: ...`
* Block of code in each statement must be indented if multiple lines must be used.
* Use the keyword `elif` and then use `else` as the default action.
* Short-hand if/else: `print("A") if a > b else print("B")`.
* Use the logical operators `and` and `or`.

### For loops

* To loop a specified number of times, use `range()`. By default `range(n)` returns a set of numbers from 0 to n (not including n) incrementing by 1.
* To specify the starting value and final value: `range(n0, nf)`
* To specify starting value, final value, and increment value: `range(n0, nf, incr)`
* `else` can execute at the end of a for loop

```python
for x in range(6):
  print(x)
else:
  print("Finally finished!")
```

### Functions

* Use `def` to define, and use a colon after the paramters
* Use indentation
* Parameters can have default values
* Functions can call themselves (recursive)
* Defining lambda functions: `lambda arguments : expression`

### Misc
* Get the length of objects with `len(object)`.
* Delete objects with `del object`.

[Back to top](#top)

## <a name="numbers"></a> Numbers
* There are 3 types: int, float, and complex.
* Use the `type()` function to verify types (e.g. `print(type(variable))`)
* **int** is any integer of unlimited length.
* **float** is any number with decimals or scientific numbers with an 'e' to specify the powers of 10 (e.g. `x = 3e3`)
* **complex** numbers use `j` for the imaginary part.
* **Type conversion** and **casting** can be done using the `int()`, `float()`, and `complex()` methods, but you can not convert a complex number to any other type. Casting includes the `str()` function as well.

```python
x = int(3.0)    #x = 3 (cast specifically as an int)
y = float(x)    #y = 3.0
z = complex(x)  #z = 3 + 0j
```
* To get random numbers, you must use the `random` module; there is no random function.

```python
import random

print(random.randrange(1,10))
```

[Back to top](#top)

## <a name="strings"></a> Strings
* Strings are arrays of strings of length 1 (no char types).
* Use `[]` to access elements.
* **Substring** starting from 'a' and ending (but not including 'b'): `var[a:b]`.
* **Remove whitespace** from begging and end: `var.strip()`.
* **Length** returned by `len(var)`.
* **Case** can be changed using `var.upper()` and `var.lower()`.
* **Replace** all instances of 'target' string with 'replacement': `var.replace(target, replacement)`
* **Split** the string at location of 'separator': `var.split(separator)`
* Use `format()` to place numbers in strings since `+` doesn't work with strings and numbers together. Use `{}` at the location you want the numbers and the arguments to `format()` will be placed there in that order. For a different order, you can specify the location of the n-th number using `{n}`.

```python
age = 24
text = "My age is {}"
print(text.format(age))

#or using a different order

x = 5
y = 20
z = 77
text = "Third number: {2}, first: {0}, second: {1}"
print(text.format(x, y, z))
```

[Back to top](#top)

## <a name="operators"></a> Operators (less obvious ones)
**Arithmetic**

Operator | Name | Example | Description
:--------|:----:|:-------:|:----------:
% | Modulus | x % y | Gives the remainder after the division x / y (e.g. 5 mod 2 gives a remainder of 1)
** | Exponentiation | x ** y | Gives x^y
// | Floor division | x // y | Truncates decimals if positive, rounds down away from zero if negative


**Logical** operators to combine conditional statements

Operator | Example | Description
:--------|:-------:|:----------:
and | x < 5 and x < 10 | True if both are true
or | x < 5 or x < 10 | True if one is true
not | not(x < 5 and x < 10) | Reverse the result


**Identity**

Operator | Example | Description
:--------|:-------:|:----------:
is | x is y | True if both are the same object (same memory allocation, not same content)
is not | x is not y | True if both are not the same object (same memory allocation, not same content)


**Membership**

Operator | Example | Description
:--------|:-------:|:----------:
in | x in y | True if a sequence with the specified value is present in the object
not in | x not in y | True if a sequence with the specified value is not present in the object


**Bitwise**

Operator | Name | Example | Description
:--------|:----:|:-------:|:----------:
<< | Zero Fill Left Shift | x << y | Returns x with the bits shifted to the left by y places (and new bits on the right-hand-side are zeros). This is the same as multiplying x by 2\*\*y.
\>> | Signed Right Shift | x >> y | Returns x with the bits shifted to the right by y places. This is the same as dividing x by 2\*\*y.
& | AND | x & y | Each bit of the output is 1 if the corresponding bit of x AND of y is 1, otherwise it's 0.
\| | OR | x \| y | Each bit of the output is 0 if the corresponding bit of x AND of y is 0, otherwise it's 1.
~ | NOT (Complement) | ~ x | Returns the complement of x - the number you get by switching each 1 for a 0 and each 0 for a 1. This is the same as -x - 1.
^ | XOR (Exclusive Or) | x ^ y | Each bit of the output is the same as the corresponding bit in x if that bit in y is 0, and it's the complement of the bit in x if that bit in y is 1.

[Back to top](#top)

## <a name="collections"></a> Collections (Arrays)
* **List**: ordered, changeable, allows duplicate members
* **Tuple**:	ordered, unchangeable, allows duplicate members
* **Set**: unordered, unindexed, no duplicate members
* **Dictionary**: unordered, changeable, and indexed, no duplicate members

### Lists

* Can be defined with `[]` or the `list()` constructor (using double parenthesis):

```python
mylist = ["apple", "banana", "cherry"]
#OR
mylist = list(("apple", "banana", "cherry"))
```

* Access elements with `[]`
* Number of elements given by `len()`
* Use `del mylist` or `del mylist[n]` to delete the list entirely or remove the nth entry from the list, respectively.
* Methods:

Method | Description
:------|:-----------
append() | Adds an element at the end
clear() | Removes all elements
copy() | Returns a copy of the list
count() | Returns the number of elements with the specified value
extend() | Add the elements of a list (or any iterable), to the end of the current list
index() | Returns the index of the first element with the specified value
insert() | Adds an element at the specified position
pop() | Removes the element at the specified position (last element by default)
remove() | Removes the item with the specified value
reverse() | Reverses the order of the list
sort() | Sorts the list. With arguments: sort(reverse=True\|False, key=myFunc) The function should return a value defined for each element for the sorting criteria (element, length, etc).

### Tuples

* Can be defined with `()` or the `tuple()` constructor (double parenthesis):

```python
mytuple = ("apple", "banana", "cherry")
#OR
mytuple = tuple(("apple", "banana", "cherry"))
```

* Access elements with `[]`
* **Unchangeable**
* Number of elements given by `len()`
* Methods:

Method | Description
:------|:-----------
count() | Returns the number of elements with the specified value
index() | Returns the index of the first element with the specified value

[Back to top](#top)

### Sets

* Can be defined with **curly braces** `{}` or the `set()` constructor (double parenthesis)

```python
myset = {"apple", "banana", "cherry"}
#OR
myset = tuple(("apple", "banana", "cherry"))
```

* **Unindexed**, so you can't access specific elements. You can still loop through the elements or check if something is `in` the set.
* Elements can't be changed, but you can **add** new ones with the `add()` method.
* Add multiple elements at the same time with `update()`:

```python
myset = {"apple", "banana", "cherry"}
myset.update(["orange", "mango", "grapes"])
```

* You can get rid of elements with `remove()` or `discard()`, but `remove()` will throw an error if the element does not exist in the set.
* `pop()` works with sets, but since they're unordered you won't know which one got removed. Doesn't seem useful at the moment.
* Methods:

Method | Description
:------|:-----------
add() | Adds an element to the set
clear() | Clears the set
copy() | Copies the set
difference() | Returns a set of the difference between two sets
difference\_update() | Removes the items in this set that are also included in another, specified set
discard() | Removes an item from the set (no error if item didn't exist)
remove() | Removes an item from the set (error if item didn't exist)
intersection() | Returns a set of the intersection between two sets
intersection\_update() | Removes the items in this set that are not present in other, specified set(s)
isdisjoint() | Returns whether two sets have an intersection (disjoint = no elements in common)
issubset() | Returns whether another set contains this set
issuperset() | Returns whether this set contains another set
pop() | Removes last element (random)
symmetric\_difference() | Returns a set with the symmetric differences of two sets
symmetric\_difference\_update() |  inserts the symmetric differences from this set and another
union() | Return a set containing the union of sets
update() | Update the set with the union of this set and others

### Dictionaries

* Similar to a map, these consist of **keys** and **values**
* Can be defined with curly braces `{}` or the `dict()` constructor, but both are quite different:

```python
mydict = {
"brand": "Ford",
"model": "Mustang",
"year": 1964
}
#OR
mydict = dict(brand="Ford", model="Mustang", year=1964)
```

* Access elements with `[key]` or `get(key)`
* Change elements with `mydict[key] = ...`
* Add elements by just defining a new key `mydict["newkey"] = "new value"`
* Can loop through keys, values, or even both using `items()`:

```python
for x, y in mydict.items():
	print(x, y)
```

* Methods:

Method | Description
:------|:-----------
clear() | Clears the dictionary
copy() | Copies the dictionary
fromkeys() | Returns a dictionary with the specified keys and values
get() | Returns the value of the specified key
items() | Returns a list containing tuples of each key/value pair
keys() | Returns a list containing the keys
pop() | Removes the element with the specified key
popitem() | Removes the last added key/value pair
setdefault() | Returns the value of the specified key; if the key does not exist: insert the key, with the specified value
update() | Updates the dictionary with the specified key/value pairs
values() | Returns a list of all the values

[Back to top](#top)

## <a name="lambda"></a> Lambda Functions

* These are small anonymous functions that take an unlimited number of arguments and perform **one** operation.
* Defined with `lamda arguments : operation`

```python
x = lambda a : a * 10    #x is a function now with one argument "a"
print(x(5))
```

* These are most useful as an anonymous function inside another function:

```python
def myfunc(n):
  return lambda a : a * n

mydoubler = myfunc(2)  #n=2 and mydoubler's argument is 'a'
mytripler = myfunc(3)  #n=3 and mydoubler's argument is 'a'

print(mydoubler(11))   #22
print(mytripler(11))   #33
```

[Back to top](#top)

## <a name="classes"></a> Classes

* Use `class` and a colon to define a class.

```python
class MyClass:
	x = 3
	
object = MyClass()
print(object.x)
```

* The `__init__()` function is a member of all classes and is called when they are initiated. Use it to set the values of members in the class.
* `__init__()` is like the constructor of the class in that parameters used when the class is initiated are passed to `__init__()`:

```python
class Person:
	def __init__(self, name, age):
		self.name = name
		self.age = age

person = Person("Jimmy", 11)
```

### Self
* The first parameter of every function in the class must be some variable that is used as a reference to the class itself. This is usually just called `self`.
* This is used to access variables that belong to that class.

### Inheritance

* A child class that inherits from a parent class is created with the parent class in parenthesis:

```python
class Person:
	...
	
class child(Person):
	pass
```

* You can use the `pass` keyword when you don't want to add anything new to your child class.
* The `__init__()` of the child class overrides that of the parent class, so if you want the parent's `__init__()`, call it from the child's. You can still set members of the child class as well.

```python
class child(Person):
	def __init__(self, name, age, height):
		Person.__init__(self, name, age)
		self.height = 4
```

* Any functions with the same name as one in the parent class will be overridden.

[Back to top](#top)

## <a name="iterators"></a> Iterators

* An iterator is an object that contains a countable number of values and can be iterated upon (gone through one-by-one).
* In python, this is an object which implements the iterator protocol consisting of `__iter__()` and `__next__()`.
* All four collection types, and strings, are iterable containers that you can get an iterator from (using `iter()`) and iterate through (using `next()`).

```python
mytuple = ("apple", "banana", "cherry")
myit = iter(mytuple)

print(next(myit))
print(next(myit))
print(next(myit))
```

* You can make your own iterable objects with a class that defines the functions `__iter__()` and `__next__()`, but these both must always `return self`.
* Use the `StopIteration` statement to prevent an iterator from going forever.

```python
class MyNumbers:
  def __iter__(self):
  	self.a = 1
  	return self

  def __next__(self):    #Stop after 20 iterations
  	if self.a <= 20:
   		x = self.a
		self.a += 1
		return x
    	else:
      		raise StopIteration


myclass = MyNumbers()
myiter = iter(myclass)

print(next(myiter))
```

[Back to top](#top)

## <a name="modules"></a>Modules

* Any files saved with `.py` can be treated as modules.
* You can `import` modules and give them an alias using `as` and then access members using the alias.

```python
import mymodule as mod

mod.memberFunction()
```

* `dir()` is a function that will print all member names in a module that is passed to it.
* You can import only a specific object of the module using `from module import [object]`, but you don't have to use `module.object` to access it in this case.

[Back to top](#top)

## <a name="json"></a> JSON

* JSON is a syntax for storing and exchanging data
* JSON is text, written with JavaScript object notation.
* Python has a built-in `json` module for handling JSON data.
* Parse JSON strings with `json.loads()` and turn them into python dictionaries.
* Convert python objects into JSON strings with `json.dumps()`. Use the `indent` or `sort_keys` parameters to make it easier to read: `json.dumps(object, indent=4, sort_keys=true)`

[Back to top](#top)


## <a name="regex"></a> RegEx

* A RegEx, or Regular Expression, is a sequence of characters that forms a search pattern.
* The RegEx module is called `re`.

```python
import re

txt = "The rain in Spain"
x = re.search("^The.*Spain$", txt)
```

* The `search()` method returns `None` if there are no matches, or a `Match` object which has the properties:
 * `.span()` -- Returns a tuple of the start and end of the match
 * `.string` -- Returns the original string that was searched
 * `.group()` -- Returns the part of the string where there was a match

* RegEx methods:

Method | Description
:------|:-----------
findall() | Returns a list containing all matches
search() | Returns a Match object if there is a match anywhere in the string
split() | Returns a list where the string has been split at each match
sub() | Replaces matches with a string

* Metacharacters:

Character | Description | Example
:---------|:------------|--------
[ ] | A set of characters | "[a-m]"
\ | Signals a special sequence | "\d"
. | Any character except newline | "he..o"
^ | Starts with | "^hello"
\$ | Ends with | "world\$"
* | Zero or more occurances of the previous character | "aix*"
+ | One or more occurances of the previous character | "aix+"
{} | Exactly the specified number of occurances of the previous character | "al{2}"
\| | Either or | "falls|stays"
() | Capture and group | 

* Special sequences:

Character | Description | Example
:---------|:------------|--------
\A | Returns a match if the specified characters are at the beginning of the string | "\AThe"
\b | Returns a match where the specified characters are at the beginning or at the end of a word | r"\bain" r"ain\b"
\B | Returns a match where the specified characters are present, but NOT at the beginning (or at the end) of a word | r"\Bain" r"ain\B"
\d | Returns a match where the string contains digits (numbers from 0-9) | "\d"
\D | Returns a match where the string DOES NOT contain digits | "\D"
\s | Returns a match where the string contains a white space character | "\s"
\S | Returns a match where the string DOES NOT contain a white space character | "\S"
\w | Returns a match where the string contains any word characters (characters from a to Z, digits from 0-9, and the underscore _ character) | "\w"
\W | Returns a match where the string DOES NOT contain any word characters | "\W"
\Z | Returns a match if the specified characters are at the end of the string | "Spain/Z"


* A **set** is a set of characters inside a pair of square brackets [] with a special meaning:

Set | Description
:---|:-----------
[arn] | Returns a match where one of the specified characters a, r, or n are present (Works for +, *, ., \|, ( ), $, { }) (Works for digits, use [0-5][0-9] for two digit numbers, etc.)
[a-n] | Returns a match for any lower case character, alphabetically between a and n (Works for digits too)
[^arn] | Returns a match for any character EXCEPT a, r, and n
[a-zA-Z] | Returns a match for any character alphabetically between a and z, lower case OR upper case


[Back to top](#top)


## <a name="try"></a> Try/Except

* Similar to java, `try` blocks let you test code and catch errors with an `except` block. The `finally` block lets you run code regardless of the result. You can use `else` as well with the same purpose as `finally`.

```python
try:
  print(x)
except NameError:                    #Catch specific type of error
  print("Variable x is not defined")
except:                              #Catch a general error
  print("Something else went wrong")
```

```python
try:
  f = open("demofile.txt")
  f.write("Lorum Ipsum")
except:
  print("Something went wrong when writing to the file")
finally:
  f.close() 
```

[Back to top](#top)
