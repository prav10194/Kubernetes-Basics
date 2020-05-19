
from kubernetes.client.rest import ApiException
from kubernetes import client, config
import os
from slack import WebClient
from slack.errors import SlackApiError

slackClient = WebClient(token="")

config.load_kube_config()

api_instance = client.CoreV1Api()

namespace = "default"
podSubstring = "tomcat"
podName = ""
endLogsText = "rule.RefreshComponentContainerJob  - End RefreshComponentContainerJob"

ret = api_instance.list_pod_for_all_namespaces(watch=False)
for i in ret.items:
    if i.metadata.namespace == namespace: 
        if podSubstring in i.metadata.name: 
            podName = i.metadata.name

print(podName)

try:
    # api_response = api_instance.read_namespaced_pod_log(name=pod_name, namespace='default')
    # print(api_response)
    for line in api_instance.read_namespaced_pod_log(podName, 'default', follow=True, _preload_content=False).stream():    
        if endLogsText in str(line): 
            print(line)
            response = slackClient.chat_postMessage(channel='#general', text="PRAV10194")
            exit(0)
except ApiException as e:
    print('Found exception in reading the logs')
    print(e)
