import random
import matplotlib.pyplot as plt

# Algorithm to predict the price of house of 50 acres using Linear regression model

def hypothesis(th0, th1, x):
    hx = th0 + th1 * (x)
    return hx


def costfunction(m, hx, h_price):
    t_cost = 0
    for i in range(0, m):
        curcost = (hx[i] - h_price[i]) ** 2
        t_cost = t_cost + curcost

    return (1 / (2 * m)) * t_cost


def gradientdes(th0, th1, m, hx, h_area, h_price, alpha):
    one = 0
    two = 0
    for i in range(m):
        one = one + (hx[i] - h_price[i])
    # print("one = ",one)
    for i in range(m):
        two = two + ((hx[i] - h_price[i]) * h_area[i])
        # print(two)
    temp0 = (th0 - (alpha * ((1 / m) * one)))
    temp1 = (th1 - (alpha * ((1 / m) * two)))
    th0 = temp0
    th1 = temp1
    # print(th0,"--", th1)
    return th0, th1


# MAIN
# alpha = 0.004255 #for small data
alpha = 0.0001  # For large data

h_area = [10, 20, 30, 40, 50, 60, 70, 80, 90, 100]  # Feature x
h_price = [10, 20, 30, 40, 50, 60, 70, 80, 90, 100]  # Predict y

m = len(h_area)
# print(m)
th0 = random.random()
# print(th0)
th1 = random.random()
# print(th1)

converge = 0
oricost = 100000000000

itr = 0;

for a in range(1000):
    hx = []
    itr += 1
    # Hypothesis mapping
    for x in h_area:
        rethx = hypothesis(th0, th1, x)
        hx.append(rethx)


    # Calculating cost
    retcst = costfunction(m, hx, h_price)

    if (retcst == oricost):
        break

    if (retcst > oricost):
        break

    if (retcst < oricost):
        oricost = retcst
        th0, th1 = gradientdes(th0, th1, m, hx, h_area, h_price, alpha)
        # Calculate hypo with new th0 and th1 (LOOP)

# After convergence achieved predict val
u_inp = int(input("Enter the house area "))
ret = hypothesis(th0, th1, u_inp)
print("Predicted cost is = ", ret, "\n\n")

plt.plot(h_area,h_price, label="Housing data") #label use given below.
plt.plot(h_area, hx, label="prediction")  # label use given below.

#Adding title and labels
plt.plot()

plt.xlabel('x-axis')
plt.ylabel('y-axis')
plt.legend()

plt.title('Housing data')
plt.show()