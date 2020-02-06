# subsets to X chromosome variants then
# switches instances of "X" appearing in chromosome column to "23"

REF=snp138.txt.pos.scz49
TMP_FNAME=tmp1.txt
gunzip -c ${REF}.gz | awk '{ if ($2=="X") print $0 }' > $TMP_FNAME

paste -d ' ' <(cut -f1 -d' ' ${TMP_FNAME}) <(cut -f2 -d' ' ${TMP_FNAME}| sed 's/X/23/g') <(cut -f3-5 -d' ' ${TMP_FNAME})  | gzip > ${REF}.chr23.gz

rm $TMP_FNAME
