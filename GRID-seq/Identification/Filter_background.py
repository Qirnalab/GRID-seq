import sys

dir=sys.argv[1]

f=open(dir)
data=f.readlines()
hash={}
hash_bg={}
hash_chr={}

for i in range(len(data)):
	data[i]=data[i][0:-1].split('\t')
	DNA_ID=data[i][-2].split(';')[0][3:]
	RNA_ID=data[i][13].split(';')[0][3:]
	RNA_chr=data[i][5]
	DNA_chr=data[i][0]
	hash_chr[DNA_ID]=DNA_chr
	hash_chr[RNA_ID]=RNA_chr
	if int(data[i][-1])<1000 and DNA_ID!="" and RNA_ID!="" and RNA_ID!="AT2G01010" and RNA_ID!="AT2G01020" and RNA_ID!="AT3G41768" and RNA_ID!="AT3G41979":
		v=len(data[i][4].split(','))
		k=RNA_ID+'\t'+DNA_ID
		if not k in hash:
			hash[k]=0
		hash[k]+=v

for (k,v) in hash.items():
	k=k.split('\t')
	if hash_chr[k[0]] != hash_chr[k[1]]:
		if not k[1] in hash_bg:
			hash_bg[k[1]]=[]
		hash_bg[k[1]].append(int(v))

for (k,v) in hash_bg.items():
	v.sort()
	v=v[len(v)/2]*2
	hash_bg[k]=v

f=open(dir+'_final','w')
for (k,v) in hash.items():
	k=k.split('\t')
	if not k[1] in hash_bg:
		hash_bg[k[1]]=0
	if v>hash_bg[k[1]]:
		f.write(k[0]+'\t'+k[1]+'\t%s\n'%(v-hash_bg[k[1]]))

f.close()


