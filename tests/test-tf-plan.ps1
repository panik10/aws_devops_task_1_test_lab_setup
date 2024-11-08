$tfPlanPath = "tfplan.json"

if (Test-Path $tfPlanPath) { 
    Write-Output "`u{2705} Checking if terrafom plan exists - OK. "
} else { 
    throw "`u{1F635} Unable to find terraform plan file. Please make sure that you saved terraform execution plan to the file and try again. "
}

$plan = (Get-Content -Path $tfPlanPath | ConvertFrom-Json) 

$vpc = $plan.resource_changes | Where-Object {$_.type -eq "aws_vpc"}
if ($vpc -and ($vpc.Count -eq 1 )) { 
    Write-Output "`u{2705} Checking if VPC is present in the plan - OK. "
} else { 
    throw "`u{1F635} Unable to find VPC. Please make sure that you added a VPC (and only one VPC) to the task module. "
}

Write-Output ""
Write-Output "`u{1F973} Congratulations! All tests passed!"
