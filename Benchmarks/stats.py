import sys

if len(sys.argv) < 2:
    print 'Needs argument'
    exit(1)

if len(sys.argv) >= 3:
    swiftIndex = int(sys.argv[2])
else:
    swiftIndex = 1

if len(sys.argv) >= 4:
    objCIndex = int(sys.argv[3])
else:
    objCIndex = 2

fileName = sys.argv[1]
diffs = map(
    lambda line: (line[swiftIndex] / line[objCIndex ]),
    map(
        lambda line: map(float, line.split('\t')),
        open(fileName, "r").read().split('\n')
    )
)

# swiftDiffs = map(lambda tuple: tuple[0], diffs)
# objCDiffs = map(lambda tuple: tuple[1], diffs)

# avg = [
    # sum(swiftDiffs) / len(swiftDiffs),
    # sum(objCDiffs) / len(objCDiffs)
# ]

avg = sum(diffs) / len(diffs)
result = avg * 100 - 100

print [i * 100 for i in diffs]
# print 'Swift: ', "{:.2f}".format(avg[0] * 100), '%'
# print 'Obj-C: ', "{:.2f}".format(avg[1] * 100), '%'
print 'Swift to Obj-C: ', "{:.2f}".format(result), '%'