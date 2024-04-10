
resource "aws_instance" "jenkins_instance" {
  ami             = var.ami        # Ubuntu 20.04 LTS AMI ID, change as needed
  instance_type   = "t2.medium"    # Change to your desired instance type
  key_name        = var.key_name   # Change to your key pair name
  subnet_id       = var.pub-sub-1a # Change to your subnet ID
  security_groups = [var.sg_id]
  # user_data     = filebase64("../modules/jenkins/config.sh")
  tags = {
    Name = "cloud"
  }

}
