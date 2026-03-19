import sys
from datetime import date, datetime
import boto3

#this script exports all currently active (Available) Workspaces in AWS to a csv called "active.csv"


def workspaces():
    client = boto3.client("workspaces")
    paginator = client.get_paginator("describe_workspaces")
    for result in paginator.paginate():
        if "Workspaces" not in result:
            continue
        for workspace in result["Workspaces"]:
            yield workspace

original_stdout = sys.stdout

if __name__ == "__main__":
    for ws in workspaces():
        print(ws, file=open("active.csv", "a"))




   
    