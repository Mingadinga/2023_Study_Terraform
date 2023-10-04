resource "random_password" "password1" {
    length = 16
    special = true
    override_special = "!#$%"
}

resource "random_password" "password2" {
    length = 8
    special = false
    override_special = "!#$%"
}