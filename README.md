# Overview [![Incite Build Status][Build Icon]][Build Status]

[Build Status]: http://travis-ci.org/tfwright/incite
[Build Icon]: https://secure.travis-ci.org/tfwright/incite.png?branch=master

Incite is in alpha alpha stage.  It's useless, don't install it.

# Installation

Incite is available as a ruby gem.

```ruby
gem install incite
```

# Usage

* Note: This syntax is very experimental, and will likely--no, definitely--change in a radical way (see above).

First you need to instantiate a source you want to cite:

```ruby
source = Incite::Source.new
=> #<Incite::Source:0x8c5f0>
```

Configure the source with the bibliographical data.  The minimum required attributes are  title, author(s), publisher, and year. 

```ruby
source.authors = ["Sam Dandy"]
source.title = "A Brief Flirtation"
source.publisher = "Rainbow Unicorn Press"
source.year = 1985
```

Yes, I just made all of that up.  I should have been a writer.  Now you can cite your source:

```ruby
source.citation(:entry)
=> "Sam Dandy. <em>A Brief Flirtation</em>. : Rainbow Unicorn Press, 1985."
```

If you try to create a citation when this data is missing you'll get an error.

```ruby
source.title = nil
# => nil
source.citation(:entry)
# => ArgumentError: Source lacks attributes required to construct citation
```

Most citations require more data, viz. page numbers.  

# Other future plans

* Integration with various bibliographies (Google Books, Amazon, &c)
* Citation text (for annotated notes/bibliographies)
* Source types (book, article, chapter &c)
* Different type of formats (to_s, to_rtf, &c)
