f=open(r"D:\GRID\Revise\Interaction\All.final.gtf")
data=f.readlines()
hash={}
hash_result={}
for i in range(len(data)):
	data[i]=data[i].split('\t')
	v=[data[i][0],int(data[i][3]),int(data[i][4])]
	k=data[i][-1].split(';')[0].replace('ID=','')
	hash[k]=v


dir1='D:\\GRID\\Revise\\Stress\\GRID_diff\\Specific\\'
dir2='D:\\GRID\\Revise\\Stress\\GRID_diff\\Common\\'

g1=open(r'D:\GRID\Revise\Stress\GRID_diff\Heat_summary','w')
g2=open(r'D:\GRID\Revise\Stress\GRID_diff\DC3000_summary','w')
g3=open(r'D:\GRID\Revise\Stress\GRID_diff\Heat_list','w')
g4=open(r'D:\GRID\Revise\Stress\GRID_diff\DC3000_list','w')

#############Heat################################
f1=open(dir1+'Control_Specific')
f2=open(dir1+'Heat_Specific')
f3=open(dir2+'Control_vs_Heat')

hash_result['Up_Cis']=0
hash_result['Up_Intra_chr.']=0
hash_result['Up_Inter_chr.']=0
hash_result['Down_Cis']=0
hash_result['Down_Intra_chr.']=0
hash_result['Down_Inter_chr.']=0

data1=f1.readlines()
Part1='Down'
Part2='Unknown'
for i in range(len(data1)):
	data1[i]=data1[i].split('\t')
	k=data1[i][0].split(',')
	RNA=hash[k[0]]
	DNA=hash[k[1]]
	if RNA[0] != DNA[0]:
		Part2='Inter_chr.'
		g3.write(data1[i][0]+'\t'+Part1+'_'+Part2+'\n')
	else:
		if RNA[1] > DNA[2] or RNA[2] < DNA[1]:
			dis = min(abs(RNA[1]-DNA[2]),abs(RNA[2]-DNA[1]))
			if dis > 1000:
				Part2='Intra_chr.'
				g3.write(data1[i][0]+'\t'+Part1+'_'+Part2+'\n')
			else:
				Part2='Cis'
				g3.write(data1[i][0]+'\t'+Part1+'_'+Part2+'\n')
		else:
			Part2='Cis'
			g3.write(data1[i][0]+'\t'+Part1+'_'+Part2+'\n')
	Interaction_type=Part1+'_'+Part2
	hash_result[Interaction_type] += 1

data2=f2.readlines()
Part1='Up'
Part2='Unknown'
for i in range(len(data2)):
	data2[i]=data2[i].split('\t')
	k=data2[i][0].split(',')
	RNA=hash[k[0]]
	DNA=hash[k[1]]
	if RNA[0] != DNA[0]:
		Part2='Inter_chr.'
		g3.write(data2[i][0]+'\t'+Part1+'_'+Part2+'\n')
	else:
		if RNA[1] > DNA[2] or RNA[2] < DNA[1]:
			dis = min(abs(RNA[1]-DNA[2]),abs(RNA[2]-DNA[1]))
			if dis > 1000:
				Part2='Intra_chr.'
				g3.write(data2[i][0]+'\t'+Part1+'_'+Part2+'\n')
			else:
				Part2='Cis'
				g3.write(data2[i][0]+'\t'+Part1+'_'+Part2+'\n')
		else:
			Part2='Cis'
			g3.write(data2[i][0]+'\t'+Part1+'_'+Part2+'\n')
	Interaction_type=Part1+'_'+Part2
	hash_result[Interaction_type] += 1

data3=f3.readlines()
Part1='Unknown'
Part2='Unknown'

for i in range(1,len(data3)):
	data3[i]=data3[i].split('\t')
	k=data3[i][0].split(',')
	if float(data3[i][1]) >1 and float(data3[i][-2]) < 0.05:
		Part1='Up'
		RNA=hash[k[0]]
		DNA=hash[k[1]]
		if RNA[0] != DNA[0]:
			Part2='Inter_chr.'
			g3.write(data3[i][0]+'\t'+Part1+'_'+Part2+'\n')
		else:
			if RNA[1] > DNA[2] or RNA[2] < DNA[1]:
				dis = min(abs(RNA[1]-DNA[2]),abs(RNA[2]-DNA[1]))
				if dis > 1000:
					Part2='Intra_chr.'
					g3.write(data3[i][0]+'\t'+Part1+'_'+Part2+'\n')
				else:
					Part2='Cis'
					g3.write(data3[i][0]+'\t'+Part1+'_'+Part2+'\n')
			else:
				Part2='Cis'
				g3.write(data3[i][0]+'\t'+Part1+'_'+Part2+'\n')
		Interaction_type=Part1+'_'+Part2
		hash_result[Interaction_type] += 1
	if float(data3[i][1]) <-1 and float(data3[i][-2]) < 0.05:
		Part1='Down'
		RNA=hash[k[0]]
		DNA=hash[k[1]]
		if RNA[0] != DNA[0]:
			Part2='Inter_chr.'
			g3.write(data3[i][0]+'\t'+Part1+'_'+Part2+'\n')
		else:
			if RNA[1] > DNA[2] or RNA[2] < DNA[1]:
				dis = min(abs(RNA[1]-DNA[2]),abs(RNA[2]-DNA[1]))
				if dis > 1000:
					Part2='Intra_chr.'
					g3.write(data3[i][0]+'\t'+Part1+'_'+Part2+'\n')
				else:
					Part2='Cis'
					g3.write(data3[i][0]+'\t'+Part1+'_'+Part2+'\n')
			else:
				Part2='Cis'
				g3.write(data3[i][0]+'\t'+Part1+'_'+Part2+'\n')
		Interaction_type=Part1+'_'+Part2
		hash_result[Interaction_type] += 1

