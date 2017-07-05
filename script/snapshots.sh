#!/bin/bash
## Script to create snapshots of running instances and delete snapshots older than 15 days

#Function to delete snapshots older than 15 days
delete_snapshot()
{
#Getting snapshot_id of all snapshots
snapshots=($(aws ec2 describe-snapshots --owner self --query 'Snapshots[*].[SnapshotId]' --output text ))

#Checking snapshots older than 15 days by comparing the creation date
for i in ${snapshots[@]}; do
    time_created=$(aws ec2 describe-snapshots --snapshot-ids $i --output json --query 'Snapshots[*].StartTime' --output text | awk -FT '{print $1}')
    if [ $(date -d "$time_created" +%s) -lt $(date --date="15 days ago" +%s) ]; then
      echo "This snapshot is older than 15 days and will be deleted!!  Snapshot ID : $i"
      aws ec2 delete-snapshot --snapshot-id $i
    else
      echo "This snapshot was created less than 15 days ago and will not be deleted!!  Snapshot ID : $i"
    fi
done
}


#Function to create snapshots of running instances
create_snapshot()
{
#Instance id of running instances
for i in $(aws ec2 describe-instances --query 'Reservations[*].Instances[*].InstanceId' --filters "Name=instance-state-name,Values=running" --output text)
    do
         #Getting volume ids associated with the instance
          volume_id=$(aws ec2 describe-volumes --query 'Volumes[*].VolumeId' --filters "Name=attachment.instance-id,Values=$i")

         #Retrieving instance name
          Instance_name=$(aws ec2 describe-instances --instance-ids $i --query 'Reservations[*].Instances[*].[Tags[?Key==`Name`].Value]' --ouput text)

         #Getting device ids of volume attached
          device_id=$(aws ec2 describe-volumes --query 'Volumes[*].Attachments[*].Device' --filters "Name=attachment.instance-id,Values=$i" --output text)
          device_name=$(echo $device_id | awk -F/ '{print $2"-"$3}')

          #Creating snapshot
          snapshot_id=$(aws ec2 create-snapshot --volume-id $volume_id --query 'SnapshotId')

          #Creating snapshot tag
          aws ec2 create-tags --resources $snapshot_id --tags Key=Name,Value="$Instance_name-$device_name-snapshot" Key=Date_Created,Value="$(date +\"%m-%d-%y\")"
    done
}
