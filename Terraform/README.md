## Creating variables

```tf
variable "myVar" {
	type = string
	default = "hello terraform"
}

variable "myMap" {
        type = map(string)
        default = {
		myKey = "my value"
	}
}

variable "myList" {
        type = list
        default = [1,2,3]
}

variable "myBool" {
        type = bool
        default = false
}
```


