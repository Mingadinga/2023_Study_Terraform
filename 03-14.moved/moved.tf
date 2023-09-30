resource "local_file" "b" {
    content  = "foo!"
    filename = "${path.module}/foo.bar"
}

output "file_content" {
    value = local_file.b.content
}

# 적용 후 주석 처리 필요
moved {
    from = local_file.a
    to = local_file.b
}