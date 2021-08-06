#Start with bam file

for i in *
do
	bedtools bamtobed -i $i > $i.bed
done

less Wt_1_RNA.bed > temp
less Wt_1_DNA.bed >> temp

awk 'BEGIN { OFS = "\t" } {if(K[$4]) print K[$4], $0; else K[$4]=$0;}' temp | 
awk 'length($1)<20 && length($7)<20{
	x = $1 "\t" $2 "\t" $3 "\t" $6 "\t" $7 "\t" $8 "\t" $9 "\t" $12;
	D[x] = D[x]? D[x] "," $4 : $4 
}
END { OFS = "\t"; for(x in D) print x, D[x]} ' > ../Interaction/Wt_1

less Wt_2_RNA.bed > temp
less Wt_2_DNA.bed >> temp

awk 'BEGIN { OFS = "\t" } {if(K[$4]) print K[$4], $0; else K[$4]=$0;}' temp | 
awk 'length($1)<20 && length($7)<20{
	x = $1 "\t" $2 "\t" $3 "\t" $6 "\t" $7 "\t" $8 "\t" $9 "\t" $12;
	D[x] = D[x]? D[x] "," $4 : $4 
}
END { OFS = "\t"; for(x in D) print x, D[x]} ' > ../Interaction/Wt_2

less Control_1_RNA.bed > temp
less Control_1_DNA.bed >> temp

awk 'BEGIN { OFS = "\t" } {if(K[$4]) print K[$4], $0; else K[$4]=$0;}' temp | 
awk 'length($1)<20 && length($7)<20{
	x = $1 "\t" $2 "\t" $3 "\t" $6 "\t" $7 "\t" $8 "\t" $9 "\t" $12;
	D[x] = D[x]? D[x] "," $4 : $4 
}
END { OFS = "\t"; for(x in D) print x, D[x]} ' > ../Interaction/Control_1

less Control_2_RNA.bed > temp
less Control_2_DNA.bed >> temp

awk 'BEGIN { OFS = "\t" } {if(K[$4]) print K[$4], $0; else K[$4]=$0;}' temp | 
awk 'length($1)<20 && length($7)<20{
	x = $1 "\t" $2 "\t" $3 "\t" $6 "\t" $7 "\t" $8 "\t" $9 "\t" $12;
	D[x] = D[x]? D[x] "," $4 : $4 
}
END { OFS = "\t"; for(x in D) print x, D[x]} ' > ../Interaction/Control_2

less Heat_1_RNA.bed > temp
less Heat_1_DNA.bed >> temp

awk 'BEGIN { OFS = "\t" } {if(K[$4]) print K[$4], $0; else K[$4]=$0;}' temp | 
awk 'length($1)<20 && length($7)<20{
	x = $1 "\t" $2 "\t" $3 "\t" $6 "\t" $7 "\t" $8 "\t" $9 "\t" $12;
	D[x] = D[x]? D[x] "," $4 : $4 
}
END { OFS = "\t"; for(x in D) print x, D[x]} ' > ../Interaction/Heat_1

less Heat_2_RNA.bed > temp
less Heat_2_DNA.bed >> temp

awk 'BEGIN { OFS = "\t" } {if(K[$4]) print K[$4], $0; else K[$4]=$0;}' temp | 
awk 'length($1)<20 && length($7)<20{
	x = $1 "\t" $2 "\t" $3 "\t" $6 "\t" $7 "\t" $8 "\t" $9 "\t" $12;
	D[x] = D[x]? D[x] "," $4 : $4 
}
END { OFS = "\t"; for(x in D) print x, D[x]} ' > ../Interaction/Heat_2

less Mock_1_RNA.bed > temp
less Mock_1_DNA.bed >> temp

awk 'BEGIN { OFS = "\t" } {if(K[$4]) print K[$4], $0; else K[$4]=$0;}' temp | 
awk 'length($1)<20 && length($7)<20{
	x = $1 "\t" $2 "\t" $3 "\t" $6 "\t" $7 "\t" $8 "\t" $9 "\t" $12;
	D[x] = D[x]? D[x] "," $4 : $4 
}
END { OFS = "\t"; for(x in D) print x, D[x]} ' > ../Interaction/Mock_1

less Mock_2_RNA.bed > temp
less Mock_2_DNA.bed >> temp

awk 'BEGIN { OFS = "\t" } {if(K[$4]) print K[$4], $0; else K[$4]=$0;}' temp | 
awk 'length($1)<20 && length($7)<20{
	x = $1 "\t" $2 "\t" $3 "\t" $6 "\t" $7 "\t" $8 "\t" $9 "\t" $12;
	D[x] = D[x]? D[x] "," $4 : $4 
}
END { OFS = "\t"; for(x in D) print x, D[x]} ' > ../Interaction/Mock_2

less DC3000_1_RNA.bed > temp
less DC3000_1_DNA.bed >> temp

awk 'BEGIN { OFS = "\t" } {if(K[$4]) print K[$4], $0; else K[$4]=$0;}' temp | 
awk 'length($1)<20 && length($7)<20{
	x = $1 "\t" $2 "\t" $3 "\t" $6 "\t" $7 "\t" $8 "\t" $9 "\t" $12;
	D[x] = D[x]? D[x] "," $4 : $4 
}
END { OFS = "\t"; for(x in D) print x, D[x]} ' > ../Interaction/DC3000_1

less DC3000_2_RNA.bed > temp
less DC3000_2_DNA.bed >> temp

awk 'BEGIN { OFS = "\t" } {if(K[$4]) print K[$4], $0; else K[$4]=$0;}' temp | 
awk 'length($1)<20 && length($7)<20{
	x = $1 "\t" $2 "\t" $3 "\t" $6 "\t" $7 "\t" $8 "\t" $9 "\t" $12;
	D[x] = D[x]? D[x] "," $4 : $4 
}
END { OFS = "\t"; for(x in D) print x, D[x]} ' > ../Interaction/DC3000_2
