#!/bin/bash -i

echo What fasta file would you like to align?

read filepath

gnome-terminal --tab -e "ssh -i ../wcb.pem ec2-user@ec2-34-215-69-72.us-west-2.compute.amazonaws.com"

scp -r -i ../wcb.pem $filepath ec2-user@ec2-34-215-69-72.us-west-2.compute.amazonaws.com:fasta/input.fa

ssh -i ../wcb.pem ec2-user@ec2-34-215-69-72.us-west-2.compute.amazonaws.com << 'EOF'
    docker run --rm     -v $HOME/blastdb:/blast/blastdb:ro     -v $HOME/blastdb_custom:/blast/blastdb_custom:ro -v $HOME/fasta:/blast/fasta:ro -v $HOME/results:/blast/results:rw    ncbi/blast blastn -db chr17-rs_ch179450-snps -query /blast/fasta/input.fa -out /blast/results/results.out
EOF

scp -i ../wcb.pem ec2-user@ec2-34-215-69-72.us-west-2.compute.amazonaws.com:results/results.out results.out