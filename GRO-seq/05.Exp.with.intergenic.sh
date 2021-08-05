#Raw reads
#analyzeRepeats.pl /Share2/home/qiyijun/lhf/Reference/transcripts.gtf tair10 -count genes -condenseGenes -raw -d $1 > $1/Genes_counts.txt
#RPKM
analyzeRepeats.pl /Share2/home/qiyijun/lhf/Reference/transcripts.gtf tair10 -count genes -condenseGenes -rpkm -d $1 > $1/Genes_norm.txt
#Pausing
#analyzeRepeats.pl /Share2/home/qiyijun/lhf/Reference/All.gtf tair10 -count pausing -condenseGenes -rpkm -d $1 > $1/Pausing_norm.txt
