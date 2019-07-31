Hack.destroy_all
Response.destroy_all
User.destroy_all
Writer.destroy_all


##### USER
# username, password
admin = User.create(username: "admin", password: "password")
martin = User.create(username: "cancer", password: "password")
franz =  User.create(username: "kafka", password: "gun")
jeremy = User.create(username: "bentham", password: "utility")
sleipnir = User.create(username: "sleipnir", password: "huggin")
ashna = User.create(username: "ashna", password: "ashna")




##### HACK
# heading, content, writer_id
long_int = Hack.create( heading: "Long Integers",
                        content: " # Writing large Integers \n
                        123_456_789 \n
                        # => 123456789"
                      )

each_slice = Hack.create(
                        heading: "Each Slice",
                        content: "# each_slice \n

                        (1..10).each_slice(3) {|a| p a} \n
                        # => [1, 2, 3] \n
                        # => [4, 5, 6]")

neg_array = Hack.create(
                        heading: "Negative Array Indicies",
                        content: "array = [:a, :b, :c, :d, :e] \n

                        array[-1] # => :e \n
                        array[0..-3] # => [:a, :b, :c]")

eval_symbol_string = Hack.create(
                        heading: "Evaluating a Symbol vs String",
                        content: " 'foo'.__id__ == 'foo'.__id__ # => false \n
                        :foo.__id__  == :foo.__id__  # => true")

meth_incep = Hack.create(
                        heading: "Method Inception",
                        content:
                        "# Passing a method taking a block to another method or object \n
                        %w[Hello World].each &method(:puts) \n
                        # Hello World"
                        )

path_name = Hack.create(
                        heading: "Finding Your Path",
                        content: "
                        require 'pathname' \n

                        pn = Pathname.new(%Q/usr/bin/ruby%Q) \n
                        pn.size        # => 52016 \n
                        pn.directory?  # => false \n
                        pn.dirname     # => Pathname:/usr/bin \n
                        pn.basename    # => Pathname:ruby \n
                        pn.to_s        # => %Q/usr/bin/ruby%Q"
                        )




##### COMMENT
#user_id, hack_id, likes, comment
