
from aws_cdk import Stack
from constructs import Construct
from aws_cdk import (aws_ecr as ecr, aws_ec2 as ec2, aws_ecs as ecs, aws_ecs_patterns as ecs_patterns)

class CdkStack(Stack):

    def __init__(self, scope: Construct, construct_id: str, **kwargs) -> None:

        super().__init__(scope, construct_id, **kwargs)

        vpc = ec2.Vpc(self, "sbkVpc", max_azs=3)     # default is all AZs in region

        cluster = ecs.Cluster(self, "sbkCluster", vpc=vpc)

        #
        # Set up an ECR repository for storing images
        #
        ecr.Repository(self, "sbkRepository", repository_name="sbk-repository")


        #
        # This sets up the fargate instance from image registry
        #
        # 0.25 CPU, 512MB RAM, 2 lodbalanced instances
        #
        ecs_patterns.ApplicationLoadBalancedFargateService(self, "sbkFargateService",
            cluster = cluster,
            cpu=256,
            desired_count=2,
            memory_limit_mib=512,
            public_load_balancer=True,
            task_image_options=ecs_patterns.ApplicationLoadBalancedTaskImageOptions(
                image=ecs.ContainerImage.from_registry("amazon/amazon-ecs-sample")))
