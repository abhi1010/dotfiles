
# Save these functions to your PowerShell profile for persistence
$profilePath = $PROFILE.CurrentUserAllHosts
if (-not (Test-Path -Path $profilePath)) {
    New-Item -ItemType File -Path $profilePath -Force
}


oh-my-posh --init --shell pwsh --config "C:\Users\abhi\OneDrive - 002088482-LEGEND ARB FINANCIAL GROUP LIMITED\Documents\profiles\ohmyposhv3-scott.json" | Invoke-Expression

net use Z: \\oscar\oscar-win

Import-Module -Name Terminal-Icons

Import-Module git-aliases -DisableNameChecking
# Import-Module posh-git
#Import-Module oh-my-posh
# Set-PoshPrompt -Theme aliens
# Shows navigable menu of all options when hitting Tab
Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete
# Autocompletion for arrow keys
Set-PSReadlineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadlineKeyHandler -Key DownArrow -Function HistorySearchForward
# Set-PSReadLineOption -PredictionSource History
# Set-PSReadLineOption -Colors @{ InlinePrediction = "$([char]0x1b)[36;7;238m"}


# Set-Alias -Name gpu -Value "git push"


Import-Module PSReadLine

Set-PSReadLineOption -PredictionSource History

Set-PSReadLineOption -HistorySearchCursorMovesToEnd
Set-PSReadLineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadLineKeyHandler -Key DownArrow -Function HistorySearchForward

Set-PSReadLineOption -Colors @{ InlinePrediction = '#875f5f'}


Set-PSReadLineKeyHandler -Chord "Ctrl+RightArrow" -Function ForwardWord


function devab {
    ssh abhi@10.0.0.209
}

function gpu {
    git push
}

function gs {
    git status
}

function gpl {
    git pull
}

function pc {
    param (
        [string]$keyword
    )

    $user = "jeremy"
    $server = ""

    switch -wildcard ($keyword) {
        { $_ -like "208*" } { 
            $user = "abhi" 
            $server = "10.0.0.208" 
        }
        { $_ -like "209*" } { 
            $user = "abhi" 
            $server = "10.0.0.209" 
        }
        { $_ -like "c*" } { $server = "casper" }
        { $_ -like "n*" } { $server = "napoleon" }
        { $_ -like "h*" } { $server = "hercules" }
        { $_ -like "p*" } { $server = "pluto" }
        { $_ -like "r*" } { $server = "risky" }
        default {
            Write-Output "Unknown server keyword: $keyword"
            return
        }
    }

    ssh "$user@$server"
}