for (k,v) in hash_result.items():
	g1.write(k+':\t%s\n'%v)
g1.close()


f1=open(dir1+'Mock_Specific')
f2=open(dir1+'DC3000_Specific')
f3=open(dir2+'Control_vs_DC3000')

hash_result['Up_Cis']=0
hash_result['Up_Intra_chr.']=0
hash_result['Up_Inter_chr.']=0
hash_result['Down_Cis']=0
hash_result['Down_Intra_chr.']=0
hash_result['Down_Inter_chr.']=0

data1=f1.readlines()
Part1='Down'
Part2='Unknown'
for i in range(len(data1)):
	data1[i]=data1[i].split('\t')
	k=data1[i][0].split(',')
	RNA=hash[k[0]]
	DNA=hash[k[1]]
	if RNA[0] != DNA[0]:
		Part2='Inter_chr.'
		g4.write(data1[i][0]+'\t'+Part1+'_'+Part2+'\n')
	else:
		if RNA[1] > DNA[2] or RNA[2] < DNA[1]:
			dis = min(abs(RNA[1]-DNA[2]),abs(RNA[2]-DNA[1]))
			if dis > 1000:
				Part2='Intra_chr.'
				g4.write(data1[i][0]+'\t'+Part1+'_'+Part2+'\n')
			else:
				Part2='Cis'
				g4.write(data1[i][0]+'\t'+Part1+'_'+Part2+'\n')
		else:
			Part2='Cis'
			g4.write(data1[i][0]+'\t'+Part1+'_'+Part2+'\n')
	Interaction_type=Part1+'_'+Part2
	hash_result[Interaction_type] += 1

data2=f2.readlines()
Part1='Up'
Part2='Unknown'
for i in range(len(data2)):
	data2[i]=data2[i].split('\t')
	k=data2[i][0].split(',')
	RNA=hash[k[0]]
	DNA=hash[k[1]]
	if RNA[0] != DNA[0]:
		Part2='Inter_chr.'
		g4.write(data2[i][0]+'\t'+Part1+'_'+Part2+'\n')
	else:
		if RNA[1] > DNA[2] or RNA[2] < DNA[1]:
			dis = min(abs(RNA[1]-DNA[2]),abs(RNA[2]-DNA[1]))
			if dis > 1000:
				Part2='Intra_chr.'
				g4.write(data2[i][0]+'\t'+Part1+'_'+Part2+'\n')
			else:
				Part2='Cis'
				g4.write(data2[i][0]+'\t'+Part1+'_'+Part2+'\n')
		else:
			Part2='Cis'
			g4.write(data2[i][0]+'\t'+Part1+'_'+Part2+'\n')
	Interaction_type=Part1+'_'+Part2
	hash_result[Interaction_type] += 1

data3=f3.readlines()
Part1='Unknown'
Part2='Unknown'

for i in range(1,len(data3)):
	data3[i]=data3[i].split('\t')
	k=data3[i][0].split(',')
	if float(data3[i][1]) >1 and float(data3[i][-2]) < 0.05:
		Part1='Up'
		RNA=hash[k[0]]
		DNA=hash[k[1]]
		if RNA[0] != DNA[0]:
			Part2='Inter_chr.'
			g4.write(data3[i][0]+'\t'+Part1+'_'+Part2+'\n')
		else:
			if RNA[1] > DNA[2] or RNA[2] < DNA[1]:
				dis = min(abs(RNA[1]-DNA[2]),abs(RNA[2]-DNA[1]))
				if dis > 1000:
					Part2='Intra_chr.'
					g4.write(data3[i][0]+'\t'+Part1+'_'+Part2+'\n')
				else:
					Part2='Cis'
					g4.write(data3[i][0]+'\t'+Part1+'_'+Part2+'\n')
			else:
				Part2='Cis'
				g4.write(data3[i][0]+'\t'+Part1+'_'+Part2+'\n')
		Interaction_type=Part1+'_'+Part2
		hash_result[Interaction_type] += 1
	if float(data3[i][1]) <-1 and float(data3[i][-2]) < 0.05:
		Part1='Down'
		RNA=hash[k[0]]
		DNA=hash[k[1]]
		if RNA[0] != DNA[0]:
			Part2='Inter_chr.'
			g4.write(data3[i][0]+'\t'+Part1+'_'+Part2+'\n')
		else:
			if RNA[1] > DNA[2] or RNA[2] < DNA[1]:
				dis = min(abs(RNA[1]-DNA[2]),abs(RNA[2]-DNA[1]))
				if dis > 1000:
					Part2='Intra_chr.'
					g4.write(data3[i][0]+'\t'+Part1+'_'+Part2+'\n')
				else:
					Part2='Cis'
					g4.write(data3[i][0]+'\t'+Part1+'_'+Part2+'\n')
			else:
				Part2='Cis'
				g4.write(data3[i][0]+'\t'+Part1+'_'+Part2+'\n')
		Interaction_type=Part1+'_'+Part2
		hash_result[Interaction_type] += 1

for (k,v) in hash_result.items():
	g2.write(k+':\t%s\n'%v)
g2.close()

g3.close()
g4.close()
