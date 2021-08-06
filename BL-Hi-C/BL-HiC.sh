#run on login04
# $1:R1	$2:R2 $3:output $4:Name
ChIA-PET2 -g ~/Genomes/ath10.fa -b ~/Genomes/ath.genome.length -f $1 -r $2 -A CGCGATATCTTATCTGACT -B AGTCAGATAAGATATCGCG -t 8 -m 1 -k 1 -o $3 -n $4
