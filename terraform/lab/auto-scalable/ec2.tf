resource "aws_security_group" "autoscaling" {
  name        = "Autoscaling"
  description = "AutoScaling Security Group - SSH/http traffic"
  vpc_id      = aws_vpc.main.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    security_groups = ["${aws_security_group.alb.id}"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "AutoScaling"
  }
}

resource "aws_launch_configuration" "main" {
  name_prefix                 = "AS-launch-config"
  image_id                    = var.ami
  instance_type               = var.instance-tp
  key_name                    = var.key
  security_groups             = ["${aws_security_group.autoscaling.id}"]
  associate_public_ip_address = true

  user_data = file("ec2_config.sh")

}

resource "aws_autoscaling_group" "main" {
  name                      = "terraform-AutoScaling"
  vpc_zone_identifier       = ["${aws_subnet.public_a.id}", "${aws_subnet.public_b.id}"]
  launch_configuration      = aws_launch_configuration.main.name
  min_size                  = 2
  max_size                  = 5
  health_check_grace_period = 300
  health_check_type         = "ELB"
  force_delete              = true
  target_group_arns         = ["${aws_lb_target_group.lb_tg.arn}"]

}

resource "aws_autoscaling_policy" "scaleup" {
  name                   = "ScaleUp"
  autoscaling_group_name = aws_autoscaling_group.main.name
  adjustment_type        = "ChangeInCapacity"
  scaling_adjustment     = "1"
  cooldown               = "300"
  policy_type            = "SimpleScaling"
}

resource "aws_autoscaling_policy" "scaledown" {
  name                   = "ScaleDown"
  autoscaling_group_name = aws_autoscaling_group.main.name
  adjustment_type        = "ChangeInCapacity"
  scaling_adjustment     = "1"
  cooldown               = "300"
  policy_type            = "SimpleScaling"
}



