function Get-VaultItemPwExposed {
    <#
    .SYNOPSIS
    Returns count of times a vault item password has been exposed
    
    .DESCRIPTION
    Calls /object/exposed/{id} endpoint to retrieve count
    
    .PARAMETER Id
    Item guid

    .LINK
    https://bitwarden.com/help/vault-management-api/
    
    #>
    [cmdletbinding()]
    Param(
        [Parameter(Mandatory = $true)]
        $Id
    )

    $Request = Invoke-VaultApi -Endpoint ('object/exposed/{0}' -f $Id)
    if ($Request.success) {
        $Request.data.data
    }
    else {
        $Request
    } 
}
