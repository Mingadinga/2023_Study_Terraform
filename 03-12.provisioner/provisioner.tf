variable "sensitive_content" {
  default   = "secret"
  sensitive = true
}

resource "local_file" "foo" {
  content  = upper(var.sensitive_content)
  filename = "${path.module}/foo.bar"

	// self 참조 : sensitive여서 값은 출력 안됨
  provisioner "local-exec" {
    command = "echo The content is ${self.content}"
  }
	
	// 존재하지 않는 커맨드 실행 : on_failure 설정으로 실패해도 계속 진행
  provisioner "local-exec" {
    command    = "abc"
    on_failure = continue
  }

	// terraform destroy할 때 실행됨
  provisioner "local-exec" {
    when    = destroy
    command = "echo The deleting filename is ${self.filename}"
  }
}