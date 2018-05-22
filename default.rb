{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "ec2:DescribeInstances",
                "ec2:DescribeImages",
                "ec2:DescribeKeyPairs",
                "ec2:DescribeVpcs",
                "ec2:DescribeSubnets",
                "ec2:DescribeSecurityGroups",
                "ec2:Describe*"
            ],
            "Resource": "*"
        },
        {
            "Effect": "Allow",
            "Action": "ec2:RunInstances",
            "Resource": [
                "arn:aws:ec2:us-east-1:990300515209:network-interface/*",
                "arn:aws:ec2:us-east-1:990300515209:volume/*",
                "arn:aws:ec2:us-east-1:990300515209:key-pair/*",
                "arn:aws:ec2:us-east-1:990300515209:security-group/*",
                "arn:aws:ec2:us-east-1:990300515209:subnet/*"
            ]
        },
        {
            "Effect": "Allow",
            "Action": "ec2:RunInstances",
            "Resource": [
                "arn:aws:ec2:us-east-1:990300515209:instance/*"
            ],
            "Condition": {
                "StringEquals": {
                    "ec2:InstanceType": "t2.micro"
                }
            }
        },
        {
            "Effect": "Allow",
            "Action": "ec2:RunInstances",
            "Resource": [
                "arn:aws:ec2:us-east-1::image/ami-14c5486b"
            ],
            "Condition": {
                "StringEquals": {
                    "ec2:Owner": "amazon"
                }
            }
        }
    ]
}
