#made on 10 6.12.2021
echo "Hi, this is Ahmed Elsherbini's HTS-PCR script"
echo "my work is based on https://github.com/egonozer/in_silico_pcr"
echo "kindly, have mafft so I can align your amplicon"

echo "So, enough speaking, what is the F primer?"
read cc
echo "R primer? y/n"
read dd

for file in *.fna;

do

#add here you primers and -l max amplicon and which -m mismatch you accept and -i the indels you may accept
perl in_silico_PCR.pl -r -s $file -a $cc -b $dd -l 100000 -m 4 -i 4 > results_$file.txt 2> amplicons_$file.fasta
sed "1s/amp_1/&_${file//./_}/" amplicons_$file.fasta > new_amplicons_$file.fasta

done
cat new_amplicons* > unaligned_amplicons.fasta

mafft  unaligned_amplicons.fasta > aligned_amplicons.fasta
rm -r results*
rm -r amplicons*
rm -r new_amplicons*

echo "See you soon my friend :))"
##################################################
