<#
.SYNOPSIS
Safely synchronizes changes from the source branch (e.g., 'main') 
into a destination branch (e.g., 'design').

.DESCRIPTION
This function automates the Git workflow:
1. Check out the source branch (e.g., 'main').
2. Pull the latest remote changes for the source branch.
3. Check out the destination branch (e.g., 'design').
4. Merge the local source branch into the destination branch.
5. Push the updated destination branch to the remote repository.
Includes robust error handling for conflicts, invalid branches, and Git failures.

.PARAMETER SourceBranch
The name of the stable branch (e.g., 'main', 'master') to pull changes from.
Defaults to 'main'.

.PARAMETER TargetBranch
The name of the development branch (e.g., 'design', 'dev') to merge changes into.
Defaults to 'design'.

.EXAMPLE
# Merges 'main' into 'design' (default behavior)
Sync-DesignBranch

.EXAMPLE
# Merges 'production' into 'staging'
Sync-DesignBranch -SourceBranch 'production' -TargetBranch 'staging'

.NOTES
Requires the Git executable to be available in the system's PATH.
#>
Function Sync-DesignBranch {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory=$false)]
        [string]$SourceBranch = "fundament",

        [Parameter(Mandatory=$false)]
        [string]$TargetBranch = "design"
    )

    Write-Host "--- Starting Branch Sync: $SourceBranch -> $TargetBranch ---" -ForegroundColor Cyan

    # Helper function to execute Git commands and check for failure
    function Invoke-GitCommand {
        param(
            [string]$Command,
            [string]$SuccessMessage
        )
        Write-Host "Executing: git $Command" -ForegroundColor Yellow
        
        # Execute the command, redirecting stderr to prevent script termination 
        # on non-zero exit codes if not using -ErrorAction Stop
        & git $Command 2>&1 | Out-String | Write-Verbose

        if ($LASTEXITCODE -ne 0) {
            Write-Error "Git command failed: git $Command"
            return $false
        }
        Write-Host "SUCCESS: $SuccessMessage" -ForegroundColor Green
        return $true
    }

    # ----------------------------------------------------------------------
    # 1. Checkout and Update Source Branch
    # ----------------------------------------------------------------------
    try {
        if (-not (Invoke-GitCommand "checkout $SourceBranch" "Checked out $SourceBranch")) { return }
        if (-not (Invoke-GitCommand "pull origin $SourceBranch" "Pulled latest changes into $SourceBranch")) { return }
    }
    catch {
        Write-Error "Error during source branch update: $($_.Exception.Message)"
        return
    }

    # ----------------------------------------------------------------------
    # 2. Checkout Target Branch and Merge
    # ----------------------------------------------------------------------
    try {
        if (-not (Invoke-GitCommand "checkout $TargetBranch" "Checked out $TargetBranch")) { return }
        
        Write-Host "Attempting merge of $SourceBranch into $TargetBranch..." -ForegroundColor Yellow
        & git merge $SourceBranch 2>&1 | Out-String | Write-Verbose
        
        if ($LASTEXITCODE -ne 0) {
            Write-Error "MERGE CONFLICTS DETECTED. The merge failed."
            Write-Warning "You must manually resolve conflicts in $TargetBranch and then commit/push."
            return
        }
        Write-Host "SUCCESS: Merge completed successfully." -ForegroundColor Green
    }
    catch {
        Write-Error "Error during merge process: $($_.Exception.Message)"
        return
    }

    # ----------------------------------------------------------------------
    # 3. Push Updated Target Branch
    # ----------------------------------------------------------------------
    try {
        if (-not (Invoke-GitCommand "push origin $TargetBranch" "Successfully pushed updated $TargetBranch to origin")) { return }
    }
    catch {
        Write-Error "Error during push: $($_.Exception.Message)"
        return
    }

    Write-Host "--- Sync Complete! $TargetBranch is now up-to-date with $SourceBranch ---" -ForegroundColor Cyan
}