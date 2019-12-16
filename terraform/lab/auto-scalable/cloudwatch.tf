resource "aws_cloudwatch_metric_alarm" "alarm_up" {
  alarm_name          = "LoadBalance_ScaleUp"
  alarm_description   = "Scales up an EC2 instance on AWS when CPU is greater than 80%"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "1"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = "60"
  statistic           = "Average"
  threshold           = "80"

  dimensions = {
    AutoScalingGroupName = aws_autoscaling_group.main.name

  }

  actions_enabled = true
  alarm_actions   = ["${aws_autoscaling_policy.scaleup.arn}"]
}

resource "aws_cloudwatch_metric_alarm" "alarm_down" {
  alarm_name          = "LoadBalance_ScaleDown"
  alarm_description   = "Scales down an EC2 instance on AWS when CPU utilization is normal - Less than 50%"
  comparison_operator = "LessThanOrEqualToThreshold"
  evaluation_periods  = "1"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = "60"
  statistic           = "Average"
  threshold           = "50"

  dimensions = {
    AutoScalingGroupName = aws_autoscaling_group.main.name

  }

  actions_enabled = true
  alarm_actions   = ["${aws_autoscaling_policy.scaledown.arn}"]
}

