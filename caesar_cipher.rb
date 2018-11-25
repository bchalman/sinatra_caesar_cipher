require 'sinatra'
require 'sinatra/reloader'
enable :sessions


get '/' do
  converted_string = ""

  if params["string"] && params["shift"]
    string = params["string"]
    shift = params["shift"].to_i
    converted_string = caesar_cipher(string, shift)
  end

  erb :index, :locals => {:cipher => converted_string}
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
