# Get the default VPC of the selected region
data "aws_vpc" "default" {
  default = true
}

# Security group for EC2
resource "aws_security_group" "app_sg" {
  name        = "app-server-sg"
  description = "Security group for app server"
  vpc_id      = data.aws_vpc.default.id   # <- dynamic VPC ID

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["152.58.45.115/32"]  # <-- your IP address
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# EC2 instance
resource "aws_instance" "app_server" {
  ami                    = "ami-0c4fc5dcabc9df21d" # Ubuntu AMI (update if wrong region)
  instance_type          = "t3.micro"
  key_name               = "forcsdev"   # Your AWS Key Pair name
  vpc_security_group_ids = [aws_security_group.app_sg.id]

  tags = {
    Name = "python-microservices-server"
  }
}

# Optional: Output the public IP
output "public_ip" {
  description = "Public IP of the EC2 instance"
  value       = aws_instance.app_server.public_ip
}
