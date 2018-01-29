#coding:utf-8

import numpy as np
from scipy.optimize import curve_fit
import matplotlib.pyplot as plt

def logistic(x, x0, k):
	out = 1 / (1 + np.exp(-k*(x-x0)))
	return out

# distance of radius between base-circle and stimulation-circle (pixel)
x = np.array([0, 10, 20, 30, 40, 50, 60], dtype=np.uint64)
xlabel = "distance of radius between base-circle and stimulation-circle (pixel)"

# accuracy
y = np.array([0.00, 0.00, 0.25, 0.80, 1.00, 1.00, 1.00], dtype=np.float64)
ylabel = "mean accuracy"

# standard error of the mean
sem = np.array([0.0, 0.0, 0.099339927, 0.091766294, 0.0, 0.0, 0.0], dtype=np.float64)


title = "result of experiment: optical illusion"

xmin = -5
xmax = 65


# curve fitting
popt, pcov = curve_fit(logistic, x, y)
#print(popt)
#function  ="1 / (1 + exp(-%.2f*(x-%.2f)" %(popt[1], popt[0])
#print(function)
curve_x = np.linspace(0, 60, 60)
curve_y = logistic(curve_x, *popt)


search_x = np.linspace(0, 60, 500)
search_y = 0
target = 0
for i in search_x :
	temp = logistic(i, *popt)
	if np.abs(0.5-temp) < np.abs(0.5-search_y) :
		target = i
		search_y = temp
		if search_y == 0.5 :
			break
#print(target)


plt.figure()

plt.plot(x, y, marker="o", color="blue")

# drawing auxiliary line: y=0.5
plt.hlines([0.5], xmin, xmax, color="gray", linestyles='dashed', label="auxiliary line: "+r"($y=0.5$)")

# drawing fitted curve
plt.plot(curve_x, curve_y, color="red", label="fiiting curve by logistic: "+r"$g(x)$")

# drawing SEM
plt.errorbar(x[2:4], y[2:4], fmt="bo", yerr=sem[2:4], ecolor='blue', capsize=4, label="accuracy: mean&SEM")


# set titles
plt.xlabel(xlabel)
plt.ylabel(ylabel)
plt.title(title)

plt.xlim(xmin, xmax)

plt.text(45, 0.9, r"$g(x)=\frac{1}{1+\exp^{-k(x-x0)}}$")
plt.text(45, 0.8, "x0=%s, \nk=%s" %(popt[0], popt[1]), fontsize=8)

# drawing PSE (point of subjective equality)
plt.plot([target], [0.5], color="lime", marker="D", ms=8, label="Position of Subjective Equality")
plt.text(13, 0.55, "(%.1f, 0.5)" %target)

plt.legend(loc="lower right")

if 0 :
	plt.show()
else :
	figname = "rslt.png"
	plt.savefig(figname, dpi=300)
	print("saved figure: %s" %figname)

exit()
