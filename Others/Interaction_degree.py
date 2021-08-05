import os
import sys

dir = sys.argv[1]
out = sys.argv[2]


#dir='C:\\GRID-seq\\Interaction_with_lncRNA\\Raw\\'
#out="C:\\GRID-seq\\Figures_data\\Fig2\\Degree\\"

files=os.listdir(dir)
for i in range(len(files)):
	f=open(dir+files[i])
	g1=open(out+files[i]+'_RNA','w')
	g2=open(out+files[i]+'_DNA','w')
	data=f.readlines()
	hash_RNA={}
	hash_DNA={}
	for j in range(len(data)):
		data[j]=data[j].split('\t')
		RNA=data[j][0]
		DNA=data[j][1]
		if not RNA in hash_RNA:
			hash_RNA[RNA]=0
		hash_RNA[RNA]+=1
		if not DNA in hash_DNA:
			hash_DNA[DNA]=0
		hash_DNA[DNA]+=1
	for (k,v) in hash_RNA.items():
		g1.write(k+'\t%s\n'%v)
	g1.close()
	for (k,v) in hash_DNA.items():
		g2.write(k+'\t%s\n'%v)
	g2.close()
	