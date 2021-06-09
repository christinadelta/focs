#!/bin/sh

# Simple script that creates BIDS compiled directories and moves the corresponding files from a dicom2nii output folder to
# the corresponding BIDs formatted folders

# Author: ChristinaDelta
# Date: 25/05/2021

# TODO:
# 1. write commands for moving files to their corresponding directories

# -----------------------------------------------------------------------------#
# ---------------------------- Paths and variables ----------------------------#
# Change these with the names of your variables and Paths

# define paths
dcmtonii_dir=""
dicomtonii_path='/Users/christinadelta/Desktop/'
new_datapath="/Users/christinadelta/datasets"

# define variables
modality='fmri'
study='test'

# define subjects, sessions, etc..
subs=5
sess=1

# -----------------------------------------------------------------------------#
# ---------------------------- Create directories -----------------------------#
# move to the datapath and create the folders and sub folders
cd $new_datapath
mkdir $modality && cd $modality && mkdir $study && cd $study # create the modality and dataset folders

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
# now back in the "study" folder create a derivatives folder
mkdir derivatives stimuli && cd derivatives && mkdir freesurfer

# back to the "study" folder
cd ../..

#-------------------------- This is it! ---------------------------------------#
