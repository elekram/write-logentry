function Write-LogEntry() {
  param(
  [Parameter(Position = 0, Mandatory = $true)]
  [string]$Type,
  [Parameter(Position = 1, Mandatory = $true)]
  [string]$Status,
  [Parameter(Position = 2, Mandatory = $true)]
  [string]$Message
)
  function Format-ExceptionMessage($Message) {
    $Message = $Message -replace '[,]', ''
    $Message = $Message -replace "`n", '' -replace "`r", ' '
    return $Message
  }

  $log = [PSCustomObject]@{
    Date     = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    Type     = $Type
    Status   = $Status
    Messsage = Format-ExceptionMessage -Message $Message
  }

  Export-Csv -Path './log.csv' -InputObject $log -Append -NoTypeInformation
}

