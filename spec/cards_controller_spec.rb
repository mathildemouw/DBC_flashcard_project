require 'spec_helper'
require 'cool_faker'

describe 'cards controller' do
  before do
    @card = Card.create(question: "Have you ever danced with the devil in the pale moonlight?", answer: "Bruce, your parents are dead")
    10.times { Card.create(question: CoolFaker::Team.slogan, answer: CoolFaker::Team.slogan) }
  end

  it "should redirect on get '/cards'" do
    get '/cards'
    expect(last_response.redirect?).to be_true
  end

  it "should redirect if the answer is right" do
    get "/cards/#{@card.id}", answer: @card.answer
    expect(last_response.redirect?).to be_true
  end

  it "should NOT redirect if the answer is NOT right" do
    get "/cards/#{@card.id}", answer: "Stephen rocks"
    expect(last_response.redirect?).to be_false
  end

  after do
    Card.all.each { |card| Card.find(card.id).destroy }
  end

end