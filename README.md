# Car On Sale Challenge

## Support

This challenge was made and tested with macOS, but it
should also work with other platforms.

## Login

The default user and password is:
* User: `user@domain.com`
* Password: `password`

You can add more users and passwords in the mocked authentication repository,
in the `lib/data/repositories/authentication_repository.dart`, by changing the
`_users_` field in the `MockAuthenticationRepository` class.

## VIN search

The search will accept any 17-characters text, as long as it contain only valid
VIN characters (all digits and letters, except for `Q`, `I` and `O`).
