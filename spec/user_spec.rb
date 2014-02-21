require 'spec_helper'

describe User do
  it { should validate_uniqueness_of :email }
  it { should validate_uniqueness_of :name }
  it { should validate_presence_of :email }
  it { should validate_presence_of :name }
  it { should allow_value("buchanan.stephenm@gmial.com").for(:email)}
  it { should_not allow_value("buchanan.stephenmgmial.com", "buchanan.stephenm@gmialcom").for(:email)}
end