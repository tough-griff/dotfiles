New-Alias -Name g -Value "git" -Force

function Invoke-GitAlias-ga { git add -A $args }
New-Alias -Name ga -Value "Invoke-GitAlias-ga" -Force
function Invoke-GitAlias-gam { git amend $args }
New-Alias -Name gam -Value "Invoke-GitAlias-gam" -Force
function Invoke-GitAlias-gb { git branch -vv $args }
New-Alias -Name gb -Value "Invoke-GitAlias-gb" -Force
function Invoke-GitAlias-gba { git branch -avv $args }
New-Alias -Name gba -Value "Invoke-GitAlias-gba" -Force
function Invoke-GitAlias-gbd { git branch -d $args }
New-Alias -Name gbd -Value "Invoke-GitAlias-gbd" -Force
# function Invoke-GitAlias-gbD { git branch -D $args }
# New-Alias -Name gbD -Value "Invoke-GitAlias-gbD" -Force
function Invoke-GitAlias-gbr { gh browse $args }
New-Alias -Name gbr -Value "Invoke-GitAlias-gbr" -Force
function Invoke-GitAlias-gc { git commit -m $args }
New-Alias -Name gc -Value "Invoke-GitAlias-gc" -Force
function Invoke-GitAlias-gci { git commit $args }
New-Alias -Name gci -Value "Invoke-GitAlias-gci" -Force
function Invoke-GitAlias-gco { git checkout $args }
New-Alias -Name gco -Value "Invoke-GitAlias-gco" -Force
function Invoke-GitAlias-gcob { git checkout -b $args }
New-Alias -Name gcob -Value "Invoke-GitAlias-gcob" -Force
function Invoke-GitAlias-gcp { git cherry-pick $args }
New-Alias -Name gcp -Value "Invoke-GitAlias-gcp" -Force
function Invoke-GitAlias-gd { git diff $args }
New-Alias -Name gd -Value "Invoke-GitAlias-gd" -Force
function Invoke-GitAlias-gdc { git diff --cached $args }
New-Alias -Name gdc -Value "Invoke-GitAlias-gdc" -Force
function Invoke-GitAlias-gf { git fetch $args }
New-Alias -Name gf -Value "Invoke-GitAlias-gf" -Force
function Invoke-GitAlias-gfa { git fetch --all -Pp $args }
New-Alias -Name gfa -Value "Invoke-GitAlias-gfa" -Force
function Invoke-GitAlias-gfv { git fetch -v $args }
New-Alias -Name gfv -Value "Invoke-GitAlias-gfv" -Force
function Invoke-GitAlias-gha { git hash $args }
New-Alias -Name gha -Value "Invoke-GitAlias-gha" -Force
function Invoke-GitAlias-ghac { git hash | pbcopy $args }
New-Alias -Name ghac -Value "Invoke-GitAlias-ghac" -Force
function Invoke-GitAlias-gl { git log $args }
New-Alias -Name gl -Value "Invoke-GitAlias-gl" -Force
function Invoke-GitAlias-glb { git log --graph --branches $args }
New-Alias -Name glb -Value "Invoke-GitAlias-glb" -Force
function Invoke-GitAlias-gp { git push $args }
New-Alias -Name gp -Value "Invoke-GitAlias-gp" -Force
function Invoke-GitAlias-gpf { git push -f $args }
New-Alias -Name gpf -Value "Invoke-GitAlias-gpf" -Force
function Invoke-GitAlias-gpl { git pull $args }
New-Alias -Name gpl -Value "Invoke-GitAlias-gpl" -Force
function Invoke-GitAlias-gpu { git push -u $args }
New-Alias -Name gpu -Value "Invoke-GitAlias-gpu" -Force
function Invoke-GitAlias-gr { git remote -v $args }
New-Alias -Name gr -Value "Invoke-GitAlias-gr" -Force
function Invoke-GitAlias-grb { git rebase $args }
New-Alias -Name grb -Value "Invoke-GitAlias-grb" -Force
function Invoke-GitAlias-grbc { git rebase --continue $args }
New-Alias -Name grbc -Value "Invoke-GitAlias-grbc" -Force
function Invoke-GitAlias-gs { git status -s $args }
New-Alias -Name gs -Value "Invoke-GitAlias-gs" -Force
function Invoke-GitAlias-gsb { git show-branch $args }
New-Alias -Name gsb -Value "Invoke-GitAlias-gsb" -Force
function Invoke-GitAlias-gsh { git show $args }
New-Alias -Name gsh -Value "Invoke-GitAlias-gsh" -Force
function Invoke-GitAlias-gst { git status $args }
New-Alias -Name gst -Value "Invoke-GitAlias-gst" -Force
function Invoke-GitAlias-gsy { gh repo sync $args }
New-Alias -Name gsy -Value "Invoke-GitAlias-gsy" -Force
function Invoke-GitAlias-gu { git up $args }
New-Alias -Name gu -Value "Invoke-GitAlias-gu" -Force
function Invoke-GitAlias-guc { git uncommit $args }
New-Alias -Name guc -Value "Invoke-GitAlias-guc" -Force
