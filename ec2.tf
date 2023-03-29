resource "aws_instance" "main" {
    ami = data.aws_ssm_parameter.instance_ami.value
    instance_type = "t3.micro"
    key_name = "Ryane"
    subnet_id = aws_subnet.public[0].id
    vpc_security_group_ids = ["sg-01e816905d0d389b0"]
    tags = {
      "Name" = "${var.default_tags.env}-EC2"
    }
    user_data = base64encode(file("C:/Users/ryanr/OneDrive/Desktop/terraform/user.sh"))
}