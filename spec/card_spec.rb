require 'spec_helper'

describe Card do
  it { should  validate_presence_of :question }
  it { should  validate_presence_of :answer }
  it { should  validate_uniqueness_of :question}
end
