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


########################
resource "aws_cloudwatch_metric_alarm" "CPUUtilization" {
  alarm_name          = "CPUUtilization"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "2"
  metric_name         = "GroupInServiceInstances"
  namespace           = "AWS/EC2"
  period              = "300"
  statistic           = "Average"
  threshold           = "80"

  dimensions {
    AutoScalingGroupName = "ptype_shfmk_sharedservices_asg_scalegroup"
  }

  alarm_description = "This metric monitors ASG group inservice instances"
  alarm_actions     = ["arn:aws:sns:ap-south-1:701732385417:LONGBOWALERT"]
}

resource "aws_cloudwatch_metric_alarm" "DiskReadOps" {
  alarm_name          = "DiskReadOps"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "2"
  metric_name         = "GroupInServiceInstances"
  namespace           = "AWS/EC2"
  period              = "300"
  statistic           = "Average"
  threshold           = "10"

  dimensions {
    AutoScalingGroupName = "ptype_shfmk_sharedservices_asg_scalegroup"
  }

  alarm_description = "This metric monitors ASG group inservice instances"
  alarm_actions     = ["arn:aws:sns:ap-south-1:701732385417:LONGBOWALERT"]
}

resource "aws_cloudwatch_metric_alarm" "DiskWriteOps" {
  alarm_name          = "DiskWriteOps"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "2"
  metric_name         = "GroupInServiceInstances"
  namespace           = "AWS/EC2"
  period              = "300"
  statistic           = "Average"
  threshold           = "10"

  dimensions {
    AutoScalingGroupName = "ptype_shfmk_sharedservices_asg_scalegroup"
  }

  alarm_description = "This metric monitors ASG group inservice instances"
  alarm_actions     = ["arn:aws:sns:ap-south-1:701732385417:LONGBOWALERT"]
}

resource "aws_cloudwatch_metric_alarm" "DiskReadBytes" {
  alarm_name          = "DiskReadBytes"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "2"
  metric_name         = "GroupInServiceInstances"
  namespace           = "AWS/EC2"
  period              = "300"
  statistic           = "Average"
  threshold           = "90"

  dimensions {
    AutoScalingGroupName = "ptype_shfmk_sharedservices_asg_scalegroup"
  }

  alarm_description = "This metric monitors ASG group inservice instances"
  alarm_actions     = ["arn:aws:sns:ap-south-1:701732385417:LONGBOWALERT"]
}

resource "aws_cloudwatch_metric_alarm" "DiskWriteBytes" {
  alarm_name          = "DiskWriteBytes"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "2"
  metric_name         = "GroupInServiceInstances"
  namespace           = "AWS/EC2"
  period              = "300"
  statistic           = "Average"
  threshold           = "90"

  dimensions {
    AutoScalingGroupName = "ptype_shfmk_sharedservices_asg_scalegroup"
  }

  alarm_description = "This metric monitors ASG group inservice instances"
  alarm_actions     = ["arn:aws:sns:ap-south-1:701732385417:LONGBOWALERT"]
}

resource "aws_cloudwatch_metric_alarm" "NetworkIn" {
  alarm_name          = "NetworkIn"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "2"
  metric_name         = "GroupInServiceInstances"
  namespace           = "AWS/EC2"
  period              = "300"
  statistic           = "Average"
  threshold           = "90"

  dimensions {
    AutoScalingGroupName = "ptype_shfmk_sharedservices_asg_scalegroup"
  }

  alarm_description = "This metric monitors ASG group inservice instances"
  alarm_actions     = ["arn:aws:sns:ap-south-1:701732385417:LONGBOWALERT"]
}

resource "aws_cloudwatch_metric_alarm" "NetworkOut" {
  alarm_name          = "NetworkOut"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "2"
  metric_name         = "GroupInServiceInstances"
  namespace           = "AWS/EC2"
  period              = "300"
  statistic           = "Average"
  threshold           = "90"

  dimensions {
    AutoScalingGroupName = "ptype_shfmk_sharedservices_asg_scalegroup"
  }

  alarm_description = "This metric monitors ASG group inservice instances"
  alarm_actions     = ["arn:aws:sns:ap-south-1:701732385417:LONGBOWALERT"]
}

resource "aws_cloudwatch_metric_alarm" "NetworkPacketsIn" {
  alarm_name          = "NetworkPacketsIn"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "2"
  metric_name         = "GroupInServiceInstances"
  namespace           = "AWS/EC2"
  period              = "300"
  statistic           = "Average"
  threshold           = "90"

  dimensions {
    AutoScalingGroupName = "ptype_shfmk_sharedservices_asg_scalegroup"
  }

  alarm_description = "This metric monitors ASG group inservice instances"
  alarm_actions     = ["arn:aws:sns:ap-south-1:701732385417:LONGBOWALERT"]
}

resource "aws_cloudwatch_metric_alarm" "NetworkPacketsIn" {
  alarm_name          = "NetworkPacketsIn"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "2"
  metric_name         = "GroupInServiceInstances"
  namespace           = "AWS/EC2"
  period              = "300"
  statistic           = "Average"
  threshold           = "90"

  dimensions {
    AutoScalingGroupName = "ptype_shfmk_sharedservices_asg_scalegroup"
  }

  alarm_description = "This metric monitors ASG group inservice instances"
  alarm_actions     = ["arn:aws:sns:ap-south-1:701732385417:LONGBOWALERT"]
}

resource "aws_cloudwatch_metric_alarm" "StatusCheckFailed" {
  alarm_name          = "StatusCheckFailed"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "2"
  metric_name         = "GroupInServiceInstances"
  namespace           = "AWS/EC2"
  period              = "300"
  statistic           = "Average"
  threshold           = "90"

  dimensions {
    AutoScalingGroupName = "ptype_shfmk_sharedservices_asg_scalegroup"
  }

  alarm_description = "This metric monitors ASG group inservice instances"
  alarm_actions     = ["arn:aws:sns:ap-south-1:701732385417:LONGBOWALERT"]
}

resource "aws_cloudwatch_metric_alarm" "StatusCheckFailed_Instance" {
  alarm_name          = "StatusCheckFailed_Instance"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "2"
  metric_name         = "GroupInServiceInstances"
  namespace           = "AWS/EC2"
  period              = "300"
  statistic           = "Average"
  threshold           = "90"

  dimensions {
    AutoScalingGroupName = "ptype_shfmk_sharedservices_asg_scalegroup"
  }

  alarm_description = "This metric monitors ASG group inservice instances"
  alarm_actions     = ["arn:aws:sns:ap-south-1:701732385417:LONGBOWALERT"]
}