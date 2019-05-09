# frozen_string_literal: true

require 'open-uri'

# This controlls the generation of new words and performs the api call
class GamesController < ApplicationController
  def new
    @letters = []
    10.times { @letters << ('A'..'Z').to_a.sample }
    @letters
  end

  def score
    @letters = params[:letters]
    @word = params[:word].upcase
    @chars = @word.chars
    @url = "https://wagon-dictionary.herokuapp.com/#{@word}"
    @response = JSON.parse(open(@url).read)
    @english = @response['found']
    @length = @response['length']
  end
end
