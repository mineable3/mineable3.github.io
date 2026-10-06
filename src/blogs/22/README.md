# Interesting Proof For The Sum of Powers of Two and Other Math Tricks

<!--
$sum_(k=0)^n 2^k$ equal to $2^(n+1) - 1$
-->

## Why is the sum of $\sum_{k = 0}^{n}2^{k}$ equal to $2^{n + 1} - 1$? 

First, you write the terms of the summation

$$
\sum_{k = 0}^{n}2^{k} = 2^{0} + 2^{1} + 2^{2} + \cdots + 2^{n}
$$

<!--
$
sum_(k=0)^n 2^k = 2^0 + 2^1 + 2^2 + dots + 2^n
$
-->

Then, you use a little trick and look at the summation in binary

```
            1  2^0
           10  2^1
          100  2^2
         1000  2^3
        10000  2^4
       100000  2^5
         ...
+  1000...000  2^n
---------------------
   1111...111
```

Notice what happens if you add $1$ to the sum.

```
  1111111111 // The sum up to 2^9
+          1
------------
 10000000000 = 2^10
```

All of the bits flip over and you are left with the next power of $2$. Now,
going back to the decimal number system you get

$$
1 + \sum_{k = 0}^{n}2^{k} = 2^{n+1}
$$

Which after subtracting $1$ from both sides, leaves us with our proof.

$$
\sum_{k = 0}^{n}2^{k} = 2^{n+1} - 1
$$

*What an odd number!*

## A trick for computing multiplication and division by two

We will follow a similar process as above and start in decimal.

Let's say you want to multiply $23$ by $10$. Our number system is in base ten,
which means that $23$ gets shifted over into the ten's place giving you $230$.

$$
23 * 10 = 230 
$$
$$
230 * 10 = 2300 
$$
$$
2300 * 10 = 23000 
$$
$$
23000 / 10 = 2300 
$$
$$
2300 / 10 = 230 
$$

Now let's say you want to multiply $23$ by $2$ resulting in $46$. Converting
this into binary leaves you with

```
    10111 // 23
x      10 // 2
-----------
   101110
```

and now $46 \times 2$

```
   101110 // 46
x      10 // 2
-----------
  1011100
```

Notice how multiplying by $2$ simply shifts the number over. This is just like
multiplying by ten. In fact, this works for any number.

To calculate a product:

1. Convert the first number into the base of second number.
2. Shift the first number to the left.
3. Convert back to base 10 to get the result.

To calculate a quotient:

1. Convert the first number into the base of second number.
2. Shift the first number to the right.
3. Convert back to base 10 to get the result.

### Here are a couple examples

```
7 x 46 = 322

   64 // 46
 x 10 // 7
-----------
  640 = 6*(7^2) + 4*(7^1) + 0*(7^0) = 322 in base 10
```

```
3 x 83 = 249

   10002 // 83
 x    10 // 3
-------------- 
  100020 = 1*(3^5) + 0 + 0 + 0 + 2*(3^1) + 0 = 249 in base 10
```

```
5 x 205 = 1025

   1310 // 205
 x   10 // 5
-------------
  13100 = 1*(5^4) + 3*(5^3) + 1*(5^1) + 0 + 0 = 1025 in base 10
```

You can do you own examples and change base easily with the `bc` utility (on
Linux).

```
echo "obase=2;21" | bc 
10101 # converting 21 into binary
```

or

```
echo "ibase=6;100" | bc
36 # converting 100 into base 10 from base 6
```



