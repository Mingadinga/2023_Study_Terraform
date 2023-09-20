terraform {
    required_version = "> 1.3.0" # 테라폼 버전 
    // backend "local" {
    //     path = "state/terraform.tfstate"
    // }
}

resource "local_file" "abc" {
    content  = "123!"
    filename = "${path.module}/abc.txt}"
}