# Numpy Intro
---

* Numpy is a python library for creating and manipulating vectors and matrices.

* Make sure to import the module. You'll use it like an object to access the functions within the module:

```python
import numpy as np
```

* Use the ```array``` function to create an array or matrix. Use extra square brackets when making a matrix matrix, the number of them will depend on how many dimensions the matrix has.

```python
two_dimensional_array = np.array([[6, 5], [11, 7], [4, 8]])
```

* To populate with all zeroes or ones, use ```np.zeros``` or ```np.ones```. To populate with a sequence of integers from 'a' up to, but not including, 'b', use ```np.arange(a, b)```.

* There are various functions to populate matrices with random numbers. One of them is ```np.random.randint``` that generates numbers between low and high values. The highest possible number generated will be one less than the provided "high" value. This will populate a 6-element vector:

```python
random_integers_between_50_and_100 = np.random.randint(low=50, high=101, size=(6))
```

* Random floating-point numbers between 0.0 and 1.0 can be generated with ```np.random.random```.

```python
random_floats_between_0_and_1 = np.random.random([6])
```

* When performing operations with matrices, Numpy uses "broadcasting" to virtually expand the smaller operand to dimensions compatible for linear algebra. So, for example, adding 2.0 to every element of the previous vector:

``` python
random_floats_between_2_and_3 = random_floats_between_0_and_1 + 2.0
```

* Generate an array of floats within [a, b) using

``` python
(b-a) * np.random.random_sample([size]) + a
```





