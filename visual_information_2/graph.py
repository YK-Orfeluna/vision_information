#coding:utf-8

import numpy as np
import matplotlib.pyplot as plt

# distance of radius between base-circle and stimulate-circle (pixel)
x = np.array([0, 10, 20, 30, 40, 50, 60], dtype=np.uint64)
xlabel = "distance of radius between base-circle and stimulate-circle (pixel)"

# accuracy
y = np.array([0.00, 0.00, 0.25, 0.80, 1.00, 1.00, 1.00], dtype=np.float64)
ylabel = "accuracy"

title = "result of experiment: optical illusion"

xmin = -5
xmax = 65

plt.figure()

plt.plot(x, y, marker="o", color="blue", label="accuracy")

# drawing auxiliary line: y=0.5
plt.hlines([0.5], xmin, xmax, "red", linestyles='dashed', label="auxiliary line (y=0.5)")

plt.xlabel(xlabel)
plt.ylabel(ylabel)

plt.legend(loc="upper left")

plt.xlim(xmin, xmax)

plt.title(title)

if 0 :
	plt.show()
else :
	plt.savefig("rslt.png", dpi=300)
	print("saved figure: rslt.png")

exit()
