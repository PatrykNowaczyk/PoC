resource "aws_alb" "my-alb"{
  name = "my-alb"
  subnets = ["${aws_subnet.main-public-1.id}", "${aws_subnet.main-public-2.id}"]
  security_groups = ["${aws_security_group.WebServer_linux.id}"]
  
   tags = {  
    Name = "my-alb"
	}
  }

resource "aws_alb_target_group" "frontend-target-group" {
  name = "alb-target-group"
  port = 80
  protocol = "HTTP"
  vpc_id   = "${aws_vpc.main.id}"
  
    health_check {
	  path = "/index.html"
	  port = 80
	  healthy_threshold = 6
	  unhealthy_threshold = 3
	  timeout = 3
	  interval = 5
	  matcher = "200"
  }
 }
resource "aws_alb_target_group_attachment" "test1" {
  target_group_arn = "${aws_alb_target_group.frontend-target-group.arn}"
  target_id        = "${aws_instance.WebServerInstance01.id}"
  port             = 80
  }
  
resource "aws_alb_target_group_attachment" "test2" {
  target_group_arn = "${aws_alb_target_group.frontend-target-group.arn}"
  target_id        = "${aws_instance.WebServerInstance02.id}"
  port             = 80
  }
  
resource "aws_alb_listener" "test-frontend-listeners" {
  load_balancer_arn = "${aws_alb.my-alb.arn}"
  port = "80"
  
  default_action {
    target_group_arn = "${aws_alb_target_group.frontend-target-group.arn}"
	type = "forward"
	}
}
  