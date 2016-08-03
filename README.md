# instagram-auth

This application is an example of how to use the [Instagram API](https://www.instagram.com/developer/authentication/) for authentication.

![alt text](https://github.com/tolkiana/instagram-auth/blob/master/screenshots/sign.png "sign")
![alt text](https://raw.githubusercontent.com/tolkiana/instagram-auth/master/screenshots/user.png "user")

```InstagramService``` is the class that handles the authentication, implements the following functions:

```
    func startAuthorization(withURL url: NSURL)
    func requestAccessToken(withCode code: String)
    func logout()
```

Implementation of ```InstagramDelegate``` is needed to get callback from the first two functions, posible callbacks are:

```
    func didGetAuthorizationCode(code: String)
    func didFailAuthorizing()
    func didGetAccessToken(token: String, forUser user: User)
    func didFailGettingAccessToken()
```


Some of the concepts applied to build this example are:

- Generics
- Protocols
- MVVM
