# Restkit django-rest-framework Snippet ios example project

This project uses [Restkit](https://github.com/RestKit/RestKit) on top of a [django-rest-framework](http://www.django-rest-framework.org/)'s [demo api hosted on heroku](https://restframework.herokuapp.com/).

## Most interesting files

* [RKSnippet/AppDelegate.m](RKSnippet/AppDelegate.m) registers Restkit
* [RKSnippet/RKSnippetViewController.m](RKSnippet/RKSnippetViewController.m) does the API calls and maps to model
* [RKSnippet/RKSnippet.m](RKSnippet/RKSnippet.m) the model used

## Current status

![Example](/Documentation/example.png)

## Todo

- [x] Fetch all snippets (1st page)
- [ ] Add pagination support
- [ ] Add a view to visit a single snippet
- [ ] Support authentication

## Contributing

Yes! Contribute! Send me a pull-request, ask me questions, open source all the things! :tada:

# License

MIT © [Gabriel Le Breton](https://gableroux.com)
