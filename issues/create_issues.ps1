# Creates labels and issues for the case-study backlog.
# Requires the GitHub CLI (https://cli.github.com) and: gh auth login
# Run from this "issues" folder inside your local clone of the case-study repository.

$labels = @(
  @{Name="user story"; Color="0E8A16"},
  @{Name="E1 Data ingestion"; Color="1D76DB"},
  @{Name="E2 Relevance and search"; Color="5319E7"},
  @{Name="E3 Alerts and digest"; Color="FBCA04"},
  @{Name="E4 Bid pipeline and intelligence"; Color="D93F0B"},
  @{Name="E5 Operations and handover"; Color="006B75"},
  @{Name="priority: Must"; Color="B60205"},
  @{Name="priority: Should"; Color="FF9F1C"},
  @{Name="priority: Could"; Color="C2E0C6"}
)
foreach ($l in $labels) { gh label create $l.Name --color $l.Color --force }

$issues = @(
  @{File="01-E1.body.md"; Title="[E1] One feed from all UK portals"; Labels="user story,E1 Data ingestion,priority: Must"},
  @{File="02-E1.body.md"; Title="[E1] Respect portal rate limits"; Labels="user story,E1 Data ingestion,priority: Must"},
  @{File="03-E1.body.md"; Title="[E1] EU and funding opportunities"; Labels="user story,E1 Data ingestion,priority: Could"},
  @{File="04-E2.body.md"; Title="[E2] Rank tenders by relevance"; Labels="user story,E2 Relevance and search,priority: Must"},
  @{File="05-E2.body.md"; Title="[E2] Search and filter tenders"; Labels="user story,E2 Relevance and search,priority: Must"},
  @{File="06-E2.body.md"; Title="[E2] Watchlist authorities"; Labels="user story,E2 Relevance and search,priority: Should"},
  @{File="07-E3.body.md"; Title="[E3] Morning digest in Teams"; Labels="user story,E3 Alerts and digest,priority: Must"},
  @{File="08-E4.body.md"; Title="[E4] Record bid decisions and outcomes"; Labels="user story,E4 Bid pipeline and intelligence,priority: Should"},
  @{File="09-E4.body.md"; Title="[E4] AI tender summary and exports"; Labels="user story,E4 Bid pipeline and intelligence,priority: Could"},
  @{File="10-E5.body.md"; Title="[E5] Secure, supportable handover"; Labels="user story,E5 Operations and handover,priority: Must"}
)
foreach ($i in $issues) {
  gh issue create --title $i.Title --body-file $i.File --label $i.Labels
}
Write-Host "Done. Issues are open; close them to show they were delivered, or add them to a Projects board."
