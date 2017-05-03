
sed -i "" s/1/gente_afectada/ labels.dat
sed -i "" s/2/insfraestructura/ labels.dat
sed -i "" s/3/donaciones/ labels.dat
sed -i "" s/4/advertencias/ labels.dat
sed -i "" s/5/simpatia/ labels.dat
sed -i "" s/6/otra_informacion/ labels.dat
sed -i "" s/7/no_aplica/ labels.dat

paste ids.dat labels.dat > ids-labels.tmp

python separate-labels.py 

sort -n id-label.csv | uniq -c | sed 's/^ *//' | sed 's/ /	/' > group.tmp


cut -d'	' -f2 group.tmp > ids.tmp
cut -d'	' -f3 group.tmp > labels.tmp
cut -d'	' -f1 group.tmp > counts.tmp

paste ids.tmp labels.tmp counts.tmp > id-label-count.csv

rm *.tmp

