#!/bin/bash

# pull some data
aws s3 cp s3://iptahack/dr2cut_IPTA.tgz ./
tar -xzf dr2cut_IPTA.tgz
rm dr2cut_IPTA.tgz

# use only a few pulsars for testing
echo "J1909-3744" >> mypsrlist.txt
echo "J1744-1134" >> mypsrlist.txt
echo "J0437-4715" >> mypsrlist.txt
echo "J1640+2224" >> mypsrlist.txt

# run enterprise
mprof run python gwb_analysis.py \
  --psrlist mypsrlist.txt \
  --datadir partim_cut_IPTA \
  --outdir ./output/ \
  --upperlimit \
  --Nsamp 1000 --thin 10

aws s3 sync output/ s3://iptahack/output/

# what else?
