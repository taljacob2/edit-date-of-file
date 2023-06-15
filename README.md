# edit-date-of-file

A PowerShell script that edits the:
  - "last modified date"
  - "creation date"
  - "last access date"

of a file or a folder.

## Usage

The following commands should be run with *powershell.exe*.

### Execute Inline Without Cloning

Syntax:
```ps1
& ([scriptblock]::Create((iwr https://raw.githubusercontent.com/taljacob2/edit-date-of-file/master/edit-date-of-file.ps1 -useb))) -Path <String> [-NewDate (<DateTime>)] [-Recursive | -Rec | -R]
```

Examples:

- Edit a file with a specific date.
  ```ps1
  & ([scriptblock]::Create((iwr https://raw.githubusercontent.com/taljacob2/edit-date-of-file/master/edit-date-of-file.ps1 -useb))) -Path demo.txt -NewDate (Get-Date("2020-12-31T23:54:43"))
  ```

- Edit a folder with the current date.
  ```ps1
  & ([scriptblock]::Create((iwr https://raw.githubusercontent.com/taljacob2/edit-date-of-file/master/edit-date-of-file.ps1 -useb))) -Path C:\Users\demo
  ```

- Edit a folder and all of the files it contains, with a specific date.
  ```ps1
  & ([scriptblock]::Create((iwr https://raw.githubusercontent.com/taljacob2/edit-date-of-file/master/edit-date-of-file.ps1 -useb))) -Path C:\Users\demo -NewDate (Get-Date("2020-12-31T23:54:43")) -R
  ```

### Execute Offline

#### Clone The Project

```
git clone https://github.com/taljacob2/edit-date-of-file
```

#### Run

```
.\edit-date-of-file.ps1 -Path <String> [-NewDate (<DateTime>)]
```

In case you encouter an error, try running with:
```
powershell.exe -NoLogo -ExecutionPolicy Bypass -Command ".\edit-date-of-file.ps1 -Path <String> [-NewDate (<DateTime>)]"
```

## Help

To view the full documentation of the script, run:
```
Get-Help .\edit-date-of-file.ps1 -Full
```
