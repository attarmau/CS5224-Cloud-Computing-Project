# CS5224 Cloud Computing Project
This project aims to provide a useful tool for AWS users to ensure that their security groups are properly configured and that no sensitive services are exposed to the public internet by scanning an Amazon Web Services (AWS) account for open security groups using Python and the AWS SDK (Boto3).

Here are the steps that this tool could follow:

1. Use Boto3 to authenticate with the AWS account and retrieve a list of security groups.

2. For each security group, check whether it has any open ports that are accessible from the public internet. An open port is a port that is configured to allow traffic from any IP address (0.0.0.0/0).

3. If any open ports are found, print a warning message to the console and provide instructions for how to close the security group.

4. Optionally, the tool could be extended to automatically close any open security groups it finds.
