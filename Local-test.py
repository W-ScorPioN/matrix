import numpy as np
import time
import random
from hashlib import sha256

Size = 30
x = random.randint(1,Size)
y = random.randint(1,Size)
c1 = random.randint(1,Size/3)
r1 = random.randint(1,Size/3)
start = time.time()
A = np.random.randint(1,9,(Size,Size))
B = np.random.randint(1,9,(Size,Size))
#R1 = np.matrix(A)[2:]
#R2 = np.matrix(B)[:,2:]
res = np.dot(A,B)[x-1,y-1]
P1 = np.zeros((Size,Size))
for i in range (Size):
    for j in range(Size):
        if i == j :
            P1[i][j] = 1
P1 = np.array(P1)
P1 = P1.astype(np.int32)
P2 = P1[[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,0],:]
P3 = P1[[2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,0,1],:]
P1_1 = np.linalg.inv(P1)
P2_1= np.linalg.inv(P2)
P3_1= np.linalg.inv(P3)
P1_1 = P1_1.astype(np.int32)
P2_1 = P2_1.astype(np.int32)
P3_1 = P3_1.astype(np.int32)
X1 = np.dot(np.dot(P1,A),P2_1)
X2 = np.dot(np.dot(P2,B),P3)
X3 = np.dot(np.dot(P3_1,A),P2)
X4 = np.dot(np.dot(P2_1,B),P1_1)
C1 = np.dot(X1,X2)
C2 = np.dot(X3,X4)
Y1 = np.dot(np.dot(P1_1,C1),P3_1)
Y2 = np.dot(np.dot(P3,C2),P1)
str = str(x+y+c1+r1+res)
comm_P = '01234567891011121314151617181920212223242526272829123456789101111213141516171819202122232425262728290'
#print(R1)

#print(",".join(str(i) for i in P1 ))
print(P1)
print(P1_1)
print(P3)
print(P3_1)
print(X1)
print(X2)
print(X3)
print(X4)
print(C1)
print(C2)
print(str)
print(res)
print(x,y,c1,r1)
def generate_sha256_hashCode(plainText):
    plainTextBytes  = plainText.encode('utf-8')
    encryptor = sha256()
    encryptor.update(plainTextBytes)
    hashcode = encryptor.hexdigest()
    return(hashcode)
COMM = generate_sha256_hashCode(str)
COMM_P = generate_sha256_hashCode(comm_P)
print(COMM)
print(COMM_P)
end = time.time()
print('running time: %s Seconds'%(end-start))
with open('C:/Users/BLUE/Desktop/研一/学术相关/OABE/n=30.txt','ab') as f:
    np.savetxt(f,X1,delimiter=',',header="X1",fmt="%d")
    np.savetxt(f,X2,delimiter=',',header="X2",fmt="%d")
    np.savetxt(f,X3,delimiter=',',header="X3",fmt="%d")
    np.savetxt(f,X4,delimiter=',',header="X4",fmt="%d")
    np.savetxt(f,P1,delimiter=',',header="P1",fmt="%d")
    np.savetxt(f,P1_1,delimiter=',',header="P1_1",fmt="%d")
    np.savetxt(f,P3,delimiter=',',header="P3",fmt="%d")
    np.savetxt(f,P3_1,delimiter=',',header="P3_1",fmt="%d")
    np.savetxt(f,C1,delimiter=',',header="C1",fmt="%d")
    np.savetxt(f,C2,delimiter=',',header="C2",fmt="%d")

