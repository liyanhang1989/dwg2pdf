# 7/11/2014
# version 0.0.1
# author: r1ddl3r
# description: simple PS script to automate the "printing" of dwg files in DWGTrueView to print to PDF
# Best run in same directory as dwg files
# Be sure to update dwgPath variable
# Must have DWGTrueView 2010 installed
# Apply reg changes here: http://www.amyuni.com/forum/viewtopic.php?f=24&t=2633
# Set up src file referenced in above link but use below code (include empty returns):
#;BEGIN SCRIPT
#PLOT0
#Y
#MODEL
#DWG To PDF.pc3
#ANSI A (11.00 x 8.50 Inches)
#Inches
#Landscape
#No
#Extents
#Fit
#Center
#Yes
#.
#Yes
#
#
#
#
#
#
#
#_quit
#;END SCRIPT


# Update dwgPatch below!
dir C:\dwg_test\*.dwg | Foreach-Object { 
Start-Process -WindowStyle hidden -FilePath $_.name –Verb Print
Start-Sleep -s 3
kill -processname DWGVIEWR
Start-Sleep -s 1
kill -processname AcroRd32
Start-Sleep -s 1
echo " $_.name converted to PDF " >> 2pdf_log.txt
echo " $_.name converted to PDF "
echo " ------------------------ " >> 2pdf_log.txt
echo " ------------------------ "
}
echo " DONE! :) " >> 2pdf_log.txt
echo " DONE! :) "
echo " Finished on.. " >> 2pdf_log.txt
get-date -f yyy-MM-dd-hh:mm:ss >> 2pdf_log.txt

