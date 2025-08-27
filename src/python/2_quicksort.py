import sys
q=lambda a:q([x for x in a[1:]if x<=a[0]])+[a[0]]+q([x for x in a[1:]if x>a[0]])if a else[]
print(q(list(map(float,sys.argv[1:]))))
