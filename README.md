# Jack Up CSS

Developer CSS stylesheet to add outlines and labels to elements.

*Author*: Jake Hickenlooper jake@weboftomorrow.com

Using CSS, it adds an outline and label to the top left corners of HTML elements
having the `jackup` attribute.  The label shows that elements class attribute.
An extra vertical line is added to the left that extends to the top to help show
vertical alignment with other elements.

**Not a fully developed and active project.**  It seems like it may be useful when
doing visual regression testing.

## Usage

Include the [index.css](index.css) CSS stylesheet into the web site and add the
`jackup` attributes to HTML elements as needed.

## Developing

Use the [vendor-grab tool](https://pypi.org/project/vendor-grab/) to further
develop this. The test directory contains SuitCSS style examples for visual
testing.

```bash
vendor_grab vendors.toml
python -m http.server 4444
```

## Contributing

Please contact me or create an issue.

Any submitted changes to this project require the commits to be signed off with
the [git command option
'--signoff'](https://git-scm.com/docs/git-commit#Documentation/git-commit.txt---signoff).
This ensures that the committer has the rights to submit the changes under the
project's license and agrees to the [Developer Certificate of
Origin](https://developercertificate.org).

## License

[MIT License](https://choosealicense.com/licenses/mit/)
Copyright Jake Hickenlooper

## Maintenance

Where possible, an upkeep comment has been added to various parts of the source
code. These are known areas that will require updates over time to reduce
software rot. The upkeep comment follows this pattern to make it easier for
commands like grep to find these comments.

Example UPKEEP comment has at least a 'due:' or 'label:' or 'interval:' value
surrounded by double quotes (").
````
Example-> # UPKEEP due: "2022-12-14" label: "an example upkeep label" interval: "+4 months"
````

The grep command to find all upkeep comments with their line numbers.
```bash
# Search for UPKEEP comments.
grep -r -n -E "^\W+UPKEEP\W+(due:\W?\".*?\"|label:\W?\".*?\"|interval:\W?\".*?\")" .
```
