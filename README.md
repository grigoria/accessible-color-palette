[![acp](https://image.ibb.co/kve88G/accessible_color_pal_copy.png)](https://nodesource.com/products/nsolid)


## Introduction

Accessible color palette is a tool for easily generating color palettes based on accessibility standards. You can, not only create a color scheme for a website but also check the contrast of your color design for accessibility based on Web Content Accessibility Guideline (WCAG).

## Use it

[WIP] [Accessible color palette](https://accessible-color-palette.herokuapp.com/)


## How it works

The tool is using the [Colourlovers](http://www.colourlovers.com/) API to generate palettes based on a color and then calculates the contrast ratio between the background color and the rest of the colors.


## Tools used

- [A simple gem to use to make it easy to use the COLOURlovers API](https://github.com/chrism/COLOURlovers)
- [WCAGColorContrast](https://github.com/mkdynamic/wcag_color_contrast)


## Contributing

Accessible color palettes is a tool built in Ruby. In order to contribute please:

1. Fork the repository
2. `cd accessible-color-palettes`
3. `bundle install`
4. Run server: `bin/rails s`
5. Create your feature branch (`git checkout -b my-new-feature`)
6. Make changes
7. Commit your changes (`git commit -m 'Add some feature'`)
8. Push to the branch (`git push -u origin my-new-feature`)
9. Create new Pull Request


## License

This work is licensed under a [Creative Commons Attribution 4.0 International license](https://creativecommons.org/licenses/by/4.0/).


## Credits

* Grigoria Pontiki / [@grigoriap](https://twitter.com/grigoriap) / [www.grigoria.gr](http://www.grigoria.gr)
* Agis Anastasopoulos / [@agis](https://twitter.com/agisanast) / [http://agis.io/](http://agis.io/)
