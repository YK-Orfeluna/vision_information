#coding:utf-8
import numpy as np
import matplotlib.pyplot as plt
from scipy.optimize import curve_fit

def sigmoid(x, x0, k):
     y = 1 / (1 + np.exp(-k*(x-x0)))
     return y

xdata = np.array([0, 10, 20, 30, 40, 50, 60])
ydata = np.array([0.00, 0.00, 0.25, 0.80, 1.00, 1.00, 1.00])

popt, pcov = curve_fit(sigmoid, xdata, ydata)
print(popt)

x = np.linspace(0, 60, 60)
y = sigmoid(x, *popt)

print(sigmoid(24.42855, *popt))

plt.plot(xdata, ydata, 'o', label='data')
plt.plot(x,y, label='fit')
plt.ylim(0, 1.05)
plt.legend(loc='best')
plt.show()