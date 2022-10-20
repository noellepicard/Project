cp SRR5210461.fastq EMHeatstress.fastq

cp SRR5210373.fastq CRHeatstress.fastq

cp SRR6476450.fastq EM.fastq 

touch casp3.fastq
echo "E. Maclovinus Heat Stress Casp3" > casp3.fastq

for i in EMHeatstress.fastq; do
	while read -r line; do
		if echo "$line" | grep -q "ATGAACGGAGACTGTGTG";
		then echo "$line" | sed 's/@/>EM_/g' >> casp3.fastq;
	fi;
	done < $i;
done 

touch casp3.fastq
echo "C. Rastrospinus Heat Stress Casp3" >> casp3.fastq

for i in CRHeatstress.fastq; do
	while read -r line; do
		if echo "$line" | grep -q "ATGAACGGAGACTGTGTG";
		then echo "$line" | sed 's/@/>CR_/g' >> casp3.fastq
	fi;
	done < $i;
done

touch casp3.fastq
echo "E. Maclovinus Resting casp3" >> casp3.fastq

for i in EM.fastq; do
	while read -r line; do
		if echo "$line" | grep -q "ATGAACGGAGACTGTGTG";
		then echo "$line" | sed 's/@/>EMresting_/g' >> casp3.fastq
	fi;
	done < $i;
done

touch cdkn1a.fastq
echo "E. Maclovinus Heat Stress cdkn1a" > cdkn1a.fastq

for i in EMHeatstress.fastq; do
	while read -r line; do
		if echo "$line" | grep -q "TTCATGTGCAACAGCT";
		then echo "$line" | sed 's/@/>EM_/g' >> cdkn1a.fastq
	fi;
	done < $i;
done

touch cdkn1a.fastq
echo "C. Rastrospinus Heat Stress cdkn1a" >> cdkn1a.fastq

for i in CRHeatstress.fastq; do
	while read -r line; do
		if echo "$line" | grep -q "TTCATGTGCAACAGCT";
		then echo "$line" | sed 's/@/>CR_/g' >> cdkn1a.fastq
	fi; 
	done < $i;
done

touch cdkn1a.fastq
echo "E. Maclovinus Resting cdkn1a" >> cdkn1a.fastq

for i in EM.fastq; do
	while read -r line; do
		if echo "$line" | grep -q "TTCATGTGCAACAGCT";
		then echo "$line" | sed 's/@/>EMresting_/g' >> cdkn1a.fastq
	fi
	done < $i;
done

cat cdkn1a.fastq casp3.fastq > apoptosisgenes.fastq


