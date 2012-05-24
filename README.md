Overview [![Incite Build Status][Build Icon]][Build Status]


Incite is in alpha alpha stage.  It's useless, don't install it.

# Usage

* Note: This syntax is very experimental, and will likely--no, definitely--change in a radical way (see above).

```
irb> require 'lib/incite'
=> true
```

First you need to instantiate a source you want to cite:

```
irb> source = Incite::Source.new
=> #<Incite::Source:0x8c5f0>
```

Sources don't require any parameters to be created, but obviously you're not going to get a very useful citation:

```
irb> source.citation(:note)
=> ", <em></em> (: , ), ."
```

So lets add some metadata and try again. When we're talking about citations, proper attribution is usually the most pressing task:

```
irb> source.authors = ["Some Guy", "Smart Gal"]
=> ["Some Guy", "Smart Gal"]
irb> source.citation(:note)
=> "Smart Gal and Some Guy, <em></em> (: , ), ."
```

OK.  That's a little better.  It's even sorted them for you!  Unfortunately...it also spat out a bunch of garbage relating to other unavailable data.  In the future the plan is for Incite to be intelligent about how to format 'partial' sources (this has begun to be implemented, but needs to be a lot more robust).

# Other future plans

* Integration with various bibliographies (Google Books, Amazon, &c?)
* Citation text
* Source types
* Minimal validations of metadata
* Different type of formats (to_s, to_rtf)
