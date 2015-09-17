require 'rails_helper'

describe User do
  it 'has a valid factory' do
    expect(build(:user)).to be_valid
  end

  it 'is invalid without a first name' do
    expect(build(:user, first_name: nil)).to_not be_valid
  end
  
  it 'is invalid with a blank first name' do
    expect(build(:user, first_name: '')).to_not be_valid
  end
  
  it 'is invalid without a last name' do
    expect(build(:user, last_name: nil)).to_not be_valid
  end
  
  it 'is invalid with a blank last name' do
    expect(build(:user, last_name: '')).to_not be_valid
  end
  
  it 'is invalid without a email' do
    expect(build(:user, email: nil)).to_not be_valid
  end
  
  it 'is invalid with a blank email' do
    expect(build(:user, email: '')).to_not be_valid
  end
  
  it 'is invalid without a password' do
    expect(build(:user, password: nil)).to_not be_valid
  end
  
  it 'is invalid with a blank password' do
    expect(build(:user, password: '')).to_not be_valid
  end
  
  it 'is invalid with a short password' do
    expect(build(:user, password: '1234567')).to_not be_valid
  end

  it 'has proper full name' do
    new_user = build(:user)
    expect(new_user.full_name).to eq("#{new_user.first_name} #{new_user.last_name}")
  end

end