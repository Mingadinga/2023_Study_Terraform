variable "enable_file" {
  default = true
}

# true이면 생성
# false이면 생성하지 않음
resource "local_file" "foo" {
  count    = var.enable_file ? 1 : 0
  content  = "foo!"
  filename = "${path.module}/foo.bar"
}

output "content" {
  value = var.enable_file ? local_file.foo[0].content : ""
}