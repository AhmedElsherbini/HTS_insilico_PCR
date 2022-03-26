#made on 10 1.02.2022
# "Hi, this is Ahmed Elsherbini's HTS-PCR script"
echo "this script is based on https://github.com/egonozer/in_silico_pcr.Make sure his perl script and my bash script are in the same dir of the genomes with (.fna extension)"
echo "ohh,also, have mafft so I can align your amplicons"
###################################################################
echo "So, enough speaking, what is the forward primer?"
read cc
echo "Please, The reverse primer?"
read dd

echo "Allowed primer mismatches like (2,3,..)?"
read i

echo "Allowed primer indels like (2,3,..)?"
read ii
#################################################################
for file in *.fna;

do

#add here you primers and -l max amplicon and which -m mismatch you accept and -i the indels you may accept
#if you want to a bigger amplicon > 100000 modify this i also, if you want to see which amplicon on which orietation 5 -3 , remove r
######################################################################################
perl in_silico_PCR.pl -r -s $file -a $cc -b $dd -l 100000 -m $i -i $ii > results_$file.txt 2> amplicons_$file.fasta
sed "1s/amp_1/&_${file//./_}/" amplicons_$file.fasta > new_amplicons_$file.fasta

done
cat new_amplicons* > unaligned_amplicons.fasta
#if you have too must 
mafft  --treeout unaligned_amplicons.fasta > aligned_amplicons.fasta


rm -r results*
rm -r amplicons*
rm -r new_amplicons*

mv unaligned_amplicons.fasta.tree phylogentic_amplicons.tree

echo "See you soon my friend (Ahmed):))"
##################################################
