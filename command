aws ecs create-cluster --cluster-name fargate-cluster

aws ecs register-task-definition --cli-input-json file://$HOME/tasks/fargate-task.json

aws ecs list-task-definitions

private
aws ecs create-service --cluster fargate-cluster --service-name fargate-service --task-definition sample-fargate:1 --desired-count 1 --launch-type "FARGATE" --network-configuration "awsvpcConfiguration={subnets=[subnet-abcd1234],securityGroups=[sg-abcd1234]}"


public
aws ecs create-service --cluster fargate-cluster --service-name fargate-service --task-definition sample-fargate:1 --desired-count 1 --launch-type "FARGATE" --network-configuration "awsvpcConfiguration={subnets=[subnet-abcd1234],securityGroups=[sg-abcd1234],assignPublicIp=ENABLED}"

aws ecs list-services --cluster fargate-cluster

aws ecs describe-services --cluster fargate-cluster --services fargate-service
