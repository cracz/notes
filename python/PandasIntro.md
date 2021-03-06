# Pandas Intro
---

* Pandas is a library used for creating, manipulating, and analyzing data frames.

* Remember to load the libraries.

``` python
import numpy as np
import pandas as pd
```

* Creating a 5x2 data frame with columns "temperature" and "activity":

``` python
# Create and populate a 5x2 NumPy array.
my_data = np.array([[0, 3], [10, 7], [20, 9], [30, 14], [40, 15]])

# Create a Python list that holds the names of the two columns.
my_column_names = ['temperature', 'activity']

# Create a DataFrame.
my_dataframe = pd.DataFrame(data=my_data, columns=my_column_names)
```

* You can add a new column just by assigning values to a new column name.

``` python
my_dataframe["adjusted"] = my_dataframe["activity"] + 2
```

* Pandas provide multiples ways to isolate specific rows, columns, slices or cells in a DataFrame:

``` python
print("Rows #0, #1, and #2:")
print(my_dataframe.head(3), '\n')

print("Row #2:")
print(my_dataframe.iloc[[2]], '\n')

print("Rows #1, #2, and #3:")
print(my_dataframe[1:4], '\n')

print("Column 'temperature':")
print(my_dataframe['temperature'])
```

* Access cell from column 'x' and row number y:

``` python
data.iloc[y]['x']
```

* Addition of rows is done row-by-row and produces an array of the same length.

* Pandas has two ways to duplicate a data frame:
	* __Referencing__: If you assign a DataFrame to a new variable, any change to the DataFrame or to the new variable will be reflected in the other. 
	* __Copying__: If you call the ```pd.DataFrame.copy``` method, you create a true independent copy. Changes to the original DataFrame or to the copy will not be reflected in the other.

 
