#Miro Manestar | Intro to Discrete Mathematics | Mini Project #2

import sys
sys.setrecursionlimit(10000)

#Lists the first 20 terms of a(n)
def a():
	for i in range(1, 21):
		print("Term ", i, rec(i))

#Finds of the summation to 50 of a(n)
def b():
	sum = 0
	for i in range(1, 51):
		sum = sum + rec(i)
	print("Summation of a(n):", sum)

#Finds a(1000)
def c():
	print("a(1000) =", rec(1000))

#Finds x in x^2 + x^5 +x^8 + ... + x^47 = 2 where x < 1
def d():
	f = (x^2) - (x^50) + (2*x^3) - 2
	s = solve(f, x)
	print(s)

#Finds a(1) in a(n) = (n^2)a(n-1) + 2na(n-2) where a(0) = 1 and a(12) = 16!
def e():
	b = 1
	a = var('x')
	for i in range(2,13):
		temp = a
		a = (i**2)*a + (2*i*b)
		b = temp
	return solve([a == 20922789888000], x)

	

############## UTILITY FUNCTIONS ##############

#For the recurrence relation a(n) = na(n-1) + (n^2)a(n-2)
@cached_function
def rec(x):
	if x == 0 or x == 1:
		return 1
	else:
		return (x * rec(x-1)) + (x**2 * rec(x-2))

#For the recurrence relation a(n) = (n^2)a(n-1) + 2na(n-2)
@cached_function
def rec2(x):
	if x == 0:
		return 1
	if x == 1:
		return -10445411496362/12097765786571
	else:
		return (x**2 * rec2(x-1)) + (2 * x * rec2(x-2))

###### BRUTE FORCE - FUNCTIONS BELOW THIS LINE NOT USED ######

#Solves for x in x^2 + x^5 + x^8 + ... + x^47 = 2 where x < 1, t is the target value
def solveSumm(t):
	i = 1
	x = 0
	while summ(x) < t:
		x = x + (.1**i)
		print("x:", x)
		
		if summ(x) > t:
			x = x - (.1**i)
			i = i + 1

#Solves for x in x^2 + x^5 + x^8 + ... + x^47
def summ(x):
	sum = 0
	for i in range(2, 50, 3):
		sum = sum + x**i
	return sum