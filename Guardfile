# uncomment to use AsciiDoctor
# require 'asciidoctor'
# require 'erb'

# Add files and commands to this file, like the example:
#   watch(%r{file/path}) { `command(s)` }

guard :shell do
  watch(/(.*).asc|(.*).css/) {|m|

    book = "resume.asc"
    
    n m[0], 'File Changed', :success

    # generate HTML
    # `asciidoc #{m[0]}`
    # n m[0].gsub('asc','html'), 'File Created', :success
    # `asciidoc -a max-width=55em #{book}`
    `asciidoctor -a max-width=55em -a stylesheet=./resume.css #{book}`    
    n book.gsub('asc','html'), 'File Created', :success

    # generate XML (precursor for ePUB, PDF, Mobi)
    # `asciidoc -b docbook #{m[0]}`
    # n m[0].gsub('asc','xml'), 'File Created', :success

   	# generate ePub
    # `a2x -v -f epub -d book -a docinfo --fop #{m[0].gsub("asc","xml")}`
    # `a2x -v -f epub -d book -a docinfo --fop #{m[0]}`
    # n m[0].gsub('asc','epub'), 'File Created', :success
    # `a2x -v -f epub -d book -a docinfo --fop #{book}`
    # n book.gsub('asc','epub'), 'File Created', :success

   	# generate PDF
     # `a2x -v -f pdf -d book -a docinfo #{m[0].gsub("asc","xml")}`
     # `a2x -v -f pdf -d book -a docinfo --fop #{m[0]}`
    # n m[0].gsub('asc','pdf'), 'File Created', :success
    `a2x -v -f pdf -d book -a docinfo --fop #{book}`
    n book.gsub('asc','pdf'), 'File Created', :success

	# use Ruby implementations
#    Asciidoctor.render_file(m[0], {:in_place => true, :safe => :unsafe})

  }

end
