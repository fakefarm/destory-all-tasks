require 'spec_helper'

describe Task do
  it 'can be created' do
    task = Task.new
    expect(task).to be_valid
  end

  it 'sets due_date' do
    task = Task.create
    time = Time.now
    expect(task.due_date).to eq time # timecop gem.
  end
end
