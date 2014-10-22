require 'spec_helper'

describe LinkedItem do
  it 'is invalid when created from a garbage url' do
    item = LinkedItem.from_url('http://garbage.garbage')

    expect(item.valid?).to be_false
    expect(item.errors).to include(:bad_url)
  end

  it 'is invalid when created from a url to non-text content' do
    item = LinkedItem.from_url('http://lorempixel.com/400/200/')

    expect(item.valid?).to be_false
    expect(item.errors).to include(:unknown_content_type)
  end

  it 'is valid when created from a url to text content' do
    item = LinkedItem.from_url('http://example.com')

    expect(item.valid?).to be_true
  end

  it 'is valid when leaving the protocol off' do
    item = LinkedItem.from_url('example.com')

    expect(item.valid?).to be_true
  end
end
