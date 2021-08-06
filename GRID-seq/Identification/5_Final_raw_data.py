import os
import sys

dir1=sys.argv[1]
output=sys.argv[2]

files=os.listdir(dir1)

for i in range(len(files)):
	if files[i].find('DNA')!=-1:
		file1=files[i]
		file2=files[i].replace('DNA','RNA')
		f1=open(dir1+file1)
		f2=open(dir1+file2)
		g1=open(output+file1,'w')
		g2=open(output+file2,'w')

		data1=f1.readlines()
		data2=f2.readlines()

		for i in range(len(data1)):
			if data1[i][0] != '>':
				if len(data1[i]) > 15 and len(data2[i]) >15:
					g1.write(data1[i-1]+data1[i])
					g2.write(data2[i-1]+data2[i])

