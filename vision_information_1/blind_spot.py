#coding:utf-8

import numpy as np
import cv2

def mouse_event(event, x, y, flags, param) :
	global radius
	if event == cv2.EVENT_LBUTTONDOWN :
		radius += 1
		print("radius = %d" %radius)
	elif event == cv2.EVENT_RBUTTONDOWN :
		if radius > 0 :
			radius -= 1
			print("radius = %d" %radius)

radius = 50
circle_x = 450
circle_y = 300

waitTime = int(np.round(1.0 / 30 * 1000, 0))

windowname = "dst"
cv2.namedWindow(windowname)

img = np.zeros([600, 600, 3], dtype=np.uint8)
img.fill(255)

cv2.line(img, (150, 250), (150, 350), (0, 0, 0), 1, cv2.LINE_AA)
cv2.line(img, (100, 300), (200, 300), (0, 0, 0), 1, cv2.LINE_AA)

cv2.setMouseCallback(windowname, mouse_event)

while True :
	dst = img.copy()
	cv2.circle(dst, (circle_x, circle_y), radius, (0, 0, 255), -1, cv2.LINE_AA)
	cv2.imshow(windowname, dst)

	key = cv2.waitKey(waitTime)
	if key == 27 or key == 113:
		break
	elif key == 63232 :
		circle_y -= 1
		print("y-axis = %d" %circle_y)
	elif key == 63233 :
		circle_y += 1
		print("y-axis = %d" %circle_y)
	elif key == 63234 :
		circle_x -= 1
		print("x-axis = %d" %circle_x)
	elif key == 63235 :
		circle_x += 1
		print("x-axis = %d" %circle_x)
	elif key == 13 :
		radius = 50
		circle_x = 450
		circle_y = 300
	#elif key != -1 :
	#	print(key)


cv2.destroyWindow(windowname)
exit("done")
