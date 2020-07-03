samp=$1
for i in $(ls *$samp*/output_forward_paired.fq.gz);
do echo $i;done >> forward.txt;
l_1=$(cat forward.txt|tr "\n" ","|cut -d ":" -f 1);
for i in $(ls *$samp*/output_reverse_paired.fq.gz);
do echo $i|tr "\n" "," >> reverse.txt;done;
l_2=$(cat reverse.txt|cut -d ":" -f 1);
megahit --min-contig-len 1000 -1 $l_1 -2 $l_2 -t 56 -o megahit_all_SS/
rm *.txt
