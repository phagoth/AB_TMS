require 'rails_helper'

describe Task do
  it 'has a valid factory' do
    expect(build(:task)).to be_valid
  end

  it 'is invalid without a title' do
    expect(build(:task, title: nil)).to_not be_valid
  end
  
  it 'is invalid with a blank title' do
    expect(build(:task, title: '')).to_not be_valid
  end
  
  it 'is valid without a description' do
    expect(build(:task, description: nil)).to be_valid
  end
  
  it 'is valid with a blank description' do
    expect(build(:task, description: '')).to be_valid
  end
  
  it 'is invalid without a priority' do
    expect(build(:task, priority: nil)).to_not be_valid
  end
  
  it 'is invalid with a blank priority' do
    expect(build(:task, priority: '')).to_not be_valid
  end
  
  it 'is invalid with a NaN priority' do
    expect(build(:task, priority: 'abc')).to_not be_valid
  end
  
  it 'is invalid with a zero priority' do
    expect(build(:task, priority: 0)).to_not be_valid
  end
  
  it 'is invalid with a below zero priority' do
    expect(build(:task, priority: -2)).to_not be_valid
  end
  
  it 'is invalid with a non integer priority' do
    expect(build(:task, priority: 5.8)).to_not be_valid
  end
  
  it 'is invalid without a due date' do
    expect(build(:task, due_date: nil)).to_not be_valid
  end
  
  it 'is invalid with a blank due date' do
    expect(build(:task, due_date: '')).to_not be_valid
  end
  
  it 'is invalid with a wrong due date' do
    expect(build(:task, due_date: '2020-20-20')).to_not be_valid
  end
  
  it 'is invalid with a past due date' do
    expect(build(:task, due_date: Time.now - 10)).to_not be_valid
  end
  
end