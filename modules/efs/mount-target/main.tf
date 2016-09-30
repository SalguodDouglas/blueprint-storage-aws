resource "aws_efs_mount_target" "efs-mount-target" {
  count = "${var.mount-targets-count}"
  file_system_id = "${var.efs-id}"
  subnet_id = "${element(split(",", var.subnets), count.index)}"
  security_groups = ["${split(",", var.security-groups)}"]
}