resource "aws_security_group" "sharedservices_sg" {
	name = "sharedservices_sg"
        vpc_id = "vpc-f31d399a"
	ingress {
		from_port = 0
		to_port = 65535
		protocol = "tcp"
		cidr_blocks = ["0.0.0.0/0"]
	}

	lifecycle {
		create_before_destroy = true
	}
}

resource "aws_security_group" "elb_sg" {
	name = "elb_sg"
        vpc_id = "vpc-f31d399a"
	ingress {
		from_port = 0
		to_port = 65535
		protocol = "tcp"
		cidr_blocks = ["0.0.0.0/0"]
	}

	egress {
		from_port = 0
		to_port = 0
		protocol = "-1"
		cidr_blocks = ["0.0.0.0/0"]
	}

	lifecycle {
		create_before_destroy = true
	}
}

resource "aws_key_pair" "myawskeypair" {
	key_name = "myawskeypair"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCvKPqwwqB7rzPrM7N2VyjSGH2YH/t+atSHKISiwA8J1SDyrmi4qN44LjchqEaVZL08pT0PuaPNvVFSVnv2Wjjy/z7H33a2n6yjNm3KTl3AV7oAFxCCaPxXi7KjBmXXv8fGRPVvSAnr/iPreVCNcJFx9syqmoIV7aDWa/cCYD/VbCTcnEJSwBbQGaY3vldcD812og5S75FL/M51Xgw1YsHJZM1/v0w8sjiQgCJ4PiIF7OGwxF72chPjN97cNh2neAd/wwg86d8UloCGZE8UcVv4ay7ebKuMWTqqBslsK52AEMEMI9Gz2XpQDfZYWX41jL3S3sV3+JPDyll3Z2OAdUJH root@client.lbtech.in"
}
#	public_key = "${file("awskey.pub")}"
#}

data "aws_availability_zones" "allzones" {}

resource "aws_elb" "ptype_shfmk_sharedservices_elb" {
        name = "ptype-shfmk-sharedservices-elb"
        security_groups = ["${aws_security_group.elb_sg.id}"]
        subnets = ["subnet-d8f6dbb1", "subnet-ff3ea4b2"]
	access_logs {
		bucket = "elb-log.sharedservices"
		bucket_prefix = "elb"
		interval = 5
	}
	listener {
		instance_port = 80
		instance_protocol = "http"
		lb_port = 80
		lb_protocol = "http"
	}
	health_check {
		healthy_threshold = 2
		unhealthy_threshold = 2
		timeout = 3
		target = "HTTP:80/"
			interval = 30
	}

	cross_zone_load_balancing = true
	idle_timeout = 400
	connection_draining = true
	connection_draining_timeout = 400

	tags {
		Name = "terraform-elb"
	}
}

resource "aws_launch_configuration" "ptype_shfmk_sharedservices_asg_launch_config" {
     name = "ptype_shfmk_sharedservices_asg_launch_config"
     image_id = "ami-29bdc246"
     instance_type = "t2.micro"
     security_groups = ["${aws_security_group.sharedservices_sg.id}"]
     key_name = "${aws_key_pair.myawskeypair.key_name}"
     user_data = "${file("userdata.txt")}"
     lifecycle {
	 create_before_destroy = true
     }
     depends_on = ["aws_elb.ptype_shfmk_sharedservices_elb"]
}

resource "aws_autoscaling_group" "ptype_shfmk_sharedservices_asg_scalegroup" {
        name = "ptype_shfmk_sharedservices_asg_scalegroup"
	launch_configuration = "${aws_launch_configuration.ptype_shfmk_sharedservices_asg_launch_config.name}"
	availability_zones = ["${data.aws_availability_zones.allzones.names}"]
	min_size = 1
	max_size = 4
	enabled_metrics = ["GroupMinSize", "GroupMaxSize", "GroupDesiredCapacity", "GroupInServiceInstances",                            "GroupTotalInstances"]
	metrics_granularity = "1 Minute"
	load_balancers = ["${aws_elb.ptype_shfmk_sharedservices_elb.id}"]
	health_check_type = "ELB"
	tag {
		key = "Name"
		value = "terraform-asg-example"
		propagate_at_launch = true
	}
        depends_on = ["aws_launch_configuration.ptype_shfmk_sharedservices_asg_launch_config"]
}

resource "aws_autoscaling_policy" "ptype_shfmk_sharedservices_autopolicy" {
	name = "ptype_shfmk_sharedservices_autopolicy"
	scaling_adjustment = 1
	adjustment_type = "ChangeInCapacity"
	cooldown = 300
	autoscaling_group_name = "${aws_autoscaling_group.ptype_shfmk_sharedservices_asg_scalegroup.name}"
       depends_on = ["aws_autoscaling_group.ptype_shfmk_sharedservices_asg_scalegroup"]
}

resource "aws_cloudwatch_metric_alarm" "ptype_shfmk_sharedservices_cpualarm" {
	alarm_name = "terraform-alarm"
	comparison_operator = "GreaterThanOrEqualToThreshold"
	evaluation_periods = "2"
	metric_name = "CPUUtilization"
	namespace = "AWS / EC2"
	period = "120"
	statistic = "Average"
	threshold = "60"

	dimensions {
		AutoScalingGroupName = "${aws_autoscaling_group.ptype_shfmk_sharedservices_asg_scalegroup.name}"
	}

	alarm_description = "This metric monitor EC2 instance cpu utilization"
	alarm_actions = ["${aws_autoscaling_policy.ptype_shfmk_sharedservices_autopolicy.arn}"]
        depends_on = ["aws_autoscaling_group.ptype_shfmk_sharedservices_asg_scalegroup"]
}

#
resource "aws_autoscaling_policy" "sharedservices_autopolicy-down" {
	name = "sharedservices_autopolicy-down"
	scaling_adjustment = -1
	adjustment_type = "ChangeInCapacity"
	cooldown = 300
	autoscaling_group_name = "${aws_autoscaling_group.ptype_shfmk_sharedservices_asg_scalegroup.name}"
        depends_on = ["aws_autoscaling_group.ptype_shfmk_sharedservices_asg_scalegroup"]
}

resource "aws_cloudwatch_metric_alarm" "ptype_shfmk_sharedservices_cpualarm-down" {
	alarm_name = "terraform-alarm-down"
	comparison_operator = "LessThanOrEqualToThreshold"
	evaluation_periods = "2"
	metric_name = "CPUUtilization"
	namespace = "AWS/EC2"
	period = "120"
	statistic = "Average"
	threshold = "10"

	dimensions {
		AutoScalingGroupName = "${aws_autoscaling_group.ptype_shfmk_sharedservices_asg_scalegroup.name}"
	}

	alarm_description = "This metric monitor EC2 instance cpu utilization"
	alarm_actions = ["${aws_autoscaling_policy.sharedservices_autopolicy-down.arn}"]
        depends_on = ["aws_autoscaling_group.ptype_shfmk_sharedservices_asg_scalegroup"]
}

resource "aws_security_group_rule" "ptype_shfmk_sharedservices_ssh" {
	security_group_id = "${aws_security_group.sharedservices_sg.id}"
	type = "ingress"
	from_port = 22
	to_port = 22
	protocol = "tcp"
	cidr_blocks = ["60.242.1.0/32"]
}

resource "aws_lb_cookie_stickiness_policy" "ptype_shfmk_sharedservices_cookie_stickness" {
	name = "cookiestickness"
	load_balancer = "${aws_elb.ptype_shfmk_sharedservices_elb.id}"
	lb_port = 80
	cookie_expiration_period = 600
}