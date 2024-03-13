resource "aws_autoscaling_group" "this" {
  name = "${var.env}-asg"

  # availability_zones        = var.azs
  min_size                  = var.min_size
  max_size                  = var.max_size
  desired_capacity          = var.desired_size
  vpc_zone_identifier       = var.vpc_zone_identifier
  health_check_grace_period = 300
  health_check_type         = "ELB"
  suspended_processes       = ["Terminate"]
  force_delete              = true
  launch_template {
    id      = aws_launch_template.this.id
    version = "$Latest"
  }
}

resource "aws_launch_template" "this" {
  # name                   = "${var.env}-template"
  name_prefix            = "${var.env}-asg"
  image_id               = var.ami_id
  instance_type          = var.instance_type
  user_data              = var.user_data
  vpc_security_group_ids = var.security_group_ids
  iam_instance_profile {
    name = "ecsInstanceRole"
  }
  tags = {
    Environment = "${var.env}"
  }
}


resource "aws_autoscaling_attachment" "this" {
  autoscaling_group_name = aws_autoscaling_group.this.id
  lb_target_group_arn    = var.alb_arn
}
