#!/bin/sh

# Simple script that creates BIDS compiled directories and moves the corresponding files from a dicom2nii output folder to
# the corresponding BIDs formatted folders

# Author: ChristinaDelta
# Date: 25/05/2021

# TODO:
# 1. write commands for moving files to their corresponding directories
# 2. write commands for the creation of behav, EEG and MEG datasets according to bids

# -----------------------------------------------------------------------------#
# ---------------------------- Paths and variables ----------------------------#
# Change these with the names of your variables and Paths

# define paths
dcmtonii_dir=""
dicomtonii_path='/Users/christinadelta/Desktop/'
new_datapath="/Users/christinadelta/datasets"

# define variables
modality='fMRI'
data='test'

# define subjects, sessions, etc..
subs=5
sess=2

# -----------------------------------------------------------------------------#
# ---------------------------- Create directories -----------------------------#
# move to the datapath and create the folders and sub folders
cd $new_datapath
mkdir $modality && cd $modality && mkdir $data && cd $data # create the modality and dataset folders

# create subject directories
for i in $(seq 1 $subs)
do
   mkdir sub-0$i
done

# create directories within each sub directory:
for i in $(seq 1 $subs)
do
  cd sub-0$i
  for j in $(seq 1 $sess)
  do
    mkdir sess-0$j && cd sess-0$j && mkdir anat func dwi
    cd ../
  done

  cd ../
done

#-------------------------- This is it! ---------------------------------------#
