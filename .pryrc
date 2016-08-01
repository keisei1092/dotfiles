# ===== editor
Pry.editor = 'vim'

# ===== command aliases
Pry.commands.alias_command 'c', 'continue' rescue nil
Pry.commands.alias_command 's', 'step' rescue nil
Pry.commands.alias_command 'n', 'next' rescue nil
Pry.commands.alias_command 'r!', 'reload!' rescue nil
Pry.commands.alias_command 'e', 'exit' rescue nil

# ===== theme
Pry.config.color = true
Pry.config.theme = "solarized"

# === Listing config ===
# Better colors - by default the headings for methods are too 
# similar to method name colors leading to a "soup"
# These colors are optimized for use with Solarized scheme 
# for your terminal
Pry.config.ls.separator = "\n" # new lines between methods
Pry.config.ls.heading_color = :magenta
Pry.config.ls.public_method_color = :green
Pry.config.ls.protected_method_color = :yellow
Pry.config.ls.private_method_color = :bright_black

# ===== plugins
# awesome_print gem: great syntax colorized printing
# look at ~/.aprc for more settings for awesome_print
require 'interactive_editor'
begin
  require 'rubygems'
  require 'awesome_print'
  require 'awesome_print_colors'

  # AwesomePrint.defaults={ 
  #               :theme=>:solorized,
  #               :indent => 2,
  #               :sort_keys => true,
  #               :color => {
  #                 :args       => :greenish,
  #                 :array      => :pale,
  #                 :bigdecimal => :blue,
  #                 :class      => :yellow,
  #                 :date       => :greenish,
  #                 :falseclass => :red,
  #                 :fixnum     => :blue,
  #                 :float      => :blue,
  #                 :hash       => :pale,
  #                 :keyword    => :cyan,
  #                 :method     => :purpleish,
  #                 :nilclass   => :red,
  #                 :string     => :yellowish,
  #                 :struct     => :pale,
  #                 :symbol     => :cyanish,
  #                 :time       => :greenish,
  #                 :trueclass  => :green,
  #                 :variable   => :cyanish
  #             }
  #          }



  AwesomePrint.defaults={:theme=>:solorized}