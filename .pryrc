instance_eval do
  def shrink_object_name(name)
    splitted = name.to_s.split('::')
    splitted.map! { |split| split.gsub(/0x(\h)\h{14}(\h)/, '0x\1…\2') }

    if splitted.count <= 4
      splitted.join('::')
    else
    "#{splitted[0]}::…::#{splitted[-1]}"
    end
  end

  logo = Pry::Helpers::Text.green(Pry::Helpers::Text.bold('λ'))
  Pry.config.prompt = lambda do |obj, nest_level, _|
    obj_name_shrunk = shrink_object_name(obj)
    "[#{nest_level}](#{obj_name_shrunk}) #{logo} "
  end
end

Pry.config.ls.separator = "\n" # new lines between methods

## Useful Collections

class Array
  def self.toy(n=10, &block)
    block_given? ? Array.new(n,&block) : Array.new(n) {|i| i+1}
  end
end

class Hash
  def self.toy(n=10)
    Hash[Array.toy(n).zip(Array.toy(n){|c| (96+(c+1)).chr})]
  end
end

def do_time(repetitions = 100, &block)
  require 'benchmark'
  Benchmark.bm{|b| b.report{repetitions.times(&block)}}
end


Pry.config.color = true

Pry.config.commands.alias_command "h", "hist -T 20", desc: "Last 20 commands"
Pry.config.commands.alias_command "hg", "hist -T 20 -G", desc: "Up to 20 commands matching expression"
Pry.config.commands.alias_command "hG", "hist -G", desc: "Commands matching expression ever used"
Pry.config.commands.alias_command "hr", "hist -r", desc: "hist -r <command number> to run a command"

begin
  require 'awesome_print'
  # Pry.config.print = proc { |output, value| output.puts value.ai }
  AwesomePrint.pry!
rescue LoadError => err
  puts "no awesome_print :("
end

# Hit Enter to repeat last command
Pry::Commands.command /^$/, "repeat last command" do
  _pry_.run_command Pry.history.to_a.last
end


puts "Loaded ~/.pryrc"
