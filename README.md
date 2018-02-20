# Development

## App startup procedure

To start webpack:

```bash
npm start
```

To start resque workers:

```bash
QUEUE=* rake environment resque:work
```

To start redis:

```bash
redis-server
```
To start rails server:

```bash
rails s
```

# Security testing

## Rails application

### Gem (component) related security issues

To check the Gemfile.lock file for vulnerabilities in the versions of the
gems used:

```bash
bundle-audit update
bundle-audit check
```

### Vulnerabilities in code

To check for vulnerabilities in the Rails application:

```bash
brakeman
```

To export this report to an HTML file containing where in the code are the
vulnerabilities, use:

```bash
brakeman -o brakeman.html
```

## Javascript components (JQuery, Node.js...)

For running these checks, go to your Node.js environment and install Retire.js:

```bash
npm install -g retire
```

and then run on the project folder:

```bash
retire
```
