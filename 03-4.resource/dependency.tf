resource "local_file" "abc-dep" {
  content  = "123!"
  filename = "${path.module}/abc.txt"
}

resource "local_file" "def-dep" {
  content  = local_file.abc-dep.content
  filename = "${path.module}/def.txt"
}