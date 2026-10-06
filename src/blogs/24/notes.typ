#set math.vec(delim: "[")

= Back Error Propogation

TODO: create an actual diagram instead of this thing
``` 
    w0        w4
 (0) ---- (2) ---- (4)
 w1 \    / w5\    /
     ----     ----     
 w2 /    \ w6/    \   
 (1) ---- (3) ---- (5)
    w3        w7 
```

For some given input, the network should produce the output:

$
vec(t_0, t_1)
$

Let E be the error function for the network. It there for must be dependent
on the output of the network and the target values. In this case, we use mean
squared error (MSE).

$
E = E(vec(a_4, a_5), vec(t_0, t_1)) \
E = 1/2 * [(t_0 - a_4)^2 + (t_1 - a_5)^2]
$

To calculate the value of any given node:

$
"output of node" k = f(sum_(i=0)^n w_i a_i)
$

where $f$ is the sigmoid activation function

$
f(x) = 1 / (1 + e^-k) \
f'(x) = f(x) (1 - f(x))
$

Now we know how to do a forward pass i.e. how to calculate the output of the
network for some given input. Currently, the network will produce a useless
random output. We want to train the network to by adjusting the weights of the
network.

How much to change any given node $k$:

$
Delta w_k = mu delta_k a_i
$

#grid(columns: 2, gutter: 0.5em,
    [$Delta w_k$],  [change in the weight $k$],
    [$mu$],  [learning rate (a constant/hyper parameter)],
    [$delta_k$],  [the ending node's error],
    [$a_i$], [the incoming node's output],
)

== How did we come up with this formula?

To figure out how much a give node contributes to the network's error.

$
delta_k = (partial E) / (partial S_k) = (partial E) / (partial a_k) dot
    (partial a_k) / (partial S_k)
$

For any node in the output layer $k in {4, 5}$:

$
(partial E) / (partial a_k) = partial / (partial a_k) (1/2 * [(t_0 - a_4)^2 + (t_1 - a_5)^2])\ 
$

eg) Let $k=4$
$
(partial E) / (partial a_4) = 1/2 * 2 (t_0 - a_4) dot (-1) = #rect[$ t_0 - a_4 $]
$

and the second part of the equation

$
(partial a_k) / (partial S_k) = partial / (partial S_k) ( f(S_k)) = #rect[$ f'(S_k) $]
$

Substituting both parts back in

$
delta_k = (partial E) / (partial a_k) dot (partial a_k) / (partial S_k)
= #rect[$ (a_k - t_(k + 4)) f'(S_k) $]
$

$
Delta w_k = (partial E) / (partial w_k) =  underbrace((partial E) / (partial a_k) dot
    (partial a_k) / (partial S_k), delta_k) dot (partial S_k) / (partial w_k)
$

We just solved for $delta_k$, but we still need to find $(partial S_k) / (partial w_k)$.

$
(partial S_k) / (partial w_k) = partial / (partial w_k) (sum_(i=0)^n w_i a_i) \
= partial / (partial w_k) (w_1 a_1 + w_2 a_2 +
... + w_n a_n) \
= partial / (partial w_k) (w_1 a_1) + partial / (partial w_k) (w_2 a_2) + ... + partial / (partial w_k) (w_n a_n) \
= 0 + 0 + ... + partial / (partial w_k) (w_k a_k) + ... + 0 = a_k \
#rect[$ (partial S_k) / (partial w_k) = a_k $]
$

$
Delta w_k = (partial E) / (partial w_k) = (partial E) / (partial a_k) dot
    (partial a_k) / (partial S_k) dot (partial S_k) / (partial w_k) \
Delta w_k = (t_(k_1) - a_(k_1)) (f'(S_(k_1))) (a_(k_2))
$


