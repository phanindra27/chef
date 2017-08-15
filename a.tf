/*
resource "aws_cloudwatch_metric_alarm" "diskReadBytes" {
  alarm_name          = "diskReadBytes"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "2"
  metric_name         = "DiskReadBytes"
  namespace           = "AWS/EC2"
  period              = "180"
  statistic           = "Average"
  threshold           = "99"

  dimensions {
    AutoScalingGroupName = "ptype_shfmk_sharedservices_asg_scalegroup"
  }

  alarm_description = "This metric monitors Disk Read Bytes"
  alarm_actions     = ["arn:aws:sns:ap-south-1:701732385417:LONGBOWALERT"]
}
*/

resource "aws_cloudwatch_metric_alarm" "GroupMinSize" {
  alarm_name          = "GroupMinSize"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = "2"
  metric_name         = "GroupMinSize"
  namespace           = "AWS/EC2"
  period              = "300"
  statistic           = "Average"
  threshold           = "2"

  dimensions {
    AutoScalingGroupName = "ptype_shfmk_sharedservices_asg_scalegroup"
  }

  alarm_description = "This metric monitors ASG group minimum size"
  alarm_actions     = ["arn:aws:sns:ap-south-1:701732385417:LONGBOWALERT"]
}

resource "aws_cloudwatch_metric_alarm" "GroupMaxSize" {
  alarm_name          = "GroupMaxSize"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "2"
  metric_name         = "GroupMaxSize"
  namespace           = "AWS/EC2"
  period              = "300"
  statistic           = "Average"
  threshold           = "4"

  dimensions {
    AutoScalingGroupName = "ptype_shfmk_sharedservices_asg_scalegroup"
  }

  alarm_description = "This metric monitors ASG group maximum size"
  alarm_actions     = ["arn:aws:sns:ap-south-1:701732385417:LONGBOWALERT"]
}

resource "aws_cloudwatch_metric_alarm" "GroupTotalInstances" {
  alarm_name          = "GroupTotalInstances"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "2"
  metric_name         = "GroupTotalInstances"
  namespace           = "AWS/EC2"
  period              = "300"
  statistic           = "Average"
  threshold           = "4"

  dimensions {
    AutoScalingGroupName = "ptype_shfmk_sharedservices_asg_scalegroup"
  }

  alarm_description = "This metric monitors ASG group total instances"
  alarm_actions     = ["arn:aws:sns:ap-south-1:701732385417:LONGBOWALERT"]
}

resource "aws_cloudwatch_metric_alarm" "GroupDesiredCapacity" {
  alarm_name          = "GroupDesiredCapacity"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "2"
  metric_name         = "GroupDesiredCapacity"
  namespace           = "AWS/EC2"
  period              = "300"
  statistic           = "Average"
  threshold           = "2"

  dimensions {
    AutoScalingGroupName = "ptype_shfmk_sharedservices_asg_scalegroup"
  }

  alarm_description = "This metric monitors ASG group desired capacity"
  alarm_actions     = ["arn:aws:sns:ap-south-1:701732385417:LONGBOWALERT"]
}

resource "aws_cloudwatch_metric_alarm" "GroupInServiceInstances" {
  alarm_name          = "GroupInServiceInstances"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "2"
  metric_name         = "GroupInServiceInstances"
  namespace           = "AWS/EC2"
  period              = "300"
  statistic           = "Average"
  threshold           = "2"

  dimensions {
    AutoScalingGroupName = "ptype_shfmk_sharedservices_asg_scalegroup"
  }

  alarm_description = "This metric monitors ASG group inservice instances"
  alarm_actions     = ["arn:aws:sns:ap-south-1:701732385417:LONGBOWALERT"]
}