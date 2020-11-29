
$x  = 10

function one{
    Write-Host "ONE: $x"

    {
        # in Powershell variable is dynamic -> it counts when a variable is defined (independend of the scope)
        $y = 22
    }

        # Therefore we can use $y though it was not defined in this scope
    Write-Host "ONE: Y $y"
}

function two {
    Write-Host "TWO"
    $x = 22
    one
}

# Powershell dynmically creates a variable lookup scope 
# Here one performs a lookup and finds the variable x=10
one

# Here function two overwrites x with 22 the lookup scope now is x= 10, x=22 -> therefore function one will print 22 as result
two
# Here x=22 is removed from the lookup scope since we left the function 'two' -> one will find the global x=10 definition in the lookup scope
one
