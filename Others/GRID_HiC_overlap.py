import sys

HiC_dir=sys.argv[1]
GRID_dir=sys.argv[2]
Result_dir=sys.argv[3]


def overlap(Start1,End1,Start2,End2):
	return max(Start1,Start2) <= min(End1,End2)

f=open(HiC_dir)
HiC=f.readlines()
for i in range(len(HiC)):
	HiC[i]=HiC[i].split('\t')
	HiC[i][1]=int(HiC[i][1])
	HiC[i][2]=int(HiC[i][2])
	HiC[i][4]=int(HiC[i][4])
	HiC[i][5]=int(HiC[i][5])

f=open(GRID_dir)
g=open(Result_dir,'w')
GRID=f.readlines()
Count=0
Total=0
for i in range(len(GRID)):
	GRID[i]=GRID[i].split('\t')
	if GRID[i][0] != GRID[i][6] and GRID[i][1] == GRID[i][7]:
		RNA_Chr=GRID[i][1]
		RNA_Start=int(GRID[i][2])
		RNA_End=int(GRID[i][3])
		DNA_Chr=GRID[i][7]
		DNA_Start=int(GRID[i][8])
		DNA_End=int(GRID[i][9])
		distance=min(abs(RNA_Start-DNA_End),abs(RNA_End-DNA_Start))
		if distance > 1000 :#and distance < 25000:
			Total+=1
			for j in range(len(HiC)):
	#			HiC[j]=HiC[j].split('\t')
				if HiC[j][0] == RNA_Chr:
					if (overlap(RNA_Start,RNA_End,HiC[j][1],HiC[j][2]) and overlap(DNA_Start,DNA_End,HiC[j][4],HiC[j][5])): or (overlap(RNA_Start,RNA_End,HiC[j][4],HiC[j][5]) and overlap(DNA_Start,DNA_End,HiC[j][1],HiC[j][2])):
						Count+=1
						temp=map(str,HiC[j])
						g.write('\t'.join(GRID[i])+'\t'.join(temp))
						break

g.close()
