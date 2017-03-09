# pool
variable "pool" {
	default = "public"
}

# keypair
variable "keypair" {
	default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCoj+AJej+p324R08l8Y7trRweM+2OlmvGHIJNW6U7VWDS0jSFr3QJJQsBIJ1KLCxIP0alveWNqUMz4xbUBof8Ai8ULelN5Gk64EsRmkH2BncxsKkoraVYr0hBom+k6d7jyONZLYohtKrGyIRC5h2RfwypCDJkAjV10XpJWOsJCJkPPl+8vuLNRdyPQqx6iBiy7mwDDuF6oNW7CZK3HPe2n9geZSTtjE18FNvHvCTOITVWSnGdSPy2e89ahemM0B3ROoaogn76Xw0BeNrhUfywXyA4GaS4F1Y28uduvXIO8QRaIiIWRjhPH83wswjnPnDciPEg7/uAa/yZSy1SXFU5V"
}

#Ip flotantes
variable "id_ip_flottante" { 
	default = ["84.39.49.19","84.39.46.157","84.39.44.165","84.39.41.206"]
} 
