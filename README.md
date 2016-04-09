# Vapor Website

This is the source code for [Vapor's Website](http://qutheory.io)

## Documentation

View [Vapor](https://github.com/qutheory/vapor) for more info and documentation.

## Vue.js

This website uses Vue.js with Browserify for the front-end. The `package.json` file has been modified to build and serve the Vapor server using the respective commands.

```sh
npm run serve
npm run dev
```

## Components

A new directory was added to the Resources folder called Components. Here all of the front end source code for components is held. The components house the entirety of the website's styles and scripts. They are served using mustache templates to include a header and footer.
