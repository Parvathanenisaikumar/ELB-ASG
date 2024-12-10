resource "aws_elb" "elb" {
  name            = "terraform-loadbalancer"
  subnets         = [aws_subnet.subnet_one.id, aws_subnet.subnet_two.id]
  security_groups = [aws_security_group.sg.id]
  listener {
    instance_port     = 80
    instance_protocol = "HTTP"

    lb_port     = 80
    lb_protocol = "HTTP"
  }
}
resource "aws_autoscaling_attachment" "attach" {
  autoscaling_group_name = aws_autoscaling_group.asg.name
  elb                    = aws_elb.elb.name
}
