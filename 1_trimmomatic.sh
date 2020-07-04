##trimmomatic
for i in $(ls */*.fq.gz);do
echo $i;j=${i%%/*};k=${i%_*}
echo $j $k
if [ ! -f $j/output_reverse_paired.fq.gz ];then 
trimmomatic PE -threads 20 $k"_"1.fq.gz $k"_"2.fq.gz $j/output_forward_paired.fq.gz $j/output_forward_unpaired.fq.gz $j/output_reverse_paired.fq.gz $j/output_reverse_unpaired.fq.gz ILLUMINACLIP:/share/disk0/user/liaohu/soft/anaconda3/share/trimmomatic-0.39-1/adapters/TruSeq3-PE.fa:2:30:10 LEADING:5 TRAILING:5 SLIDINGWINDOW:4:20 MINLEN:60
fi
done

## steatic reads number
for i in $(ls */*_paired.fq.gz);do echo $i;j=$(cat $i|sed -n "/@/p"|wc -l);echo $i $j >> trim_reads_number.tsv;done
