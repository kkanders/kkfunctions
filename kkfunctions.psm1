#
# KKFUNCTIONS
##
#
#
#
#
#



function searchfile($filepath,$search) {

Get-Content $filepath | Select-String  $search



}


function FromUtcEpocTime ([long]$UnixTime)
{
    $epoch = New-Object System.DateTime (1970, 1, 1, 0, 0, 0, [System.DateTimeKind]::Utc);
    return $epoch.AddSeconds($UnixTime);
}

function base64 {

[CmdletBinding()]

param( [parameter(
            mandatory=$true)][string]$text,
            [bool]$decode = $false
        )
        if($decode -eq $false) {
[System.Convert]::ToBase64String([System.Text.Encoding]::UNICODE.GetBytes($text))
} else {

    [System.Text.Encoding]::UNICODE.GetString([System.Convert]::FromBase64String($text))
}

}



function macConvert ([string]$macaddress)
{
    
    if($macaddress.Length -eq 12) {
        $macreturn = $macaddress.Substring(0,2)+":"+$macaddress.Substring(2,2)+":"+$macaddress.Substring(4,2)+":"+$macaddress.Substring(6,2)+":"+$macaddress.Substring(8,2)+":"+$macaddress.Substring(10,2)
    } elseif($macaddress.Contains("-")) {
        $macreturn = $macaddress.Replace("-",":")
    }




    return $macreturn
}


function ConvertTo-ROT13
{
    [CmdletBinding()] param(
        [Parameter(Mandatory = $False)]
        [String] $rot13string
     )
    [String] $string = $null;
    $rot13string.ToCharArray() | ForEach-Object {
        if((([int] $_ -ge 97) -and ([int] $_ -le 109)) -or (([int] $_ -ge 65) -and ([int] $_ -le 77)))
        {
            $string += [char] ([int] $_ + 13);
        }
        elseif((([int] $_ -ge 110) -and ([int] $_ -le 122)) -or (([int] $_ -ge 78) -and ([int] $_ -le 90)))
        {
            $string += [char] ([int] $_ - 13);
        }
        else
        {
            $string += $_
        }
    }
    $string
}


 


function get-konikahex ($in) {

$hex = ([System.Convert]::ToString($in, 16)).toUpper()



#C1639CDD

$test2 =$hex[6]+$hex[7]

$test2 +=$hex[4]+$hex[5]
$test2 +=$hex[2]+$hex[3]
$test2 +=$hex[0]+$hex[1]


return $test2
}

