#analyzeRepeats.pl /Share2/home/qiyijun/lhf/Reference/All.gtf tair10 -raw -d /Share2/home/qiyijun/lhf/GRO-seq/Result/Control_1/ /Share2/home/qiyijun/lhf/GRO-seq/Result/Control_2 /Share2/home/qiyijun/lhf/GRO-seq/Result/Control_3/ /Share2/home/qiyijun/lhf/GRO-seq/Result/Heat_1/ /Share2/home/qiyijun/lhf/GRO-seq/Result/Heat_2/ /Share2/home/qiyijun/lhf/GRO-seq/Result/Heat_3/ > /Share2/home/qiyijun/lhf/GRO-seq/Diff_exp/Diff_heat.txt

#analyzeRepeats.pl /Share2/home/qiyijun/lhf/Reference/All.gtf tair10 -raw -d /Share2/home/qiyijun/lhf/GRO-seq/Result/Mock_1/ /Share2/home/qiyijun/lhf/GRO-seq/Result/Mock_2/ /Share2/home/qiyijun/lhf/GRO-seq/Result/Mock_3/ /Share2/home/qiyijun/lhf/GRO-seq/Result/DC3000_1/ /Share2/home/qiyijun/lhf/GRO-seq/Result/DC3000_2/ /Share2/home/qiyijun/lhf/GRO-seq/Result/DC3000_3/ > /Share2/home/qiyijun/lhf/GRO-seq/Diff_exp/Diff_DC3000.txt

#Diff_exp
getDiffExpression.pl /Share2/home/qiyijun/lhf/GRO-seq/Diff_exp/Diff_heat.txt -repeats Ctrl Ctrl Ctrl Heat Heat Heat -batch 1 2 3 1 2 3 > /Share2/home/qiyijun/lhf/GRO-seq/Diff_exp/Heat_result.txt

#Diff_exp
getDiffExpression.pl /Share2/home/qiyijun/lhf/GRO-seq/Diff_exp/Diff_DC3000.txt -repeats Ctrl Ctrl Ctrl DC3000 DC3000 DC3000 -batch 1 2 3 1 2 3 > /Share2/home/qiyijun/lhf/GRO-seq/Diff_exp/DC3000_result.txt

