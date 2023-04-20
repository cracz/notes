# SQL - sqlzoo.net

---

All statements should end in a semicolon ;.

Find some possible standard functions [here](https://sqlzoo.net/wiki/FUNCTIONS).

www.tutorialspoint.com/sql/

Data types: https://www.tutorialspoint.com/sql/sql-data-types.htm

### SELECT

* A SELECT statement gets data from a table (dataset). Specify the columns you want on the select line, and use FROM to specify the table you're accessing.

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

