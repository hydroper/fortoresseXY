# HTTP server

## Sign in

Sign in includes IP and captcha validation, similiar to the account creation validation.

## Account creation

Validation after filling the required fields:

1. If e-mail or username is duplicate
    1. Return failure response.
2. Register last account creation attempt at the same IP.
3. Lock mass account creation
    1. Through IP. If the last attempt to create an account through the same IP is shorter than 10 minutes
        1. Return failure response.
    2. Through captcha.
4. Require e-mail verification until 5 minutes, otherwise the account is deleted from the database.