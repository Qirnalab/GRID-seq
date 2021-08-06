import sys
Input=sys.argv[1]
Output_dir=sys.argv[2]

Linker='GACACAGCTCACTCCCACACACCGAACTCCAAC'
Linker_rc='GTTGGAGTTCGGTGTGTGGGAGTGAGCTGTGTC'

f=open(Input)
g1=open(Output_dir+'_RLD.txt','w')
g2=open(Output_dir+'_DLR.txt','w')
data=f.read()
data=data.split('>')
for i in range(1,len(data)):
	if data[i].find(Linker) != -1:
		g1.write('>'+data[i])
	if data[i].find(Linker_rc) != -1:
		g2.write('>'+data[i])

g1.close()
g2.close()


