require 'sinatra'
require 'sinatra/reloader'
enable :sessions


get '/' do

  erb :index

end

def caesar_cipher (string, shift)
  string.split("").collect do |char|
    num = char.ord
    if num.between?(64, 91)
      num = ((num + shift - 65) % 26) + 65
    elsif num.between?(96, 123)
      num = ((num + shift - 97) % 26) + 97
    end
    char = num.chr
  end.join
end
