#!/usr/bin/env python3

import os
import aws_cdk as cdk
from cdk.cdk_stack import CdkStack

app = cdk.App()

CdkStack(app, "dev", env=cdk.Environment(account='688789537087', region='us-east-1'))
CdkStack(app, "test0", env=cdk.Environment(account='803670239139', region='us-east-1'))
CdkStack(app, "test1", env=cdk.Environment(account='803670239139', region='us-east-1'))

app.synth()
