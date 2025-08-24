import sys,random
n=int(sys.argv[1])
print(4*sum(random.random()**2+random.random()**2<1 for _ in range(n))/n)
