require 'spec_helper'

describe 'SearchResult' do
  let(:search_result_dat) { File.open('spec/html/search_result/tokachi.dat', 'r+:shift_jis', &:read) }

  context do
    subject { Pdql::SearchResult.new(search_result_dat) }
    it { expect(subject.dam_quantities.count).to eq(731) }
    it { expect(subject.dam_quantities.first.class).to eq(Pdql::DamQuantity) }
  end
end
