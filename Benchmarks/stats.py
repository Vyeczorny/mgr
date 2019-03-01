import sys

if len(sys.argv) < 2:
    print 'Needs argument'
    exit(1)

fileName = sys.argv[1]
diffs = map(
    lambda line: (line[1] / line[2], line[2] / line[1]),
    map(
        lambda line: map(float, line.split('\t')),
        open(fileName, "r").read().split('\n')
    )
)

swiftDiffs = map(lambda tuple: tuple[0], diffs)
objCDiffs = map(lambda tuple: tuple[1], diffs)

avg = [
    sum(swiftDiffs) / len(swiftDiffs),
    sum(objCDiffs) / len(objCDiffs)
]

print diffs
print 'Swift: ', "{:.2f}".format(avg[0] * 100), '%'
print 'Obj-C: ', "{:.2f}".format(avg[1] * 100), '%'