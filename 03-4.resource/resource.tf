// resource <리소스 유형> <이름> {  
//     <인수> = <값>
// }

resource "local_file" "abc" {  
    content  = "123!"  
    filename = "${path.module}/abc.txt"
}

resource aws_instance web {  
    ami           = "ami-a1b2c3d4"  
    instance_type = "t2.micro"
}
