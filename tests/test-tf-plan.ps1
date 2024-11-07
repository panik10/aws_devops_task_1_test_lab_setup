$tfPlanPath = "tfplan"

# Check if terraform execution plan exists
if (Test-Path $tfPlanPath) { 
    Write-Host "`u{2705} Checking if terrafom plan exists - OK. "
} else { 
    throw "`u{1F635} Unable to find terraform plan file. Please make sure that you saved terraform execution plan to the file and try again. "
}

# Convert execution plan to json 
$tfPlanJsonPath = "tfPlan.json"
try { 
    terraform show -json $tfPlanPath > $tfPlanJsonPath
} catch { 
    throw "`u{1F635} Unexpected error: unable to read terraform plan file. Please contact your course mentor. "
}

$plan = (Get-Content -Path $tfPlanJsonPath | ConvertFrom-Json) 

$vpc = $plan.resource_changes | Where-Object {$_.type -eq "aws_vpc"}
if ($vpc -and ($vpc.Count -eq 1 )) { 
    Write-Host "`u{2705} Checking if VPC is present in the plan - OK. "
} else { 
    throw "`u{1F635} Unable to find VPC. Please make sure that you added a VPC (and only one VPC) to the task module. "
}
