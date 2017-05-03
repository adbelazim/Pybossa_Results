data = open("ids-labels.tmp", "r")
ids_labels = [[int(line.split("\t")[0].strip()),line.split("\t")[1].strip()] for line in data]
out = ""
for i, j in ids_labels:
	labels = j.split(",")
	for label in labels:
		out=out+str(i)+"\t"+label+"\n"
	

fileout = open ("id-label.csv", "w")
fileout.write(out)
fileout.close()
