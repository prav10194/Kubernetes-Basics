## Install Sysdig

curl -s https://download.sysdig.com/stable/install-agent-kubernetes | sudo bash -s -- --access_key <access_key> --collector ingest-us2.app.sysdig.com --collector_port 6443 --cluster_name <cluster_name> --imageanalyzer --analysismanager https://us2.app.sysdig.com/internal/scanning/scanning-analysis-collector
