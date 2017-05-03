cut -d',' -f15 $1 | tr -d "\015" | tail -n +2 > ids.tmp
cut -d',' -f13 $1 | tr -d "\015" | tail -n +2 > labels.tmp

sed -i "" s/1/positivo/ labels.tmp
sed -i "" s/2/negativo/ labels.tmp
sed -i "" s/3/neutro/ labels.tmp

paste ids.tmp labels.tmp > ids-labels.tmp

sort -n ids-labels.tmp | uniq -c | sed 's/^ *//' | sed 's/ /	/' > group.tmp

cut -d'	' -f2 group.tmp > ids.tmp
cut -d'	' -f3 group.tmp > labels.tmp
cut -d'	' -f1 group.tmp > counts.tmp

paste ids.tmp labels.tmp counts.tmp > id-label-count.csv

rm *.tmp

