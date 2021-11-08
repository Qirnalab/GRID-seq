#Step0 mkdir

mkdir Dedup
mkdir Cut_ada
mkdir Tag_linker
mkdir Linker_remove
mkdir Final_raw_data
mkdir Sam
mkdir Bam
mkdir Bed
mkdir Interaction

#Step1 remove PCR duplication
for i in *fq
do
nohup ../Scripts/1_Dedup.sh $i ../Dedup/$i &
done

#Step2 Cut adapter
for i in *fq
do
nohup ../Scripts/2_Cut_ada.sh ../Dedup/$i ../Cut_ada/$i &
done

#Step3 Tag linkers
for i in *fq
do
python ../Scripts/3_Tag_linker.py ../Cut_ada/$i ../Tag_linker/$i
done

#Step4 Linker remove
python ../Scripts/4_linker_remove.py ../Tag_linker/ ../Linker_remove/

#Step5 Get final data
python ../Scripts/5_Final_raw_data.py ../Linker_remove/ ../Final_raw_data/

#Step6 Mapping to genome
cd ../Final_raw_data
for i in *
do
bowtie -m 0 -p 8 $Reference $Input.fq -S $Output.sam
done

