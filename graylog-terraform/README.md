# graylog-terraform

* https://www.terraform.io/docs/index.html
* https://github.com/suzuki-shunsuke/go-graylog/tree/master/terraform

```
$ cp terraform.tfvars.tpl terraform.tfvars
# set username and access token
$ vi terraform.tfvars
```

```
web_endpoint_uri = "https://graylog.example.com/api"
auth_name = "<user access token>"
auth_password = "token"
```

## How to get an access token

http://docs.graylog.org/en/2.4/pages/configuration/rest_api.html

Get existing user's access tokens.

```sh
$ curl -u <username>:<password> -H 'Accept: application/json' -X GET 'https://graylog.example.com/api/users/<username>/tokens/?pretty=true'
```

Create an access token.
If you don't know an appropriate token name, name `terraform`.

```sh
$ curl -u <username>:<password> -H 'Accept: application/json' -X POST 'https://graylog.example.com/api/users/<username>/tokens/<tokenname>?pretty=true'
```

Delete an access token.

```
$ curl -u <username>:<password> -H 'Accept: application/json' -X DELETE 'https://graylog.example.com/api/users/<username>/tokens/<token>?pretty=true'
```

## Import

https://www.terraform.io/docs/import/usage.html

### How to import user

Add skelton to user.tf .

```
resource "graylog_user" "bob" {
}
```

```
$ terraform import graylog_user.bob <key>
```
