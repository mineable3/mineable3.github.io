# Is it cheaper to leave the AC/heat on all night?

Heating a house or cooling it with air conditioning (AC) can get expensive. The
fundamental idea is to create a temperature gradient between your house and the
outside. If you are familiar with cell biology, you know that maintaining
gradients takes a lot of energy.

> This blog post talks about AC because AC is a luxury. Heating, on the other
> hand, is necessary to survival. Just remember that the following arguments
> are interchangeable between AC and heating after swapping a negative sign.

There are two common approaches to how to cool a home:

1. Keep the AC on 24/7 so that the AC never has to cool the house by more than
   1 degree.
2. Turn the AC off at night so you don't spend energy cooling a house with
   everyone asleep.

These two approaches target different trade offs. Keeping the AC on all the time
means that the system only needs to establish the temperature gradient once and
spends the rest of the time maintaining a gradient. Turning the AC off at night
means that the system needs to create a temperature gradient every morning, but
only has to maintain it for half of the day.

To compare the two strategies, let's represent the energy required to cool the
house as a function of the current temperature.

Let $E(t)$ be the energy to decrease the temperature of the house by 1 degree
at temperature $t$. Let $t_(base)$ be the equilibrium temperature with the
surrounding environment and $t_(target)$ be the desired temperature. Where
$t_(base) > t_(target)$.

Assuming the temperature of the house increases by 1 degree an hour until it
reaches equilibrium, the fundamental question is: Is $24*E(t_(target) + 1) <
16*E(t_(target) + 1) + sum(i = t_(base) -> t_(target), E(i))$

> Assuming the temperature of the house increases at a rate of 1 degree per
> hour is a broad assumption because the heating rate would be heavily impacted
> by the time of day, how much shade the house gets and where the shade is in
> relation to the sun.

To answer this question, we need to know the function $E(t)$. This function is
dependent on a number of factors like the size of the house, the efficiency of
the AC unit, or even the 

## Assuming Linearity

The simplest case 


