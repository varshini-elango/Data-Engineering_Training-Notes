import numpy as np

#create a one-dimensional array
arr = np.array([1,2,3,4,5])
print("Array:" ,arr)

#reshape to a 2x3 array
reshaped_arr =np.arange(6).reshape(2,3)
print("Reshaped array:\n",reshaped_arr)

#element-wise addition
arr_add =  arr+10
print("added 10 to each element:",arr_add)

#element-wise multiplication
arr_mul =arr*2
print("multiplied each element by 2:", arr_mul)

#slicing arrays
sliced_arr= arr[1:4] #get elements from index 1 to 3
print("Sliced array:",sliced_arr)