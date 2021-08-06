import os
import sys
from Bio.Seq import Seq
dir=sys.argv[1]
output_dir=sys.argv[2]
files=os.listdir(dir)

for i in range(len(files)):
	if files[i].find('RLD') != -1:
		file1=files[i]
		file2=files[i].replace('RLD','DLR')
		Linker1='GACACAGCTCACTCCCACACACCGAACTCCAAC'
		Linker2='GTTGGAGTTCGGTGTGTGGGAGTGAGCTGTGTC'
		f1=open(dir+file1)
		f2=open(dir+file2)
		g1=open(output_dir+files[i][0:-8]+'_RNA.txt','w')
		g2=open(output_dir+files[i][0:-8]+'_DNA.txt','w')
		data=f1.readlines()
		m=0
		for i in range(len(data)):
		        data[i]=data[i].replace('\n','')
		        linker_loc=data[i].find(Linker1)
		        if linker_loc>12:
        		        m+=1
                		g1.write('>%s\n'%m)
                		g1.write(data[i][0:linker_loc-12]+'\n')
                		g2.write('>%s\n'%m)
                		g2.write(data[i][linker_loc+33:]+'\n')
		data=f2.readlines()
		m=0
		for i in range(len(data)):
        		data[i]=data[i].replace('\n','')
        		linker_loc=data[i].find(Linker2)
        		if linker_loc>12:
        		        m+=1
        		        g2.write('>%s\n'%m)
        		        g2.write(data[i][0:linker_loc]+'\n')
        		        g1.write('>%s\n'%m)
                		g1.write(str(Seq(data[i][linker_loc+45:]).reverse_complement())+'\n')
				#g1.write(data[i][linker_loc+45:]+'\n')

