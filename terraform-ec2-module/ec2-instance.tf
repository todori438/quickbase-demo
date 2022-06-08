module "dev_ssh_sg" {
  source = "terraform-aws-modules/security-group/aws"

  name        = "ec2_sg"
  description = "Security group for ec2_sg"
  vpc_id      = data.aws_vpc.default.id

  ingress_cidr_blocks = ["79.100.158.144/32"] 
  ingress_rules       = ["ssh-tcp"]
}

module "ec2_sg" {
  source = "terraform-aws-modules/security-group/aws"

  name        = "ec2_sg"
  description = "Security group for ec2_sg"
  vpc_id      = data.aws_vpc.default.id

  ingress_cidr_blocks      = ["79.100.158.144/32"]
  ingress_with_cidr_blocks = [
    {
      from_port   = 5001
      to_port     = 5001
      protocol    = "tcp"
    },
    {
      from_port   = 8080
      to_port     = 8080
      protocol    = "tcp"
    }    
  ]
  egress_rules        = ["all-all"]
}

data "aws_ami" "amazon_linux_2" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-ebs"]
  }
}

resource "aws_instance" "web" {
  ami           = data.aws_ami.amazon_linux_2.id
  instance_type = "t3.micro"

  root_block_device {
    volume_size = 8
  }

  user_data = <<-EOF
    #!/bin/bash
    set -ex
    sudo yum update -y
    sudo yum install amazon-linux-extras install docker git -y
    sudo service docker start
    sudo usermod -a -G docker ec2-user
    sudo git clone https://github.com/todori438/quickbase-demo.git /tmp/deploy
    sudo docker build /tmp/deploy/app -t hello-app
    sudo docker run --detach --publish=5001:80 --name=hello-app hello-app
  EOF

  vpc_security_group_ids = [
    module.ec2_sg.security_group_id,
    module.dev_ssh_sg.security_group_id
  ]

  tags = {
    project = "hello-world"
  }

  monitoring              = true
  disable_api_termination = false
  ebs_optimized           = true
}
