#coding:utf-8

import numpy as np
from scipy.optimize import curve_fit
import matplotlib.pyplot as plt

def sigmoid(x, x0, k):
	out = 1 / (1 + np.exp(-k*(x-x0)))
	return out

# distance of radius between base-circle and stimulation-circle (pixel)
x = np.array([0, 10, 20, 30, 40, 50, 60], dtype=np.uint64)
xlabel = "distance of radius between base-circle and stimulation-circle (pixel)"

# accuracy
y = np.array([0.00, 0.00, 0.25, 0.80, 1.00, 1.00, 1.00], dtype=np.float64)
ylabel = "accuracy"

title = "result of experiment: optical illusion"

xmin = -5
xmax = 65


# curve fitting
popt, pcov = curve_fit(sigmoid, x, y)
#print(popt)
function  ="1 / (1 + exp(-%.2f*(x-%.2f)" %(popt[1], popt[0])
#print(function)
curve_x = np.linspace(0, 60, 60)
curve_y = sigmoid(curve_x, *popt)


search_x = np.linspace(0, 60, 1000)
search_y = 0
target = 0
for i in search_x :
	temp = sigmoid(i, *popt)
	if np.abs(0.5-temp) < np.abs(0.5-search_y) :
		target = i
		search_y = temp
		if search_y == 0.5 :
			break
#print(target)


plt.figure()

plt.plot(x, y, marker="o", color="blue", label="accuracy")

# drawing auxiliary line: y=0.5
plt.hlines([0.5], xmin, xmax, color="gray", linestyles='dashed', label="auxiliary line: "+r"($y=0.5$)")

# drawing fitted curve
plt.plot(curve_x, curve_y, color="red", label="fiiting curve by logistic: "+r"$g(x)$")

plt.xlabel(xlabel)
plt.ylabel(ylabel)

plt.legend(loc="lower right")

plt.xlim(xmin, xmax)

plt.title(title)

plt.text(45, 0.9, r"$g(x)=\frac{1}{1+\exp^{-k(x-x0)}}$")
plt.text(45, 0.8, "x0=%s, \nk=%s" %(popt[0], popt[1]), fontsize=8)

plt.text(13, 0.55, "(%.1f, 0.5)" %target)

if 0 :
	plt.show()
else :
	plt.savefig("rslt.png", dpi=300)
	print("saved figure: rslt.png")

exit()
