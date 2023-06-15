<#
  .DESCRIPTION
  A script that edits the:
  - "last modified date"
  - "creation date"
  - "last access date"

  of a file or a folder.

  .PARAMETER Path
  Specify the path to the target file or folder, that you wish to edit its dates.

  .PARAMETER NewDate
  Specify the date to be set as the new date for each:
  - "last modified date"
  - "creation date"
  - "last access date"

  By default, `NewDate` is the current date.

  .PARAMETER Recursive
  In case the `Path` you have specified is targetting a folder, you can add the
  `-Recursive` option (alias: `-Rec`, `-R`), so that all the files within that
  folder will also be targetted by this script, and their dates will be editted
  too.

  .INPUTS
  None. You cannot pipe objects to this script.

  .OUTPUTS
  None. This script does not generate any output.

  .NOTES
  MIT License
  Author: Tal Jacob

  .EXAMPLE
  PS> # Edit a file with a specific date.
  PS> .\edit-date-of-file.ps1 -Path demo.txt -NewDate (Get-Date("2020-12-31T23:54:43"))

  .EXAMPLE
  PS> # Edit a folder with the current date.
  PS> .\edit-date-of-file.ps1 -Path C:\Users\demo

  .EXAMPLE
  PS> # Edit a folder and all of the files it contains, with a specific date.
  PS> .\edit-date-of-file.ps1 -Path C:\Users\demo -NewDate (Get-Date("2020-12-31T23:54:43")) -R

  .LINK
  Online version: https://github.com/taljacob2/edit-date-of-file

  .LINK
  See `Get-Date` syntax: https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.utility/get-date?view=powershell-7.3
#>

param (
  [parameter(mandatory)][string]$Path,
  [parameter()][DateTime]$NewDate = (Get-Date),
  [parameter()][Alias("Rec","R")][switch]$Recursive
)


function Edit-Date-Of-File {
  param (
    [parameter()][string]$Path,
    [parameter()][string]$Item
  )

  $file = $Item
  if ($Path) {
    $file = Get-Item $Path
  }

  # Edit "last modified".
  $file.LastWriteTime = $NewDate

  # Edit "creation date".
  $file.CreationTime = $NewDate

  # Edit "last access date".
  $file.LastAccessTime = $NewDate
}

# Edit the dates of the given `$file`.
Edit-Date-Of-File -Path $Path

# Is the given `$file` a folder.
$isFileAFolder = Test-Path -Path $Path -PathType Container

if ($isFileAFolder -and $Recursive) {
  $file = Get-Item $Path
  Get-ChildItem $file -Recurse | 
  Foreach-Object {
    Edit-Date-Of-File -Path $_.FullName
  }
}
