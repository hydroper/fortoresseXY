# HTTP server

## Sign in

Sign in includes IP and captcha validation, similiar to the account creation validation.

## Account creation

Validation after filling the required fields:

1. Register last account creation attempt at the same IP.
2. Lock mass account creation
    1. Through IP. If the last attempt to create an account through the same IP is shorter than 10 minutes
        1. Return failure response.
    2. Through captcha.
3. If e-mail or username is duplicate
    1. If the duplicate field identifies an unverified account
        1. Delete the unverified account.
    1. Else return failure response.
4. Require e-mail verification until 5 minutes, otherwise the account is deleted from the database.

## Private socket APIs

The socket server side has exclusive APIs at the HTTP server side.

* The secret bridge key allows solely the socket server side to access these APIs from the HTTP server side.
* Avoid signing into account by instead taking advantage of the secret bridge key.