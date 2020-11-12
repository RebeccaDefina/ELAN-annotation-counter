param($dataPath, $outputFile = ".\output.csv", $typeRef = "Phrases")
#$dataPath = "C:\Dev\Projects\ELAN_annotation-counting-test\data\"

function Get-Xml-Files {
    param ($path)
    Get-ChildItem -Path $path -recurse -force | Where-Object { -not $_.psisdirectory } | Where-Object { $_.name.endswith('.eaf') } 
}

function Get-Annotations {
    param ($path, $typeRef)

    $outArray = New-Object System.Collections.ArrayList

    Get-Xml-Files -Path $dataPath | ForEach-Object { 
        [xml]$xml = (get-content $_.FullName) 
    
        $tiers = $xml.SelectNodes("/ANNOTATION_DOCUMENT/TIER[@LINGUISTIC_TYPE_REF='" + $typeRef +"']")
        foreach ($tier in $tiers)
        {
            $NumberOfAnnotations = 0
            $NumberOfEmptyAnnotations = 0
            foreach($annotation in $tier.ANNOTATION){
                $NumberOfAnnotations += 1
                if ($annotation.ALIGNABLE_ANNOTATION.ANNOTATION_VALUE -eq ""){
                    $NumberOfEmptyAnnotations += 1
                }
            }
            $obj = New-Object -Type PSObject -Property @{
                'Filename'   = $_.name
                'Participant' = $tier.PARTICIPANT
                'NumberOfAnnotations' = $NumberOfAnnotations
                'NumberOfNonEmptyAnnotations' = $NumberOfAnnotations - $NumberOfEmptyAnnotations
            }
            [void]$outArray.Add($obj)
        }
    } 
    $outArray | Select-Object Filename, Participant, NumberOfAnnotations, NumberOfNonEmptyAnnotations
}
Get-Annotations -path $dataPath -typeRef $typeRef | Export-Csv -Path $outputFile -NoTypeInformation
