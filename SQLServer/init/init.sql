CREATE DATABASE uploid_db;

USE uploid_db;

CREATE TABLE biosequence (
bioentry_id INT(10) UNSIGNED NOT NULL,
version SMALLINT,
length INT(10),
alphabet VARCHAR(10),
seq LONGTEXT,
) ENGINE=INNODB;

CREATE TABLE reference_genome (
reference_genome_id INT(10) UNSIGNED NOT NULL,
reference_genome_name VARCHAR(100),
) ENGINE=INNODB;

CREATE TABLE sample_genome (
sample_genome_id INT(10) UNSIGNED NOT NULL,
sample_genome_name VARCHAR(100),
) ENGINE=INNODB;

CREATE TABLE contig (
contig_id INT(10) UNSIGNED NOT NULL,
contig_name VARCHAR(100),
contig_reference_genome_id INT(10) UNSIGNED NOT NULL,
contig_seq LONGTEXT,
) ENGINE=INNODB;

CREATE TABLE read (
read_id INT(10) UNSIGNED NOT NULL,
read_qname VARCHAR(20),
read_flag INT(10),
read_contig_id INT(10) UNSIGNED NOT NULL,
read_position INT(50) UNSIGNED NOT NULL,
read_mapq INT(50) UNSIGNED NOT NULL,
read_tlen INT(10),
read_cigar VARCHAR(50) UNSIGNED NOT NULL,
read_seq VARCHAR(M) UNSIGNED NOT NULL,
read_qual VARCHAR(50) UNSIGNED NOT NULL,
read_sample_genome_id VARCHAR(10) UNSIGNED NOT NULL,
read_mate_id VARCHAR(10) UNSIGNED NOT NULL,
read_front_hard_clip_length INT(10) UNSIGNED NOT NULL,
read_rear_hard_clip_length VARCHAR(10) UNSIGNED NOT NULL,
read_front_soft_clip_seq VARCHAR(1000) UNSIGNED NOT NULL,
read_rear_hard_clip_seq VARCHAR(1000) UNSIGNED NOT NULL,
read_front_soft_clip_qual VARCHAR(100) UNSIGNED NOT NULL,
read_rear_hard_clip_qual VARCHAR(100) UNSIGNED NOT NULL,
) ENGINE=INNODB;

CREATE TABLE reference_base (
reference_base_id INT(10) UNSIGNED NOT NULL,
reference_base_value VARCHAR(10),
reference_base_position VARCHAR(100),
reference_base_contig_id VARCHAR(10),
) ENGINE=INNODB;

CREATE TABLE sample_base (
sample_base_id INT(10) UNSIGNED NOT NULL,
sample_base_value VARCHAR(10),
sample_base_quality INT(100),
sample_base_insert_offset INT(100),
sample_base_reference_base_id VARCHAR(10),
sample_base_read_id VARCHAR(10),
) ENGINE=INNODB;
