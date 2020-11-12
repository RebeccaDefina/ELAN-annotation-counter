This script was written by Brahn Partridge

It searches a directory containing ELAN files for annotations of a specific LINGUISTIC_TYPE_REF and outputs a csv file containing the total number of annotations as well as the number of non-empty annotations of that type per participant per file.

For instance a section of the output looks like this
"Filename","Participant","NumberOfAnnotations","NumberOfNonEmptyAnnotations"
"A-D_20180323.eaf","Rebecca","38","38"
"A-D_20180323.eaf","Max","49","48"
"E-L-W_20180928.eaf","Ngunytju","36","10"
"E-L-W_20180928.eaf","Rebecca","2","2"

It was written and has been tested on PC, but should work on MAC OS as well.

Instructions for use:
Open a Powershell window for the directory containing the script

The command to run the script is:
 

.\ELAN-annotation-count-script.ps1 ".\data\"
 

Where “.\data\” is the path to your ELAN files. Can be a full or relative path.

There are two additional optional parameters.

Specify the output filename which is “output.csv”:

 

.\ELAN-annotation-count-script.ps1 ".\data" ".\test.csv"

 

And finally, you can specify which LINGUISTIC_TYPE_REF to search for, defaults to "Phrases":

 

.\ELAN-annotation-count-script.ps1 ".\data" ".\text.csv" "Text"

 

You can also explicitly name the parameters:

 

.\ELAN-annotation-count-script.ps1 -Path ".\data" -TypeRef "Text"

.\ELAN-annotation-count-script.ps1 -Path ".\data" -TypeRef "Text" -OutputFile "blah.csv"


If you have any problems or questions feel free to contact Rebecca Defina rebecca.defina@unimelb.edu.au