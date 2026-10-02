# Interesting Proof For The Sum of Powers of Two

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


