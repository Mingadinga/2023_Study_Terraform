resource "local_file" "step7" {
    content  = ""
    filename = "${path.module}/step7.txt"

    lifecycle {
        postcondition {
            condition = self.content != ""
            error_message = "content cannot be empty"
        }
    }
}

output "step7_content" {
    value = local_file.step7.id
}