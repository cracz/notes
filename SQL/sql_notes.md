# SQL - sqlzoo.net

---

All statements should end in a semicolon ;.

Find some possible standard functions [here](https://sqlzoo.net/wiki/FUNCTIONS).

www.tutorialspoint.com/sql/

Data types: https://www.tutorialspoint.com/sql/sql-data-types.htm

### SELECT, FROM, GROUP BY

* A SELECT statement gets data from a table (dataset). Specify the columns you want on the select line, and use FROM to specify the table you're accessing (in that order).

```SQL
SELECT column1, column2 FROM tableName;
```

* Use WHERE to select only rows that satisfy a condition.

```SQL
SELECT name, population FROM world
	WHERE name IN ('Sweden', 'Norway', 'Denmark');
```

* GROUP BY columnName is used to combine rows with identical data in the column called columnName.

* The following query shows the total salary when there are some rows that have the same name but different salary values:

```SQL
SELECT name, SUM(salary) FROM customers
	GROUP BY name;
```


# SQL - MODE (mode.com)

---

### WILDCARDS

* `%` stands for any character or string of characters.
* Underscore `_` stands for just one character.

### AS

* Change how a column's name appears with AS. Use double quotes if a name has a space in it.

```SQL
SELECT west AS "West Region"
  FROM tutorial.us_housing_units
```

### LIMIT

* Restrict the number of rows that are returned. Use this to inspect the first few rows and the names of the fields/columns.

```SQL
SELECT *
  FROM tutorial.us_housing_units
 LIMIT 100
```

### WHERE

* Filter the table to only list rows that match a condition. Maintain the `SELECT -> FROM -> WHERE` order!
* With a column named `month` in the dataset below:

```SQL
SELECT * FROM tutorial.us_housing_units
 WHERE month = 1
```

* You can use comparison operators for numerical and non-numerical data `=, != or <>, <, >, >=, <=`. Non-numerical values need to be put in single quotes like `'January'`.
* If you have non-numerical data with the operators `<, >, >=, or <=` you can filter things alphabetically, in a way. `WHERE month_name > 'J'` will return all rows where the month_name starts with the letters 'J' or later in the alphabet. 'January' would be included since 'Ja' comes after 'J'. 
* You can use arithmetic operators as well with `+, -, *, /`.
* You can make new columns (called **derived columns**) that are the result of arithmetic operations across columns. These operations will only be done between values on the **same row** in those columns. Use aggregate functions if you need multiple rows in the operations.

```SQL
SELECT year,
       month,
       west,
       south,
       (west + south)/2 AS south_west_avg
  FROM tutorial.us_housing_units
```

### Logical Operators

* `LIKE` allows you to match similar values, instead of exact values. Case-sensitive!
	* Use with wildcards such as `WHERE "group_name" LIKE 'Snoop%'`.
	* `ILIKE` is **not** case-sensitive.
* `IN` allows you to specify a list of values you'd like to include.
* `BETWEEN` allows you to select only rows within a certain range.
* `IS NULL` allows you to select rows that contain no data in a given column.
* `AND` allows you to select only rows that satisfy two conditions.
* `OR` allows you to select rows that satisfy either of two conditions.
* `NOT` allows you to select rows that do not match a certain condition.

# LeetCode

### Common Table Expressions (CTEs)

Source/Example: Leetcode problem "Game Play Analysis IV"

