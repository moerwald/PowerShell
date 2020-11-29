
function PipelineSupportViaPSItem {
    param (
        $someArg
    )

    begin{
        $counter = 0
        Write-Host "Counter: $counter, Argument: $someArg"
    }

    process{
        # Pipeline input is stored under $_, this function is called in a pipeline flow manner
        $counter++;
        Write-Host "Counter: $counter, Argument: $someArg, Pipeline variable `$PSItem : $PSItem"
    }

    end{

        Write-Host "Counter: $counter, Argument: $someArg"
    }
}

function PipelineSupportViaInput{

    # $input contains accumulated Pipeline objects -> this function will be called AFTER the pipeline
    # has run through all objets
    foreach ($in in $input)
    {
        Write-Host $in
    }
}

function Sum {
    param($pName)

    $total = 0
    foreach ($item in $input ) {
        $total += $item.$pName
    }

    $total

}